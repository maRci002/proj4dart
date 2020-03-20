// ----- START ------- Load proj4js in nodejs ------ START ---------
// import proj4 from './lib/index';
// ----- START ------- Load proj4js in nodejs ------ START ---------

// ----- START ------- Load proj4js on WEB ------ START ---------
var script = document.createElement("script");
var scriptPath = "https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.6.0/proj4-src.js"; // warning use git master version!
script.setAttribute("src", scriptPath);
document.head.appendChild(script);
// ----- END ------- Load proj4js on WEB ------ END ---------

// ----- START ------- Parse proj4 defs ------ START ---------
// copy '_testDefs' from all_proj4_defs.dart / all_proj4_ogc_wkt_defs.dart / all_proj4_esri_wkt_defs.dart and rename it to 'allDefs'

var blackList = [];
var blackListKeys = [];

for (let [key, value] of Object.entries(allDefs)) {
    try {
        proj4.defs(key, value);
        proj4(key);
    } catch (error) {
        // console.error(error);
        // debugger;
        blackList.push("\r\n'" + key + "' : '" + error.message + "'");
        blackListKeys.push(key);
    }
}

// copy("const blackList = {" + blackList.toString() + ",\r\n};");
// require('clipboardy').writeSync("const blackList = {" + blackList.toString().replace(/havn\'t/gi, 'havn\\\'t') + ",\r\n};");

// if (true) { process.exit(); }

// Create ProjectAndUnProjectResults
var keys = Object.keys(allDefs);
var point = [17.888058560281515, 46.89226406700879]; // change it!

var forwardResults = {};
for (var i = 0; i < keys.length; i++) {
    var key = keys[i];

    if (blackListKeys.includes(key)) {
        forwardResults[key] = null; // skip...
    } else {
        try {
            forwardResults[key] = proj4("WGS84", key, point);
        } catch (error) {
            forwardResults[key] = error.message;
        }
    }
}

var inverseResults = {};
for (let [key, value] of Object.entries(forwardResults)) {
    if (Array.isArray(value)) {
        try {
            inverseResults[key] = proj4(key, "WGS84", value);
        } catch (error) {
            inverseResults[key] = error.message;
        }
    } else {
        inverseResults[key] = null; // forwardResults failed, we skip unproject
    }
}

function pointToString(point) {
    if (null == point || typeof point === 'string') {
        return null;
    }

    if (point.length === 3) {
        return `Point.withZ(x: ${point[0]}, y: ${point[1]}, z: ${point[2]})`;
    }

    return `Point(x: ${point[0]}, y: ${point[1]})`;
}

var results = [];
for (let [key, value] of Object.entries(forwardResults)) {
    var forwardResult = value;

    if (blackListKeys.includes(key)) {
        forwardResults[key] = null; // skip...
        results.push("'" + key + "' : null /* blacklist */");
    } else {
        var inverseResult = inverseResults[key];
        var result = "'" + key + "' : ProjectAndUnProjectResult(" + pointToString(value) + ", " + pointToString(inverseResults[key]);

        if (typeof forwardResult === 'string') {
            result += ", forwardResultError: '" + forwardResult + "'";
        }

        if (typeof inverseResult === 'string') {
            result += ", inverseResultError: '" + inverseResult + "'";
        }
        result += ")";

        results.push(result);
    }
}

// NaN => double.nan
const finalResult = "final Map<String, ProjectAndUnProjectResult> _testResults = {\r\n"
    + results.toString()
        .replace(/NaN/gi, 'double.nan')
        .replace(/undefined/gi, 'null')
        .replace(/: -Infinity/gi, ': double.negativeInfinity')
        .replace(/: Infinity/gi, ': double.infinity')
    + "\r\n};";

//copy(finalResult);
require('clipboardy').writeSync(finalResult);
// ----- END ------- Parse proj4 defs ------ END ---------


// ----- START ------- Fetch defs from web ------ START ---------
var keys = Object.keys(allDefs);
var errors = [];
var skipErrors = [];

// result
var netResults = {};

async function fetchDefFromWeb(def) {
    var key = def.split(':')[1];
    return fetch(`https://epsg.io/${key}.wkt`) // esriwkt / wkt / proj4
        .then(function (response) {
            if ('text/html; charset=utf-8' === response.headers.get("Content-Type")) {
                skipErrors.push(def);
                throw 'skip';
            };

            return response.text();
        }).then(function (data) {
            netResults[def] = data;
        }).catch(function (error) {
            if ('skip' !== error) {
                netResults[def] = JSON.stringify(error, Object.getOwnPropertyNames(error));
                errors.push(JSON.stringify(error, Object.getOwnPropertyNames(error)));
            }
        });
}

async function fetchDefsFromWeb() {
    for (var i = 0; i < keys.length; ++i) {
        var curr = keys[i];

        await fetchDefFromWeb(curr);
    }
};

// START
fetchDefsFromWeb();
// ----- END ------- Fetch defs from web ------ END ---------
