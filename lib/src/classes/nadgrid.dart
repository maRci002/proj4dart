import 'dart:typed_data';
import 'dart:math' as math;

import 'package:proj4dart/src/globals/nadgrid_store.dart';

/// Resources for details of NTv2 file formats:
/// - https://web.archive.org/web/20140127204822if_/http://www.mgs.gov.on.ca:80/stdprodconsume/groups/content/@mgs/@iandit/documents/resourcelist/stel02_047447.pdf
/// - http://mimaka.com/help/gs/html/004_NTV2%20Data%20Format.htm
class NadgridParam {
  final String name;
  final bool mandatory;
  final Nadgird? grid;
  final bool isNull;

  NadgridParam({
    required this.name,
    required this.mandatory,
    this.grid,
    required this.isNull,
  });
}

class GridHeader {
  final int nFields;
  final int nSubgridFields;
  final int nSubgrids;
  final String shiftType;
  final double fromSemiMajorAxis;
  final double fromSemiMinorAxis;
  final double toSemiMajorAxis;
  final double toSemiMinorAxis;

  GridHeader({
    required this.nFields,
    required this.nSubgridFields,
    required this.nSubgrids,
    required this.shiftType,
    required this.fromSemiMajorAxis,
    required this.fromSemiMinorAxis,
    required this.toSemiMajorAxis,
    required this.toSemiMinorAxis,
  });
}

class SubGridHeader {
  final String name;
  final String parent;
  final double lowerLatitude;
  final double upperLatitude;
  final double lowerLongitude;
  final double upperLongitude;
  final double latitudeInterval;
  final double longitudeInterval;
  final int gridNodeCount;

  SubGridHeader({
    required this.name,
    required this.parent,
    required this.lowerLatitude,
    required this.upperLatitude,
    required this.lowerLongitude,
    required this.upperLongitude,
    required this.latitudeInterval,
    required this.longitudeInterval,
    required this.gridNodeCount,
  });
}

class GridNode {
  final double latitudeShift;
  final double longitudeShift;
  final double latitudeAccuracy;
  final double longitudeAccuracy;

  GridNode({
    required this.latitudeShift,
    required this.longitudeShift,
    required this.latitudeAccuracy,
    required this.longitudeAccuracy,
  });
}

class SubGrid {
  final List<double> ll;
  final List<double> del;
  final List<int> lim;
  final int count;
  final List<List<double>> cvs;

  SubGrid({
    required this.ll,
    required this.del,
    required this.lim,
    required this.count,
    required this.cvs,
  });
}

class Nadgird {
  final GridHeader header;
  final List<SubGrid> subgrids;

  Nadgird({
    required this.header,
    required this.subgrids,
  });

  /// Load a binary NTv2 file (.gsb) to a key that can be used in a proj string like +nadgrids=<key>. Pass the NTv2 file
  /// as an Uint8List.
  factory Nadgird.factory(String key, Uint8List data) {
    var view = ByteData.view(data.buffer);
    var endian = detectEndian(view);
    var header = readHeader(view, endian);
    if (header.nSubgrids > 1) {
      print(
          'Only single NTv2 subgrids are currently supported, subsequent sub grids are ignored');
    }
    var subgrids = readSubgrids(view, header, endian);
    var nadgrid = Nadgird(header: header, subgrids: subgrids);
    return NadgridStore().register(key, nadgrid);
  }

  /// Given a proj4 value for nadgrids, return an array of loaded grids
  static List<NadgridParam>? getNadgrids(String? nadgrids) {
    // Format details: http://proj.maptools.org/gen_parms.html
    if (nadgrids == null) {
      return null;
    }
    var grids = nadgrids.split(',');
    return grids.map(parseNadgridString).toList();
  }

  static NadgridParam parseNadgridString(String value) {
    // if (value.isEmpty) {
    //   return null;
    // }
    var optional = value[0] == '@';
    if (optional) {
      value = value.substring(1);
    }
    if (value == 'null') {
      return NadgridParam(
        name: 'null',
        mandatory: !optional,
        grid: null,
        isNull: true,
      );
    }
    return NadgridParam(
      name: value,
      mandatory: !optional,
      grid: NadgridStore().get(value),
      isNull: false,
    );
  }

  static double secondsToRadians(double seconds) {
    return (seconds / 3600) * math.pi / 180;
  }

  static Endian detectEndian(ByteData view) {
    return view.getUint8(8) == 11 ? Endian.little : Endian.big;
  }

  static GridHeader readHeader(ByteData view, Endian endian) {
    return GridHeader(
      nFields: view.getInt32(8, endian),
      nSubgridFields: view.getInt32(24, endian),
      nSubgrids: view.getInt32(40, endian),
      shiftType: decodeString(view, 56, 56 + 8).trim(),
      fromSemiMajorAxis: view.getFloat64(120, endian),
      fromSemiMinorAxis: view.getFloat64(136, endian),
      toSemiMajorAxis: view.getFloat64(152, endian),
      toSemiMinorAxis: view.getFloat64(168, endian),
    );
  }

  static String decodeString(ByteData view, int start, int end) {
    return String.fromCharCodes(
      Iterable.generate(end - start, (x) => view.getUint8(start + x)),
    );
  }

  static List<SubGrid> readSubgrids(
      ByteData view, GridHeader header, Endian endian) {
    var gridOffset = 176;
    var grids = <SubGrid>[];
    for (var i = 0; i < header.nSubgrids; i++) {
      var subHeader = readGridHeader(view, gridOffset, endian);
      var nodes = readGridNodes(view, gridOffset, subHeader, endian);
      var lngColumnCount = (1 +
              (subHeader.upperLongitude - subHeader.lowerLongitude) /
                  subHeader.longitudeInterval)
          .round();
      var latColumnCount = (1 +
              (subHeader.upperLatitude - subHeader.lowerLatitude) /
                  subHeader.latitudeInterval)
          .round();

      // Proj4 operates on radians whereas the coordinates are in seconds in the grid
      grids.add(
        SubGrid(
          ll: [
            secondsToRadians(subHeader.lowerLongitude),
            secondsToRadians(subHeader.lowerLatitude)
          ],
          del: [
            secondsToRadians(subHeader.longitudeInterval),
            secondsToRadians(subHeader.latitudeInterval)
          ],
          lim: [lngColumnCount, latColumnCount],
          count: subHeader.gridNodeCount,
          cvs: mapNodes(nodes),
        ),
      );
    }
    return grids;
  }

  static List<List<double>> mapNodes(List<GridNode> nodes) {
    return nodes
        .map(
          (r) => [
            secondsToRadians(r.longitudeShift),
            secondsToRadians(r.latitudeShift)
          ],
        )
        .toList();
  }

  static SubGridHeader readGridHeader(
      ByteData view, int offset, Endian endian) {
    return SubGridHeader(
      name: decodeString(view, offset + 8, offset + 16).trim(),
      parent: decodeString(view, offset + 24, offset + 24 + 8).trim(),
      lowerLatitude: view.getFloat64(offset + 72, endian),
      upperLatitude: view.getFloat64(offset + 88, endian),
      lowerLongitude: view.getFloat64(offset + 104, endian),
      upperLongitude: view.getFloat64(offset + 120, endian),
      latitudeInterval: view.getFloat64(offset + 136, endian),
      longitudeInterval: view.getFloat64(offset + 152, endian),
      gridNodeCount: view.getInt32(offset + 168, endian),
    );
  }

  static List<GridNode> readGridNodes(
      ByteData view, int offset, SubGridHeader gridHeader, Endian endian) {
    var nodesOffset = offset + 176;
    var gridRecordLength = 16;
    var gridShiftRecords = <GridNode>[];

    for (var i = 0; i < gridHeader.gridNodeCount; i++) {
      var record = GridNode(
        latitudeShift:
            view.getFloat32(nodesOffset + i * gridRecordLength, endian),
        longitudeShift:
            view.getFloat32(nodesOffset + i * gridRecordLength + 4, endian),
        latitudeAccuracy:
            view.getFloat32(nodesOffset + i * gridRecordLength + 8, endian),
        longitudeAccuracy:
            view.getFloat32(nodesOffset + i * gridRecordLength + 12, endian),
      );
      gridShiftRecords.add(record);
    }

    return gridShiftRecords;
  }
}
