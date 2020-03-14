import 'package:proj4dart/src/classes/point.dart';

import '../classes/project_and_unproject_result.dart';

const blackList = {
  'EPSG:4338': ' Skip because of blackList',
  'EPSG:2046': ' Skip because of blackList',
  'EPSG:2047': ' Skip because of blackList',
  'EPSG:2048': ' Skip because of blackList',
  'EPSG:2049': ' Skip because of blackList',
  'EPSG:2050': ' Skip because of blackList',
  'EPSG:2051': ' Skip because of blackList',
  'EPSG:2052': ' Skip because of blackList',
  'EPSG:2053': ' Skip because of blackList',
  'EPSG:2054': ' Skip because of blackList',
  'EPSG:2055': ' Skip because of blackList',
  'EPSG:2085': ' Skip because of blackList',
  'EPSG:2062': ' Skip because of blackList',
  'EPSG:4340': ' Skip because of blackList',
  'EPSG:2086': ' Skip because of blackList',
  'EPSG:2101': ' Skip because of blackList',
  'EPSG:2102': ' Skip because of blackList',
  'EPSG:2103': ' Skip because of blackList',
  'EPSG:2104': ' Skip because of blackList',
  'EPSG:4342': ' Skip because of blackList',
  'EPSG:4344': ' Skip because of blackList',
  'EPSG:4346': ' Skip because of blackList',
  'EPSG:4348': ' Skip because of blackList',
  'EPSG:2155': ' Skip because of blackList',
  'EPSG:4350': ' Skip because of blackList',
  'EPSG:2192': ' Skip because of blackList',
  'EPSG:2194': ' Skip because of blackList',
  'EPSG:4352': ' Skip because of blackList',
  'EPSG:4354': ' Skip because of blackList',
  'EPSG:4356': ' Skip because of blackList',
  'EPSG:4358': ' Skip because of blackList',
  'EPSG:4360': ' Skip because of blackList',
  'EPSG:4362': ' Skip because of blackList',
  'EPSG:4364': ' Skip because of blackList',
  'EPSG:4366': ' Skip because of blackList',
  'EPSG:4368': ' Skip because of blackList',
  'EPSG:4370': ' Skip because of blackList',
  'EPSG:4372': ' Skip because of blackList',
  'EPSG:3102': ' Skip because of blackList',
  'EPSG:4374': ' Skip because of blackList',
  'EPSG:7664': ' Skip because of blackList',
  'EPSG:4376': ' Skip because of blackList',
  'EPSG:4378': ' Skip because of blackList',
  'EPSG:3200': ' Skip because of blackList',
  'EPSG:4380': ' Skip because of blackList',
  'EPSG:4382': ' Skip because of blackList',
  'EPSG:3337': ' Skip because of blackList',
  'EPSG:4384': ' Skip because of blackList',
  'EPSG:4385': ' Skip because of blackList',
  'EPSG:3388': ' Skip because of blackList',
  'EPSG:3394': ' Skip because of blackList',
  'EPSG:4387': ' Skip because of blackList',
  'EPSG:3410': ' Skip because of blackList',
  'EPSG:4389': ' Skip because of blackList',
  'EPSG:3448': ' Skip because of blackList',
  'EPSG:3975': ' Skip because of blackList',
  'EPSG:4465': ' Skip because of blackList',
  'EPSG:4468': ' Skip because of blackList',
  'EPSG:4473': ' Skip because of blackList',
  'EPSG:4479': ' Skip because of blackList',
  'EPSG:4481': ' Skip because of blackList',
  'EPSG:4556': ' Skip because of blackList',
  'EPSG:4882': ' Skip because of blackList',
  'EPSG:4884': ' Skip because of blackList',
  'EPSG:4886': ' Skip because of blackList',
  'EPSG:4888': ' Skip because of blackList',
  'EPSG:3994': ' Skip because of blackList',
  'EPSG:4890': ' Skip because of blackList',
  'EPSG:4892': ' Skip because of blackList',
  'EPSG:4894': ' Skip because of blackList',
  'EPSG:4896': ' Skip because of blackList',
  'EPSG:4897': ' Skip because of blackList',
  'EPSG:4899': ' Skip because of blackList',
  'EPSG:4906': ' Skip because of blackList',
  'EPSG:4908': ' Skip because of blackList',
  'EPSG:4910': ' Skip because of blackList',
  'EPSG:4911': ' Skip because of blackList',
  'EPSG:5456': ' Skip because of blackList',
  'EPSG:5457': ' Skip because of blackList',
  'EPSG:5458': ' Skip because of blackList',
  'EPSG:5459': ' Skip because of blackList',
  'EPSG:5460': ' Skip because of blackList',
  'EPSG:5461': ' Skip because of blackList',
  'EPSG:5462': ' Skip because of blackList',
  'EPSG:5469': ' Skip because of blackList',
  'EPSG:5559': ' Skip because of blackList',
  'EPSG:5641': ' Skip because of blackList',
  'EPSG:4912': ' Skip because of blackList',
  'EPSG:4913': ' Skip because of blackList',
  'EPSG:4914': ' Skip because of blackList',
  'EPSG:4915': ' Skip because of blackList',
  'EPSG:7677': ' Skip because of blackList',
  'EPSG:4916': ' Skip because of blackList',
  'EPSG:4917': ' Skip because of blackList',
  'EPSG:4918': ' Skip because of blackList',
  'EPSG:4919': ' Skip because of blackList',
  'EPSG:4920': ' Skip because of blackList',
  'EPSG:4922': ' Skip because of blackList',
  'EPSG:4924': ' Skip because of blackList',
  'EPSG:4926': ' Skip because of blackList',
  'EPSG:4928': ' Skip because of blackList',
  'EPSG:4930': ' Skip because of blackList',
  'EPSG:4932': ' Skip because of blackList',
  'EPSG:4934': ' Skip because of blackList',
  'EPSG:6792': ' Skip because of blackList',
  'EPSG:4936': ' Skip because of blackList',
  'EPSG:6793': ' Skip because of blackList',
  'EPSG:6794': ' Skip because of blackList',
  'EPSG:6795': ' Skip because of blackList',
  'EPSG:6796': ' Skip because of blackList',
  'EPSG:6797': ' Skip because of blackList',
  'EPSG:6798': ' Skip because of blackList',
  'EPSG:6799': ' Skip because of blackList',
  'EPSG:6804': ' Skip because of blackList',
  'EPSG:6805': ' Skip because of blackList',
  'EPSG:6806': ' Skip because of blackList',
  'EPSG:6807': ' Skip because of blackList',
  'EPSG:4938': ' Skip because of blackList',
  'EPSG:6852': ' Skip because of blackList',
  'EPSG:6853': ' Skip because of blackList',
  'EPSG:6854': ' Skip because of blackList',
  'EPSG:6855': ' Skip because of blackList',
  'EPSG:4940': ' Skip because of blackList',
  'EPSG:6933': ' Skip because of blackList',
  'EPSG:7057': ' Skip because of blackList',
  'EPSG:7058': ' Skip because of blackList',
  'EPSG:7060': ' Skip because of blackList',
  'EPSG:7061': ' Skip because of blackList',
  'EPSG:7066': ' Skip because of blackList',
  'EPSG:7068': ' Skip because of blackList',
  'EPSG:7111': ' Skip because of blackList',
  'EPSG:7112': ' Skip because of blackList',
  'EPSG:7113': ' Skip because of blackList',
  'EPSG:7114': ' Skip because of blackList',
  'EPSG:7116': ' Skip because of blackList',
  'EPSG:7117': ' Skip because of blackList',
  'EPSG:7121': ' Skip because of blackList',
  'EPSG:4942': ' Skip because of blackList',
  'EPSG:7122': ' Skip because of blackList',
  'EPSG:7123': ' Skip because of blackList',
  'EPSG:7124': ' Skip because of blackList',
  'EPSG:7126': ' Skip because of blackList',
  'EPSG:7127': ' Skip because of blackList',
  'EPSG:4944': ' Skip because of blackList',
  'EPSG:4946': ' Skip because of blackList',
  'EPSG:4948': ' Skip because of blackList',
  'EPSG:4950': ' Skip because of blackList',
  'EPSG:4952': ' Skip because of blackList',
  'EPSG:4954': ' Skip because of blackList',
  'EPSG:4956': ' Skip because of blackList',
  'EPSG:7531': ' Skip because of blackList',
  'EPSG:7534': ' Skip because of blackList',
  'EPSG:7536': ' Skip because of blackList',
  'EPSG:7538': ' Skip because of blackList',
  'EPSG:7539': ' Skip because of blackList',
  'EPSG:7540': ' Skip because of blackList',
  'EPSG:7545': ' Skip because of blackList',
  'EPSG:7549': ' Skip because of blackList',
  'EPSG:7550': ' Skip because of blackList',
  'EPSG:7557': ' Skip because of blackList',
  'EPSG:7559': ' Skip because of blackList',
  'EPSG:7562': ' Skip because of blackList',
  'EPSG:7564': ' Skip because of blackList',
  'EPSG:7565': ' Skip because of blackList',
  'EPSG:7567': ' Skip because of blackList',
  'EPSG:7569': ' Skip because of blackList',
  'EPSG:7573': ' Skip because of blackList',
  'EPSG:7576': ' Skip because of blackList',
  'EPSG:7578': ' Skip because of blackList',
  'EPSG:7579': ' Skip because of blackList',
  'EPSG:7580': ' Skip because of blackList',
  'EPSG:7581': ' Skip because of blackList',
  'EPSG:7585': ' Skip because of blackList',
  'EPSG:7586': ' Skip because of blackList',
  'EPSG:7590': ' Skip because of blackList',
  'EPSG:7593': ' Skip because of blackList',
  'EPSG:7595': ' Skip because of blackList',
  'EPSG:7597': ' Skip because of blackList',
  'EPSG:4958': ' Skip because of blackList',
  'EPSG:7598': ' Skip because of blackList',
  'EPSG:7599': ' Skip because of blackList',
  'EPSG:7604': ' Skip because of blackList',
  'EPSG:4960': ' Skip because of blackList',
  'EPSG:7608': ' Skip because of blackList',
  'EPSG:7609': ' Skip because of blackList',
  'EPSG:4962': ' Skip because of blackList',
  'EPSG:7616': ' Skip because of blackList',
  'EPSG:7618': ' Skip because of blackList',
  'EPSG:7621': ' Skip because of blackList',
  'EPSG:4964': ' Skip because of blackList',
  'EPSG:7623': ' Skip because of blackList',
  'EPSG:7624': ' Skip because of blackList',
  'EPSG:7626': ' Skip because of blackList',
  'EPSG:7628': ' Skip because of blackList',
  'EPSG:4966': ' Skip because of blackList',
  'EPSG:7632': ' Skip because of blackList',
  'EPSG:7635': ' Skip because of blackList',
  'EPSG:7637': ' Skip because of blackList',
  'EPSG:4968': ' Skip because of blackList',
  'EPSG:7638': ' Skip because of blackList',
  'EPSG:7639': ' Skip because of blackList',
  'EPSG:7640': ' Skip because of blackList',
  'EPSG:7644': ' Skip because of blackList',
  'EPSG:7645': ' Skip because of blackList',
  'EPSG:4970': ' Skip because of blackList',
  'EPSG:4972': ' Skip because of blackList',
  'EPSG:4974': ' Skip because of blackList',
  'EPSG:4976': ' Skip because of blackList',
  'EPSG:8068': ' Skip because of blackList',
  'EPSG:4978': ' Skip because of blackList',
  'EPSG:8092': ' Skip because of blackList',
  'EPSG:8093': ' Skip because of blackList',
  'EPSG:8095': ' Skip because of blackList',
  'EPSG:8096': ' Skip because of blackList',
  'EPSG:8097': ' Skip because of blackList',
  'EPSG:8098': ' Skip because of blackList',
  'EPSG:4980': ' Skip because of blackList',
  'EPSG:8105': ' Skip because of blackList',
  'EPSG:8106': ' Skip because of blackList',
  'EPSG:8107': ' Skip because of blackList',
  'EPSG:8108': ' Skip because of blackList',
  'EPSG:8109': ' Skip because of blackList',
  'EPSG:8110': ' Skip because of blackList',
  'EPSG:8111': ' Skip because of blackList',
  'EPSG:8112': ' Skip because of blackList',
  'EPSG:8115': ' Skip because of blackList',
  'EPSG:8116': ' Skip because of blackList',
  'EPSG:4982': ' Skip because of blackList',
  'EPSG:8121': ' Skip because of blackList',
  'EPSG:8122': ' Skip because of blackList',
  'EPSG:4984': ' Skip because of blackList',
  'EPSG:8129': ' Skip because of blackList',
  'EPSG:8130': ' Skip because of blackList',
  'EPSG:8133': ' Skip because of blackList',
  'EPSG:8134': ' Skip because of blackList',
  'EPSG:4986': ' Skip because of blackList',
  'EPSG:8137': ' Skip because of blackList',
  'EPSG:8138': ' Skip because of blackList',
  'EPSG:8139': ' Skip because of blackList',
  'EPSG:8140': ' Skip because of blackList',
  'EPSG:8143': ' Skip because of blackList',
  'EPSG:8144': ' Skip because of blackList',
  'EPSG:8149': ' Skip because of blackList',
  'EPSG:8150': ' Skip because of blackList',
  'EPSG:4988': ' Skip because of blackList',
  'EPSG:8153': ' Skip because of blackList',
  'EPSG:8154': ' Skip because of blackList',
  'EPSG:4990': ' Skip because of blackList',
  'EPSG:8167': ' Skip because of blackList',
  'EPSG:8168': ' Skip because of blackList',
  'EPSG:4992': ' Skip because of blackList',
  'EPSG:8169': ' Skip because of blackList',
  'EPSG:8170': ' Skip because of blackList',
  'EPSG:4994': ' Skip because of blackList',
  'EPSG:8191': ' Skip because of blackList',
  'EPSG:8193': ' Skip because of blackList',
  'EPSG:4996': ' Skip because of blackList',
  'EPSG:8196': ' Skip because of blackList',
  'EPSG:8197': ' Skip because of blackList',
  'EPSG:8198': ' Skip because of blackList',
  'EPSG:8200': ' Skip because of blackList',
  'EPSG:8203': ' Skip because of blackList',
  'EPSG:8204': ' Skip because of blackList',
  'EPSG:4998': ' Skip because of blackList',
  'EPSG:8207': ' Skip because of blackList',
  'EPSG:8208': ' Skip because of blackList',
  'EPSG:5011': ' Skip because of blackList',
  'EPSG:8214': ' Skip because of blackList',
  'EPSG:8216': ' Skip because of blackList',
  'EPSG:5244': ' Skip because of blackList',
  'EPSG:8315': ' Skip because of blackList',
  'EPSG:8316': ' Skip because of blackList',
  'EPSG:5250': ' Skip because of blackList',
  'EPSG:8321': ' Skip because of blackList',
  'EPSG:8322': ' Skip because of blackList',
  'EPSG:8323': ' Skip because of blackList',
  'EPSG:8324': ' Skip because of blackList',
  'EPSG:8325': ' Skip because of blackList',
  'EPSG:8326': ' Skip because of blackList',
  'EPSG:8327': ' Skip because of blackList',
  'EPSG:8328': ' Skip because of blackList',
  'EPSG:8329': ' Skip because of blackList',
  'EPSG:8330': ' Skip because of blackList',
  'EPSG:8333': ' Skip because of blackList',
  'EPSG:8334': ' Skip because of blackList',
  'EPSG:8335': ' Skip because of blackList',
  'EPSG:8336': ' Skip because of blackList',
  'EPSG:5262': ' Skip because of blackList',
  'EPSG:8339': ' Skip because of blackList',
  'EPSG:8340': ' Skip because of blackList',
  'EPSG:8341': ' Skip because of blackList',
  'EPSG:8342': ' Skip because of blackList',
  'EPSG:8345': ' Skip because of blackList',
  'EPSG:8346': ' Skip because of blackList',
  'EPSG:5322': ' Skip because of blackList',
  'EPSG:5332': ' Skip because of blackList',
  'EPSG:22275': ' Skip because of blackList',
  'EPSG:22277': ' Skip because of blackList',
  'EPSG:22279': ' Skip because of blackList',
  'EPSG:22281': ' Skip because of blackList',
  'EPSG:22283': ' Skip because of blackList',
  'EPSG:22285': ' Skip because of blackList',
  'EPSG:22287': ' Skip because of blackList',
  'EPSG:22289': ' Skip because of blackList',
  'EPSG:22291': ' Skip because of blackList',
  'EPSG:22293': ' Skip because of blackList',
  'EPSG:22300': ' Skip because of blackList',
  'EPSG:22391': ' Skip because of blackList',
  'EPSG:22392': ' Skip because of blackList',
  'EPSG:22700': ' Skip because of blackList',
  'EPSG:22770': ' Skip because of blackList',
  'EPSG:5341': ' Skip because of blackList',
  'EPSG:5352': ' Skip because of blackList',
  'EPSG:24100': ' Skip because of blackList',
  'EPSG:24200': ' Skip because of blackList',
  'EPSG:5358': ' Skip because of blackList',
  'EPSG:24370': ' Skip because of blackList',
  'EPSG:24371': ' Skip because of blackList',
  'EPSG:24372': ' Skip because of blackList',
  'EPSG:24373': ' Skip because of blackList',
  'EPSG:24374': ' Skip because of blackList',
  'EPSG:24375': ' Skip because of blackList',
  'EPSG:24376': ' Skip because of blackList',
  'EPSG:24377': ' Skip because of blackList',
  'EPSG:24378': ' Skip because of blackList',
  'EPSG:24379': ' Skip because of blackList',
  'EPSG:24380': ' Skip because of blackList',
  'EPSG:24381': ' Skip because of blackList',
  'EPSG:24382': ' Skip because of blackList',
  'EPSG:24383': ' Skip because of blackList',
  'EPSG:24600': ' Skip because of blackList',
  'EPSG:26191': ' Skip because of blackList',
  'EPSG:26192': ' Skip because of blackList',
  'EPSG:26193': ' Skip because of blackList',
  'EPSG:26194': ' Skip because of blackList',
  'EPSG:26195': ' Skip because of blackList',
  'EPSG:5363': ' Skip because of blackList',
  'EPSG:5368': ' Skip because of blackList',
  'EPSG:5369': ' Skip because of blackList',
  'EPSG:5379': ' Skip because of blackList',
  'EPSG:5391': ' Skip because of blackList',
  'EPSG:27500': ' Skip because of blackList',
  'EPSG:27561': ' Skip because of blackList',
  'EPSG:27562': ' Skip because of blackList',
  'EPSG:27563': ' Skip because of blackList',
  'EPSG:27564': ' Skip because of blackList',
  'EPSG:27571': ' Skip because of blackList',
  'EPSG:27572': ' Skip because of blackList',
  'EPSG:27573': ' Skip because of blackList',
  'EPSG:27574': ' Skip because of blackList',
  'EPSG:27581': ' Skip because of blackList',
  'EPSG:27582': ' Skip because of blackList',
  'EPSG:27583': ' Skip because of blackList',
  'EPSG:27584': ' Skip because of blackList',
  'EPSG:27591': ' Skip because of blackList',
  'EPSG:5487': ' Skip because of blackList',
  'EPSG:27592': ' Skip because of blackList',
  'EPSG:27593': ' Skip because of blackList',
  'EPSG:27594': ' Skip because of blackList',
  'EPSG:5544': ' Skip because of blackList',
  'EPSG:29371': ' Skip because of blackList',
  'EPSG:29373': ' Skip because of blackList',
  'EPSG:29375': ' Skip because of blackList',
  'EPSG:29377': ' Skip because of blackList',
  'EPSG:29379': ' Skip because of blackList',
  'EPSG:29381': ' Skip because of blackList',
  'EPSG:29383': ' Skip because of blackList',
  'EPSG:29385': ' Skip because of blackList',
  'EPSG:5558': ' Skip because of blackList',
  'EPSG:29701': ' Skip because of blackList',
  'EPSG:5591': ' Skip because of blackList',
  'EPSG:30491': ' Skip because of blackList',
  'EPSG:30492': ' Skip because of blackList',
  'EPSG:30493': ' Skip because of blackList',
  'EPSG:30494': ' Skip because of blackList',
  'EPSG:30791': ' Skip because of blackList',
  'EPSG:30792': ' Skip because of blackList',
  'EPSG:5828': ' Skip because of blackList',
  'EPSG:5884': ' Skip because of blackList',
  'EPSG:31300': ' Skip because of blackList',
  'EPSG:6133': ' Skip because of blackList',
  'EPSG:32061': ' Skip because of blackList',
  'EPSG:32062': ' Skip because of blackList',
  'EPSG:4079': ' Skip because of blackList',
  'EPSG:4328': ' Skip because of blackList',
  'EPSG:4330': ' Skip because of blackList',
  'EPSG:4331': ' Skip because of blackList',
  'EPSG:4332': ' Skip because of blackList',
  'EPSG:4333': ' Skip because of blackList',
  'EPSG:4334': ' Skip because of blackList',
  'EPSG:4335': ' Skip because of blackList',
  'EPSG:4336': ' Skip because of blackList',
  'EPSG:4337': ' Skip because of blackList',
  'EPSG:6309': ' Skip because of blackList',
  'EPSG:7660': ' Skip because of blackList',
  'EPSG:7662': ' Skip because of blackList',
  'EPSG:3822': ' Skip because of blackList',
  'EPSG:3887': ' Skip because of blackList',
  'EPSG:4000': ' Skip because of blackList',
  'EPSG:4039': ' Skip because of blackList',
  'EPSG:4073': ' Skip because of blackList',
  'EPSG:6317': ' Skip because of blackList',
  'EPSG:6320': ' Skip because of blackList',
  'EPSG:6323': ' Skip because of blackList',
  'EPSG:6363': ' Skip because of blackList',
  'EPSG:6666': ' Skip because of blackList',
  'EPSG:6704': ' Skip because of blackList',
  'EPSG:6781': ' Skip because of blackList',
  'EPSG:6934': ' Skip because of blackList',
  'EPSG:6978': ' Skip because of blackList',
  'EPSG:6981': ' Skip because of blackList',
  'EPSG:6985': ' Skip because of blackList',
  'EPSG:6988': ' Skip because of blackList',
  'EPSG:7071': ' Skip because of blackList',
  'EPSG:7134': ' Skip because of blackList',
  'EPSG:7137': ' Skip because of blackList',
  'EPSG:7371': ' Skip because of blackList',
  'EPSG:7656': ' Skip because of blackList',
  'EPSG:7658': ' Skip because of blackList',
  'EPSG:7679': ' Skip because of blackList',
  'EPSG:7681': ' Skip because of blackList',
  'EPSG:7684': ' Skip because of blackList',
  'EPSG:7789': ' Skip because of blackList',
  'EPSG:7796': ' Skip because of blackList',
  'EPSG:7815': ' Skip because of blackList',
  'EPSG:7842': ' Skip because of blackList',
  'EPSG:7879': ' Skip because of blackList',
  'EPSG:7884': ' Skip because of blackList',
  'EPSG:7914': ' Skip because of blackList',
  'EPSG:7916': ' Skip because of blackList',
  'EPSG:7918': ' Skip because of blackList',
  'EPSG:7920': ' Skip because of blackList',
  'EPSG:7922': ' Skip because of blackList',
  'EPSG:7924': ' Skip because of blackList',
  'EPSG:7926': ' Skip because of blackList',
  'EPSG:7928': ' Skip because of blackList',
  'EPSG:7930': ' Skip because of blackList',
  'EPSG:8084': ' Skip because of blackList',
  'EPSG:8227': ' Skip because of blackList',
  'EPSG:8230': ' Skip because of blackList',
  'EPSG:8233': ' Skip because of blackList',
  'EPSG:8238': ' Skip because of blackList',
  'EPSG:8242': ' Skip because of blackList',
  'EPSG:8247': ' Skip because of blackList',
  'EPSG:8250': ' Skip because of blackList',
  'EPSG:8253': ' Skip because of blackList',
  'EPSG:3901': ' Skip because of blackList',
  'EPSG:3902': ' Skip because of blackList',
  'EPSG:3903': ' Skip because of blackList',
  'EPSG:5500': ' Skip because of blackList',
  'EPSG:4097': ' Skip because of blackList',
  'EPSG:4098': ' Skip because of blackList',
  'EPSG:4099': ' Skip because of blackList',
  'EPSG:4100': ' Skip because of blackList',
  'EPSG:5318': ' Skip because of blackList',
  'EPSG:5498': ' Skip because of blackList',
  'EPSG:5499': ' Skip because of blackList',
  'EPSG:5554': ' Skip because of blackList',
  'EPSG:5555': ' Skip because of blackList',
  'EPSG:5556': ' Skip because of blackList',
  'EPSG:5598': ' Skip because of blackList',
  'EPSG:5628': ' Skip because of blackList',
  'EPSG:5698': ' Skip because of blackList',
  'EPSG:5699': ' Skip because of blackList',
  'EPSG:5846': ' Skip because of blackList',
  'EPSG:5707': ' Skip because of blackList',
  'EPSG:5708': ' Skip because of blackList',
  'EPSG:5832': ' Skip because of blackList',
  'EPSG:5833': ' Skip because of blackList',
  'EPSG:5834': ' Skip because of blackList',
  'EPSG:5835': ' Skip because of blackList',
  'EPSG:5845': ' Skip because of blackList',
  'EPSG:5847': ' Skip because of blackList',
  'EPSG:5848': ' Skip because of blackList',
  'EPSG:5849': ' Skip because of blackList',
  'EPSG:5850': ' Skip because of blackList',
  'EPSG:5851': ' Skip because of blackList',
  'EPSG:5852': ' Skip because of blackList',
  'EPSG:5853': ' Skip because of blackList',
  'EPSG:5854': ' Skip because of blackList',
  'EPSG:5855': ' Skip because of blackList',
  'EPSG:5856': ' Skip because of blackList',
  'EPSG:5857': ' Skip because of blackList',
  'EPSG:5942': ' Skip because of blackList',
  'EPSG:5945': ' Skip because of blackList',
  'EPSG:5946': ' Skip because of blackList',
  'EPSG:5947': ' Skip because of blackList',
  'EPSG:5948': ' Skip because of blackList',
  'EPSG:5949': ' Skip because of blackList',
  'EPSG:5950': ' Skip because of blackList',
  'EPSG:5951': ' Skip because of blackList',
  'EPSG:5952': ' Skip because of blackList',
  'EPSG:5953': ' Skip because of blackList',
  'EPSG:5954': ' Skip because of blackList',
  'EPSG:5955': ' Skip because of blackList',
  'EPSG:7409': ' Skip because of blackList',
  'EPSG:5956': ' Skip because of blackList',
  'EPSG:5957': ' Skip because of blackList',
  'EPSG:5958': ' Skip because of blackList',
  'EPSG:5959': ' Skip because of blackList',
  'EPSG:5960': ' Skip because of blackList',
  'EPSG:5961': ' Skip because of blackList',
  'EPSG:5962': ' Skip because of blackList',
  'EPSG:7410': ' Skip because of blackList',
  'EPSG:5963': ' Skip because of blackList',
  'EPSG:5964': ' Skip because of blackList',
  'EPSG:5965': ' Skip because of blackList',
  'EPSG:5966': ' Skip because of blackList',
  'EPSG:5967': ' Skip because of blackList',
  'EPSG:5968': ' Skip because of blackList',
  'EPSG:5969': ' Skip because of blackList',
  'EPSG:5970': ' Skip because of blackList',
  'EPSG:5971': ' Skip because of blackList',
  'EPSG:5972': ' Skip because of blackList',
  'EPSG:5973': ' Skip because of blackList',
  'EPSG:5974': ' Skip because of blackList',
  'EPSG:5975': ' Skip because of blackList',
  'EPSG:5976': ' Skip because of blackList',
  'EPSG:6144': ' Skip because of blackList',
  'EPSG:6145': ' Skip because of blackList',
  'EPSG:6146': ' Skip because of blackList',
  'EPSG:6147': ' Skip because of blackList',
  'EPSG:6148': ' Skip because of blackList',
  'EPSG:6149': ' Skip because of blackList',
  'EPSG:6150': ' Skip because of blackList',
  'EPSG:6151': ' Skip because of blackList',
  'EPSG:6152': ' Skip because of blackList',
  'EPSG:6153': ' Skip because of blackList',
  'EPSG:6154': ' Skip because of blackList',
  'EPSG:6155': ' Skip because of blackList',
  'EPSG:6156': ' Skip because of blackList',
  'EPSG:6157': ' Skip because of blackList',
  'EPSG:6158': ' Skip because of blackList',
  'EPSG:6159': ' Skip because of blackList',
  'EPSG:6160': ' Skip because of blackList',
  'EPSG:6161': ' Skip because of blackList',
  'EPSG:6162': ' Skip because of blackList',
  'EPSG:6163': ' Skip because of blackList',
  'EPSG:6164': ' Skip because of blackList',
  'EPSG:6165': ' Skip because of blackList',
  'EPSG:6166': ' Skip because of blackList',
  'EPSG:6167': ' Skip because of blackList',
  'EPSG:6168': ' Skip because of blackList',
  'EPSG:6169': ' Skip because of blackList',
  'EPSG:6170': ' Skip because of blackList',
  'EPSG:6171': ' Skip because of blackList',
  'EPSG:6172': ' Skip because of blackList',
  'EPSG:6173': ' Skip because of blackList',
  'EPSG:6174': ' Skip because of blackList',
  'EPSG:6175': ' Skip because of blackList',
  'EPSG:6176': ' Skip because of blackList',
  'EPSG:6190': ' Skip because of blackList',
  'EPSG:6349': ' Skip because of blackList',
  'EPSG:6649': ' Skip because of blackList',
  'EPSG:6650': ' Skip because of blackList',
  'EPSG:6651': ' Skip because of blackList',
  'EPSG:6652': ' Skip because of blackList',
  'EPSG:6653': ' Skip because of blackList',
  'EPSG:6654': ' Skip because of blackList',
  'EPSG:6655': ' Skip because of blackList',
  'EPSG:6656': ' Skip because of blackList',
  'EPSG:6657': ' Skip because of blackList',
  'EPSG:6658': ' Skip because of blackList',
  'EPSG:6659': ' Skip because of blackList',
  'EPSG:6660': ' Skip because of blackList',
  'EPSG:6661': ' Skip because of blackList',
  'EPSG:6662': ' Skip because of blackList',
  'EPSG:6663': ' Skip because of blackList',
  'EPSG:6664': ' Skip because of blackList',
  'EPSG:6665': ' Skip because of blackList',
  'EPSG:6696': ' Skip because of blackList',
  'EPSG:6697': ' Skip because of blackList',
  'EPSG:6700': ' Skip because of blackList',
  'EPSG:6871': ' Skip because of blackList',
  'EPSG:6893': ' Skip because of blackList',
  'EPSG:6917': ' Skip because of blackList',
  'EPSG:6927': ' Skip because of blackList',
  'EPSG:7400': ' Skip because of blackList',
  'EPSG:7401': ' Skip because of blackList',
  'EPSG:7402': ' Skip because of blackList',
  'EPSG:7403': ' Skip because of blackList',
  'EPSG:7404': ' Skip because of blackList',
  'EPSG:7405': ' Skip because of blackList',
  'EPSG:7406': ' Skip because of blackList',
  'EPSG:7407': ' Skip because of blackList',
  'EPSG:7408': ' Skip because of blackList',
  'EPSG:7411': ' Skip because of blackList',
  'EPSG:7412': ' Skip because of blackList',
  'EPSG:7413': ' Skip because of blackList',
  'EPSG:7414': ' Skip because of blackList',
  'EPSG:7415': ' Skip because of blackList',
  'EPSG:7416': ' Skip because of blackList',
  'EPSG:7417': ' Skip because of blackList',
  'EPSG:7418': ' Skip because of blackList',
  'EPSG:7419': ' Skip because of blackList',
  'EPSG:7420': ' Skip because of blackList',
  'EPSG:7421': ' Skip because of blackList',
  'EPSG:7422': ' Skip because of blackList',
  'EPSG:7423': ' Skip because of blackList',
  'EPSG:7954': ' Skip because of blackList',
  'EPSG:7955': ' Skip because of blackList',
  'EPSG:7956': ' Skip because of blackList',
  'EPSG:8349': ' Skip because of blackList',
  'EPSG:8350': ' Skip because of blackList',
  'EPSG:3993': ' Skip because of blackList',
  'EPSG:6200': ' Skip because of blackList',
  'EPSG:6201': ' Skip because of blackList',
  'EPSG:6202': ' Skip because of blackList',
  'EPSG:6966': ' Skip because of blackList',
  'EPSG:8441': ' Skip because of blackList',
  'EPSG:8816': ' Skip because of blackList',
  'EPSG:8525': ' Skip because of blackList',
  'EPSG:8526': ' Skip because of blackList',
  'EPSG:8527': ' Skip because of blackList',
  'EPSG:8528': ' Skip because of blackList',
  'EPSG:8536': ' Skip because of blackList',
  'EPSG:8538': ' Skip because of blackList',
  'EPSG:8857': ' Skip because of blackList',
  'EPSG:8858': ' Skip because of blackList',
  'EPSG:8859': ' Skip because of blackList',
  'EPSG:8397': ' Skip because of blackList',
  'EPSG:8401': ' Skip because of blackList',
  'EPSG:8425': ' Skip because of blackList',
  'EPSG:8429': ' Skip because of blackList',
  'EPSG:8541': ' Skip because of blackList',
  'EPSG:8543': ' Skip because of blackList',
  'EPSG:8683': ' Skip because of blackList',
  'EPSG:8898': ' Skip because of blackList',
  'EPSG:8905': ' Skip because of blackList',
  'EPSG:9001': ' Skip because of blackList',
  'EPSG:9004': ' Skip because of blackList',
  'EPSG:9007': ' Skip because of blackList',
  'EPSG:9010': ' Skip because of blackList',
  'EPSG:9015': ' Skip because of blackList',
  'EPSG:8360': ' Skip because of blackList',
  'EPSG:8370': ' Skip because of blackList',
  'EPSG:8700': ' Skip because of blackList',
  'EPSG:8701': ' Skip because of blackList',
  'EPSG:4329': ' Skip because of blackList',
  'EPSG:8702': ' Skip because of blackList',
  'EPSG:8703': ' Skip because of blackList',
  'EPSG:8704': ' Skip because of blackList',
  'EPSG:8705': ' Skip because of blackList',
  'EPSG:8706': ' Skip because of blackList',
  'EPSG:8707': ' Skip because of blackList',
  'EPSG:7138': ' Skip because of blackList',
  'EPSG:8708': ' Skip because of blackList',
  'EPSG:8709': ' Skip because of blackList',
  'EPSG:8710': ' Skip because of blackList',
  'EPSG:8711': ' Skip because of blackList',
  'EPSG:8712': ' Skip because of blackList',
  'EPSG:8713': ' Skip because of blackList',
  'EPSG:8714': ' Skip because of blackList',
  'EPSG:8715': ' Skip because of blackList',
  'EPSG:8716': ' Skip because of blackList',
  'EPSG:8717': ' Skip because of blackList',
  'EPSG:8718': ' Skip because of blackList',
  'EPSG:8719': ' Skip because of blackList',
  'EPSG:8720': ' Skip because of blackList',
  'EPSG:8721': ' Skip because of blackList',
  'EPSG:8722': ' Skip because of blackList',
  'EPSG:8723': ' Skip because of blackList',
  'EPSG:8724': ' Skip because of blackList',
  'EPSG:8725': ' Skip because of blackList',
  'EPSG:8726': ' Skip because of blackList',
  'EPSG:8727': ' Skip because of blackList',
  'EPSG:8728': ' Skip because of blackList',
  'EPSG:8729': ' Skip because of blackList',
  'EPSG:8730': ' Skip because of blackList',
  'EPSG:8731': ' Skip because of blackList',
  'EPSG:7372': ' Skip because of blackList',
  'EPSG:8732': ' Skip because of blackList',
  'EPSG:8733': ' Skip because of blackList',
  'EPSG:8734': ' Skip because of blackList',
  'EPSG:8735': ' Skip because of blackList',
  'EPSG:8736': ' Skip because of blackList',
  'EPSG:8737': ' Skip because of blackList',
  'EPSG:8738': ' Skip because of blackList',
  'EPSG:8739': ' Skip because of blackList',
  'EPSG:8740': ' Skip because of blackList',
  'EPSG:8741': ' Skip because of blackList',
  'EPSG:8742': ' Skip because of blackList',
  'EPSG:8743': ' Skip because of blackList',
  'EPSG:8744': ' Skip because of blackList',
  'EPSG:8745': ' Skip because of blackList',
  'EPSG:8746': ' Skip because of blackList',
  'EPSG:8747': ' Skip because of blackList',
  'EPSG:8748': ' Skip because of blackList',
  'EPSG:8749': ' Skip because of blackList',
  'EPSG:8750': ' Skip because of blackList',
  'EPSG:8751': ' Skip because of blackList',
  'EPSG:8752': ' Skip because of blackList',
  'EPSG:8753': ' Skip because of blackList',
  'EPSG:8754': ' Skip because of blackList',
  'EPSG:8755': ' Skip because of blackList',
  'EPSG:8756': ' Skip because of blackList',
  'EPSG:8757': ' Skip because of blackList',
  'EPSG:8758': ' Skip because of blackList',
  'EPSG:8759': ' Skip because of blackList',
  'EPSG:8760': ' Skip because of blackList',
  'EPSG:8761': ' Skip because of blackList',
  'EPSG:7657': ' Skip because of blackList',
  'EPSG:8762': ' Skip because of blackList',
  'EPSG:8763': ' Skip because of blackList',
  'EPSG:8764': ' Skip because of blackList',
  'EPSG:8765': ' Skip because of blackList',
  'EPSG:8766': ' Skip because of blackList',
  'EPSG:8767': ' Skip because of blackList',
  'EPSG:7659': ' Skip because of blackList',
  'EPSG:8768': ' Skip because of blackList',
  'EPSG:8769': ' Skip because of blackList',
  'EPSG:8770': ' Skip because of blackList',
  'EPSG:8771': ' Skip because of blackList',
  'EPSG:8772': ' Skip because of blackList',
  'EPSG:8773': ' Skip because of blackList',
  'EPSG:8774': ' Skip because of blackList',
  'EPSG:8775': ' Skip because of blackList',
  'EPSG:8776': ' Skip because of blackList',
  'EPSG:8777': ' Skip because of blackList',
  'EPSG:8778': ' Skip because of blackList',
  'EPSG:8779': ' Skip because of blackList',
  'EPSG:8780': ' Skip because of blackList',
  'EPSG:8781': ' Skip because of blackList',
  'EPSG:8782': ' Skip because of blackList',
  'EPSG:8783': ' Skip because of blackList',
  'EPSG:8784': ' Skip because of blackList',
  'EPSG:8785': ' Skip because of blackList',
  'EPSG:8786': ' Skip because of blackList',
  'EPSG:8787': ' Skip because of blackList',
  'EPSG:8788': ' Skip because of blackList',
  'EPSG:8789': ' Skip because of blackList',
  'EPSG:8790': ' Skip because of blackList',
  'EPSG:8791': ' Skip because of blackList',
  'EPSG:8792': ' Skip because of blackList',
  'EPSG:8793': ' Skip because of blackList',
  'EPSG:8794': ' Skip because of blackList',
  'EPSG:8795': ' Skip because of blackList',
  'EPSG:8796': ' Skip because of blackList',
  'EPSG:8797': ' Skip because of blackList',
  'EPSG:8798': ' Skip because of blackList',
  'EPSG:8799': ' Skip because of blackList',
  'EPSG:8800': ' Skip because of blackList',
  'EPSG:8801': ' Skip because of blackList',
  'EPSG:8802': ' Skip because of blackList',
  'EPSG:8803': ' Skip because of blackList',
  'EPSG:7661': ' Skip because of blackList',
  'EPSG:8804': ' Skip because of blackList',
  'EPSG:8805': ' Skip because of blackList',
  'EPSG:8806': ' Skip because of blackList',
  'EPSG:8807': ' Skip because of blackList',
  'EPSG:8808': ' Skip because of blackList',
  'EPSG:8809': ' Skip because of blackList',
  'EPSG:8810': ' Skip because of blackList',
  'EPSG:8811': ' Skip because of blackList',
  'EPSG:8812': ' Skip because of blackList',
  'EPSG:8813': ' Skip because of blackList',
  'EPSG:8814': ' Skip because of blackList',
  'EPSG:8815': ' Skip because of blackList',
  'EPSG:8912': ' Skip because of blackList',
  'EPSG:3823': ' Skip because of blackList',
  'EPSG:3888': ' Skip because of blackList',
  'EPSG:4017': ' Skip because of blackList',
  'EPSG:4040': ' Skip because of blackList',
  'EPSG:4074': ' Skip because of blackList',
  'EPSG:4080': ' Skip because of blackList',
  'EPSG:4327': ' Skip because of blackList',
  'EPSG:4339': ' Skip because of blackList',
  'EPSG:4341': ' Skip because of blackList',
  'EPSG:4343': ' Skip because of blackList',
  'EPSG:4345': ' Skip because of blackList',
  'EPSG:4347': ' Skip because of blackList',
  'EPSG:7663': ' Skip because of blackList',
  'EPSG:4349': ' Skip because of blackList',
  'EPSG:4351': ' Skip because of blackList',
  'EPSG:4353': ' Skip because of blackList',
  'EPSG:4355': ' Skip because of blackList',
  'EPSG:4357': ' Skip because of blackList',
  'EPSG:7665': ' Skip because of blackList',
  'EPSG:4359': ' Skip because of blackList',
  'EPSG:4361': ' Skip because of blackList',
  'EPSG:4363': ' Skip because of blackList',
  'EPSG:4365': ' Skip because of blackList',
  'EPSG:4367': ' Skip because of blackList',
  'EPSG:7678': ' Skip because of blackList',
  'EPSG:4369': ' Skip because of blackList',
  'EPSG:4371': ' Skip because of blackList',
  'EPSG:4373': ' Skip because of blackList',
  'EPSG:4375': ' Skip because of blackList',
  'EPSG:4377': ' Skip because of blackList',
  'EPSG:7680': ' Skip because of blackList',
  'EPSG:4379': ' Skip because of blackList',
  'EPSG:4381': ' Skip because of blackList',
  'EPSG:4383': ' Skip because of blackList',
  'EPSG:4386': ' Skip because of blackList',
  'EPSG:4388': ' Skip because of blackList',
  'EPSG:4466': ' Skip because of blackList',
  'EPSG:7682': ' Skip because of blackList',
  'EPSG:7685': ' Skip because of blackList',
  'EPSG:4469': ' Skip because of blackList',
  'EPSG:4472': ' Skip because of blackList',
  'EPSG:4480': ' Skip because of blackList',
  'EPSG:4482': ' Skip because of blackList',
  'EPSG:4557': ' Skip because of blackList',
  'EPSG:4883': ' Skip because of blackList',
  'EPSG:4885': ' Skip because of blackList',
  'EPSG:4887': ' Skip because of blackList',
  'EPSG:4889': ' Skip because of blackList',
  'EPSG:4891': ' Skip because of blackList',
  'EPSG:4893': ' Skip because of blackList',
  'EPSG:4895': ' Skip because of blackList',
  'EPSG:4898': ' Skip because of blackList',
  'EPSG:4900': ' Skip because of blackList',
  'EPSG:4907': ' Skip because of blackList',
  'EPSG:4909': ' Skip because of blackList',
  'EPSG:4921': ' Skip because of blackList',
  'EPSG:4923': ' Skip because of blackList',
  'EPSG:4925': ' Skip because of blackList',
  'EPSG:4927': ' Skip because of blackList',
  'EPSG:4929': ' Skip because of blackList',
  'EPSG:4931': ' Skip because of blackList',
  'EPSG:4933': ' Skip because of blackList',
  'EPSG:7902': ' Skip because of blackList',
  'EPSG:4935': ' Skip because of blackList',
  'EPSG:4937': ' Skip because of blackList',
  'EPSG:4939': ' Skip because of blackList',
  'EPSG:4941': ' Skip because of blackList',
  'EPSG:4943': ' Skip because of blackList',
  'EPSG:7903': ' Skip because of blackList',
  'EPSG:4945': ' Skip because of blackList',
  'EPSG:4947': ' Skip because of blackList',
  'EPSG:4949': ' Skip because of blackList',
  'EPSG:4951': ' Skip because of blackList',
  'EPSG:4953': ' Skip because of blackList',
  'EPSG:7904': ' Skip because of blackList',
  'EPSG:4955': ' Skip because of blackList',
  'EPSG:4957': ' Skip because of blackList',
  'EPSG:4959': ' Skip because of blackList',
  'EPSG:4961': ' Skip because of blackList',
  'EPSG:4963': ' Skip because of blackList',
  'EPSG:7905': ' Skip because of blackList',
  'EPSG:4965': ' Skip because of blackList',
  'EPSG:4967': ' Skip because of blackList',
  'EPSG:4969': ' Skip because of blackList',
  'EPSG:4971': ' Skip because of blackList',
  'EPSG:4973': ' Skip because of blackList',
  'EPSG:7906': ' Skip because of blackList',
  'EPSG:4975': ' Skip because of blackList',
  'EPSG:4977': ' Skip because of blackList',
  'EPSG:4979': ' Skip because of blackList',
  'EPSG:4981': ' Skip because of blackList',
  'EPSG:4983': ' Skip because of blackList',
  'EPSG:4985': ' Skip because of blackList',
  'EPSG:4987': ' Skip because of blackList',
  'EPSG:4989': ' Skip because of blackList',
  'EPSG:4991': ' Skip because of blackList',
  'EPSG:4993': ' Skip because of blackList',
  'EPSG:4995': ' Skip because of blackList',
  'EPSG:7907': ' Skip because of blackList',
  'EPSG:7908': ' Skip because of blackList',
  'EPSG:4997': ' Skip because of blackList',
  'EPSG:4999': ' Skip because of blackList',
  'EPSG:5012': ' Skip because of blackList',
  'EPSG:5245': ' Skip because of blackList',
  'EPSG:5251': ' Skip because of blackList',
  'EPSG:7909': ' Skip because of blackList',
  'EPSG:5263': ' Skip because of blackList',
  'EPSG:5323': ' Skip because of blackList',
  'EPSG:5342': ' Skip because of blackList',
  'EPSG:5353': ' Skip because of blackList',
  'EPSG:5359': ' Skip because of blackList',
  'EPSG:7910': ' Skip because of blackList',
  'EPSG:5364': ' Skip because of blackList',
  'EPSG:5370': ' Skip because of blackList',
  'EPSG:5372': ' Skip because of blackList',
  'EPSG:5380': ' Skip because of blackList',
  'EPSG:5392': ' Skip because of blackList',
  'EPSG:7911': ' Skip because of blackList',
  'EPSG:5488': ' Skip because of blackList',
  'EPSG:5545': ' Skip because of blackList',
  'EPSG:5560': ' Skip because of blackList',
  'EPSG:5592': ' Skip because of blackList',
  'EPSG:5830': ' Skip because of blackList',
  'EPSG:5885': ' Skip because of blackList',
  'EPSG:7912': ' Skip because of blackList',
  'EPSG:6134': ' Skip because of blackList',
  'EPSG:6310': ' Skip because of blackList',
  'EPSG:6319': ' Skip because of blackList',
  'EPSG:6321': ' Skip because of blackList',
  'EPSG:6324': ' Skip because of blackList',
  'EPSG:6364': ' Skip because of blackList',
  'EPSG:6667': ' Skip because of blackList',
  'EPSG:7915': ' Skip because of blackList',
  'EPSG:6705': ' Skip because of blackList',
  'EPSG:6782': ' Skip because of blackList',
  'EPSG:6979': ' Skip because of blackList',
  'EPSG:6982': ' Skip because of blackList',
  'EPSG:6986': ' Skip because of blackList',
  'EPSG:6989': ' Skip because of blackList',
  'EPSG:7034': ' Skip because of blackList',
  'EPSG:7036': ' Skip because of blackList',
  'EPSG:9016': ' Skip because of blackList',
  'EPSG:7038': ' Skip because of blackList',
  'EPSG:7040': ' Skip because of blackList',
  'EPSG:7042': ' Skip because of blackList',
  'EPSG:7072': ' Skip because of blackList',
  'EPSG:7085': ' Skip because of blackList',
  'EPSG:7087': ' Skip because of blackList',
  'EPSG:7135': ' Skip because of blackList',
  'EPSG:7797': ' Skip because of blackList',
  'EPSG:7816': ' Skip because of blackList',
  'EPSG:7843': ' Skip because of blackList',
  'EPSG:7880': ' Skip because of blackList',
  'EPSG:7885': ' Skip because of blackList',
  'EPSG:7900': ' Skip because of blackList',
  'EPSG:7901': ' Skip because of blackList',
  'EPSG:7917': ' Skip because of blackList',
  'EPSG:7919': ' Skip because of blackList',
  'EPSG:7921': ' Skip because of blackList',
  'EPSG:7923': ' Skip because of blackList',
  'EPSG:7925': ' Skip because of blackList',
  'EPSG:7927': ' Skip because of blackList',
  'EPSG:7929': ' Skip because of blackList',
  'EPSG:7931': ' Skip because of blackList',
  'EPSG:8085': ' Skip because of blackList',
  'EPSG:8231': ' Skip because of blackList',
  'EPSG:8235': ' Skip because of blackList',
  'EPSG:8239': ' Skip because of blackList',
  'EPSG:9018': ' Skip because of blackList',
  'EPSG:8244': ' Skip because of blackList',
  'EPSG:8248': ' Skip because of blackList',
  'EPSG:8251': ' Skip because of blackList',
  'EPSG:8254': ' Skip because of blackList',
  'EPSG:8399': ' Skip because of blackList',
  'EPSG:8403': ' Skip because of blackList',
  'EPSG:8426': ' Skip because of blackList',
  'EPSG:8430': ' Skip because of blackList',
  'EPSG:8542': ' Skip because of blackList',
  'EPSG:8544': ' Skip because of blackList',
  'EPSG:8684': ' Skip because of blackList',
  'EPSG:8817': ' Skip because of blackList',
  'EPSG:8899': ' Skip because of blackList',
  'EPSG:8901': ' Skip because of blackList',
  'EPSG:8906': ' Skip because of blackList',
  'EPSG:9002': ' Skip because of blackList',
  'EPSG:9005': ' Skip because of blackList',
  'EPSG:9008': ' Skip because of blackList',
  'EPSG:9011': ' Skip because of blackList',
  'EPSG:9013': ' Skip because of blackList',
  'EPSG:3408': 'coordinates must be finite numbers',
  'EPSG:3409': 'coordinates must be finite numbers',
  'EPSG:3974': 'coordinates must be finite numbers',
  'EPSG:3973': 'coordinates must be finite numbers',
  'EPSG:5042': 'coordinates must be finite numbers',
  'EPSG:5482': 'coordinates must be finite numbers',
  'EPSG:6931': 'coordinates must be finite numbers',
  'EPSG:6932': 'coordinates must be finite numbers',
  'EPSG:32761': 'coordinates must be finite numbers',
  'EPSG:3295': 'coordinates must be finite numbers'
};

// We converted this point [17.888058560281515, 46.89226406700879] with proj4js this will give us wgsToCustom
// Then we transformed back the wgsToCustom to calculate customToWgs
final Map<String, ProjectAndUnProjectResult> testResults = {
  'EPSG:3819': ProjectAndUnProjectResult(
      Point(x: 17.889590510079564, y: 46.89133824892714),
      Point(x: 17.888058590372236, y: 46.89226407474856)),
  'EPSG:3821': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226940909668),
      Point(x: 17.888058560281515, y: 46.89226406702781)),
  'EPSG:3824': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:3889': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:3906': ProjectAndUnProjectResult(
      Point(x: 17.893343028916338, y: 46.89256923369196),
      Point(x: 17.888058599054727, y: 46.89226406925582)),
  'EPSG:4001': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89156202307832),
      Point(x: 17.888058560281515, y: 46.8922641256493)),
  'EPSG:4002': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891555329121985),
      Point(x: 17.888058560281515, y: 46.89226415100563)),
  'EPSG:4003': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226940909668),
      Point(x: 17.888058560281515, y: 46.89226406702781)),
  'EPSG:4004': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891667111272),
      Point(x: 17.888058560281515, y: 46.89226413303865)),
  'EPSG:4005': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891669957840094),
      Point(x: 17.888058560281515, y: 46.89226412388948)),
  'EPSG:4006': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891669713200216),
      Point(x: 17.888058560281515, y: 46.89226412467244)),
  'EPSG:4007': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.894876304001876),
      Point(x: 17.888058560281515, y: 46.892264067744904)),
  'EPSG:4008': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89439997507818),
      Point(x: 17.888058560281515, y: 46.892264047823126)),
  'EPSG:4009': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89440739031153),
      Point(x: 17.888058560281515, y: 46.892264129593705)),
  'EPSG:4010': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.895403256441554),
      Point(x: 17.888058560281515, y: 46.8922640560184)),
  'EPSG:4011': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540187406876),
      Point(x: 17.888058560281515, y: 46.89226403064899)),
  'EPSG:4012': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540255142901),
      Point(x: 17.888058560281515, y: 46.892264030594234)),
  'EPSG:4013': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540168196001),
      Point(x: 17.888058560281515, y: 46.8922640306297)),
  'EPSG:4014': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540190152416),
      Point(x: 17.888058560281515, y: 46.89226403064783)),
  'EPSG:4015': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.890614382797786),
      Point(x: 17.888058560281515, y: 46.892264264613424)),
  'EPSG:4016': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89061504563593),
      Point(x: 17.888058560281515, y: 46.892264258792565)),
  'EPSG:4018': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89061520998017),
      Point(x: 17.888058560281515, y: 46.892264257350064)),
  'EPSG:4019': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4020': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89223843211186),
      Point(x: 17.888058560281515, y: 46.89226406674914)),
  'EPSG:4021': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89227134028165),
      Point(x: 17.888058560281515, y: 46.892264067034574)),
  'EPSG:4022': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:4023': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4024': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89223978629081),
      Point(x: 17.888058560281515, y: 46.892264066591615)),
  'EPSG:4025': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.892268957628076),
      Point(x: 17.888058560281515, y: 46.89226406701472)),
  'EPSG:4027': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.88575860697436),
      Point(x: 17.888058560281515, y: 46.892265321883364)),
  'EPSG:4028': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89456657513059),
      Point(x: 17.888058560281515, y: 46.892264075977536)),
  'EPSG:4029': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89373303490688),
      Point(x: 17.888058560281515, y: 46.89226408451826)),
  'EPSG:4030': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4031': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4032': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226404293105),
      Point(x: 17.888058560281515, y: 46.8922640670088)),
  'EPSG:4033': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226404594078),
      Point(x: 17.888058560281515, y: 46.8922640670088)),
  'EPSG:4034': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.895401681983635),
      Point(x: 17.888058560281515, y: 46.892264030629626)),
  'EPSG:4035': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.7002178889327),
      Point(x: 17.888058560281515, y: 46.89213702363703)),
  'EPSG:4036': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89227123250313),
      Point(x: 17.888058560281515, y: 46.8922640670342)),
  'EPSG:4041': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.892264150719406),
      Point(x: 17.888058560281515, y: 46.89226406700877)),
  'EPSG:4042': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.890615053633574),
      Point(x: 17.888058560281515, y: 46.89226425858212)),
  'EPSG:4043': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.892262219671444),
      Point(x: 17.888058560281515, y: 46.89226406700934)),
  'EPSG:4044': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89061510968799),
      Point(x: 17.888058560281515, y: 46.89226425809032)),
  'EPSG:4045': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89061504725688),
      Point(x: 17.888058560281515, y: 46.89226425863833)),
  'EPSG:4046': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4047': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.7002178889327),
      Point(x: 17.888058560281515, y: 46.89213681286046)),
  'EPSG:4052': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.7002178889327),
      Point(x: 17.888058560281515, y: 46.89213711396999)),
  'EPSG:4053': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.7002178889327),
      Point(x: 17.888058560281515, y: 46.892130158581075)),
  'EPSG:4054': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89225387910864),
      Point(x: 17.888058560281515, y: 46.892264066790325)),
  'EPSG:4055': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.7002178889327),
      Point(x: 17.888058560281515, y: 46.891922361995945)),
  'EPSG:4075': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4081': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4120': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891667111272),
      Point(x: 17.888058560281515, y: 46.89226413303865)),
  'EPSG:4121': ProjectAndUnProjectResult(
      Point(x: 17.886319111822356, y: 46.88964974015317),
      Point(x: 17.888058542379405, y: 46.892264040019356)),
  'EPSG:4122': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.892264150719406),
      Point(x: 17.888058560281515, y: 46.89226406700877)),
  'EPSG:4123': ProjectAndUnProjectResult(
      Point(x: 17.890460923808195, y: 46.8927480842039),
      Point(x: 17.888058569538547, y: 46.892264085278)),
  'EPSG:4124': ProjectAndUnProjectResult(
      Point(x: 17.89111683155867, y: 46.89126953091154),
      Point(x: 17.888058586300215, y: 46.89226403037144)),
  'EPSG:4125': ProjectAndUnProjectResult(
      Point(x: 17.877865063178003, y: 46.89024053372384),
      Point(x: 17.888059821808675, y: 46.89226431815993)),
  'EPSG:4126': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4127': ProjectAndUnProjectResult(
      Point(x: 17.88898485101689, y: 46.895099716216706),
      Point(x: 17.888058517270704, y: 46.89226393491842)),
  'EPSG:4128': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89439997507818),
      Point(x: 17.888058560281515, y: 46.892264047823126)),
  'EPSG:4129': ProjectAndUnProjectResult(
      Point(x: 17.88890013291431, y: 46.89541223457047),
      Point(x: 17.88805850618414, y: 46.892263863991445)),
  'EPSG:4130': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4131': ProjectAndUnProjectResult(
      Point(x: 17.87785401620481, y: 46.891679815946205),
      Point(x: 17.888058908121824, y: 46.89226408697101)),
  'EPSG:4132': ProjectAndUnProjectResult(
      Point(x: 17.88912842628545, y: 46.891128257323274),
      Point(x: 17.888058564271084, y: 46.8922640627601)),
  'EPSG:4133': ProjectAndUnProjectResult(
      Point(x: 17.88807258856188, y: 46.89226281494607),
      Point(x: 17.888058560281266, y: 46.89226406700893)),
  'EPSG:4134': ProjectAndUnProjectResult(
      Point(x: 17.88743199286141, y: 46.89232048551994),
      Point(x: 17.888058574304544, y: 46.892264020038354)),
  'EPSG:4135': ProjectAndUnProjectResult(
      Point(x: 17.89186333824403, y: 46.895318810057795),
      Point(x: 17.888058435522446, y: 46.89226396652039)),
  'EPSG:4136': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89439997507818),
      Point(x: 17.888058560281515, y: 46.892264047823126)),
  'EPSG:4137': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89439997507818),
      Point(x: 17.888058560281515, y: 46.892264047823126)),
  'EPSG:4138': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89439997507818),
      Point(x: 17.888058560281515, y: 46.892264047823126)),
  'EPSG:4139': ProjectAndUnProjectResult(
      Point(x: 17.887203787603656, y: 46.89523479110371),
      Point(x: 17.888058574820874, y: 46.892264016316005)),
  'EPSG:4140': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4141': ProjectAndUnProjectResult(
      Point(x: 17.887178288997255, y: 46.8917553671602),
      Point(x: 17.888058557761525, y: 46.89226406554796)),
  'EPSG:4142': ProjectAndUnProjectResult(
      Point(x: 17.88689293822409, y: 46.891857519508626),
      Point(x: 17.888058524365807, y: 46.89226405444291)),
  'EPSG:4143': ProjectAndUnProjectResult(
      Point(x: 17.88689390545708, y: 46.89186031046316),
      Point(x: 17.88805852439511, y: 46.89226405452901)),
  'EPSG:4144': ProjectAndUnProjectResult(
      Point(x: 17.87888016879856, y: 46.89192581137229),
      Point(x: 17.888058932791115, y: 46.89226408076527)),
  'EPSG:4145': ProjectAndUnProjectResult(
      Point(x: 17.880681888395628, y: 46.89233928505992),
      Point(x: 17.888058839897592, y: 46.89226406413963)),
  'EPSG:4146': ProjectAndUnProjectResult(
      Point(x: 17.880055808022465, y: 46.89236328151591),
      Point(x: 17.888058818502056, y: 46.8922640637884)),
  'EPSG:4147': ProjectAndUnProjectResult(
      Point(x: 17.889340620285022, y: 46.892295366381994),
      Point(x: 17.888058566253854, y: 46.892264067155104)),
  'EPSG:4148': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4149': ProjectAndUnProjectResult(
      Point(x: 17.89058897773099, y: 46.893420533895046),
      Point(x: 17.88805857342885, y: 46.89226407303667)),
  'EPSG:4150': ProjectAndUnProjectResult(
      Point(x: 17.89058897773099, y: 46.893420533895046),
      Point(x: 17.88805857342885, y: 46.89226407303667)),
  'EPSG:4151': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4152': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4153': ProjectAndUnProjectResult(
      Point(x: 17.889486693864647, y: 46.89290650862107),
      Point(x: 17.888058552817974, y: 46.8922640636407)),
  'EPSG:4154': ProjectAndUnProjectResult(
      Point(x: 17.889235305497543, y: 46.893094948907134),
      Point(x: 17.888058556385946, y: 46.892264064249474)),
  'EPSG:4155': ProjectAndUnProjectResult(
      Point(x: 17.887262003930054, y: 46.894195551341284),
      Point(x: 17.888058563957035, y: 46.892264058068044)),
  'EPSG:4156': ProjectAndUnProjectResult(
      Point(x: 17.889483655386478, y: 46.89255090981592),
      Point(x: 17.888058570312527, y: 46.89226406903427)),
  'EPSG:4157': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.894876304001876),
      Point(x: 17.888058560281515, y: 46.892264067744904)),
  'EPSG:4158': ProjectAndUnProjectResult(
      Point(x: 17.883410020092334, y: 46.892776246869204),
      Point(x: 17.88805826525789, y: 46.89226409962333)),
  'EPSG:4159': ProjectAndUnProjectResult(
      Point(x: 17.888828579118577, y: 46.89309763553744),
      Point(x: 17.88805855967068, y: 46.892264066345454)),
  'EPSG:4160': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:4161': ProjectAndUnProjectResult(
      Point(x: 17.887994572881254, y: 46.89213861426008),
      Point(x: 17.88805855668369, y: 46.892264059932785)),
  'EPSG:4162': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891667111272),
      Point(x: 17.888058560281515, y: 46.89226413303865)),
  'EPSG:4163': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4164': ProjectAndUnProjectResult(
      Point(x: 17.8894754842712, y: 46.8910745711517),
      Point(x: 17.888058578013172, y: 46.89226405207682)),
  'EPSG:4165': ProjectAndUnProjectResult(
      Point(x: 17.884202019692626, y: 46.89234743893277),
      Point(x: 17.888058462095806, y: 46.89226406913976)),
  'EPSG:4166': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4167': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4168': ProjectAndUnProjectResult(
      Point(x: 17.886856942238104, y: 46.89057447103977),
      Point(x: 17.888058524869066, y: 46.89226401706037)),
  'EPSG:4169': ProjectAndUnProjectResult(
      Point(x: 17.88612155915996, y: 46.891300547834845),
      Point(x: 17.88805849850665, y: 46.8922640361846)),
  'EPSG:4170': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4171': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4172': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4173': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4174': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89373303490688),
      Point(x: 17.888058560281515, y: 46.89226408451826)),
  'EPSG:4175': ProjectAndUnProjectResult(
      Point(x: 17.887653935064552, y: 46.89423979151373),
      Point(x: 17.88805856386246, y: 46.892264049467926)),
  'EPSG:4176': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4178': ProjectAndUnProjectResult(
      Point(x: 17.88967433858724, y: 46.8926376649266),
      Point(x: 17.888058571408713, y: 46.89226406958981)),
  'EPSG:4179': ProjectAndUnProjectResult(
      Point(x: 17.88968389153443, y: 46.89263827240311),
      Point(x: 17.888058572338835, y: 46.892264068796905)),
  'EPSG:4180': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4181': ProjectAndUnProjectResult(
      Point(x: 17.885985188709242, y: 46.891410472758366),
      Point(x: 17.888058557212126, y: 46.8922640628794)),
  'EPSG:4182': ProjectAndUnProjectResult(
      Point(x: 17.888455953540493, y: 46.88958948053483),
      Point(x: 17.88805855714915, y: 46.89226408815598)),
  'EPSG:4183': ProjectAndUnProjectResult(
      Point(x: 17.88555400076387, y: 46.89300479015121),
      Point(x: 17.888058504603237, y: 46.89226408352831)),
  'EPSG:4184': ProjectAndUnProjectResult(
      Point(x: 17.88547971941075, y: 46.89177423856442),
      Point(x: 17.888058504324555, y: 46.89226405634754)),
  'EPSG:4185': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:4188': ProjectAndUnProjectResult(
      Point(x: 17.89149816134214, y: 46.89087754271238),
      Point(x: 17.888058682874288, y: 46.8922640188893)),
  'EPSG:4189': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4190': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4191': ProjectAndUnProjectResult(
      Point(x: 17.889780047022388, y: 46.89270927012999),
      Point(x: 17.888058561860525, y: 46.89226406417254)),
  'EPSG:4192': ProjectAndUnProjectResult(
      Point(x: 17.88940937007267, y: 46.891982973463755),
      Point(x: 17.888058553441127, y: 46.89226406843666)),
  'EPSG:4193': ProjectAndUnProjectResult(
      Point(x: 17.889668362724734, y: 46.89490699898191),
      Point(x: 17.88805851442825, y: 46.8922639914871)),
  'EPSG:4194': ProjectAndUnProjectResult(
      Point(x: 17.8869962335548, y: 46.8955494705063),
      Point(x: 17.888058527031806, y: 46.89226417016857)),
  'EPSG:4195': ProjectAndUnProjectResult(
      Point(x: 17.88418455062187, y: 46.895028094947314),
      Point(x: 17.88805841161424, y: 46.892264179570724)),
  'EPSG:4196': ProjectAndUnProjectResult(
      Point(x: 17.882443675058976, y: 46.89366554547311),
      Point(x: 17.888058345867105, y: 46.89226412250776)),
  'EPSG:4197': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540255142901),
      Point(x: 17.888058560281515, y: 46.892264030594234)),
  'EPSG:4198': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540255142901),
      Point(x: 17.888058560281515, y: 46.892264030594234)),
  'EPSG:4199': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:4200': ProjectAndUnProjectResult(
      Point(x: 17.889755560315955, y: 46.89262999262432),
      Point(x: 17.88805857029885, y: 46.8922640691192)),
  'EPSG:4201': ProjectAndUnProjectResult(
      Point(x: 17.887576830377576, y: 46.893080833974146),
      Point(x: 17.888058563000428, y: 46.89226406238434)),
  'EPSG:4202': ProjectAndUnProjectResult(
      Point(x: 17.888287661997563, y: 46.890674147943486),
      Point(x: 17.88805856087318, y: 46.89226405813346)),
  'EPSG:4203': ProjectAndUnProjectResult(
      Point(x: 17.888117874315867, y: 46.89041918662036),
      Point(x: 17.888058560599372, y: 46.8922640570915)),
  'EPSG:4204': ProjectAndUnProjectResult(
      Point(x: 17.890429142931993, y: 46.891671530046324),
      Point(x: 17.88805858437824, y: 46.89226406096708)),
  'EPSG:4205': ProjectAndUnProjectResult(
      Point(x: 17.889920676804028, y: 46.89136561351612),
      Point(x: 17.888058583628542, y: 46.89226405570901)),
  'EPSG:4206': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540187406876),
      Point(x: 17.888058560281515, y: 46.89226403064899)),
  'EPSG:4207': ProjectAndUnProjectResult(
      Point(x: 17.887589584381217, y: 46.890424883310125),
      Point(x: 17.888058555320438, y: 46.892264047492375)),
  'EPSG:4208': ProjectAndUnProjectResult(
      Point(x: 17.883861602436856, y: 46.89361973851696),
      Point(x: 17.888058523417733, y: 46.892264078954746)),
  'EPSG:4209': ProjectAndUnProjectResult(
      Point(x: 17.888606057304198, y: 46.896133481889876),
      Point(x: 17.88805852597426, y: 46.89226382376273)),
  'EPSG:4210': ProjectAndUnProjectResult(
      Point(x: 17.887488627766196, y: 46.89624671942169),
      Point(x: 17.888058595933604, y: 46.89226381707144)),
  'EPSG:4211': ProjectAndUnProjectResult(
      Point(x: 17.878035407484088, y: 46.89099159774057),
      Point(x: 17.888059883263967, y: 46.89226423543215)),
  'EPSG:4212': ProjectAndUnProjectResult(
      Point(x: 17.88442861267548, y: 46.893632591169165),
      Point(x: 17.888058380719098, y: 46.89226413492314)),
  'EPSG:4213': ProjectAndUnProjectResult(
      Point(x: 17.88871772398678, y: 46.893408260648066),
      Point(x: 17.888058557832185, y: 46.89226406274371)),
  'EPSG:4214': ProjectAndUnProjectResult(
      Point(x: 17.890050300715586, y: 46.892532970958314),
      Point(x: 17.88805856876601, y: 46.89226406815799)),
  'EPSG:4215': ProjectAndUnProjectResult(
      Point(x: 17.88960106454166, y: 46.893158792010986),
      Point(x: 17.88805862001476, y: 46.892264104890465)),
  'EPSG:4216': ProjectAndUnProjectResult(
      Point(x: 17.885104495171113, y: 46.892553822191374),
      Point(x: 17.888058488103763, y: 46.89226407411175)),
  'EPSG:4218': ProjectAndUnProjectResult(
      Point(x: 17.885499486596796, y: 46.897571019234405),
      Point(x: 17.888058466715794, y: 46.89226426167436)),
  'EPSG:4219': ProjectAndUnProjectResult(
      Point(x: 17.878219502434554, y: 46.89090128234533),
      Point(x: 17.888059869224158, y: 46.892264248817156)),
  'EPSG:4220': ProjectAndUnProjectResult(
      Point(x: 17.892193924486552, y: 46.895803032438074),
      Point(x: 17.88805833465257, y: 46.89226387329526)),
  'EPSG:4221': ProjectAndUnProjectResult(
      Point(x: 17.88576379730565, y: 46.89188044521362),
      Point(x: 17.888058488318986, y: 46.89226405494158)),
  'EPSG:4222': ProjectAndUnProjectResult(
      Point(x: 17.88885903683948, y: 46.89612862680453),
      Point(x: 17.888058510401954, y: 46.89226382542354)),
  'EPSG:4223': ProjectAndUnProjectResult(
      Point(x: 17.88692368188675, y: 46.89112086314892),
      Point(x: 17.888058547656183, y: 46.89226405425115)),
  'EPSG:4224': ProjectAndUnProjectResult(
      Point(x: 17.8844396573402, y: 46.892882095940344),
      Point(x: 17.888058483585702, y: 46.892264080149346)),
  'EPSG:4225': ProjectAndUnProjectResult(
      Point(x: 17.88512259072015, y: 46.89216530703706),
      Point(x: 17.888058513826838, y: 46.892264065441836)),
  'EPSG:4226': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540187406876),
      Point(x: 17.888058560281515, y: 46.89226403064899)),
  'EPSG:4227': ProjectAndUnProjectResult(
      Point(x: 17.887184563300927, y: 46.892761753630296),
      Point(x: 17.888058563233912, y: 46.892264065322266)),
  'EPSG:4228': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540187406876),
      Point(x: 17.888058560281515, y: 46.89226403064899)),
  'EPSG:4229': ProjectAndUnProjectResult(
      Point(x: 17.88616100866217, y: 46.891727756878986),
      Point(x: 17.888058562190455, y: 46.892264067549995)),
  'EPSG:4230': ProjectAndUnProjectResult(
      Point(x: 17.88893166266119, y: 46.89308670807359),
      Point(x: 17.888058565321924, y: 46.89226407177292)),
  'EPSG:4231': ProjectAndUnProjectResult(
      Point(x: 17.888924847955725, y: 46.8930767617878),
      Point(x: 17.888058566225, y: 46.892264072588254)),
  'EPSG:4232': ProjectAndUnProjectResult(
      Point(x: 17.886699809337195, y: 46.89188049193136),
      Point(x: 17.888058583479843, y: 46.89226407421031)),
  'EPSG:4233': ProjectAndUnProjectResult(
      Point(x: 17.891530821413426, y: 46.891298217036905),
      Point(x: 17.88805860647322, y: 46.89226405412053)),
  'EPSG:4234': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540187406876),
      Point(x: 17.888058560281515, y: 46.89226403064899)),
  'EPSG:4235': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:4236': ProjectAndUnProjectResult(
      Point(x: 17.892346029888245, y: 46.889243935620044),
      Point(x: 17.888058241276223, y: 46.89226429240757)),
  'EPSG:4237': ProjectAndUnProjectResult(
      Point(x: 17.88916569162529, y: 46.892543996221036),
      Point(x: 17.888058565574823, y: 46.892264068351416)),
  'EPSG:4238': ProjectAndUnProjectResult(
      Point(x: 17.888149140889887, y: 46.89206035315574),
      Point(x: 17.888058560387304, y: 46.89226406677013)),
  'EPSG:4239': ProjectAndUnProjectResult(
      Point(x: 17.87865495536962, y: 46.891792293513525),
      Point(x: 17.888058899882886, y: 46.89226408408594)),
  'EPSG:4240': ProjectAndUnProjectResult(
      Point(x: 17.878739158646248, y: 46.89179187013394),
      Point(x: 17.888058916886116, y: 46.8922640851195)),
  'EPSG:4241': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.895401681983635),
      Point(x: 17.888058560281515, y: 46.892264030629626)),
  'EPSG:4242': ProjectAndUnProjectResult(
      Point(x: 17.885755708408063, y: 46.892860713000246),
      Point(x: 17.88805844635425, y: 46.8922640966206)),
  'EPSG:4243': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.890615053633574),
      Point(x: 17.888058560281515, y: 46.89226425858212)),
  'EPSG:4244': ProjectAndUnProjectResult(
      Point(x: 17.877839573051762, y: 46.89106653380673),
      Point(x: 17.88805951681861, y: 46.892264179410205)),
  'EPSG:4245': ProjectAndUnProjectResult(
      Point(x: 17.877386729833542, y: 46.89223185252286),
      Point(x: 17.88805949588407, y: 46.89226406979833)),
  'EPSG:4246': ProjectAndUnProjectResult(
      Point(x: 17.889369426719277, y: 46.88992675311392),
      Point(x: 17.888058575893997, y: 46.89226403908497)),
  'EPSG:4247': ProjectAndUnProjectResult(
      Point(x: 17.885575231028568, y: 46.89379807115077),
      Point(x: 17.888058643287803, y: 46.89226401557033)),
  'EPSG:4248': ProjectAndUnProjectResult(
      Point(x: 17.88471263263447, y: 46.8939485850594),
      Point(x: 17.888058676900894, y: 46.89226400810805)),
  'EPSG:4249': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:4250': ProjectAndUnProjectResult(
      Point(x: 17.887172482230394, y: 46.892411036577954),
      Point(x: 17.888058544556486, y: 46.89226406962533)),
  'EPSG:4251': ProjectAndUnProjectResult(
      Point(x: 17.887196330109735, y: 46.894379819264344),
      Point(x: 17.888058568348903, y: 46.89226404714982)),
  'EPSG:4252': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540187406876),
      Point(x: 17.888058560281515, y: 46.89226403064899)),
  'EPSG:4253': ProjectAndUnProjectResult(
      Point(x: 17.88848403025963, y: 46.89372691088209),
      Point(x: 17.888058547156763, y: 46.8922640217402)),
  'EPSG:4254': ProjectAndUnProjectResult(
      Point(x: 17.885675452411373, y: 46.893008004004194),
      Point(x: 17.888058440261307, y: 46.892264104595334)),
  'EPSG:4255': ProjectAndUnProjectResult(
      Point(x: 17.88948851238981, y: 46.889854644489276),
      Point(x: 17.88805856530313, y: 46.892264058521334)),
  'EPSG:4256': ProjectAndUnProjectResult(
      Point(x: 17.890971046188174, y: 46.896038620827106),
      Point(x: 17.88805847310742, y: 46.892263953667324)),
  'EPSG:4257': ProjectAndUnProjectResult(
      Point(x: 17.879199861644413, y: 46.88814568219285),
      Point(x: 17.888059768494056, y: 46.89226463038157)),
  'EPSG:4258': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4259': ProjectAndUnProjectResult(
      Point(x: 17.88710140026856, y: 46.89210196633683),
      Point(x: 17.888058565856863, y: 46.89226406795597)),
  'EPSG:4260': ProjectAndUnProjectResult(
      Point(x: 17.889668362724734, y: 46.89490767633145),
      Point(x: 17.88805851440427, y: 46.89226399142825)),
  'EPSG:4261': ProjectAndUnProjectResult(
      Point(x: 17.886360298096015, y: 46.89560123818276),
      Point(x: 17.888058557275553, y: 46.89226407293465)),
  'EPSG:4262': ProjectAndUnProjectResult(
      Point(x: 17.885576177667634, y: 46.89610913745565),
      Point(x: 17.888058622476596, y: 46.89226397036131)),
  'EPSG:4263': ProjectAndUnProjectResult(
      Point(x: 17.888849074168615, y: 46.89389003348671),
      Point(x: 17.888058552341498, y: 46.89226405062547)),
  'EPSG:4264': ProjectAndUnProjectResult(
      Point(x: 17.887090426208047, y: 46.89208763998366),
      Point(x: 17.888058565335186, y: 46.89226406793263)),
  'EPSG:4265': ProjectAndUnProjectResult(
      Point(x: 17.88806206252404, y: 46.89153971492727),
      Point(x: 17.88805856483977, y: 46.892264067501486)),
  'EPSG:4266': ProjectAndUnProjectResult(
      Point(x: 17.889383648796457, y: 46.894418962792756),
      Point(x: 17.888058535696295, y: 46.89226402690006)),
  'EPSG:4267': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89439997507818),
      Point(x: 17.888058560281515, y: 46.892264047823126)),
  'EPSG:4268': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89440739031153),
      Point(x: 17.888058560281515, y: 46.892264129593705)),
  'EPSG:4269': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4270': ProjectAndUnProjectResult(
      Point(x: 17.889002961206145, y: 46.8911896257025),
      Point(x: 17.88805856169809, y: 46.89226406539213)),
  'EPSG:4271': ProjectAndUnProjectResult(
      Point(x: 17.883335320057093, y: 46.892763918400064),
      Point(x: 17.888058268284464, y: 46.89226409801385)),
  'EPSG:4272': ProjectAndUnProjectResult(
      Point(x: 17.88819953783656, y: 46.89222622730486),
      Point(x: 17.888058577183052, y: 46.892264068019884)),
  'EPSG:4273': ProjectAndUnProjectResult(
      Point(x: 17.89207245993109, y: 46.89002141197087),
      Point(x: 17.88805856210612, y: 46.89226407696183)),
  'EPSG:4274': ProjectAndUnProjectResult(
      Point(x: 17.88578286214444, y: 46.89168614169353),
      Point(x: 17.888058522143783, y: 46.89226405729353)),
  'EPSG:4275': ProjectAndUnProjectResult(
      Point(x: 17.888130687051746, y: 46.89226381503744),
      Point(x: 17.888058560710174, y: 46.89226406700729)),
  'EPSG:4276': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.892268957628076),
      Point(x: 17.888058560281515, y: 46.89226406701472)),
  'EPSG:4277': ProjectAndUnProjectResult(
      Point(x: 17.89125174421817, y: 46.89081594604395),
      Point(x: 17.888058558608066, y: 46.892264067200834)),
  'EPSG:4278': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89156202307832),
      Point(x: 17.888058560281515, y: 46.8922641256493)),
  'EPSG:4279': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89156202307832),
      Point(x: 17.888058560281515, y: 46.8922641256493)),
  'EPSG:4280': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891667111272),
      Point(x: 17.888058560281515, y: 46.89226413303865)),
  'EPSG:4281': ProjectAndUnProjectResult(
      Point(x: 17.88640309155158, y: 46.89129025552753),
      Point(x: 17.888058483333054, y: 46.892264029983394)),
  'EPSG:4282': ProjectAndUnProjectResult(
      Point(x: 17.88682522003918, y: 46.89636840495731),
      Point(x: 17.88805863204859, y: 46.89226382741024)),
  'EPSG:4283': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4284': ProjectAndUnProjectResult(
      Point(x: 17.88972298822399, y: 46.89269405847744),
      Point(x: 17.888058570172568, y: 46.89226406845011)),
  'EPSG:4285': ProjectAndUnProjectResult(
      Point(x: 17.89106859551569, y: 46.891578847854085),
      Point(x: 17.888058595968577, y: 46.89226405885983)),
  'EPSG:4286': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89223843211186),
      Point(x: 17.888058560281515, y: 46.89226406674914)),
  'EPSG:4287': ProjectAndUnProjectResult(
      Point(x: 17.8869962335548, y: 46.8955494705063),
      Point(x: 17.888058527031806, y: 46.89226417016857)),
  'EPSG:4288': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:4289': ProjectAndUnProjectResult(
      Point(x: 17.890149632205905, y: 46.89256626995258),
      Point(x: 17.888058571915472, y: 46.89226406583144)),
  'EPSG:4291': ProjectAndUnProjectResult(
      Point(x: 17.887816338046054, y: 46.89216904811291),
      Point(x: 17.88805856195776, y: 46.89226406766842)),
  'EPSG:4292': ProjectAndUnProjectResult(
      Point(x: 17.886365628239236, y: 46.89046548138973),
      Point(x: 17.88805855273655, y: 46.89226405896806)),
  'EPSG:4293': ProjectAndUnProjectResult(
      Point(x: 17.88933022937584, y: 46.897258350298635),
      Point(x: 17.888058484614056, y: 46.89226376887304)),
  'EPSG:4294': ProjectAndUnProjectResult(
      Point(x: 17.87789321261279, y: 46.89027575009919),
      Point(x: 17.888059822235842, y: 46.8922643145557)),
  'EPSG:4295': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891667111272),
      Point(x: 17.888058560281515, y: 46.89226413303865)),
  'EPSG:4296': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540187406876),
      Point(x: 17.888058560281515, y: 46.89226403064899)),
  'EPSG:8246': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4297': ProjectAndUnProjectResult(
      Point(x: 17.890318647376606, y: 46.89197436010706),
      Point(x: 17.8880585469207, y: 46.892264068726696)),
  'EPSG:4298': ProjectAndUnProjectResult(
      Point(x: 17.876968826843065, y: 46.88801569432457),
      Point(x: 17.88806042992997, y: 46.892264785360716)),
  'EPSG:4299': ProjectAndUnProjectResult(
      Point(x: 17.89149816134214, y: 46.890870847956194),
      Point(x: 17.888058558102674, y: 46.892264068524085)),
  'EPSG:4300': ProjectAndUnProjectResult(
      Point(x: 17.89149816134214, y: 46.890870847956194),
      Point(x: 17.888058558102674, y: 46.892264068524085)),
  'EPSG:4301': ProjectAndUnProjectResult(
      Point(x: 17.88113303218112, y: 46.887591671655095),
      Point(x: 17.888058773192473, y: 46.892264211085)),
  'EPSG:4302': ProjectAndUnProjectResult(
      Point(x: 17.88425729588024, y: 46.89216271108818),
      Point(x: 17.888058342544866, y: 46.89226406118848)),
  'EPSG:4303': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89223843211186),
      Point(x: 17.888058560281515, y: 46.89226406674914)),
  'EPSG:4304': ProjectAndUnProjectResult(
      Point(x: 17.890848660074248, y: 46.89305198445358),
      Point(x: 17.8880585570519, y: 46.89226406609385)),
  'EPSG:4306': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891667111272),
      Point(x: 17.888058560281515, y: 46.89226413303865)),
  'EPSG:4307': ProjectAndUnProjectResult(
      Point(x: 17.88846626695256, y: 46.89234812636942),
      Point(x: 17.888058555003756, y: 46.89226406004092)),
  'EPSG:4308': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891667111272),
      Point(x: 17.888058560281515, y: 46.89226413303865)),
  'EPSG:4309': ProjectAndUnProjectResult(
      Point(x: 17.885298528576193, y: 46.892233086942255),
      Point(x: 17.888058489235636, y: 46.892264066209684)),
  'EPSG:4310': ProjectAndUnProjectResult(
      Point(x: 17.885564999334463, y: 46.8950505604044),
      Point(x: 17.888058555778105, y: 46.89226407205741)),
  'EPSG:4311': ProjectAndUnProjectResult(
      Point(x: 17.88549210530198, y: 46.89387076538575),
      Point(x: 17.888058643082715, y: 46.892264015006454)),
  'EPSG:4312': ProjectAndUnProjectResult(
      Point(x: 17.889363301810285, y: 46.89255711860701),
      Point(x: 17.888058571079615, y: 46.8922640719494)),
  'EPSG:4313': ProjectAndUnProjectResult(
      Point(x: 17.88960106454166, y: 46.893158792010986),
      Point(x: 17.88805862001476, y: 46.892264104890465)),
  'EPSG:4314': ProjectAndUnProjectResult(
      Point(x: 17.890291752597673, y: 46.892979025245644),
      Point(x: 17.888058571400855, y: 46.89226406835496)),
  'EPSG:4315': ProjectAndUnProjectResult(
      Point(x: 17.884731546747, y: 46.89583586991772),
      Point(x: 17.888058581617305, y: 46.892264044029275)),
  'EPSG:4605': ProjectAndUnProjectResult(
      Point(x: 17.885809584610897, y: 46.89437726949937),
      Point(x: 17.88805851007049, y: 46.892264114339376)),
  'EPSG:4316': ProjectAndUnProjectResult(
      Point(x: 17.889728481044955, y: 46.8954153421914),
      Point(x: 17.888058566597667, y: 46.892264078966164)),
  'EPSG:4317': ProjectAndUnProjectResult(
      Point(x: 17.88968240024422, y: 46.89264401721376),
      Point(x: 17.88805857198031, y: 46.89226406975483)),
  'EPSG:4318': ProjectAndUnProjectResult(
      Point(x: 17.88811684154245, y: 46.89221535782348),
      Point(x: 17.88805856027027, y: 46.89226406701824)),
  'EPSG:4319': ProjectAndUnProjectResult(
      Point(x: 17.887833618004347, y: 46.89214211393298),
      Point(x: 17.88805856061255, y: 46.89226406718884)),
  'EPSG:4322': ProjectAndUnProjectResult(
      Point(x: 17.88790467139263, y: 46.892234600760624),
      Point(x: 17.888058560281515, y: 46.892264066788826)),
  'EPSG:4324': ProjectAndUnProjectResult(
      Point(x: 17.88783244917041, y: 46.89225046689003),
      Point(x: 17.888058560281518, y: 46.89226406656845)),
  'EPSG:4326': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4463': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4470': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4475': ProjectAndUnProjectResult(
      Point(x: 17.887237885734397, y: 46.89216008403257),
      Point(x: 17.888058591798575, y: 46.89226407101459)),
  'EPSG:4483': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4490': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4555': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89223978629081),
      Point(x: 17.888058560281515, y: 46.892264066591615)),
  'EPSG:4558': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4600': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540255142901),
      Point(x: 17.888058560281515, y: 46.892264030594234)),
  'EPSG:4601': ProjectAndUnProjectResult(
      Point(x: 17.88721814677669, y: 46.893342149927),
      Point(x: 17.888058585409585, y: 46.89226403467231)),
  'EPSG:4602': ProjectAndUnProjectResult(
      Point(x: 17.882425548003347, y: 46.898021261455405),
      Point(x: 17.888057738261182, y: 46.89226490990544)),
  'EPSG:4603': ProjectAndUnProjectResult(
      Point(x: 17.885680098564837, y: 46.89571197771934),
      Point(x: 17.888058528393696, y: 46.892264113383426)),
  'EPSG:4604': ProjectAndUnProjectResult(
      Point(x: 17.884276605220265, y: 46.89497059488942),
      Point(x: 17.888058334744, y: 46.8922642289329)),
  'EPSG:4606': ProjectAndUnProjectResult(
      Point(x: 17.885859666543812, y: 46.8929099882085),
      Point(x: 17.888058535444458, y: 46.89226407432793)),
  'EPSG:4607': ProjectAndUnProjectResult(
      Point(x: 17.884694673740547, y: 46.89560829660311),
      Point(x: 17.888058389924087, y: 46.892264236916844)),
  'EPSG:4608': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89439997507818),
      Point(x: 17.888058560281515, y: 46.892264047823126)),
  'EPSG:4609': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89439997507818),
      Point(x: 17.888058560281515, y: 46.892264047823126)),
  'EPSG:4610': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226430120541),
      Point(x: 17.888058560281515, y: 46.89226406700891)),
  'EPSG:4611': ProjectAndUnProjectResult(
      Point(x: 17.89099923399472, y: 46.89190484851266),
      Point(x: 17.888058516995418, y: 46.892264063154926)),
  'EPSG:4612': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4613': ProjectAndUnProjectResult(
      Point(x: 17.87789321261279, y: 46.89027575009919),
      Point(x: 17.888059822235842, y: 46.8922643145557)),
  'EPSG:4614': ProjectAndUnProjectResult(
      Point(x: 17.891406881740558, y: 46.89174050444905),
      Point(x: 17.888058600353727, y: 46.892264061580484)),
  'EPSG:4615': ProjectAndUnProjectResult(
      Point(x: 17.889156602283535, y: 46.88753333683978),
      Point(x: 17.88805856970177, y: 46.89226402629913)),
  'EPSG:4616': ProjectAndUnProjectResult(
      Point(x: 17.8884421751394, y: 46.89065924577472),
      Point(x: 17.88805856221497, y: 46.89226405889515)),
  'EPSG:4617': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4618': ProjectAndUnProjectResult(
      Point(x: 17.887734475828278, y: 46.892097093209316),
      Point(x: 17.888058562716655, y: 46.89226406826737)),
  'EPSG:4619': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4620': ProjectAndUnProjectResult(
      Point(x: 17.88924218112375, y: 46.893465592311145),
      Point(x: 17.888058551122096, y: 46.892264057681295)),
  'EPSG:4621': ProjectAndUnProjectResult(
      Point(x: 17.885513710819573, y: 46.897083926153584),
      Point(x: 17.888058548504002, y: 46.89226408938738)),
  'EPSG:4622': ProjectAndUnProjectResult(
      Point(x: 17.886376296781005, y: 46.89197759023489),
      Point(x: 17.888058645514224, y: 46.89226408156828)),
  'EPSG:4623': ProjectAndUnProjectResult(
      Point(x: 17.884436847845105, y: 46.891709591178596),
      Point(x: 17.888058441256078, y: 46.892264048731)),
  'EPSG:4624': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4625': ProjectAndUnProjectResult(
      Point(x: 17.88278885238051, y: 46.89429083216939),
      Point(x: 17.88805811931666, y: 46.89226423715717)),
  'EPSG:4626': ProjectAndUnProjectResult(
      Point(x: 17.90027503305275, y: 46.89951537654362),
      Point(x: 17.888056921845994, y: 46.89226309120497)),
  'EPSG:4627': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4628': ProjectAndUnProjectResult(
      Point(x: 17.887250423662014, y: 46.89338618412523),
      Point(x: 17.888058504039414, y: 46.89226414534991)),
  'EPSG:4629': ProjectAndUnProjectResult(
      Point(x: 17.884406106849905, y: 46.89384278599231),
      Point(x: 17.888058313856018, y: 46.892264159538165)),
  'EPSG:4630': ProjectAndUnProjectResult(
      Point(x: 17.884975423977735, y: 46.893762453048616),
      Point(x: 17.888058385637116, y: 46.892264152156805)),
  'EPSG:4631': ProjectAndUnProjectResult(
      Point(x: 17.890978201391995, y: 46.892980160097515),
      Point(x: 17.888058712257504, y: 46.892264104403324)),
  'EPSG:4632': ProjectAndUnProjectResult(
      Point(x: 17.887255748631244, y: 46.89218847940424),
      Point(x: 17.888058591658098, y: 46.89226406997221)),
  'EPSG:4633': ProjectAndUnProjectResult(
      Point(x: 17.886631067875875, y: 46.89704960653234),
      Point(x: 17.888058493571194, y: 46.892264291373415)),
  'EPSG:4634': ProjectAndUnProjectResult(
      Point(x: 17.89235170464927, y: 46.89050602958376),
      Point(x: 17.88805878472249, y: 46.89226397481847)),
  'EPSG:4635': ProjectAndUnProjectResult(
      Point(x: 17.892041183889614, y: 46.88969257925379),
      Point(x: 17.888058581785078, y: 46.892264017988204)),
  'EPSG:4636': ProjectAndUnProjectResult(
      Point(x: 17.88710701957235, y: 46.89473654925238),
      Point(x: 17.888058470694517, y: 46.892264300535274)),
  'EPSG:4637': ProjectAndUnProjectResult(
      Point(x: 17.887445339647073, y: 46.894368959173974),
      Point(x: 17.88805850542791, y: 46.892264255895014)),
  'EPSG:4638': ProjectAndUnProjectResult(
      Point(x: 17.88280763118828, y: 46.893032812684694),
      Point(x: 17.888058304217317, y: 46.89226410462147)),
  'EPSG:4639': ProjectAndUnProjectResult(
      Point(x: 17.8907267486178, y: 46.895179932784885),
      Point(x: 17.888058663196375, y: 46.89226417983814)),
  'EPSG:4640': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4641': ProjectAndUnProjectResult(
      Point(x: 17.886997535873586, y: 46.89607270696852),
      Point(x: 17.888058505847603, y: 46.8922642630332)),
  'EPSG:4642': ProjectAndUnProjectResult(
      Point(x: 17.89235170464927, y: 46.89050602958376),
      Point(x: 17.88805878472249, y: 46.89226397481847)),
  'EPSG:4671': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540187406876),
      Point(x: 17.888058560281515, y: 46.89226403064899)),
  'EPSG:4643': ProjectAndUnProjectResult(
      Point(x: 17.89911985026825, y: 46.89707061133045),
      Point(x: 17.888057469925077, y: 46.8922641752369)),
  'EPSG:4644': ProjectAndUnProjectResult(
      Point(x: 17.892393416084214, y: 46.89052262337273),
      Point(x: 17.88805878748905, y: 46.89226397545263)),
  'EPSG:4645': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:4646': ProjectAndUnProjectResult(
      Point(x: 17.877810348941836, y: 46.89030120340471),
      Point(x: 17.88805948904907, y: 46.89226424540961)),
  'EPSG:4657': ProjectAndUnProjectResult(
      Point(x: 17.88546066911159, y: 46.89131098788118),
      Point(x: 17.88805897605859, y: 46.89226422001618)),
  'EPSG:4658': ProjectAndUnProjectResult(
      Point(x: 17.88717743233147, y: 46.89323310922694),
      Point(x: 17.888058545916724, y: 46.89226408285691)),
  'EPSG:4659': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4660': ProjectAndUnProjectResult(
      Point(x: 17.88964062637946, y: 46.894746227733776),
      Point(x: 17.888057194615087, y: 46.892265015063444)),
  'EPSG:4661': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4662': ProjectAndUnProjectResult(
      Point(x: 17.892364679364178, y: 46.890513441336765),
      Point(x: 17.888058785902057, y: 46.892263975002756)),
  'EPSG:4663': ProjectAndUnProjectResult(
      Point(x: 17.889121534685867, y: 46.88752019786821),
      Point(x: 17.888058568882606, y: 46.89226402850628)),
  'EPSG:4664': ProjectAndUnProjectResult(
      Point(x: 17.885483484701325, y: 46.89174877482454),
      Point(x: 17.888058504245326, y: 46.892264055760975)),
  'EPSG:4665': ProjectAndUnProjectResult(
      Point(x: 17.885552947330282, y: 46.89298894154823),
      Point(x: 17.888058505169003, y: 46.892264083003866)),
  'EPSG:4666': ProjectAndUnProjectResult(
      Point(x: 17.89249247462093, y: 46.89098242462263),
      Point(x: 17.888058559248655, y: 46.89226406730827)),
  'EPSG:4667': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4668': ProjectAndUnProjectResult(
      Point(x: 17.888935693234195, y: 46.8930806639105),
      Point(x: 17.8880585656349, y: 46.8922640720085)),
  'EPSG:4669': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4670': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4746': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891667111272),
      Point(x: 17.888058560281515, y: 46.89226413303865)),
  'EPSG:4672': ProjectAndUnProjectResult(
      Point(x: 17.889238463056923, y: 46.89340678995979),
      Point(x: 17.88805863242381, y: 46.89226413709957)),
  'EPSG:4673': ProjectAndUnProjectResult(
      Point(x: 17.888924521304972, y: 46.893428776837766),
      Point(x: 17.888058623138072, y: 46.89226413881443)),
  'EPSG:4674': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4675': ProjectAndUnProjectResult(
      Point(x: 17.890752311639893, y: 46.891682599344946),
      Point(x: 17.888058566515163, y: 46.892264065659084)),
  'EPSG:4676': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89223978629081),
      Point(x: 17.888058560281515, y: 46.892264066591615)),
  'EPSG:4677': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89223978629081),
      Point(x: 17.888058560281515, y: 46.892264066591615)),
  'EPSG:4678': ProjectAndUnProjectResult(
      Point(x: 17.889876773236402, y: 46.89249682169752),
      Point(x: 17.88805858362109, y: 46.892264070006156)),
  'EPSG:4679': ProjectAndUnProjectResult(
      Point(x: 17.88457348974185, y: 46.89362339205687),
      Point(x: 17.88805848402476, y: 46.892264096847704)),
  'EPSG:4680': ProjectAndUnProjectResult(
      Point(x: 17.889353342845457, y: 46.8977797632434),
      Point(x: 17.888058517439326, y: 46.89226388391012)),
  'EPSG:4681': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540255142901),
      Point(x: 17.888058560281515, y: 46.892264030594234)),
  'EPSG:4682': ProjectAndUnProjectResult(
      Point(x: 17.880011527018617, y: 46.89226657819295),
      Point(x: 17.888058854118235, y: 46.89226406690649)),
  'EPSG:4683': ProjectAndUnProjectResult(
      Point(x: 17.88752878305918, y: 46.89531286609277),
      Point(x: 17.888058548246388, y: 46.89226402045779)),
  'EPSG:4684': ProjectAndUnProjectResult(
      Point(x: 17.891530821413426, y: 46.891298217036905),
      Point(x: 17.88805860647322, y: 46.89226405412053)),
  'EPSG:4685': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:4686': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4687': ProjectAndUnProjectResult(
      Point(x: 17.888062019684995, y: 46.892266639477235),
      Point(x: 17.888058560281404, y: 46.892264067008945)),
  'EPSG:4688': ProjectAndUnProjectResult(
      Point(x: 17.875491445920094, y: 46.902894781164655),
      Point(x: 17.888053645696168, y: 46.89225762930562)),
  'EPSG:4689': ProjectAndUnProjectResult(
      Point(x: 17.889777663834664, y: 46.895670868507914),
      Point(x: 17.88805865056876, y: 46.89226438035667)),
  'EPSG:7039': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4690': ProjectAndUnProjectResult(
      Point(x: 17.886490230812537, y: 46.89352917427127),
      Point(x: 17.888058465456226, y: 46.89226420182663)),
  'EPSG:4691': ProjectAndUnProjectResult(
      Point(x: 17.886312153203775, y: 46.89348297085436),
      Point(x: 17.888058467903072, y: 46.892264199301934)),
  'EPSG:4692': ProjectAndUnProjectResult(
      Point(x: 17.887847411101863, y: 46.89446897440634),
      Point(x: 17.88805854774968, y: 46.89226419828875)),
  'EPSG:4693': ProjectAndUnProjectResult(
      Point(x: 17.888060433409922, y: 46.8922595843611),
      Point(x: 17.888058560281653, y: 46.89226406700847)),
  'EPSG:4694': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4695': ProjectAndUnProjectResult(
      Point(x: 17.887760475462485, y: 46.895305433836086),
      Point(x: 17.888058574909916, y: 46.89226391727656)),
  'EPSG:4696': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540255142901),
      Point(x: 17.888058560281515, y: 46.892264030594234)),
  'EPSG:4697': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540255142901),
      Point(x: 17.888058560281515, y: 46.892264030594234)),
  'EPSG:4698': ProjectAndUnProjectResult(
      Point(x: 17.890978201391995, y: 46.892980160097515),
      Point(x: 17.888058712257504, y: 46.892264104403324)),
  'EPSG:4699': ProjectAndUnProjectResult(
      Point(x: 17.882977455574668, y: 46.893971328045275),
      Point(x: 17.888059280197965, y: 46.89226382433033)),
  'EPSG:4700': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540255142901),
      Point(x: 17.888058560281515, y: 46.892264030594234)),
  'EPSG:4701': ProjectAndUnProjectResult(
      Point(x: 17.88960106454166, y: 46.89547705613627),
      Point(x: 17.88805857313875, y: 46.89226409682905)),
  'EPSG:4702': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4703': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540255142901),
      Point(x: 17.888058560281515, y: 46.892264030594234)),
  'EPSG:4704': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:4705': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:4706': ProjectAndUnProjectResult(
      Point(x: 17.88606284100167, y: 46.89152694466221),
      Point(x: 17.888058561521675, y: 46.892264067468275)),
  'EPSG:4707': ProjectAndUnProjectResult(
      Point(x: 17.889966620179933, y: 46.89560969979221),
      Point(x: 17.888058562981083, y: 46.892264071757495)),
  'EPSG:4708': ProjectAndUnProjectResult(
      Point(x: 17.886354502128633, y: 46.88648237628388),
      Point(x: 17.88805855593484, y: 46.89226405221617)),
  'EPSG:4709': ProjectAndUnProjectResult(
      Point(x: 17.887706403556955, y: 46.895813813158675),
      Point(x: 17.888058554008516, y: 46.89226413044398)),
  'EPSG:4710': ProjectAndUnProjectResult(
      Point(x: 17.8799009205528, y: 46.895230056341475),
      Point(x: 17.88805888070346, y: 46.892263950123855)),
  'EPSG:4711': ProjectAndUnProjectResult(
      Point(x: 17.89148045704814, y: 46.89354091777952),
      Point(x: 17.888058675761418, y: 46.892264110237484)),
  'EPSG:4712': ProjectAndUnProjectResult(
      Point(x: 17.885896226032933, y: 46.891693165360294),
      Point(x: 17.88805851621705, y: 46.89226405533878)),
  'EPSG:4713': ProjectAndUnProjectResult(
      Point(x: 17.88934658256844, y: 46.8937902354589),
      Point(x: 17.888058550773266, y: 46.89226405570672)),
  'EPSG:4714': ProjectAndUnProjectResult(
      Point(x: 17.897148850198207, y: 46.887837526056295),
      Point(x: 17.888058991233653, y: 46.89226385652954)),
  'EPSG:4715': ProjectAndUnProjectResult(
      Point(x: 17.889250242355903, y: 46.89070495421856),
      Point(x: 17.888058612902718, y: 46.89226399794855)),
  'EPSG:4716': ProjectAndUnProjectResult(
      Point(x: 17.89305606977008, y: 46.896638513137226),
      Point(x: 17.88805860607975, y: 46.892264107227625)),
  'EPSG:4717': ProjectAndUnProjectResult(
      Point(x: 17.886164864068693, y: 46.89357945484591),
      Point(x: 17.888058529067077, y: 46.89226408875982)),
  'EPSG:4718': ProjectAndUnProjectResult(
      Point(x: 17.89147071239652, y: 46.898742516286894),
      Point(x: 17.88805843272785, y: 46.89226382403678)),
  'EPSG:4719': ProjectAndUnProjectResult(
      Point(x: 17.887073271478066, y: 46.89401728859372),
      Point(x: 17.888058490667778, y: 46.89226419127359)),
  'EPSG:4720': ProjectAndUnProjectResult(
      Point(x: 17.88790467139263, y: 46.892234600760624),
      Point(x: 17.888058560281515, y: 46.892264066788826)),
  'EPSG:4721': ProjectAndUnProjectResult(
      Point(x: 17.884319612953597, y: 46.89670999008969),
      Point(x: 17.888058376658527, y: 46.89226428606032)),
  'EPSG:4722': ProjectAndUnProjectResult(
      Point(x: 17.883373110749563, y: 46.89019407126835),
      Point(x: 17.888058931805364, y: 46.892264231647864)),
  'EPSG:4723': ProjectAndUnProjectResult(
      Point(x: 17.88505670856662, y: 46.896132550026195),
      Point(x: 17.888058533433984, y: 46.892264007253466)),
  'EPSG:4724': ProjectAndUnProjectResult(
      Point(x: 17.894329066182088, y: 46.894914288264445),
      Point(x: 17.88805863793075, y: 46.892264099934195)),
  'EPSG:4725': ProjectAndUnProjectResult(
      Point(x: 17.889806898751825, y: 46.89534787336956),
      Point(x: 17.8880586043926, y: 46.89226414506381)),
  'EPSG:4726': ProjectAndUnProjectResult(
      Point(x: 17.887608855287716, y: 46.89265580161719),
      Point(x: 17.888058556924786, y: 46.892264048786586)),
  'EPSG:4727': ProjectAndUnProjectResult(
      Point(x: 17.89069455201619, y: 46.893736905282694),
      Point(x: 17.88805882827271, y: 46.89226421722509)),
  'EPSG:4728': ProjectAndUnProjectResult(
      Point(x: 17.887970059662376, y: 46.89019943929116),
      Point(x: 17.888058559227066, y: 46.89226404233306)),
  'EPSG:4729': ProjectAndUnProjectResult(
      Point(x: 17.88674369065092, y: 46.894315245671294),
      Point(x: 17.888058480448866, y: 46.89226419194381)),
  'EPSG:4730': ProjectAndUnProjectResult(
      Point(x: 17.888219273378926, y: 46.89371519581479),
      Point(x: 17.888058569915952, y: 46.892264154277235)),
  'EPSG:4731': ProjectAndUnProjectResult(
      Point(x: 17.883381313005287, y: 46.89673125985289),
      Point(x: 17.88805854927638, y: 46.89226407755388)),
  'EPSG:4732': ProjectAndUnProjectResult(
      Point(x: 17.887820312501738, y: 46.89405674360816),
      Point(x: 17.888058555281884, y: 46.89226410474781)),
  'EPSG:4733': ProjectAndUnProjectResult(
      Point(x: 17.88988286565692, y: 46.89377841359267),
      Point(x: 17.888058696937886, y: 46.89226418080785)),
  'EPSG:4734': ProjectAndUnProjectResult(
      Point(x: 17.88004261530172, y: 46.89376117773054),
      Point(x: 17.8880592645506, y: 46.89226393503251)),
  'EPSG:4735': ProjectAndUnProjectResult(
      Point(x: 17.868470746721638, y: 46.90762007642163),
      Point(x: 17.888058023535276, y: 46.89226448928608)),
  'EPSG:4736': ProjectAndUnProjectResult(
      Point(x: 17.88895668803144, y: 46.897955360920655),
      Point(x: 17.888058558926932, y: 46.89226405839706)),
  'EPSG:4737': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4738': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.894876304001876),
      Point(x: 17.888058560281515, y: 46.892264067744904)),
  'EPSG:4739': ProjectAndUnProjectResult(
      Point(x: 17.890813776949443, y: 46.89272448126952),
      Point(x: 17.888058519770908, y: 46.89226406021736)),
  'EPSG:4740': ProjectAndUnProjectResult(
      Point(x: 17.888037449170405, y: 46.892254419819864),
      Point(x: 17.888058560281515, y: 46.89226406700472)),
  'EPSG:4741': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:4742': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4743': ProjectAndUnProjectResult(
      Point(x: 17.89253942680843, y: 46.89355253344707),
      Point(x: 17.888058625983124, y: 46.892264085962395)),
  'EPSG:4744': ProjectAndUnProjectResult(
      Point(x: 17.8888917661477, y: 46.891320291198916),
      Point(x: 17.88805856139318, y: 46.89226406574567)),
  'EPSG:4745': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891667111272),
      Point(x: 17.888058560281515, y: 46.89226413303865)),
  'EPSG:4747': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4748': ProjectAndUnProjectResult(
      Point(x: 17.883381313005287, y: 46.89673214081649),
      Point(x: 17.88805850742944, y: 46.89226411766146)),
  'EPSG:4749': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4750': ProjectAndUnProjectResult(
      Point(x: 17.887630299141588, y: 46.892085486412526),
      Point(x: 17.888058563625414, y: 46.892264068407535)),
  'EPSG:4751': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.890614959330605),
      Point(x: 17.888058560281515, y: 46.89226425955022)),
  'EPSG:4752': ProjectAndUnProjectResult(
      Point(x: 17.88358319563896, y: 46.896937840938364),
      Point(x: 17.888058481293985, y: 46.89226414976651)),
  'EPSG:4753': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:4754': ProjectAndUnProjectResult(
      Point(x: 17.888590655621456, y: 46.8915760666189),
      Point(x: 17.888058563770603, y: 46.892264062483285)),
  'EPSG:4755': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4756': ProjectAndUnProjectResult(
      Point(x: 17.887775534047428, y: 46.891664589513624),
      Point(x: 17.88805856969633, y: 46.89226408683721)),
  'EPSG:4757': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4758': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4759': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4760': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.892268957628076),
      Point(x: 17.888058560281515, y: 46.89226406701472)),
  'EPSG:4761': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4762': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4763': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4764': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4765': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4801': ProjectAndUnProjectResult(
      Point(x: 17.89058897773099, y: 46.893420533895046),
      Point(x: 17.88805857342885, y: 46.89226407303667)),
  'EPSG:4802': ProjectAndUnProjectResult(
      Point(x: 17.885499486596796, y: 46.897571019234405),
      Point(x: 17.888058466715794, y: 46.89226426167436)),
  'EPSG:4803': ProjectAndUnProjectResult(
      Point(x: 17.887589584381217, y: 46.890424883310125),
      Point(x: 17.888058555320438, y: 46.892264047492375)),
  'EPSG:4804': ProjectAndUnProjectResult(
      Point(x: 17.879199861644413, y: 46.88814568219285),
      Point(x: 17.888059768494056, y: 46.89226463038157)),
  'EPSG:4805': ProjectAndUnProjectResult(
      Point(x: 17.893343028916338, y: 46.89256923369196),
      Point(x: 17.888058599054727, y: 46.89226406925582)),
  'EPSG:4806': ProjectAndUnProjectResult(
      Point(x: 17.88806206252404, y: 46.89153971492727),
      Point(x: 17.88805856483977, y: 46.892264067501486)),
  'EPSG:4807': ProjectAndUnProjectResult(
      Point(x: 17.888130687051746, y: 46.89226381503744),
      Point(x: 17.888058560710174, y: 46.89226406700729)),
  'EPSG:4808': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891667111272),
      Point(x: 17.888058560281515, y: 46.89226413303865)),
  'EPSG:4809': ProjectAndUnProjectResult(
      Point(x: 17.88960106454166, y: 46.893158792010986),
      Point(x: 17.88805862001476, y: 46.892264104890465)),
  'EPSG:4810': ProjectAndUnProjectResult(
      Point(x: 17.890318647376606, y: 46.89197436010706),
      Point(x: 17.8880585469207, y: 46.892264068726696)),
  'EPSG:4811': ProjectAndUnProjectResult(
      Point(x: 17.890848660074248, y: 46.89305198445358),
      Point(x: 17.8880585570519, y: 46.89226406609385)),
  'EPSG:4813': ProjectAndUnProjectResult(
      Point(x: 17.878035407484088, y: 46.89099159774057),
      Point(x: 17.888059883263967, y: 46.89226423543215)),
  'EPSG:4814': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891667111272),
      Point(x: 17.888058560281515, y: 46.89226413303865)),
  'EPSG:4815': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891667111272),
      Point(x: 17.888058560281515, y: 46.89226413303865)),
  'EPSG:4816': ProjectAndUnProjectResult(
      Point(x: 17.88692368188675, y: 46.89112086314892),
      Point(x: 17.888058547656183, y: 46.89226405425115)),
  'EPSG:4817': ProjectAndUnProjectResult(
      Point(x: 17.89207245993109, y: 46.89002141197087),
      Point(x: 17.88805856210612, y: 46.89226407696183)),
  'EPSG:4818': ProjectAndUnProjectResult(
      Point(x: 17.889483655386478, y: 46.89255090981592),
      Point(x: 17.888058570312527, y: 46.89226406903427)),
  'EPSG:7041': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4819': ProjectAndUnProjectResult(
      Point(x: 17.88846626695256, y: 46.89234812636942),
      Point(x: 17.888058555003756, y: 46.89226406004092)),
  'EPSG:4820': ProjectAndUnProjectResult(
      Point(x: 17.87789321261279, y: 46.89027575009919),
      Point(x: 17.888059822235842, y: 46.8922643145557)),
  'EPSG:4821': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89540187406876),
      Point(x: 17.888058560281515, y: 46.89226403064899)),
  'EPSG:4823': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:4824': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:4901': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.88575860697436),
      Point(x: 17.888058560281515, y: 46.892265321883364)),
  'EPSG:4902': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.88575860697436),
      Point(x: 17.888058560281515, y: 46.892265321883364)),
  'EPSG:4903': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89456657513059),
      Point(x: 17.888058560281515, y: 46.892264075977536)),
  'EPSG:4904': ProjectAndUnProjectResult(
      Point(x: 17.89249247462093, y: 46.89098242462263),
      Point(x: 17.888058559248655, y: 46.89226406730827)),
  'EPSG:5013': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5132': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891667111272),
      Point(x: 17.888058560281515, y: 46.89226413303865)),
  'EPSG:5228': ProjectAndUnProjectResult(
      Point(x: 17.889375102921427, y: 46.89255636815979),
      Point(x: 17.88805857007035, y: 46.89226407109219)),
  'EPSG:5229': ProjectAndUnProjectResult(
      Point(x: 17.889375102921427, y: 46.89255636815979),
      Point(x: 17.88805857007035, y: 46.89226407109219)),
  'EPSG:5233': ProjectAndUnProjectResult(
      Point(x: 17.877723129835083, y: 46.89205125071689),
      Point(x: 17.888059358568963, y: 46.89226411384656)),
  'EPSG:5246': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5252': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5264': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5324': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5340': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5354': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5360': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5365': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5371': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5373': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5381': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5393': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5451': ProjectAndUnProjectResult(
      Point(x: 17.887685988564414, y: 46.89647728834349),
      Point(x: 17.88805855884157, y: 46.89226408334499)),
  'EPSG:5464': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.894876304001876),
      Point(x: 17.888058560281515, y: 46.892264067744904)),
  'EPSG:5467': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89439997507818),
      Point(x: 17.888058560281515, y: 46.892264047823126)),
  'EPSG:5489': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5524': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:5527': ProjectAndUnProjectResult(
      Point(x: 17.887738660065978, y: 46.89209126084331),
      Point(x: 17.888058562695022, y: 46.892264068316635)),
  'EPSG:5546': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5561': ProjectAndUnProjectResult(
      Point(x: 17.889747303353275, y: 46.89268662292843),
      Point(x: 17.888058571172053, y: 46.89226406866575)),
  'EPSG:5593': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5681': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.891667111272),
      Point(x: 17.888058560281515, y: 46.89226413303865)),
  'EPSG:5886': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:6135': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:6207': ProjectAndUnProjectResult(
      Point(x: 17.88017108167943, y: 46.89240293551692),
      Point(x: 17.888058857391957, y: 46.89226406175111)),
  'EPSG:6311': ProjectAndUnProjectResult(
      Point(x: 17.88809892246126, y: 46.89227902071313),
      Point(x: 17.888058560426426, y: 46.89226406707394)),
  'EPSG:6318': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:6322': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:6325': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:6365': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:6668': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:6706': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:6783': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:6881': ProjectAndUnProjectResult(
      Point(x: 17.890496748184272, y: 46.893195640809694),
      Point(x: 17.88805858452878, y: 46.89226407630267)),
  'EPSG:6882': ProjectAndUnProjectResult(
      Point(x: 17.887508316704572, y: 46.89255043592205),
      Point(x: 17.88805856000109, y: 46.8922640671552)),
  'EPSG:6883': ProjectAndUnProjectResult(
      Point(x: 17.888484998433885, y: 46.888977869744615),
      Point(x: 17.888058581195754, y: 46.8922639053432)),
  'EPSG:6892': ProjectAndUnProjectResult(
      Point(x: 17.89012751193021, y: 46.896412400626616),
      Point(x: 17.88805845164408, y: 46.892263848482756)),
  'EPSG:6894': ProjectAndUnProjectResult(
      Point(x: 17.885606838948544, y: 46.894226637720585),
      Point(x: 17.88805853835899, y: 46.89226408461359)),
  'EPSG:6980': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:6983': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:6987': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:6990': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:7035': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:7037': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:7073': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:7084': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:7086': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:7088': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:7133': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:7136': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:7139': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:7373': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:7683': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.8922645723598),
      Point(x: 17.888058560281515, y: 46.892264067008746)),
  'EPSG:7686': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:7798': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:7844': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:7881': ProjectAndUnProjectResult(
      Point(x: 17.8880572634198, y: 46.89226321647872),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:7886': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8042': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.88493102999294),
      Point(x: 17.888058560281515, y: 46.892265975585296)),
  'EPSG:8043': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.88493102999294),
      Point(x: 17.888058560281515, y: 46.892265975585296)),
  'EPSG:8086': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8232': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8237': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8240': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8249': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8252': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8255': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:2000': ProjectAndUnProjectResult(
      Point(x: 5525945.930258166, y: 9002818.259894714),
      Point(x: 45, y: double.nan)),
  'EPSG:2001': ProjectAndUnProjectResult(
      Point(x: 5526247.188282154, y: 9002686.809073899),
      Point(x: 45, y: double.nan)),
  'EPSG:2002': ProjectAndUnProjectResult(
      Point(x: 5525471.979595799, y: 9002287.996307883),
      Point(x: 45, y: double.nan)),
  'EPSG:2003': ProjectAndUnProjectResult(
      Point(x: 5525866.648876498, y: 9002577.335182045),
      Point(x: 45, y: double.nan)),
  'EPSG:2004': ProjectAndUnProjectResult(
      Point(x: 5525960.067546683, y: 9002415.436513854),
      Point(x: 45, y: double.nan)),
  'EPSG:2005': ProjectAndUnProjectResult(
      Point(x: 5526070.952200489, y: 9002562.307417115),
      Point(x: 45, y: double.nan)),
  'EPSG:2006': ProjectAndUnProjectResult(
      Point(x: 5526294.303343434, y: 9002536.186308786),
      Point(x: 45, y: double.nan)),
  'EPSG:2007': ProjectAndUnProjectResult(
      Point(x: 5525868.983512072, y: 9002472.567891844),
      Point(x: 45, y: double.nan)),
  'EPSG:2008': ProjectAndUnProjectResult(
      Point(x: 5277366.425898419, y: 8355198.520245712),
      Point(x: 45, y: double.nan)),
  'EPSG:2009': ProjectAndUnProjectResult(
      Point(x: 5364906.447262949, y: 8649042.253562601),
      Point(x: 45, y: double.nan)),
  'EPSG:2010': ProjectAndUnProjectResult(
      Point(x: 5425654.034598166, y: 8954486.70998534),
      Point(x: 45, y: double.nan)),
  'EPSG:2011': ProjectAndUnProjectResult(
      Point(x: 5455436.685654514, y: 9269841.860248554),
      Point(x: 45, y: double.nan)),
  'EPSG:2012': ProjectAndUnProjectResult(
      Point(x: 5449562.187313349, y: 9592891.270385174),
      Point(x: 45, y: double.nan)),
  'EPSG:2013': ProjectAndUnProjectResult(
      Point(x: 5402768.903433069, y: 9920802.848189948),
      Point(x: 45, y: double.nan)),
  'EPSG:2014': ProjectAndUnProjectResult(
      Point(x: 5309172.716652227, y: 10250029.426227113), Point(x: 0, y: 90)),
  'EPSG:2015': ProjectAndUnProjectResult(
      Point(x: 5162210.502310001, y: 10576198.432745144), Point(x: 0, y: 90)),
  'EPSG:2016': ProjectAndUnProjectResult(
      Point(x: 4954580.012644431, y: 10893989.875088919), Point(x: 0, y: 90)),
  'EPSG:2017': ProjectAndUnProjectResult(
      Point(x: 5309172.716652227, y: 10250029.426227113), Point(x: 0, y: 90)),
  'EPSG:2018': ProjectAndUnProjectResult(
      Point(x: 5162210.502310001, y: 10576198.432745144), Point(x: 0, y: 90)),
  'EPSG:2019': ProjectAndUnProjectResult(
      Point(x: 4954580.012644431, y: 10893989.875088919), Point(x: 0, y: 90)),
  'EPSG:2020': ProjectAndUnProjectResult(
      Point(x: 4678176.049428774, y: 11197001.833426762), Point(x: 0, y: 90)),
  'EPSG:2021': ProjectAndUnProjectResult(
      Point(x: 4825514.478730791, y: 11047789.619846717), Point(x: 0, y: 90)),
  'EPSG:2022': ProjectAndUnProjectResult(
      Point(x: 4511415.01371259, y: 11340632.97474037), Point(x: 0, y: 90)),
  'EPSG:2023': ProjectAndUnProjectResult(
      Point(x: 4114729.659579363, y: 11606738.13357102), Point(x: 0, y: 90)),
  'EPSG:2024': ProjectAndUnProjectResult(
      Point(x: 3625041.14068967, y: 11836320.377563428), Point(x: 0, y: 90)),
  'EPSG:2025': ProjectAndUnProjectResult(
      Point(x: 3030874.8475555074, y: 12017931.72291831), Point(x: 0, y: 90)),
  'EPSG:2026': ProjectAndUnProjectResult(
      Point(x: 2319616.799685115, y: 12138259.566105235), Point(x: 0, y: 90)),
  'EPSG:2027': ProjectAndUnProjectResult(
      Point(x: 3225256.943310816, y: 12014325.982827425), Point(x: 0, y: 90)),
  'EPSG:9006': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:2028': ProjectAndUnProjectResult(
      Point(x: 4308786.566372169, y: 11603255.763893979), Point(x: 0, y: 90)),
  'EPSG:2029': ProjectAndUnProjectResult(
      Point(x: 5019358.128752175, y: 11044474.951493928), Point(x: 0, y: 90)),
  'EPSG:2030': ProjectAndUnProjectResult(
      Point(x: 5436519.152292094, y: 10410680.453106662), Point(x: 0, y: 90)),
  'EPSG:2031': ProjectAndUnProjectResult(
      Point(x: 5019358.128752175, y: 11044474.951493928), Point(x: 0, y: 90)),
  'EPSG:2032': ProjectAndUnProjectResult(
      Point(x: 5436519.152292094, y: 10410680.453106662), Point(x: 0, y: 90)),
  'EPSG:2033': ProjectAndUnProjectResult(
      Point(x: 5625294.712617322, y: 9753515.763326045),
      Point(x: 45, y: double.nan)),
  'EPSG:2034': ProjectAndUnProjectResult(
      Point(x: 5638354.370073671, y: 9108317.051244248),
      Point(x: 45, y: double.nan)),
  'EPSG:2035': ProjectAndUnProjectResult(
      Point(x: 5517937.734275888, y: 8498032.558622306),
      Point(x: 45, y: double.nan)),
  'EPSG:2036': ProjectAndUnProjectResult(
      Point(x: 8016398.141955978, y: 11184245.693301002),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:2037': ProjectAndUnProjectResult(
      Point(x: 5625552.597278097, y: 9753575.672750814),
      Point(x: -14563147143.452982, y: 3188443837.820243)),
  'EPSG:2038': ProjectAndUnProjectResult(
      Point(x: 5638571.782971076, y: 9108330.901623307),
      Point(x: -1685042.2535846238, y: 369929.7983349917)),
  'EPSG:2039': ProjectAndUnProjectResult(
      Point(x: -1098634.4919505278, y: 2457346.6175213307),
      Point(x: 17.88812604899518, y: 46.892265987217414)),
  'EPSG:2040': ProjectAndUnProjectResult(
      Point(x: 2088185.5204058057, y: 5408822.102999807),
      Point(x: 17.887652422252895, y: 46.892287416165274)),
  'EPSG:2041': ProjectAndUnProjectResult(
      Point(x: 2088185.507755896, y: 5408822.431463917),
      Point(x: 17.887652422068037, y: 46.89228741626157)),
  'EPSG:2042': ProjectAndUnProjectResult(
      Point(x: 2540746.234906597, y: 5555321.112302605),
      Point(x: 17.883149862342727, y: 46.892699088806914)),
  'EPSG:2043': ProjectAndUnProjectResult(
      Point(x: 2540746.1943142824, y: 5555321.445061632),
      Point(x: 17.883149860218786, y: 46.89269908904486)),
  'EPSG:2044': ProjectAndUnProjectResult(
      Point(x: 13375888.420644771, y: 9782000.530853491),
      Point(x: 45, y: double.nan)),
  'EPSG:2045': ProjectAndUnProjectResult(
      Point(x: 14572166.498555884, y: 10439359.049643723),
      Point(x: -99.18246850655717, y: 89.9990176256858)),
  'EPSG:2056': ProjectAndUnProjectResult(
      Point(x: 3393998.8609966785, y: 1246372.8682418307),
      Point(x: 17.88805857342887, y: 46.892264073036614)),
  'EPSG:2057': ProjectAndUnProjectResult(
      Point(x: -1967980.2117443858, y: 5814317.985443937),
      Point(x: 17.888058552817974, y: 46.89226406364063)),
  'EPSG:2058': ProjectAndUnProjectResult(
      Point(x: -1557511.0018826332, y: 5562125.437218922),
      Point(x: 17.893397784869233, y: 46.89274269597983)),
  'EPSG:2059': ProjectAndUnProjectResult(
      Point(x: -2005488.4216561709, y: 5752075.374270758),
      Point(x: 17.93092172085776, y: 46.89707938545267)),
  'EPSG:2060': ProjectAndUnProjectResult(
      Point(x: -2446061.7106089196, y: 5987175.135639785),
      Point(x: 18.16314207324923, y: 46.92854192295028)),
  'EPSG:2061': ProjectAndUnProjectResult(
      Point(x: -2874870.017929434, y: 6270985.091068825),
      Point(x: 19.45430257528023, y: 47.12658590690358)),
  'EPSG:2063': ProjectAndUnProjectResult(
      Point(x: 2988585.002277317, y: 5744009.102065168),
      Point(x: 17.84823657652429, y: 46.89670599128666)),
  'EPSG:2064': ProjectAndUnProjectResult(
      Point(x: 2540422.4229976125, y: 5555697.086638527),
      Point(x: 17.883153226896248, y: 46.892698810059336)),
  'EPSG:2065': ProjectAndUnProjectResult(
      Point(x: -528541.4989383046, y: -1425018.4481326654),
      Point(x: 17.888058569293726, y: 46.892264071214136)),
  'EPSG:9009': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:2066': ProjectAndUnProjectResult(
      Point(x: 26483973.91827763, y: 38951324.389591135),
      Point(x: 45, y: double.nan)),
  'EPSG:2067': ProjectAndUnProjectResult(
      Point(x: 5638669.582505264, y: 9108152.747041047),
      Point(x: 45, y: double.nan)),
  'EPSG:2068': ProjectAndUnProjectResult(
      Point(x: 877174.2791365524, y: 5233442.711583846),
      Point(x: 17.888058434831024, y: 46.89226402657196)),
  'EPSG:2069': ProjectAndUnProjectResult(
      Point(x: 724868.4445832657, y: 5218033.250551673),
      Point(x: 17.888058549525788, y: 46.89226405704958)),
  'EPSG:2070': ProjectAndUnProjectResult(
      Point(x: 572516.2375633244, y: 5206559.459927045),
      Point(x: 17.888058559553354, y: 46.89226406512193)),
  'EPSG:2071': ProjectAndUnProjectResult(
      Point(x: 420132.8434565015, y: 5198996.0726106735),
      Point(x: 17.888058559691398, y: 46.89226406629287)),
  'EPSG:2072': ProjectAndUnProjectResult(
      Point(x: 267731.6895766501, y: 5195326.393193976),
      Point(x: 17.888058559670743, y: 46.89226406634541)),
  'EPSG:2073': ProjectAndUnProjectResult(
      Point(x: 115325.17106628911, y: 5195542.310019263),
      Point(x: 17.888058559670505, y: 46.89226406634528)),
  'EPSG:2074': ProjectAndUnProjectResult(
      Point(x: -37074.63351051809, y: 5199644.30056243),
      Point(x: 17.88805855964199, y: 46.892264066263465)),
  'EPSG:2075': ProjectAndUnProjectResult(
      Point(x: -189455.24974488816, y: 5207641.431124745),
      Point(x: 17.888058559947464, y: 46.89226406475083)),
  'EPSG:2076': ProjectAndUnProjectResult(
      Point(x: -341803.09099735273, y: 5219551.350775675),
      Point(x: 17.888058573693698, y: 46.89226405516002)),
  'EPSG:2077': ProjectAndUnProjectResult(
      Point(x: 1176971.1065355511, y: 5231872.521751389),
      Point(x: 17.888058434831017, y: 46.892264026571965)),
  'EPSG:2078': ProjectAndUnProjectResult(
      Point(x: 720066.7969988188, y: 5197436.217803409),
      Point(x: 17.888058559691398, y: 46.89226406629287)),
  'EPSG:2079': ProjectAndUnProjectResult(
      Point(x: 262996.4959924854, y: 5198084.251267332),
      Point(x: 17.88805855964199, y: 46.892264066263444)),
  'EPSG:2080': ProjectAndUnProjectResult(
      Point(x: -193894.4792730622, y: 5233829.501282762),
      Point(x: 17.888058717779117, y: 46.892264020815794)),
  'EPSG:2081': ProjectAndUnProjectResult(
      Point(x: 7627684.830706392, y: 19760087.55839518),
      Point(x: 45, y: double.nan)),
  'EPSG:2082': ProjectAndUnProjectResult(
      Point(x: 7627836.604861228, y: 19760099.02032721),
      Point(x: 45, y: double.nan)),
  'EPSG:2083': ProjectAndUnProjectResult(
      Point(x: 7627733.958387017, y: 19759828.399297565),
      Point(x: 45, y: double.nan)),
  'EPSG:2084': ProjectAndUnProjectResult(
      Point(x: 5625682.8648036625, y: 19753637.08426707),
      Point(x: 45, y: double.nan)),
  'EPSG:2087': ProjectAndUnProjectResult(
      Point(x: 948562.5161284998, y: 5210242.47811393),
      Point(x: 17.88805855781303, y: 46.89226406264945)),
  'EPSG:2088': ProjectAndUnProjectResult(
      Point(x: 1024585.230716818, y: 5215823.111785821),
      Point(x: 17.888058537613816, y: 46.892264044854954)),
  'EPSG:2089': ProjectAndUnProjectResult(
      Point(x: -1557536.5212162894, y: 5561950.164033774),
      Point(x: 17.893399933574567, y: 46.89274299727972)),
  'EPSG:2090': ProjectAndUnProjectResult(
      Point(x: -2005500.4107896662, y: 5751900.446702114),
      Point(x: 17.93093567947049, y: 46.89708113439577)),
  'EPSG:2091': ProjectAndUnProjectResult(
      Point(x: 6441663.530162457, y: 5564103.330087571),
      Point(x: 17.89339697213266, y: 46.892742762902465)),
  'EPSG:2092': ProjectAndUnProjectResult(
      Point(x: 6993498.98724838, y: 5754124.1644214),
      Point(x: 17.9309147229843, y: 46.897079180364614)),
  'EPSG:2093': ProjectAndUnProjectResult(
      Point(x: -4605022.839155141, y: 9891596.17907378),
      Point(x: 45, y: double.nan)),
  'EPSG:2094': ProjectAndUnProjectResult(
      Point(x: -4602867.643342257, y: 9887634.235410025),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2095': ProjectAndUnProjectResult(
      Point(x: 2988722.9250619435, y: 5744023.146098382),
      Point(x: 17.84824676444358, y: 46.896706289150075)),
  'EPSG:2096': ProjectAndUnProjectResult(
      Point(x: -2477654.964744781, y: 8322681.944070417), Point(x: 0, y: 90)),
  'EPSG:2097': ProjectAndUnProjectResult(
      Point(x: -2891594.3076343164, y: 8210304.863080276), Point(x: 0, y: 90)),
  'EPSG:2098': ProjectAndUnProjectResult(
      Point(x: -3256897.0694959406, y: 8074347.482084176), Point(x: 0, y: 90)),
  'EPSG:2099': ProjectAndUnProjectResult(
      Point(x: -2335876.019447882, y: 3037642.022973382),
      Point(x: 18.660390541502206, y: 46.91114923329722)),
  'EPSG:2100': ProjectAndUnProjectResult(
      Point(x: 34306.32981000986, y: 5211073.220895577),
      Point(x: 17.888058545235562, y: 46.89226403542799)),
  'EPSG:2105': ProjectAndUnProjectResult(
      Point(x: 32850550.065560255, y: -3270535.576852885),
      Point(x: -4199764943.5286245, y: -5957715656.169244)),
  'EPSG:2106': ProjectAndUnProjectResult(
      Point(x: 35759476.71623347, y: -5777315.079927069), Point(x: 0, y: -90)),
  'EPSG:2107': ProjectAndUnProjectResult(
      Point(x: 38318911.48100344, y: -8040181.450261377), Point(x: 0, y: -90)),
  'EPSG:2108': ProjectAndUnProjectResult(
      Point(x: 36125762.57713887, y: -5901469.767428318), Point(x: 0, y: -90)),
  'EPSG:2109': ProjectAndUnProjectResult(
      Point(x: 31973641.181411814, y: -2247993.836208177),
      Point(x: -298884534.2929694, y: -423154071.5673603)),
  'EPSG:2110': ProjectAndUnProjectResult(
      Point(x: 34327332.79609692, y: -4289279.409817552),
      Point(x: -32742816039535.246, y: -47525696566486.016)),
  'EPSG:2111': ProjectAndUnProjectResult(
      Point(x: 34068419.96635581, y: -3976456.4830530314),
      Point(x: -2519565311616.5806, y: -3636547354206.4497)),
  'EPSG:2112': ProjectAndUnProjectResult(
      Point(x: 34339673.9589003, y: -4143440.224427971),
      Point(x: -37973903095663.65, y: -55134268755000.69)),
  'EPSG:2113': ProjectAndUnProjectResult(
      Point(x: 32874046.41045196, y: -2797958.525036691),
      Point(x: -4515425166.07598, y: -6406514911.378608)),
  'EPSG:2114': ProjectAndUnProjectResult(
      Point(x: 29513789.58716431, y: 44107.2351280842),
      Point(x: -2611936.0038365964, y: -3936120.7101866063)),
  'EPSG:2115': ProjectAndUnProjectResult(
      Point(x: 30489035.306998402, y: -725324.512856351),
      Point(x: -12876700.09181123, y: -18658874.29126566)),
  'EPSG:2116': ProjectAndUnProjectResult(
      Point(x: 28656830.8124914, y: 830153.3168542829),
      Point(x: -773156.938411585, y: -1228253.689185668)),
  'EPSG:2117': ProjectAndUnProjectResult(
      Point(x: 27869208.089729458, y: 1544532.5120018146),
      Point(x: -281811.1669623546, y: -476370.1261903999)),
  'EPSG:2118': ProjectAndUnProjectResult(
      Point(x: 27822837.02783532, y: 1641064.5844478845),
      Point(x: -266271.72178309405, y: -451885.84998319583)),
  'EPSG:2119': ProjectAndUnProjectResult(
      Point(x: 30036695.885839436, y: -181239.37348593108),
      Point(x: -5943326.577045224, y: -8746687.248570332)),
  'EPSG:2120': ProjectAndUnProjectResult(
      Point(x: 31286742.00371912, y: -1383042.9101164634),
      Point(x: -60508707.335342064, y: -86182687.46876109)),
  'EPSG:2121': ProjectAndUnProjectResult(
      Point(x: 26989884.593294784, y: 2388592.0331349443),
      Point(x: -100393.16164697426, y: -183187.94481468308)),
  'EPSG:2122': ProjectAndUnProjectResult(
      Point(x: 25963676.639189754, y: 3247587.8181949467),
      Point(x: -33322.17233272656, y: -65146.77183461389)),
  'EPSG:2123': ProjectAndUnProjectResult(
      Point(x: 23701742.26292862, y: 5136799.454106336),
      Point(x: -4624.2225625370465, y: -4574.04745204502)),
  'EPSG:2124': ProjectAndUnProjectResult(
      Point(x: 29598432.423587836, y: 291775.43540201656),
      Point(x: -2970085.785647243, y: -4456765.992337756)),
  'EPSG:2125': ProjectAndUnProjectResult(
      Point(x: 27544492.860864505, y: 2028444.204376034),
      Point(x: -190505.2633385869, y: -331203.45893672656)),
  'EPSG:2126': ProjectAndUnProjectResult(
      Point(x: 27102127.331886742, y: 2465018.3980043815),
      Point(x: -113982.78651000015, y: -205992.32562848937)),
  'EPSG:2127': ProjectAndUnProjectResult(
      Point(x: 24862053.484980527, y: 4309331.922602151),
      Point(x: -11494.224264886332, y: -21364.563567721947)),
  'EPSG:2128': ProjectAndUnProjectResult(
      Point(x: 23427706.35134291, y: 5477898.539964551),
      Point(x: -3928.8987458178717, y: -2460.4207688839397)),
  'EPSG:2129': ProjectAndUnProjectResult(
      Point(x: 22569959.180864595, y: 6185243.87407861),
      Point(x: -2826.4646871818013, y: 1883.3950870020797)),
  'EPSG:2130': ProjectAndUnProjectResult(
      Point(x: 26484920.948208235, y: 3126186.532855955),
      Point(x: -57608.89888369485, y: -109400.7560537086)),
  'EPSG:2131': ProjectAndUnProjectResult(
      Point(x: 25993190.252229676, y: 3528578.7160891304),
      Point(x: -34383.531734012, y: -67143.59487000619)),
  'EPSG:2132': ProjectAndUnProjectResult(
      Point(x: 23354328.47571193, y: 5697778.310615819),
      Point(x: -3777.7176323807585, y: -1967.9352749532163)),
  'EPSG:2133': ProjectAndUnProjectResult(
      Point(x: 19321105.829017498, y: 12806678.893239),
      Point(x: -5175.116548601758, y: 7749.823533021951)),
  'EPSG:2134': ProjectAndUnProjectResult(
      Point(x: 27108574.549169235, y: 6815768.467481233),
      Point(x: -103767.21820745953, y: -188871.77584871996)),
  'EPSG:2135': ProjectAndUnProjectResult(
      Point(x: 36792794.61949032, y: -1620286.792548649), Point(x: 0, y: -90)),
  'EPSG:2136': ProjectAndUnProjectResult(
      Point(x: 5614410.538666465, y: 15924700.735644972),
      Point(x: 17.887904271665004, y: 46.892270643403975)),
  'EPSG:2137': ProjectAndUnProjectResult(
      Point(x: 1936735.369318174, y: 5368921.034444872),
      Point(x: 17.887904271665, y: 46.89227064340398)),
  'EPSG:2138': ProjectAndUnProjectResult(
      Point(x: 5088215.637832019, y: 3830123.3104004664),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:2139': ProjectAndUnProjectResult(
      Point(x: 5277537.244089515, y: 8355177.8227729015),
      Point(x: -15979.524499782834, y: 3524.3478798098868)),
  'EPSG:2140': ProjectAndUnProjectResult(
      Point(x: 5365095.243901447, y: 8649032.835441044),
      Point(x: -76314.668724916, y: 16624.267920019753)),
  'EPSG:2141': ProjectAndUnProjectResult(
      Point(x: 5425861.74852327, y: 8954491.865918288),
      Point(x: -519603.48216074344, y: 113747.10753176517)),
  'EPSG:2327': ProjectAndUnProjectResult(
      Point(x: 9328491.478380622, y: 7001530.290950692),
      Point(x: 66.4697850700211, y: 55.685367319970595)),
  'EPSG:2142': ProjectAndUnProjectResult(
      Point(x: 5455664.100526009, y: 9269865.456694849),
      Point(x: -6859630.010890731, y: 1508686.9880534173)),
  'EPSG:2143': ProjectAndUnProjectResult(
      Point(x: 5449809.877896608, y: 9592937.814035818),
      Point(x: -411243275.37217355, y: 90346346.30780989)),
  'EPSG:2144': ProjectAndUnProjectResult(
      Point(x: 5403037.173898023, y: 9920877.559935424),
      Point(x: -34661211008946.938, y: 7546306826338.474)),
  'EPSG:2145': ProjectAndUnProjectResult(
      Point(x: 5309461.530223562, y: 10250138.320860693), Point(x: 0, y: 90)),
  'EPSG:2146': ProjectAndUnProjectResult(
      Point(x: 5162519.4015817605, y: 10576348.404652024), Point(x: 0, y: 90)),
  'EPSG:2147': ProjectAndUnProjectResult(
      Point(x: 4954908.029848009, y: 10894188.79017561), Point(x: 0, y: 90)),
  'EPSG:2148': ProjectAndUnProjectResult(
      Point(x: 5518117.362620078, y: 8498017.126823647),
      Point(x: -33811.09013364492, y: 7380.196889868285)),
  'EPSG:2149': ProjectAndUnProjectResult(
      Point(x: 5436818.00586931, y: 10410808.927530395), Point(x: 0, y: 90)),
  'EPSG:2150': ProjectAndUnProjectResult(
      Point(x: 5019695.054228077, y: 11044701.550210133), Point(x: 0, y: 90)),
  'EPSG:2151': ProjectAndUnProjectResult(
      Point(x: -465963.8528201919, y: 11963247.506900493), Point(x: 0, y: 90)),
  'EPSG:2152': ProjectAndUnProjectResult(
      Point(x: -3328981.2161364346, y: 11193210.773121612), Point(x: 0, y: 90)),
  'EPSG:2153': ProjectAndUnProjectResult(
      Point(x: -7081100.809078519, y: 9644074.035715306),
      Point(x: 16894389367.285646, y: 5473429537.796183)),
  'EPSG:2154': ProjectAndUnProjectResult(
      Point(x: 1826843.263640678, y: 6750111.643270713),
      Point(x: 17.888058560281515, y: 46.89226406700873)),
  'EPSG:2156': ProjectAndUnProjectResult(
      Point(x: 27108574.549169235, y: 6815768.467481233),
      Point(x: -103767.21820745953, y: -188871.77584871996)),
  'EPSG:2157': ProjectAndUnProjectResult(
      Point(x: 2565971.4726937497, y: 350468.4491314345),
      Point(x: 17.884705059466434, y: 46.89254697437338)),
  'EPSG:2158': ProjectAndUnProjectResult(
      Point(x: 2540720.5313290567, y: 5555692.513083512),
      Point(x: 17.883147133968766, y: 46.89269979625903)),
  'EPSG:2159': ProjectAndUnProjectResult(
      Point(x: 7935821.360607181, y: 16107775.865064288),
      Point(x: 17.873538880077483, y: 46.893725941677246)),
  'EPSG:2160': ProjectAndUnProjectResult(
      Point(x: 8235821.360607179, y: 16707775.865064288),
      Point(x: 17.873538880077483, y: 46.893725941677246)),
  'EPSG:2161': ProjectAndUnProjectResult(
      Point(x: 2988883.3916948386, y: 5743938.6562924925),
      Point(x: 17.848199840970295, y: 46.89670953934024)),
  'EPSG:2162': ProjectAndUnProjectResult(
      Point(x: 2540706.7284883, y: 5555603.346607446),
      Point(x: 17.88314798684374, y: 46.89269922179742)),
  'EPSG:2163': ProjectAndUnProjectResult(
      Point(x: 4812749.36130746, y: 5886812.970045971),
      Point(x: 17.88805856028152, y: 46.89213711396999)),
  'EPSG:2164': ProjectAndUnProjectResult(
      Point(x: 2239389.0905693173, y: 5453183.2920706915),
      Point(x: 17.887069394115564, y: 46.8923327733385)),
  'EPSG:2165': ProjectAndUnProjectResult(
      Point(x: 2239389.0688365707, y: 5453183.622056071),
      Point(x: 17.887069393658564, y: 46.892332773451955)),
  'EPSG:2166': ProjectAndUnProjectResult(
      Point(x: 4177291.738831021, y: 5233913.048442174),
      Point(x: 17.88805844634046, y: 46.892264029990585)),
  'EPSG:2167': ProjectAndUnProjectResult(
      Point(x: 4948796.71822361, y: 5212272.480322573),
      Point(x: 17.88805856953789, y: 46.89226406590728)),
  'EPSG:2168': ProjectAndUnProjectResult(
      Point(x: 5720214.533676548, y: 5199458.992247189),
      Point(x: 17.88805857142926, y: 46.89226406953736)),
  'EPSG:2178': ProjectAndUnProjectResult(
      Point(x: 7262868.68864916, y: 5199573.694242832),
      Point(x: 17.88805856025308, y: 46.89226406692701)),
  'EPSG:2169': ProjectAndUnProjectResult(
      Point(x: 972727.6705186315, y: -160036.37681488332),
      Point(x: 17.88805685051788, y: 46.8922639079873)),
  'EPSG:2170': ProjectAndUnProjectResult(
      Point(x: 720138.75396052, y: 5198308.653355898),
      Point(x: 17.888058571100018, y: 46.89226407189716)),
  'EPSG:2171': ProjectAndUnProjectResult(
      Point(x: 4393448.659624081, y: 5236980.26449201),
      Point(x: 17.888058572338835, y: 46.89226406879691)),
  'EPSG:2172': ProjectAndUnProjectResult(
      Point(x: 4326990.83530267, y: 5132629.844777857),
      Point(x: 17.888058572338835, y: 46.89226406879691)),
  'EPSG:2173': ProjectAndUnProjectResult(
      Point(x: 3568381.6764939143, y: 5254461.948739831),
      Point(x: 17.88805857233884, y: 46.89226406879691)),
  'EPSG:2174': ProjectAndUnProjectResult(
      Point(x: 3795922.0731681488, y: 5096131.4504086105),
      Point(x: 17.888058572338835, y: 46.89226406879691)),
  'EPSG:2175': ProjectAndUnProjectResult(
      Point(x: 155560.46537570143, y: 495869.3370027859),
      Point(x: 17.888058572338693, y: 46.89226406879674)),
  'EPSG:2176': ProjectAndUnProjectResult(
      Point(x: 5720072.31867286, y: 5198920.990764878),
      Point(x: 17.888058560302017, y: 46.89226406695651)),
  'EPSG:2177': ProjectAndUnProjectResult(
      Point(x: 6491469.740628461, y: 5194876.075589367),
      Point(x: 17.888058560281518, y: 46.89226406700878)),
  'EPSG:2179': ProjectAndUnProjectResult(
      Point(x: 8034311.066893917, y: 5213037.208459122),
      Point(x: 17.88805856312982, y: 46.89226406242482)),
  'EPSG:2180': ProjectAndUnProjectResult(
      Point(x: 415319.99980040884, y: -107766.73050999455),
      Point(x: 17.888058560281344, y: 46.89226406700861)),
  'EPSG:2188': ProjectAndUnProjectResult(
      Point(x: 4271189.859630246, y: 6593368.16982121),
      Point(x: 9.845324587595094, y: 48.22226651993602)),
  'EPSG:2189': ProjectAndUnProjectResult(
      Point(x: 3859060.7778656865, y: 6259399.768258426),
      Point(x: 16.419105844920082, y: 47.11110953614261)),
  'EPSG:2190': ProjectAndUnProjectResult(
      Point(x: 3859147.5296835937, y: 6259269.792447176),
      Point(x: 16.419180982215078, y: 47.11110154421953)),
  'EPSG:2191': ProjectAndUnProjectResult(
      Point(x: 2988971.3749373723, y: 5744238.047397396),
      Point(x: 17.848195893325798, y: 46.89671111691266)),
  'EPSG:2193': ProjectAndUnProjectResult(
      Point(x: 31209288.20939178, y: 4306152.547655749),
      Point(x: -5793696.938596561, y: -8531714.862681149)),
  'EPSG:2328': ProjectAndUnProjectResult(
      Point(x: 9982558.448361719, y: 7451377.650985235),
      Point(x: 45, y: double.nan)),
  'EPSG:2195': ProjectAndUnProjectResult(
      Point(x: 63333518.09556754, y: -28676678.417839117), Point(x: 0, y: -90)),
  'EPSG:2196': ProjectAndUnProjectResult(
      Point(x: 839056.3768331184, y: 5229280.974066414),
      Point(x: 17.888058488739624, y: 46.89226403833658)),
  'EPSG:2197': ProjectAndUnProjectResult(
      Point(x: 948646.8348811632, y: 5211869.284666118),
      Point(x: 17.888058558416994, y: 46.89226406333179)),
  'EPSG:2198': ProjectAndUnProjectResult(
      Point(x: 1120089.2655463072, y: 5199321.338507943),
      Point(x: 17.888058560302017, y: 46.89226406695651)),
  'EPSG:2199': ProjectAndUnProjectResult(
      Point(x: 4262979.618454169, y: 5200109.974276837),
      Point(x: 17.888058561832175, y: 46.89226406409104)),
  'EPSG:2200': ProjectAndUnProjectResult(
      Point(x: 5816396.409235267, y: 4484244.548855066),
      Point(x: 17.888058560281525, y: 46.89226406700881)),
  'EPSG:2201': ProjectAndUnProjectResult(
      Point(x: 5436818.00586931, y: 10410808.927530395), Point(x: 0, y: 90)),
  'EPSG:2202': ProjectAndUnProjectResult(
      Point(x: 5625552.597278097, y: 9753575.672750814),
      Point(x: -14563147143.452982, y: 3188443837.820243)),
  'EPSG:2203': ProjectAndUnProjectResult(
      Point(x: 5638571.782971076, y: 9108330.901623307),
      Point(x: -1685042.2535846238, y: 369929.7983349917)),
  'EPSG:2204': ProjectAndUnProjectResult(
      Point(x: 23787400.95592869, y: 17368660.079644486),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:2205': ProjectAndUnProjectResult(
      Point(x: 6854798.276271999, y: 4982007.395728776),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2206': ProjectAndUnProjectResult(
      Point(x: 8805835.558791894, y: 5235921.738050902),
      Point(x: 17.888058723412236, y: 46.89226402624652)),
  'EPSG:2207': ProjectAndUnProjectResult(
      Point(x: 9577493.88483472, y: 5267161.966714753),
      Point(x: 17.88806088967312, y: 46.892263897270425)),
  'EPSG:2208': ProjectAndUnProjectResult(
      Point(x: 10349377.792572536, y: 5307499.291513194),
      Point(x: 17.88807716577362, y: 46.89226406012086)),
  'EPSG:2209': ProjectAndUnProjectResult(
      Point(x: 11121586.300820123, y: 5357129.58577281),
      Point(x: 17.88816193315454, y: 46.89226781527169)),
  'EPSG:2210': ProjectAndUnProjectResult(
      Point(x: 11894248.322078396, y: 5416290.662010544),
      Point(x: 17.88850900875216, y: 46.89229072693788)),
  'EPSG:2211': ProjectAndUnProjectResult(
      Point(x: 12667529.955258828, y: 5485261.147490877),
      Point(x: 17.88971086715372, y: 46.89238960175352)),
  'EPSG:2212': ProjectAndUnProjectResult(
      Point(x: 13441642.51414534, y: 5564358.804472028),
      Point(x: 17.893398352663354, y: 46.892742746067256)),
  'EPSG:2213': ProjectAndUnProjectResult(
      Point(x: -422174.5031304131, y: 5264871.233027248),
      Point(x: 17.88806088688771, y: 46.89226389365527)),
  'EPSG:2214': ProjectAndUnProjectResult(
      Point(x: 1562499.0954302107, y: 6216696.097143596),
      Point(x: 17.88805853282264, y: 46.892264054463574)),
  'EPSG:2215': ProjectAndUnProjectResult(
      Point(x: 1177012.0348314897, y: 5231668.496150266),
      Point(x: 17.8880583898021, y: 46.89226395115276)),
  'EPSG:2216': ProjectAndUnProjectResult(
      Point(x: 5297446.059637752, y: 7936740.586872464),
      Point(x: 45, y: double.nan)),
  'EPSG:2217': ProjectAndUnProjectResult(
      Point(x: 5003359.673296536, y: 7430950.286132686),
      Point(x: 45, y: double.nan)),
  'EPSG:2219': ProjectAndUnProjectResult(
      Point(x: 5625550.978502559, y: 9753572.604345992),
      Point(x: 45, y: double.nan)),
  'EPSG:2220': ProjectAndUnProjectResult(
      Point(x: 5638570.162453743, y: 9108328.03697944),
      Point(x: 45, y: double.nan)),
  'EPSG:2222': ProjectAndUnProjectResult(
      Point(x: -10399806.518539019, y: 25963983.55181139), Point(x: 0, y: 90)),
  'EPSG:2223': ProjectAndUnProjectResult(
      Point(x: -13543801.5364406, y: 24888413.49452938), Point(x: 0, y: 90)),
  'EPSG:2224': ProjectAndUnProjectResult(
      Point(x: -17112193.866983697, y: 23518362.396374583), Point(x: 0, y: 90)),
  'EPSG:2225': ProjectAndUnProjectResult(
      Point(x: 28587111.613013346, y: 26997662.4569494),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2243': ProjectAndUnProjectResult(
      Point(x: -19420021.483049188, y: 17825378.802620757), Point(x: 0, y: 90)),
  'EPSG:2226': ProjectAndUnProjectResult(
      Point(x: 29490928.127553087, y: 27229420.066716958),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:2227': ProjectAndUnProjectResult(
      Point(x: 30172292.14900214, y: 26973096.865134276),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:2228': ProjectAndUnProjectResult(
      Point(x: 30723796.79656839, y: 26753014.189562038),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:2229': ProjectAndUnProjectResult(
      Point(x: 31683048.00808699, y: 26700474.83101188),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2230': ProjectAndUnProjectResult(
      Point(x: 32341774.398609553, y: 26377843.57152736),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:2231': ProjectAndUnProjectResult(
      Point(x: 24966835.570312265, y: 22103331.550557755),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2232': ProjectAndUnProjectResult(
      Point(x: 25415893.18631023, y: 22403922.591381256),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2233': ProjectAndUnProjectResult(
      Point(x: 25926473.257043168, y: 22550664.95360246),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2234': ProjectAndUnProjectResult(
      Point(x: 19813264.617850065, y: 13594950.05734413),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:2235': ProjectAndUnProjectResult(
      Point(x: 16790808.84134736, y: 20514172.84270222), Point(x: 0, y: 90)),
  'EPSG:2236': ProjectAndUnProjectResult(
      Point(x: 15489593.979353804, y: 27416023.75950058), Point(x: 0, y: 90)),
  'EPSG:2237': ProjectAndUnProjectResult(
      Point(x: 15174228.04246971, y: 27744330.38729839), Point(x: 0, y: 90)),
  'EPSG:2238': ProjectAndUnProjectResult(
      Point(x: 25311130.553737484, y: 17855126.624383375),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:2239': ProjectAndUnProjectResult(
      Point(x: 15118403.957847713, y: 25737343.784918793), Point(x: 0, y: 90)),
  'EPSG:2240': ProjectAndUnProjectResult(
      Point(x: 16034054.29733326, y: 26367116.78968559), Point(x: 0, y: 90)),
  'EPSG:2241': ProjectAndUnProjectResult(
      Point(x: -14057937.667923164, y: 20834716.344766937), Point(x: 0, y: 90)),
  'EPSG:2242': ProjectAndUnProjectResult(
      Point(x: -16681202.277333234, y: 19427882.72002641), Point(x: 0, y: 90)),
  'EPSG:2244': ProjectAndUnProjectResult(
      Point(x: 13443875.494497076, y: 24904663.66490966), Point(x: 0, y: 90)),
  'EPSG:2245': ProjectAndUnProjectResult(
      Point(x: 15414189.905530728, y: 25302765.529912125), Point(x: 0, y: 90)),
  'EPSG:2246': ProjectAndUnProjectResult(
      Point(x: 22489450.678402383, y: 16345135.930820161),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2247': ProjectAndUnProjectResult(
      Point(x: 22967474.00105343, y: 18536097.935624205),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:2248': ProjectAndUnProjectResult(
      Point(x: 21190442.582283285, y: 14745735.004731355),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:2249': ProjectAndUnProjectResult(
      Point(x: 19196544.98708545, y: 15324376.324036008),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:2250': ProjectAndUnProjectResult(
      Point(x: 20191338.90486749, y: 12525841.796467042),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:2251': ProjectAndUnProjectResult(
      Point(x: 45461213.70641344, y: 15730349.260780366),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2252': ProjectAndUnProjectResult(
      Point(x: 39006952.19021326, y: 15402243.62815605),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:2253': ProjectAndUnProjectResult(
      Point(x: 32899589.65714337, y: 15708442.659052998),
      Point(x: 17.8880585602815, y: 46.892264067008746)),
  'EPSG:2254': ProjectAndUnProjectResult(
      Point(x: 12542576.309419384, y: 27849501.87445014), Point(x: 0, y: 90)),
  'EPSG:2255': ProjectAndUnProjectResult(
      Point(x: 12992572.243961738, y: 28200799.426332895), Point(x: 0, y: 90)),
  'EPSG:2256': ProjectAndUnProjectResult(
      Point(x: 21510163.334050607, y: 21622551.551792037),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2257': ProjectAndUnProjectResult(
      Point(x: -1740585.942947746, y: 28162864.26349877), Point(x: 0, y: 90)),
  'EPSG:2258': ProjectAndUnProjectResult(
      Point(x: -3274517.639472816, y: 27651211.139304798), Point(x: 0, y: 90)),
  'EPSG:2259': ProjectAndUnProjectResult(
      Point(x: -4556912.360749827, y: 27080492.584270146), Point(x: 0, y: 90)),
  'EPSG:2260': ProjectAndUnProjectResult(
      Point(x: 16771473.19291651, y: 19881470.240724005), Point(x: 0, y: 90)),
  'EPSG:2261': ProjectAndUnProjectResult(
      Point(x: 16742057.214225767, y: 20198326.19815082), Point(x: 0, y: 90)),
  'EPSG:2262': ProjectAndUnProjectResult(
      Point(x: 16635885.195668627, y: 20897177.962862995), Point(x: 0, y: 90)),
  'EPSG:2263': ProjectAndUnProjectResult(
      Point(x: 20080362.042142667, y: 13503621.26983818),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2264': ProjectAndUnProjectResult(
      Point(x: 23009024.984398805, y: 15969960.634952374),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:2265': ProjectAndUnProjectResult(
      Point(x: 21212141.1777009, y: 18575411.16597377),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2266': ProjectAndUnProjectResult(
      Point(x: 21568125.75435474, y: 18836205.032457754),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2267': ProjectAndUnProjectResult(
      Point(x: 24956378.374106497, y: 19976436.59594429),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:2268': ProjectAndUnProjectResult(
      Point(x: 25553996.407476988, y: 20227709.190562464),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3374': ProjectAndUnProjectResult(
      Point(x: 2540783.335368116, y: 5555899.395479769),
      Point(x: 17.883147115494637, y: 46.89269969480191)),
  'EPSG:2269': ProjectAndUnProjectResult(
      Point(x: 28205491.53782647, y: 24245461.29358233),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:2270': ProjectAndUnProjectResult(
      Point(x: 25833585.615591403, y: 24599246.142841343),
      Point(x: 17.88805856028154, y: 46.892264067008725)),
  'EPSG:2271': ProjectAndUnProjectResult(
      Point(x: 21399134.738047402, y: 14424379.654619897),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2272': ProjectAndUnProjectResult(
      Point(x: 21600173.968596835, y: 14567500.710063381),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:2273': ProjectAndUnProjectResult(
      Point(x: 23724086.117270596, y: 16795620.69326082),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:2274': ProjectAndUnProjectResult(
      Point(x: 23755941.686326686, y: 17389305.165589985),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:2275': ProjectAndUnProjectResult(
      Point(x: 24255654.445273783, y: 24283641.25020052),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2276': ProjectAndUnProjectResult(
      Point(x: 26211047.58759166, y: 27153798.922896974),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:2277': ProjectAndUnProjectResult(
      Point(x: 27620463.418675568, y: 31078601.6437094),
      Point(x: 17.88805856028155, y: 46.892264067008746)),
  'EPSG:2278': ProjectAndUnProjectResult(
      Point(x: 27843540.280672904, y: 34296206.30905828),
      Point(x: 17.88805856028154, y: 46.89226406700874)),
  'EPSG:2279': ProjectAndUnProjectResult(
      Point(x: 27835397.225557923, y: 37629307.37812436),
      Point(x: 17.88805856028154, y: 46.89226406700874)),
  'EPSG:2280': ProjectAndUnProjectResult(
      Point(x: 23401765.337626535, y: 25725115.05581844),
      Point(x: 17.888058560281525, y: 46.892264067008746)),
  'EPSG:2281': ProjectAndUnProjectResult(
      Point(x: 24004536.819161545, y: 29432949.629476044),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:2282': ProjectAndUnProjectResult(
      Point(x: 24918173.066587433, y: 32865585.764436252),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:2283': ProjectAndUnProjectResult(
      Point(x: 31609131.381488748, y: 21591230.948789448),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:2284': ProjectAndUnProjectResult(
      Point(x: 31900874.224490017, y: 18579489.497676484),
      Point(x: 17.888058560281486, y: 46.892264067008746)),
  'EPSG:2285': ProjectAndUnProjectResult(
      Point(x: 20370302.974943724, y: 23626235.95369611),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:2286': ProjectAndUnProjectResult(
      Point(x: 21028688.336513802, y: 23890497.31480848),
      Point(x: 17.88805856028154, y: 46.892264067008746)),
  'EPSG:2287': ProjectAndUnProjectResult(
      Point(x: 21381299.102231305, y: 16301056.100981915),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:2288': ProjectAndUnProjectResult(
      Point(x: 21690411.73560526, y: 16558125.8202394),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:2289': ProjectAndUnProjectResult(
      Point(x: 22059612.239289284, y: 16959866.73353126),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:2290': ProjectAndUnProjectResult(
      Point(x: 6057388.715196855, y: 3704941.015248521),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2291': ProjectAndUnProjectResult(
      Point(x: 5757388.715196855, y: 4104941.015248521),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2292': ProjectAndUnProjectResult(
      Point(x: 5757390.397843242, y: 4104942.040903113),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:2294': ProjectAndUnProjectResult(
      Point(x: 9621060.134025961, y: 8954489.049760353),
      Point(x: 45, y: double.nan)),
  'EPSG:2295': ProjectAndUnProjectResult(
      Point(x: 10650862.475597754, y: 9269862.541106977),
      Point(x: 45, y: double.nan)),
  'EPSG:2308': ProjectAndUnProjectResult(
      Point(x: -4513134.124233968, y: 20216828.511930987),
      Point(x: 118.9688106325813, y: 89.99303026578566)),
  'EPSG:2309': ProjectAndUnProjectResult(
      Point(x: -4088660.7438535104, y: 20965646.197774395), Point(x: 0, y: 90)),
  'EPSG:2310': ProjectAndUnProjectResult(
      Point(x: -1456461.55427555, y: 22141396.692297444), Point(x: 0, y: 90)),
  'EPSG:2311': ProjectAndUnProjectResult(
      Point(x: 1405147.9833163773, y: 5262228.862753582),
      Point(x: 17.88805660756604, y: 46.89226390459157)),
  'EPSG:2312': ProjectAndUnProjectResult(
      Point(x: 719998.6774621322, y: 5197277.81087716),
      Point(x: 17.888058560302763, y: 46.892264030541085)),
  'EPSG:2313': ProjectAndUnProjectResult(
      Point(x: 719998.6774621322, y: 5197277.81087716),
      Point(x: 17.888058560302763, y: 46.892264030541085)),
  'EPSG:2314': ProjectAndUnProjectResult(
      Point(x: 17761587.675211947, y: 26351562.307014886),
      Point(x: 45, y: double.nan)),
  'EPSG:2315': ProjectAndUnProjectResult(
      Point(x: 5625861.196194883, y: 19753668.72755958),
      Point(x: 45, y: double.nan)),
  'EPSG:2316': ProjectAndUnProjectResult(
      Point(x: 5638830.44606481, y: 19108385.594976246),
      Point(x: 45, y: double.nan)),
  'EPSG:2317': ProjectAndUnProjectResult(
      Point(x: 9479662.195388306, y: 6627480.319235176),
      Point(x: 17.888058676900886, y: 46.892264008108)),
  'EPSG:2318': ProjectAndUnProjectResult(
      Point(x: -2439841.30386344, y: 2731845.1191254184),
      Point(x: 17.88805858437824, y: 46.89226406096703)),
  'EPSG:2319': ProjectAndUnProjectResult(
      Point(x: -194164.44120810507, y: 5235921.738050902),
      Point(x: 17.888058723412243, y: 46.89226402624652)),
  'EPSG:2320': ProjectAndUnProjectResult(
      Point(x: -422506.1151652804, y: 5267161.966714753),
      Point(x: 17.88806088967312, y: 46.892263897270425)),
  'EPSG:2321': ProjectAndUnProjectResult(
      Point(x: -650622.2074274644, y: 5307499.291513194),
      Point(x: 17.88807716577362, y: 46.89226406012086)),
  'EPSG:2322': ProjectAndUnProjectResult(
      Point(x: -878413.6991798768, y: 5357129.58577281),
      Point(x: 17.88816193315454, y: 46.89226781527169)),
  'EPSG:2323': ProjectAndUnProjectResult(
      Point(x: -1105751.6779216034, y: 5416290.662010544),
      Point(x: 17.888509008752173, y: 46.89229072693788)),
  'EPSG:2324': ProjectAndUnProjectResult(
      Point(x: -1332470.0447411719, y: 5485261.147490877),
      Point(x: 17.889710867153727, y: 46.89238960175352)),
  'EPSG:2325': ProjectAndUnProjectResult(
      Point(x: -1558357.485854659, y: 5564358.804472028),
      Point(x: 17.893398352663354, y: 46.892742746067256)),
  'EPSG:2326': ProjectAndUnProjectResult(
      Point(x: -3897811.017792186, y: 9131123.390083745),
      Point(x: -129.7117865736333, y: 89.99675233963234)),
  'EPSG:2329': ProjectAndUnProjectResult(
      Point(x: 10690682.26184419, y: 7959555.287549272),
      Point(x: 45, y: double.nan)),
  'EPSG:2330': ProjectAndUnProjectResult(
      Point(x: 11473395.319197614, y: 8523391.635694005),
      Point(x: 45, y: double.nan)),
  'EPSG:2331': ProjectAndUnProjectResult(
      Point(x: 12357223.479454573, y: 9135549.480791643),
      Point(x: 45, y: double.nan)),
  'EPSG:2332': ProjectAndUnProjectResult(
      Point(x: 13375988.771509204, y: 9781978.871222312),
      Point(x: 45, y: double.nan)),
  'EPSG:2333': ProjectAndUnProjectResult(
      Point(x: 14572307.397942493, y: 10439327.334100816), Point(x: 0, y: 90)),
  'EPSG:2334': ProjectAndUnProjectResult(
      Point(x: 15999298.63160049, y: 11071718.158153336), Point(x: 0, y: 90)),
  'EPSG:2335': ProjectAndUnProjectResult(
      Point(x: 17722520.20505155, y: 11626800.653391963), Point(x: 0, y: 90)),
  'EPSG:2336': ProjectAndUnProjectResult(
      Point(x: 19822145.79304871, y: 12030969.44277301), Point(x: 0, y: 90)),
  'EPSG:2337': ProjectAndUnProjectResult(
      Point(x: 22395400.18812346, y: 12183642.986562943), Point(x: 0, y: 90)),
  'EPSG:2338': ProjectAndUnProjectResult(
      Point(x: -3671508.521619378, y: 7001530.290950692),
      Point(x: 66.46978507002119, y: 55.685367319970595)),
  'EPSG:2339': ProjectAndUnProjectResult(
      Point(x: -4017441.551638281, y: 7451377.650985235),
      Point(x: 45, y: double.nan)),
  'EPSG:2340': ProjectAndUnProjectResult(
      Point(x: -4309317.73815581, y: 7959555.287549272),
      Point(x: 45, y: double.nan)),
  'EPSG:2341': ProjectAndUnProjectResult(
      Point(x: -4526604.680802387, y: 8523391.635694005),
      Point(x: 45, y: double.nan)),
  'EPSG:2342': ProjectAndUnProjectResult(
      Point(x: -4642776.520545427, y: 9135549.480791643),
      Point(x: 45, y: double.nan)),
  'EPSG:2343': ProjectAndUnProjectResult(
      Point(x: -4624011.228490796, y: 9781978.871222312),
      Point(x: 45, y: double.nan)),
  'EPSG:2344': ProjectAndUnProjectResult(
      Point(x: -4427692.602057507, y: 10439327.334100816), Point(x: 0, y: 90)),
  'EPSG:2345': ProjectAndUnProjectResult(
      Point(x: -4000701.36839951, y: 11071718.158153336), Point(x: 0, y: 90)),
  'EPSG:2346': ProjectAndUnProjectResult(
      Point(x: -3277479.794948453, y: 11626800.653391963), Point(x: 0, y: 90)),
  'EPSG:2347': ProjectAndUnProjectResult(
      Point(x: -2177854.2069512904, y: 12030969.44277301), Point(x: 0, y: 90)),
  'EPSG:2348': ProjectAndUnProjectResult(
      Point(x: -604599.8118765403, y: 12183642.986562943), Point(x: 0, y: 90)),
  'EPSG:2349': ProjectAndUnProjectResult(
      Point(x: 21328491.47838062, y: 7001530.290950692),
      Point(x: 66.46978507002132, y: 55.68536731997062)),
  'EPSG:2350': ProjectAndUnProjectResult(
      Point(x: 22149848.88083156, y: 7219131.771872754),
      Point(x: 138.37485485398375, y: 69.53969117644566)),
  'EPSG:2351': ProjectAndUnProjectResult(
      Point(x: 22982558.448361717, y: 7451377.650985235),
      Point(x: 45, y: double.nan)),
  'EPSG:2352': ProjectAndUnProjectResult(
      Point(x: 23828706.44663569, y: 7698253.457248896),
      Point(x: 45, y: double.nan)),
  'EPSG:2353': ProjectAndUnProjectResult(
      Point(x: 24690682.261844188, y: 7959555.287549272),
      Point(x: 45, y: double.nan)),
  'EPSG:2354': ProjectAndUnProjectResult(
      Point(x: 25571212.091190733, y: 8234843.799559098),
      Point(x: 45, y: double.nan)),
  'EPSG:2355': ProjectAndUnProjectResult(
      Point(x: 26473395.319197614, y: 8523391.635694005),
      Point(x: 45, y: double.nan)),
  'EPSG:2356': ProjectAndUnProjectResult(
      Point(x: 27400743.7017072, y: 8824123.674719455),
      Point(x: 45, y: double.nan)),
  'EPSG:2357': ProjectAndUnProjectResult(
      Point(x: 28357223.479454573, y: 9135549.480791643),
      Point(x: 45, y: double.nan)),
  'EPSG:2358': ProjectAndUnProjectResult(
      Point(x: 29347300.543087415, y: 9455687.292939829),
      Point(x: 45, y: double.nan)),
  'EPSG:2359': ProjectAndUnProjectResult(
      Point(x: 30375988.771509204, y: 9781978.871222312),
      Point(x: 45, y: double.nan)),
  'EPSG:2360': ProjectAndUnProjectResult(
      Point(x: 31448901.665421672, y: 10111194.489013076), Point(x: 0, y: 90)),
  'EPSG:2361': ProjectAndUnProjectResult(
      Point(x: 32572307.39794249, y: 10439327.334100816), Point(x: 0, y: 90)),
  'EPSG:2362': ProjectAndUnProjectResult(
      Point(x: 33753187.40417423, y: 10761476.55450688), Point(x: 0, y: 90)),
  'EPSG:2363': ProjectAndUnProjectResult(
      Point(x: 34999298.63160049, y: 11071718.158153336), Point(x: 0, y: 90)),
  'EPSG:2364': ProjectAndUnProjectResult(
      Point(x: 36319239.57318527, y: 11362962.948737264), Point(x: 0, y: 90)),
  'EPSG:2365': ProjectAndUnProjectResult(
      Point(x: 37722520.20505155, y: 11626800.653391963), Point(x: 0, y: 90)),
  'EPSG:2366': ProjectAndUnProjectResult(
      Point(x: 39219635.95061495, y: 11853329.370940657), Point(x: 0, y: 90)),
  'EPSG:2367': ProjectAndUnProjectResult(
      Point(x: 40822145.79304871, y: 12030969.44277301), Point(x: 0, y: 90)),
  'EPSG:2368': ProjectAndUnProjectResult(
      Point(x: 42542754.65795568, y: 12146260.82159941), Point(x: 0, y: 90)),
  'EPSG:2369': ProjectAndUnProjectResult(
      Point(x: 44395400.18812346, y: 12183642.986562943), Point(x: 0, y: 90)),
  'EPSG:2370': ProjectAndUnProjectResult(
      Point(x: -3671508.521619378, y: 7001530.290950692),
      Point(x: 66.46978507002119, y: 55.685367319970595)),
  'EPSG:2371': ProjectAndUnProjectResult(
      Point(x: -3850151.1191684427, y: 7219131.771872754),
      Point(x: 138.37485485398398, y: 69.53969117644573)),
  'EPSG:2372': ProjectAndUnProjectResult(
      Point(x: -4017441.551638281, y: 7451377.650985235),
      Point(x: 45, y: double.nan)),
  'EPSG:2373': ProjectAndUnProjectResult(
      Point(x: -4171293.5533643113, y: 7698253.457248896),
      Point(x: 45, y: double.nan)),
  'EPSG:2374': ProjectAndUnProjectResult(
      Point(x: -4309317.73815581, y: 7959555.287549272),
      Point(x: 45, y: double.nan)),
  'EPSG:2375': ProjectAndUnProjectResult(
      Point(x: -4428787.908809266, y: 8234843.799559098),
      Point(x: 45, y: double.nan)),
  'EPSG:2376': ProjectAndUnProjectResult(
      Point(x: -4526604.680802387, y: 8523391.635694005),
      Point(x: 45, y: double.nan)),
  'EPSG:2377': ProjectAndUnProjectResult(
      Point(x: -4599256.2982928, y: 8824123.674719455),
      Point(x: 45, y: double.nan)),
  'EPSG:2378': ProjectAndUnProjectResult(
      Point(x: -4642776.520545427, y: 9135549.480791643),
      Point(x: 45, y: double.nan)),
  'EPSG:2379': ProjectAndUnProjectResult(
      Point(x: -4652699.456912585, y: 9455687.292939829),
      Point(x: 45, y: double.nan)),
  'EPSG:2380': ProjectAndUnProjectResult(
      Point(x: -4624011.228490796, y: 9781978.871222312),
      Point(x: 45, y: double.nan)),
  'EPSG:2381': ProjectAndUnProjectResult(
      Point(x: -4551098.334578328, y: 10111194.489013076), Point(x: 0, y: 90)),
  'EPSG:2382': ProjectAndUnProjectResult(
      Point(x: -4427692.602057507, y: 10439327.334100816), Point(x: 0, y: 90)),
  'EPSG:2383': ProjectAndUnProjectResult(
      Point(x: -4246812.595825768, y: 10761476.55450688), Point(x: 0, y: 90)),
  'EPSG:2384': ProjectAndUnProjectResult(
      Point(x: -4000701.36839951, y: 11071718.158153336), Point(x: 0, y: 90)),
  'EPSG:2385': ProjectAndUnProjectResult(
      Point(x: -3680760.4268147284, y: 11362962.948737264), Point(x: 0, y: 90)),
  'EPSG:2386': ProjectAndUnProjectResult(
      Point(x: -3277479.794948453, y: 11626800.653391963), Point(x: 0, y: 90)),
  'EPSG:2387': ProjectAndUnProjectResult(
      Point(x: -2780364.0493850503, y: 11853329.370940657), Point(x: 0, y: 90)),
  'EPSG:2388': ProjectAndUnProjectResult(
      Point(x: -2177854.2069512904, y: 12030969.44277301), Point(x: 0, y: 90)),
  'EPSG:2389': ProjectAndUnProjectResult(
      Point(x: -1457245.342044324, y: 12146260.82159941), Point(x: 0, y: 90)),
  'EPSG:2390': ProjectAndUnProjectResult(
      Point(x: -604599.8118765403, y: 12183642.986562943), Point(x: 0, y: 90)),
  'EPSG:2391': ProjectAndUnProjectResult(
      Point(x: 1263024.506404655, y: 5200120.525379185),
      Point(x: 17.888058569509923, y: 46.89226408519625)),
  'EPSG:2392': ProjectAndUnProjectResult(
      Point(x: 2034440.5716829193, y: 5213578.652113191),
      Point(x: 17.888058572362624, y: 46.892264080684676)),
  'EPSG:2393': ProjectAndUnProjectResult(
      Point(x: 2805947.597461324, y: 5235870.493398355),
      Point(x: 17.888058727374972, y: 46.89226403979681)),
  'EPSG:2394': ProjectAndUnProjectResult(
      Point(x: 3577604.3454710813, y: 5267106.15784692),
      Point(x: 17.888060891114286, y: 46.892263910899054)),
  'EPSG:2395': ProjectAndUnProjectResult(
      Point(x: 6441663.530162457, y: 5564103.330087571),
      Point(x: 17.89339697213266, y: 46.892742762902465)),
  'EPSG:2396': ProjectAndUnProjectResult(
      Point(x: 6993498.98724838, y: 5754124.1644214),
      Point(x: 17.9309147229843, y: 46.897079180364614)),
  'EPSG:2397': ProjectAndUnProjectResult(
      Point(x: 4177294.151646561, y: 5233915.120827863),
      Point(x: 17.888058445012796, y: 46.892264030067174)),
  'EPSG:2398': ProjectAndUnProjectResult(
      Point(x: 4948799.201240658, y: 5212274.451999459),
      Point(x: 17.888058568215087, y: 46.89226406598465)),
  'EPSG:2399': ProjectAndUnProjectResult(
      Point(x: 5720217.08564427, y: 5199460.86379259),
      Point(x: 17.88805857010659, y: 46.89226406961487)),
  'EPSG:2400': ProjectAndUnProjectResult(
      Point(x: 1658711.959966589, y: 5196737.44236798),
      Point(x: 17.88805858630439, y: 46.8922640303641)),
  'EPSG:2401': ProjectAndUnProjectResult(
      Point(x: 21328573.28048693, y: 7001532.8404073985),
      Point(x: 66.44236062758634, y: 55.68084177388956)),
  'EPSG:2402': ProjectAndUnProjectResult(
      Point(x: 22149922.7599575, y: 7219126.768205585),
      Point(x: 138.30647601081196, y: 69.52623410327858)),
  'EPSG:2403': ProjectAndUnProjectResult(
      Point(x: 22982623.296146363, y: 7451365.034696903),
      Point(x: 45, y: double.nan)),
  'EPSG:2404': ProjectAndUnProjectResult(
      Point(x: 23828760.974070355, y: 7698233.245223834),
      Point(x: 45, y: double.nan)),
  'EPSG:2405': ProjectAndUnProjectResult(
      Point(x: 24690724.97687363, y: 7959527.594984778),
      Point(x: 45, y: double.nan)),
  'EPSG:2406': ProjectAndUnProjectResult(
      Point(x: 25571241.274286646, y: 8234808.865123581),
      Point(x: 45, y: double.nan)),
  'EPSG:2407': ProjectAndUnProjectResult(
      Point(x: 26473408.996789828, y: 8523349.850202367),
      Point(x: 45, y: double.nan)),
  'EPSG:2408': ProjectAndUnProjectResult(
      Point(x: 27400739.617356338, y: 8824075.613625502),
      Point(x: 45, y: double.nan)),
  'EPSG:2409': ProjectAndUnProjectResult(
      Point(x: 28357199.0626484, y: 9135495.940806963),
      Point(x: 45, y: double.nan)),
  'EPSG:2410': ProjectAndUnProjectResult(
      Point(x: 29347252.875541657, y: 9455629.333097685),
      Point(x: 45, y: double.nan)),
  'EPSG:2411': ProjectAndUnProjectResult(
      Point(x: 30375914.550852004, y: 9781917.858713986),
      Point(x: 45, y: double.nan)),
  'EPSG:2412': ProjectAndUnProjectResult(
      Point(x: 31448797.166139334, y: 10111132.15013253),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2413': ProjectAndUnProjectResult(
      Point(x: 32572168.42946268, y: 10439265.810641618),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2414': ProjectAndUnProjectResult(
      Point(x: 33753009.265961155, y: 10761418.465963187),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2415': ProjectAndUnProjectResult(
      Point(x: 34999076.06513523, y: 11071666.670084072),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2416': ProjectAndUnProjectResult(
      Point(x: 36318966.71070275, y: 11362921.847659718),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2417': ProjectAndUnProjectResult(
      Point(x: 37722190.51490404, y: 11626774.428577727),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2418': ProjectAndUnProjectResult(
      Point(x: 39219242.179130815, y: 11853323.303493233),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2419': ProjectAndUnProjectResult(
      Point(x: 40821679.90275308, y: 12030989.702372357),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2420': ProjectAndUnProjectResult(
      Point(x: 42542207.76201861, y: 12146314.571304422),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2421': ProjectAndUnProjectResult(
      Point(x: 44394762.48089945, y: 12183738.496068094),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2422': ProjectAndUnProjectResult(
      Point(x: -3671426.71951307, y: 7001532.8404073985),
      Point(x: 66.44236062758634, y: 55.68084177388956)),
  'EPSG:2423': ProjectAndUnProjectResult(
      Point(x: -3850077.240042502, y: 7219126.768205585),
      Point(x: 138.30647601081242, y: 69.52623410327867)),
  'EPSG:2424': ProjectAndUnProjectResult(
      Point(x: -4017376.703853639, y: 7451365.034696903),
      Point(x: 45, y: double.nan)),
  'EPSG:2425': ProjectAndUnProjectResult(
      Point(x: -4171239.0259296447, y: 7698233.245223834),
      Point(x: 45, y: double.nan)),
  'EPSG:2426': ProjectAndUnProjectResult(
      Point(x: -4309275.023126369, y: 7959527.594984778),
      Point(x: 45, y: double.nan)),
  'EPSG:2427': ProjectAndUnProjectResult(
      Point(x: -4428758.725713354, y: 8234808.865123581),
      Point(x: 45, y: double.nan)),
  'EPSG:2428': ProjectAndUnProjectResult(
      Point(x: -4526591.003210171, y: 8523349.850202367),
      Point(x: 45, y: double.nan)),
  'EPSG:2429': ProjectAndUnProjectResult(
      Point(x: -4599260.382643661, y: 8824075.613625502),
      Point(x: 45, y: double.nan)),
  'EPSG:2430': ProjectAndUnProjectResult(
      Point(x: -4642800.937351601, y: 9135495.940806963),
      Point(x: 45, y: double.nan)),
  'EPSG:2431': ProjectAndUnProjectResult(
      Point(x: -4652747.124458343, y: 9455629.333097685),
      Point(x: 45, y: double.nan)),
  'EPSG:2432': ProjectAndUnProjectResult(
      Point(x: -4624085.449147995, y: 9781917.858713986),
      Point(x: 45, y: double.nan)),
  'EPSG:2433': ProjectAndUnProjectResult(
      Point(x: -4551202.833860664, y: 10111132.15013253),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2434': ProjectAndUnProjectResult(
      Point(x: -4427831.570537322, y: 10439265.810641618),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2435': ProjectAndUnProjectResult(
      Point(x: -4246990.734038848, y: 10761418.465963187),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2436': ProjectAndUnProjectResult(
      Point(x: -4000923.934864768, y: 11071666.670084072),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2437': ProjectAndUnProjectResult(
      Point(x: -3681033.2892972548, y: 11362921.847659718),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2438': ProjectAndUnProjectResult(
      Point(x: -3277809.485095963, y: 11626774.428577727),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2439': ProjectAndUnProjectResult(
      Point(x: -2780757.820869183, y: 11853323.303493233),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2440': ProjectAndUnProjectResult(
      Point(x: -2178320.097246922, y: 12030989.702372357),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2441': ProjectAndUnProjectResult(
      Point(x: -1457792.2379813858, y: 12146314.571304422),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2442': ProjectAndUnProjectResult(
      Point(x: -605237.519100545, y: 12183738.496068094),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:2443': ProjectAndUnProjectResult(
      Point(x: -2566056.9116173303, y: 8401313.58870162), Point(x: 0, y: 90)),
  'EPSG:2444': ProjectAndUnProjectResult(
      Point(x: -2211182.2634812854, y: 8462072.812029004), Point(x: 0, y: 90)),
  'EPSG:2445': ProjectAndUnProjectResult(
      Point(x: -1913282.6153144585, y: 8164170.9970185), Point(x: 0, y: 90)),
  'EPSG:2446': ProjectAndUnProjectResult(
      Point(x: -1548193.3456383753, y: 8522145.552706772), Point(x: 0, y: 90)),
  'EPSG:2447': ProjectAndUnProjectResult(
      Point(x: -1306115.9982166318, y: 8196578.576068864), Point(x: 0, y: 90)),
  'EPSG:2448': ProjectAndUnProjectResult(
      Point(x: -788366.1033867978, y: 8189401.718133621), Point(x: 0, y: 90)),
  'EPSG:2449': ProjectAndUnProjectResult(
      Point(x: -398086.9536182322, y: 8165821.33190225), Point(x: 0, y: 90)),
  'EPSG:2450': ProjectAndUnProjectResult(
      Point(x: 77463.83204888566, y: 8118405.0916535165), Point(x: 0, y: 90)),
  'EPSG:2451': ProjectAndUnProjectResult(
      Point(x: 585959.9308690846, y: 8047327.498372015), Point(x: 0, y: 90)),
  'EPSG:2452': ProjectAndUnProjectResult(
      Point(x: 989901.510910523, y: 7533339.024756886), Point(x: 0, y: 90)),
  'EPSG:2453': ProjectAndUnProjectResult(
      Point(x: 751869.6886925661, y: 7131756.363145234), Point(x: 0, y: 90)),
  'EPSG:2454': ProjectAndUnProjectResult(
      Point(x: 1596744.7812366635, y: 6963379.403117015), Point(x: 0, y: 90)),
  'EPSG:2455': ProjectAndUnProjectResult(
      Point(x: 2526128.1328379745, y: 6728261.832241865), Point(x: 0, y: 90)),
  'EPSG:2456': ProjectAndUnProjectResult(
      Point(x: 1486633.193392855, y: 8984705.502253164), Point(x: 0, y: 90)),
  'EPSG:2457': ProjectAndUnProjectResult(
      Point(x: -2992748.9178998745, y: 9071307.830204587), Point(x: 0, y: 90)),
  'EPSG:2458': ProjectAndUnProjectResult(
      Point(x: -3622384.886812397, y: 8829268.069555495), Point(x: 0, y: 90)),
  'EPSG:2459': ProjectAndUnProjectResult(
      Point(x: -2211182.2634812854, y: 9237908.69123874), Point(x: 0, y: 90)),
  'EPSG:2460': ProjectAndUnProjectResult(
      Point(x: -788366.1033867978, y: 9962400.81668543), Point(x: 0, y: 90)),
  'EPSG:2461': ProjectAndUnProjectResult(
      Point(x: 8475126.70697138, y: 6334051.65944307),
      Point(x: -131825587.42186226, y: 47833306.95865751)),
  'EPSG:2462': ProjectAndUnProjectResult(
      Point(x: 4262979.618454169, y: 5200109.974276837),
      Point(x: 17.888058561832175, y: 46.89226406409104)),
  'EPSG:2463': ProjectAndUnProjectResult(
      Point(x: 262977.40292099846, y: 5200101.235815557),
      Point(x: 17.88805857027049, y: 46.89226406903771)),
  'EPSG:2464': ProjectAndUnProjectResult(
      Point(x: -194086.63716134313, y: 5235854.283937308),
      Point(x: 17.888058728388476, y: 46.89226402384307)),
  'EPSG:2465': ProjectAndUnProjectResult(
      Point(x: -650534.705398909, y: 5307424.743197788),
      Point(x: 17.888077164108275, y: 46.89226406201648)),
  'EPSG:2466': ProjectAndUnProjectResult(
      Point(x: -1105654.7796934056, y: 5416207.687562138),
      Point(x: 17.88850885829136, y: 46.89229074846724)),
  'EPSG:2467': ProjectAndUnProjectResult(
      Point(x: -1558251.691909319, y: 5564265.926028976),
      Point(x: 17.89339665661175, y: 46.892742750704436)),
  'EPSG:2468': ProjectAndUnProjectResult(
      Point(x: -2006400.0574959628, y: 5754282.564756225),
      Point(x: 17.930912766487186, y: 46.89707896829051)),
  'EPSG:2469': ProjectAndUnProjectResult(
      Point(x: -2447142.3192905476, y: 5989465.549310994),
      Point(x: 18.163085249950498, y: 46.92853675095355)),
  'EPSG:2470': ProjectAndUnProjectResult(
      Point(x: -2876116.3057343345, y: 6273376.642920781),
      Point(x: 19.453977225641804, y: 47.12654815721369)),
  'EPSG:2471': ProjectAndUnProjectResult(
      Point(x: -3287096.703733949, y: 6609650.442058996),
      Point(x: 26.45354646467008, y: 48.31387174213733)),
  'EPSG:2472': ProjectAndUnProjectResult(
      Point(x: -3671434.8463999643, y: 7001562.176153691),
      Point(x: 66.44656806390067, y: 55.68157108625792)),
  'EPSG:2473': ProjectAndUnProjectResult(
      Point(x: -4017381.2158948015, y: 7451396.183664046),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2474': ProjectAndUnProjectResult(
      Point(x: -4309275.061622056, y: 7959560.102225089),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2475': ProjectAndUnProjectResult(
      Point(x: -4526585.5339893205, y: 8523382.956016758),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2476': ProjectAndUnProjectResult(
      Point(x: -4642788.733976571, y: 9135528.468969345),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2477': ProjectAndUnProjectResult(
      Point(x: -4624065.078742239, y: 9781948.077873092),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2478': ProjectAndUnProjectResult(
      Point(x: -4427801.383499, y: 10439291.264915409),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2479': ProjectAndUnProjectResult(
      Point(x: -4000882.0598914055, y: 11071683.97462519),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2480': ProjectAndUnProjectResult(
      Point(x: -3277753.8311074045, y: 11626779.025659218),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2481': ProjectAndUnProjectResult(
      Point(x: -2178248.363955864, y: 12030975.573321657),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2482': ProjectAndUnProjectResult(
      Point(x: -605147.2181421507, y: 12183697.82416335),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2483': ProjectAndUnProjectResult(
      Point(x: 1558526.4870261499, y: 11950616.349463312),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2484': ProjectAndUnProjectResult(
      Point(x: 4452505.288271218, y: 11155688.489850847),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2485': ProjectAndUnProjectResult(
      Point(x: 8242579.076082804, y: 9571887.488782195),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2486': ProjectAndUnProjectResult(
      Point(x: 13124216.874329505, y: 6910483.138041684),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2487': ProjectAndUnProjectResult(
      Point(x: 19326524.301511526, y: 2808729.8638930563),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2488': ProjectAndUnProjectResult(
      Point(x: 27116552.31342323, y: -3184188.6720379107),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2489': ProjectAndUnProjectResult(
      Point(x: 36803972.82699252, y: -11623116.237611713),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:2490': ProjectAndUnProjectResult(
      Point(x: 48746136.82506581, y: -23184946.595761795),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:2491': ProjectAndUnProjectResult(
      Point(x: 63353530.541906394, y: -38688883.46037097),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:2492': ProjectAndUnProjectResult(
      Point(x: 1177294.7279087103, y: 5233919.735428686),
      Point(x: 17.88805844509745, y: 46.89226402884926)),
  'EPSG:2493': ProjectAndUnProjectResult(
      Point(x: 720218.0099101962, y: 5199465.397656718),
      Point(x: 17.888058570193113, y: 46.892264068397665)),
  'EPSG:2494': ProjectAndUnProjectResult(
      Point(x: 262975.2033760503, y: 5200108.455837973),
      Point(x: 17.88805857014421, y: 46.89226406836862)),
  'EPSG:2495': ProjectAndUnProjectResult(
      Point(x: -194088.28412423097, y: 5235861.690128276),
      Point(x: 17.88805872826832, y: 46.89226402317326)),
  'EPSG:2496': ProjectAndUnProjectResult(
      Point(x: -650535.7804342315, y: 5307432.332827369),
      Point(x: 17.88807716440437, y: 46.89226406138663)),
  'EPSG:2497': ProjectAndUnProjectResult(
      Point(x: -1105655.2508189164, y: 5416215.45576819),
      Point(x: 17.888508865759512, y: 46.89229074905092)),
  'EPSG:2498': ProjectAndUnProjectResult(
      Point(x: -1558251.513767628, y: 5564273.862147296),
      Point(x: 17.893396730554738, y: 46.89274276585422)),
  'EPSG:2499': ProjectAndUnProjectResult(
      Point(x: -2006399.1709308936, y: 5754290.647735119),
      Point(x: 17.930913287470418, y: 46.89707909919423)),
  'EPSG:2500': ProjectAndUnProjectResult(
      Point(x: -2447140.6515301783, y: 5989473.74186563),
      Point(x: 18.163088321316437, y: 46.92853762419354)),
  'EPSG:2501': ProjectAndUnProjectResult(
      Point(x: -2876113.771579705, y: 6273384.884065807),
      Point(x: 19.45399395295535, y: 47.12655335465394)),
  'EPSG:2502': ProjectAndUnProjectResult(
      Point(x: -3287093.208259472, y: 6609658.637646196),
      Point(x: 26.45363795646325, y: 48.31390228746322)),
  'EPSG:2503': ProjectAndUnProjectResult(
      Point(x: -3671430.2897785814, y: 7001570.187034681),
      Point(x: 66.4471378153942, y: 55.6817679617501)),
  'EPSG:2504': ProjectAndUnProjectResult(
      Point(x: -4017375.5010680165, y: 7451403.811096456),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2505': ProjectAndUnProjectResult(
      Point(x: -4309268.105641998, y: 7959567.070144047),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2506': ProjectAndUnProjectResult(
      Point(x: -4526577.283967023, y: 8523388.889802082),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2507': ProjectAndUnProjectResult(
      Point(x: -4642779.188677735, y: 9135532.870352365),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2508': ProjectAndUnProjectResult(
      Point(x: -4624054.316978742, y: 9781950.295645684),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2509': ProjectAndUnProjectResult(
      Point(x: -4427789.600571497, y: 10439290.461127605),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2510': ProjectAndUnProjectResult(
      Point(x: -4000869.6134453984, y: 11071679.08598643),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2511': ProjectAndUnProjectResult(
      Point(x: -3277741.2978721927, y: 11626768.71989223),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2512': ProjectAndUnProjectResult(
      Point(x: -2178236.608942848, y: 12030958.200256905),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2513': ProjectAndUnProjectResult(
      Point(x: -605137.4779859737, y: 12183671.361405866),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2514': ProjectAndUnProjectResult(
      Point(x: 1558532.5047930002, y: 11950578.342513002),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2515': ProjectAndUnProjectResult(
      Point(x: 4452505.288112892, y: 11155635.986611271),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2516': ProjectAndUnProjectResult(
      Point(x: 8242570.037518824, y: 9571816.968452249),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2517': ProjectAndUnProjectResult(
      Point(x: 13124194.893046256, y: 6910390.434448714),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2518': ProjectAndUnProjectResult(
      Point(x: 19326484.40630764, y: 2808610.083395421),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2519': ProjectAndUnProjectResult(
      Point(x: 27116488.25666316, y: -3184341.2378764953),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2520': ProjectAndUnProjectResult(
      Point(x: 36803876.84613541, y: -11623308.20429408),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:2521': ProjectAndUnProjectResult(
      Point(x: 48745999.37273005, y: -23185185.58270928),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:2522': ProjectAndUnProjectResult(
      Point(x: 63353339.98182248, y: -38689178.19189904),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:2523': ProjectAndUnProjectResult(
      Point(x: 7262975.20337605, y: 5200108.455837973),
      Point(x: 17.88805857014421, y: 46.89226406836862)),
  'EPSG:2524': ProjectAndUnProjectResult(
      Point(x: 8034397.971578807, y: 5213568.339213907),
      Point(x: 17.888058573013023, y: 46.89226406387413)),
  'EPSG:2525': ProjectAndUnProjectResult(
      Point(x: 8805911.715875769, y: 5235861.690128276),
      Point(x: 17.88805872826832, y: 46.89226402317326)),
  'EPSG:2526': ProjectAndUnProjectResult(
      Point(x: 9577575.20169213, y: 5267098.6213854635),
      Point(x: 17.888060893877114, y: 46.8922638952511)),
  'EPSG:2527': ProjectAndUnProjectResult(
      Point(x: 10349464.219565768, y: 5307432.332827369),
      Point(x: 17.888077164404354, y: 46.89226406138663)),
  'EPSG:2528': ProjectAndUnProjectResult(
      Point(x: 11121677.771482574, y: 5357058.679738873),
      Point(x: 17.888161903085418, y: 46.89226782416723)),
  'EPSG:2529': ProjectAndUnProjectResult(
      Point(x: 11894344.749181084, y: 5416215.45576819),
      Point(x: 17.88850886575952, y: 46.892290749050915)),
  'EPSG:2530': ProjectAndUnProjectResult(
      Point(x: 12667631.226298774, y: 5485181.2688879585),
      Point(x: 17.8897103496953, y: 46.892389637173814)),
  'EPSG:2531': ProjectAndUnProjectResult(
      Point(x: 13441748.486232372, y: 5564273.862147296),
      Point(x: 17.893396730554738, y: 46.89274276585422)),
  'EPSG:2532': ProjectAndUnProjectResult(
      Point(x: 14216961.907584509, y: 5653847.704189581),
      Point(x: 17.903741895646384, y: 46.89385695428033)),
  'EPSG:3013': ProjectAndUnProjectResult(
      Point(x: 312936.3103335998, y: 5197489.998984287),
      Point(x: 17.8880585602863, y: 46.89226406700016)),
  'EPSG:2533': ProjectAndUnProjectResult(
      Point(x: 14993600.829069106, y: 5754290.647735119),
      Point(x: 17.930913287470414, y: 46.89707909919423)),
  'EPSG:2534': ProjectAndUnProjectResult(
      Point(x: 15772069.515747806, y: 5866019.427452342),
      Point(x: 17.998882442621085, y: 46.90582889002483)),
  'EPSG:2535': ProjectAndUnProjectResult(
      Point(x: 16552859.348469822, y: 5989473.74186563),
      Point(x: 18.163088321316437, y: 46.92853762419354)),
  'EPSG:2536': ProjectAndUnProjectResult(
      Point(x: 17336562.358387552, y: 6125108.637172303),
      Point(x: 18.550708939450903, y: 46.9856578147775)),
  'EPSG:2537': ProjectAndUnProjectResult(
      Point(x: 18123886.228420295, y: 6273384.884065807),
      Point(x: 19.45399395295535, y: 47.12655335465394)),
  'EPSG:2538': ProjectAndUnProjectResult(
      Point(x: 18915670.883538455, y: 6434757.011886531),
      Point(x: 21.551887363787515, y: 47.47098438727558)),
  'EPSG:2539': ProjectAndUnProjectResult(
      Point(x: 19712906.79174053, y: 6609658.637646196),
      Point(x: 26.453637956463236, y: 48.31390228746322)),
  'EPSG:2540': ProjectAndUnProjectResult(
      Point(x: 20516755.09759528, y: 6798484.700696194),
      Point(x: 38.08853620835505, y: 50.40030765814774)),
  'EPSG:2541': ProjectAndUnProjectResult(
      Point(x: 21328569.710221417, y: 7001570.187034681),
      Point(x: 66.44713781539431, y: 55.68176796175012)),
  'EPSG:3014': ProjectAndUnProjectResult(
      Point(x: 198625.57705212594, y: 5195467.700063693),
      Point(x: 17.888058560281525, y: 46.89226406700878)),
  'EPSG:2542': ProjectAndUnProjectResult(
      Point(x: 22149921.467577163, y: 7219164.900471759),
      Point(x: 138.3187917769007, y: 69.52887325997268)),
  'EPSG:2543': ProjectAndUnProjectResult(
      Point(x: 22982624.49893198, y: 7451403.811096456),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2544': ProjectAndUnProjectResult(
      Point(x: 23828764.907392956, y: 7698272.484713709),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2545': ProjectAndUnProjectResult(
      Point(x: 24690731.894358, y: 7959567.070144047),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2546': ProjectAndUnProjectResult(
      Point(x: 25571251.447768413, y: 8234848.294503033),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2547': ProjectAndUnProjectResult(
      Point(x: 26473422.71603298, y: 8523388.889802082),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2548': ProjectAndUnProjectResult(
      Point(x: 27400757.18949611, y: 8824113.847436663),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2549': ProjectAndUnProjectResult(
      Point(x: 28357220.811322264, y: 9135532.870352365),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2550': ProjectAndUnProjectResult(
      Point(x: -3997737.101659989, y: 21067305.568205394),
      Point(x: 120.55478469957501, y: 89.99287050426858)),
  'EPSG:3015': ProjectAndUnProjectResult(
      Point(x: 84312.6848457014, y: 5195630.7617201),
      Point(x: 17.88805856028147, y: 46.89226406700875)),
  'EPSG:2551': ProjectAndUnProjectResult(
      Point(x: 29347279.13966903, y: 9455664.3659038),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2552': ProjectAndUnProjectResult(
      Point(x: 30375945.68302126, y: 9781950.295645684),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2553': ProjectAndUnProjectResult(
      Point(x: 31448833.53055856, y: 10111161.171520011),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2554': ProjectAndUnProjectResult(
      Point(x: 32572210.3994285, y: 10439290.461127605),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2555': ProjectAndUnProjectResult(
      Point(x: 33753057.22079792, y: 10761437.637996785),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2556': ProjectAndUnProjectResult(
      Point(x: 34999130.3865546, y: 11071679.08598643),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2557': ProjectAndUnProjectResult(
      Point(x: 36319027.77853179, y: 11362926.04018508),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2558': ProjectAndUnProjectResult(
      Point(x: 37722258.70212781, y: 11626768.71989223),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2559': ProjectAndUnProjectResult(
      Point(x: 39219317.84619309, y: 11853305.782492371),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:3016': ProjectAndUnProjectResult(
      Point(x: -29997.2884961167, y: 5197979.386805543),
      Point(x: 17.88805856027366, y: 46.892264066993114)),
  'EPSG:2560': ProjectAndUnProjectResult(
      Point(x: 40821763.39105715, y: 12030958.200256905),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2561': ProjectAndUnProjectResult(
      Point(x: 42542299.38656767, y: 12146266.635333346),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2562': ProjectAndUnProjectResult(
      Point(x: 44394862.52201403, y: 12183671.361405866),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2563': ProjectAndUnProjectResult(
      Point(x: 46394713.40980792, y: 12125273.753735503),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2564': ProjectAndUnProjectResult(
      Point(x: 48558532.504793, y: 11950578.342513002),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2565': ProjectAndUnProjectResult(
      Point(x: 50904520.78105618, y: 11636214.397681559),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2566': ProjectAndUnProjectResult(
      Point(x: 53452505.28811289, y: 11155635.986611271),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2567': ProjectAndUnProjectResult(
      Point(x: 56224049.70833858, y: 10478799.419231562),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2568': ProjectAndUnProjectResult(
      Point(x: 59242570.03751882, y: 9571816.968452249),
      Point(x: double.nan, y: double.nan)),
  'EPSG:3017': ProjectAndUnProjectResult(
      Point(x: -144299.16811836342, y: 5202516.496162767),
      Point(x: 17.88805856022543, y: 46.892264066710894)),
  'EPSG:2569': ProjectAndUnProjectResult(
      Point(x: 62533455.5103905, y: 8396585.726928417),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2570': ProjectAndUnProjectResult(
      Point(x: 66124194.89304626, y: 6910390.434448714),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2571': ProjectAndUnProjectResult(
      Point(x: 70044508.26407446, y: 5065479.08345128),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2572': ProjectAndUnProjectResult(
      Point(x: 74326484.40630764, y: 2808610.083395421),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2573': ProjectAndUnProjectResult(
      Point(x: 79004723.9310509, y: 80569.73794255334),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2574': ProjectAndUnProjectResult(
      Point(x: 84116488.25666316, y: -3184341.2378764953),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2575': ProjectAndUnProjectResult(
      Point(x: 89701854.56336358, y: -7058853.460105787),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2576': ProjectAndUnProjectResult(
      Point(x: 95803876.84613541, y: -11623308.20429408),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:2577': ProjectAndUnProjectResult(
      Point(x: 101968753.1875995, y: -16966271.673058722),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:3018': ProjectAndUnProjectResult(
      Point(x: -258587.512644806, y: 5209247.727562542),
      Point(x: 17.88805856085824, y: 46.892264064897844)),
  'EPSG:2578': ProjectAndUnProjectResult(
      Point(x: 109745999.37273005, y: -23185185.58270928),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:2579': ProjectAndUnProjectResult(
      Point(x: 117688628.96728492, y: -30387055.475630186),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:2580': ProjectAndUnProjectResult(
      Point(x: 126353339.98182249, y: -38689178.19189904),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:2581': ProjectAndUnProjectResult(
      Point(x: 135800708.24317816, y: -48219909.96039137),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:2582': ProjectAndUnProjectResult(
      Point(x: 262975.2033760503, y: 5200108.455837973),
      Point(x: 17.88805857014421, y: 46.89226406836862)),
  'EPSG:2583': ProjectAndUnProjectResult(
      Point(x: 34397.97157880687, y: 5213568.339213907),
      Point(x: 17.888058573013026, y: 46.89226406387413)),
  'EPSG:2584': ProjectAndUnProjectResult(
      Point(x: -194088.28412423097, y: 5235861.690128276),
      Point(x: 17.88805872826832, y: 46.89226402317326)),
  'EPSG:2585': ProjectAndUnProjectResult(
      Point(x: -422424.7983078696, y: 5267098.6213854635),
      Point(x: 17.888060893877114, y: 46.8922638952511)),
  'EPSG:2586': ProjectAndUnProjectResult(
      Point(x: -650535.7804342315, y: 5307432.332827369),
      Point(x: 17.88807716440437, y: 46.89226406138663)),
  'EPSG:3029': ProjectAndUnProjectResult(
      Point(x: 1315582.0205458421, y: 5197519.530895611),
      Point(x: 17.88805856027271, y: 46.89226413302058)),
  'EPSG:2587': ProjectAndUnProjectResult(
      Point(x: -878322.2285174257, y: 5357058.679738873),
      Point(x: 17.888161903085425, y: 46.89226782416723)),
  'EPSG:2588': ProjectAndUnProjectResult(
      Point(x: -1105655.2508189164, y: 5416215.45576819),
      Point(x: 17.888508865759512, y: 46.89229074905092)),
  'EPSG:2589': ProjectAndUnProjectResult(
      Point(x: -1332368.7737012256, y: 5485181.2688879585),
      Point(x: 17.889710349695306, y: 46.892389637173814)),
  'EPSG:2590': ProjectAndUnProjectResult(
      Point(x: -1558251.513767628, y: 5564273.862147296),
      Point(x: 17.893396730554738, y: 46.89274276585422)),
  'EPSG:2591': ProjectAndUnProjectResult(
      Point(x: -1783038.0924154916, y: 5653847.704189581),
      Point(x: 17.903741895646384, y: 46.89385695428033)),
  'EPSG:2592': ProjectAndUnProjectResult(
      Point(x: -2006399.1709308936, y: 5754290.647735119),
      Point(x: 17.930913287470418, y: 46.89707909919423)),
  'EPSG:2593': ProjectAndUnProjectResult(
      Point(x: -2227930.4842521935, y: 5866019.427452342),
      Point(x: 17.9988824426211, y: 46.90582889002483)),
  'EPSG:2594': ProjectAndUnProjectResult(
      Point(x: -2447140.6515301783, y: 5989473.74186563),
      Point(x: 18.163088321316437, y: 46.92853762419354)),
  'EPSG:2595': ProjectAndUnProjectResult(
      Point(x: -2663437.6416124497, y: 6125108.637172303),
      Point(x: 18.550708939450896, y: 46.98565781477748)),
  'EPSG:3030': ProjectAndUnProjectResult(
      Point(x: 1144153.5326327079, y: 5205274.382075083),
      Point(x: 17.888058560309865, y: 46.89226413211409)),
  'EPSG:2596': ProjectAndUnProjectResult(
      Point(x: -2876113.771579705, y: 6273384.884065807),
      Point(x: 19.45399395295535, y: 47.12655335465394)),
  'EPSG:2597': ProjectAndUnProjectResult(
      Point(x: -3084329.1164615457, y: 6434757.011886531),
      Point(x: 21.55188736378752, y: 47.47098438727558)),
  'EPSG:2598': ProjectAndUnProjectResult(
      Point(x: -3287093.208259472, y: 6609658.637646196),
      Point(x: 26.45363795646325, y: 48.31390228746322)),
  'EPSG:2599': ProjectAndUnProjectResult(
      Point(x: -3483244.9024047223, y: 6798484.700696194),
      Point(x: 38.088536208355066, y: 50.40030765814774)),
  'EPSG:2600': ProjectAndUnProjectResult(
      Point(x: 34368.35104356846, y: 5212395.955506003),
      Point(x: 17.888058563129828, y: 46.892264062424815)),
  'EPSG:2601': ProjectAndUnProjectResult(
      Point(x: -3671430.2897785814, y: 7001570.187034681),
      Point(x: 66.4471378153942, y: 55.6817679617501)),
  'EPSG:2602': ProjectAndUnProjectResult(
      Point(x: -3850078.532422838, y: 7219164.900471759),
      Point(x: 138.31879177690084, y: 69.5288732599727)),
  'EPSG:2603': ProjectAndUnProjectResult(
      Point(x: -4017375.5010680165, y: 7451403.811096456),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2604': ProjectAndUnProjectResult(
      Point(x: -4171235.0926070437, y: 7698272.484713709),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2605': ProjectAndUnProjectResult(
      Point(x: -4309268.105641998, y: 7959567.070144047),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2606': ProjectAndUnProjectResult(
      Point(x: -4428748.552231589, y: 8234848.294503033),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2607': ProjectAndUnProjectResult(
      Point(x: -4526577.283967023, y: 8523388.889802082),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2608': ProjectAndUnProjectResult(
      Point(x: -4599242.81050389, y: 8824113.847436663),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2609': ProjectAndUnProjectResult(
      Point(x: -4642779.188677735, y: 9135532.870352365),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2610': ProjectAndUnProjectResult(
      Point(x: -4652720.860330971, y: 9455664.3659038),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2611': ProjectAndUnProjectResult(
      Point(x: -4624054.316978742, y: 9781950.295645684),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2612': ProjectAndUnProjectResult(
      Point(x: -4551166.469441441, y: 10111161.171520011),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2613': ProjectAndUnProjectResult(
      Point(x: -4427789.600571497, y: 10439290.461127605),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2614': ProjectAndUnProjectResult(
      Point(x: -4246942.779202082, y: 10761437.637996785),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:3031': ProjectAndUnProjectResult(
      Point(x: 5124879.134065282, y: 20731379.026842233),
      Point(x: 17.888058560281515, y: 46.89226406700877)),
  'EPSG:2615': ProjectAndUnProjectResult(
      Point(x: -4000869.6134453984, y: 11071679.08598643),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2616': ProjectAndUnProjectResult(
      Point(x: -3680972.2214682084, y: 11362926.04018508),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2617': ProjectAndUnProjectResult(
      Point(x: -3277741.2978721927, y: 11626768.71989223),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2618': ProjectAndUnProjectResult(
      Point(x: -2780682.1538069127, y: 11853305.782492371),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2619': ProjectAndUnProjectResult(
      Point(x: -2178236.608942848, y: 12030958.200256905),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2620': ProjectAndUnProjectResult(
      Point(x: -1457700.6134323366, y: 12146266.635333346),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2621': ProjectAndUnProjectResult(
      Point(x: -605137.4779859737, y: 12183671.361405866),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2622': ProjectAndUnProjectResult(
      Point(x: 394713.4098079185, y: 12125273.753735503),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2623': ProjectAndUnProjectResult(
      Point(x: 1558532.5047930002, y: 11950578.342513002),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:3042': ProjectAndUnProjectResult(
      Point(x: 2088186.225893158, y: 5409193.676598077),
      Point(x: 17.88765211923516, y: 46.89228755974916)),
  'EPSG:2624': ProjectAndUnProjectResult(
      Point(x: 2904520.781056181, y: 11636214.397681559),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2625': ProjectAndUnProjectResult(
      Point(x: 4452505.288112892, y: 11155635.986611271),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2626': ProjectAndUnProjectResult(
      Point(x: 6224049.708338583, y: 10478799.419231562),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:2627': ProjectAndUnProjectResult(
      Point(x: 8242570.037518824, y: 9571816.968452249),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2628': ProjectAndUnProjectResult(
      Point(x: 10533455.5103905, y: 8396585.726928417),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2629': ProjectAndUnProjectResult(
      Point(x: 13124194.893046256, y: 6910390.434448714),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2630': ProjectAndUnProjectResult(
      Point(x: 16044508.264074454, y: 5065479.08345128),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2631': ProjectAndUnProjectResult(
      Point(x: 19326484.40630764, y: 2808610.083395421),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2632': ProjectAndUnProjectResult(
      Point(x: 23004723.931050893, y: 80569.73794255334),
      Point(x: double.nan, y: double.nan)),
  'EPSG:3043': ProjectAndUnProjectResult(
      Point(x: 1633185.6064171265, y: 5301866.087016829),
      Point(x: 17.88804238865636, y: 46.892264000337974)),
  'EPSG:2633': ProjectAndUnProjectResult(
      Point(x: 27116488.25666316, y: -3184341.2378764953),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2634': ProjectAndUnProjectResult(
      Point(x: 31701854.563363586, y: -7058853.460105787),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2635': ProjectAndUnProjectResult(
      Point(x: 36803876.84613541, y: -11623308.20429408),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:2636': ProjectAndUnProjectResult(
      Point(x: 42468753.187599495, y: -16966271.673058722),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:2637': ProjectAndUnProjectResult(
      Point(x: 48745999.37273005, y: -23185185.58270928),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:2638': ProjectAndUnProjectResult(
      Point(x: 55688628.96728491, y: -30387055.475630186),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:2639': ProjectAndUnProjectResult(
      Point(x: 63353339.98182248, y: -38689178.19189904),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:2640': ProjectAndUnProjectResult(
      Point(x: 71800708.24317816, y: -48219909.96039137),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:2641': ProjectAndUnProjectResult(
      Point(x: 7262977.402920999, y: 5200101.235815557),
      Point(x: 17.888058570270495, y: 46.89226406903771)),
  'EPSG:3044': ProjectAndUnProjectResult(
      Point(x: 1176891.287219305, y: 5231671.834018296),
      Point(x: 17.88805843543735, y: 46.892264027445336)),
  'EPSG:2642': ProjectAndUnProjectResult(
      Point(x: 8034399.896494305, y: 5213561.025774186),
      Point(x: 17.8880585731391, y: 46.892264064543355)),
  'EPSG:2643': ProjectAndUnProjectResult(
      Point(x: 8805913.362838658, y: 5235854.283937308),
      Point(x: 17.888058728388486, y: 46.89226402384307)),
  'EPSG:2644': ProjectAndUnProjectResult(
      Point(x: 9577576.565879751, y: 5267091.123078233),
      Point(x: 17.88806089393773, y: 46.89226389591836)),
  'EPSG:2645': ProjectAndUnProjectResult(
      Point(x: 10349465.29460109, y: 5307424.743197788),
      Point(x: 17.888077164108264, y: 46.89226406201648)),
  'EPSG:2646': ProjectAndUnProjectResult(
      Point(x: 11121678.549381936, y: 5357050.999945765),
      Point(x: 17.888161901223476, y: 46.89226782456999)),
  'EPSG:2647': ProjectAndUnProjectResult(
      Point(x: 11894345.220306594, y: 5416207.687562138),
      Point(x: 17.888508858291356, y: 46.89229074846724)),
  'EPSG:2648': ProjectAndUnProjectResult(
      Point(x: 12667631.379318276, y: 5485173.414864039),
      Point(x: 17.88971032479296, y: 46.892389633066195)),
  'EPSG:2649': ProjectAndUnProjectResult(
      Point(x: 13441748.308090681, y: 5564265.926028976),
      Point(x: 17.89339665661175, y: 46.89274275070445)),
  'EPSG:2650': ProjectAndUnProjectResult(
      Point(x: 14216961.383490501, y: 5653839.691149153),
      Point(x: 17.903741693390224, y: 46.893856907596486)),
  'EPSG:2736': ProjectAndUnProjectResult(
      Point(x: -650095.4663031783, y: 15305278.669002412),
      Point(x: 17.88807711308079, y: 46.89226391592079)),
  'EPSG:2651': ProjectAndUnProjectResult(
      Point(x: 14993599.942504037, y: 5754282.564756225),
      Point(x: 17.930912766487186, y: 46.89707896829051)),
  'EPSG:2652': ProjectAndUnProjectResult(
      Point(x: 15772068.24850111, y: 5866011.283740241),
      Point(x: 17.998881158089443, y: 46.90582854474073)),
  'EPSG:2653': ProjectAndUnProjectResult(
      Point(x: 16552857.680709451, y: 5989465.549310994),
      Point(x: 18.163085249950498, y: 46.92853675095355)),
  'EPSG:2654': ProjectAndUnProjectResult(
      Point(x: 17336560.26877277, y: 6125100.410874365),
      Point(x: 18.550701738008826, y: 46.98565566739176)),
  'EPSG:2655': ProjectAndUnProjectResult(
      Point(x: 18123883.694265664, y: 6273376.642920781),
      Point(x: 19.45397722564179, y: 47.12654815721367)),
  'EPSG:2656': ProjectAndUnProjectResult(
      Point(x: 18915667.88103859, y: 6434748.779247259),
      Point(x: 21.551848481426067, y: 47.47097185323702)),
  'EPSG:2657': ProjectAndUnProjectResult(
      Point(x: 19712903.29626605, y: 6609650.442058996),
      Point(x: 26.453546464670094, y: 48.31387174213733)),
  'EPSG:2658': ProjectAndUnProjectResult(
      Point(x: 20516751.084071193, y: 6798476.576720871),
      Point(x: 38.08831473467017, y: 50.40023120211537)),
  'EPSG:2659': ProjectAndUnProjectResult(
      Point(x: 21328565.153600037, y: 7001562.176153691),
      Point(x: 66.44656806390056, y: 55.6815710862579)),
  'EPSG:3045': ProjectAndUnProjectResult(
      Point(x: 720001.2298400886, y: 5197241.60997254),
      Point(x: 17.888058560302017, y: 46.89226406695651)),
  'EPSG:2660': ProjectAndUnProjectResult(
      Point(x: 22149916.343418464, y: 7219157.052094408),
      Point(x: 138.3170738035686, y: 69.52842660642159)),
  'EPSG:2661': ProjectAndUnProjectResult(
      Point(x: 22982618.784105197, y: 7451396.183664046),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2662': ProjectAndUnProjectResult(
      Point(x: 23828758.58091396, y: 7698265.146911397),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2663': ProjectAndUnProjectResult(
      Point(x: 24690724.938377943, y: 7959560.102225089),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2664': ProjectAndUnProjectResult(
      Point(x: 25571243.848729856, y: 8234841.789731057),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2665': ProjectAndUnProjectResult(
      Point(x: 26473414.46601068, y: 8523382.956016758),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2666': ProjectAndUnProjectResult(
      Point(x: 27400748.28774033, y: 8824108.608748099),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2667': ProjectAndUnProjectResult(
      Point(x: 28357211.266023427, y: 9135528.468969345),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2668': ProjectAndUnProjectResult(
      Point(x: 29347268.969963353, y: 9455660.96410075),
      Point(x: double.nan, y: double.nan)),
  'EPSG:3046': ProjectAndUnProjectResult(
      Point(x: 262945.2879608735, y: 5197894.102611037),
      Point(x: 17.888058560253082, y: 46.89226406692702)),
  'EPSG:2669': ProjectAndUnProjectResult(
      Point(x: 30375934.92125776, y: 9781948.077873092),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2670': ProjectAndUnProjectResult(
      Point(x: 31448822.224848773, y: 10111160.346662756),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2671': ProjectAndUnProjectResult(
      Point(x: 32572198.616501, y: 10439291.264915409),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2672': ProjectAndUnProjectResult(
      Point(x: 33753045.04918061, y: 10761440.335570734),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2673': ProjectAndUnProjectResult(
      Point(x: 34999117.9401086, y: 11071683.97462519),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2674': ProjectAndUnProjectResult(
      Point(x: 36319015.20036148, y: 11362933.452194152),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2675': ProjectAndUnProjectResult(
      Point(x: 37722246.16889259, y: 11626779.025659218),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2676': ProjectAndUnProjectResult(
      Point(x: 39219305.57284712, y: 11853319.39371094),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2677': ProjectAndUnProjectResult(
      Point(x: 40821751.63604414, y: 12030975.573321657),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:3047': ProjectAndUnProjectResult(
      Point(x: -193931.3475621267, y: 5233642.279931091),
      Point(x: 17.88805871864152, y: 46.89226402167793)),
  'EPSG:2678': ProjectAndUnProjectResult(
      Point(x: 42542288.4574988, y: 12146288.274907539),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2679': ProjectAndUnProjectResult(
      Point(x: 44394852.78185785, y: 12183697.82416335),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2680': ProjectAndUnProjectResult(
      Point(x: 46394705.28362169, y: 12125305.652278015),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2681': ProjectAndUnProjectResult(
      Point(x: 48558526.48702615, y: 11950616.349463312),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2682': ProjectAndUnProjectResult(
      Point(x: 50904517.44345708, y: 11636259.249952596),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2683': ProjectAndUnProjectResult(
      Point(x: 53452505.28827122, y: 11155688.489850847),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2684': ProjectAndUnProjectResult(
      Point(x: 56224053.798896156, y: 10478860.452441784),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2685': ProjectAndUnProjectResult(
      Point(x: 59242579.0760828, y: 9571887.488782195),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2686': ProjectAndUnProjectResult(
      Point(x: 62533470.4701836, y: 8396666.774638083),
      Point(x: double.nan, y: double.nan)),
  'EPSG:3048': ProjectAndUnProjectResult(
      Point(x: -650192.2096700789, y: 5305193.291220044),
      Point(x: 17.888077173234436, y: 46.89226405998426)),
  'EPSG:2687': ProjectAndUnProjectResult(
      Point(x: 66124216.87432951, y: 6910483.138041684),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2688': ProjectAndUnProjectResult(
      Point(x: 70044538.50637878, y: 5065584.664972954),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2689': ProjectAndUnProjectResult(
      Point(x: 74326524.30151153, y: 2808729.8638930563),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2690': ProjectAndUnProjectResult(
      Point(x: 79004775.0373421, y: 80705.1430827397),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2691': ProjectAndUnProjectResult(
      Point(x: 84116552.31342323, y: -3184188.6720379107),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2692': ProjectAndUnProjectResult(
      Point(x: 89701933.50701517, y: -7058682.08120732),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2693': ProjectAndUnProjectResult(
      Point(x: 95803972.82699251, y: -11623116.237611713),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:2694': ProjectAndUnProjectResult(
      Point(x: 101968868.58776212, y: -16966057.215315938),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:2695': ProjectAndUnProjectResult(
      Point(x: 109746136.8250658, y: -23184946.595761795),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:3049': ProjectAndUnProjectResult(
      Point(x: -1105125.5282006196, y: 5413941.856367431),
      Point(x: 17.888509189327227, y: 46.89229076369037)),
  'EPSG:2696': ProjectAndUnProjectResult(
      Point(x: 117688791.37553996, y: -30386789.780033987),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:2697': ProjectAndUnProjectResult(
      Point(x: 126353530.54190639, y: -38688883.46037097),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:2698': ProjectAndUnProjectResult(
      Point(x: 135800930.4656664, y: -48219583.711172454),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:2699': ProjectAndUnProjectResult(
      Point(x: 262977.40292099846, y: 5200101.235815557),
      Point(x: 17.88805857027049, y: 46.89226406903771)),
  'EPSG:2700': ProjectAndUnProjectResult(
      Point(x: 34399.89649430476, y: 5213561.025774186),
      Point(x: 17.8880585731391, y: 46.892264064543355)),
  'EPSG:2701': ProjectAndUnProjectResult(
      Point(x: -194086.63716134313, y: 5235854.283937308),
      Point(x: 17.888058728388476, y: 46.89226402384307)),
  'EPSG:2702': ProjectAndUnProjectResult(
      Point(x: -422423.43412024935, y: 5267091.123078233),
      Point(x: 17.888060893937723, y: 46.89226389591836)),
  'EPSG:2703': ProjectAndUnProjectResult(
      Point(x: -650534.705398909, y: 5307424.743197788),
      Point(x: 17.888077164108275, y: 46.89226406201648)),
  'EPSG:2704': ProjectAndUnProjectResult(
      Point(x: -878321.4506180638, y: 5357050.999945765),
      Point(x: 17.888161901223476, y: 46.89226782456999)),
  'EPSG:2705': ProjectAndUnProjectResult(
      Point(x: -1105654.7796934056, y: 5416207.687562138),
      Point(x: 17.88850885829136, y: 46.89229074846724)),
  'EPSG:2706': ProjectAndUnProjectResult(
      Point(x: -1332368.6206817243, y: 5485173.414864039),
      Point(x: 17.889710324792958, y: 46.892389633066195)),
  'EPSG:2707': ProjectAndUnProjectResult(
      Point(x: -1558251.691909319, y: 5564265.926028976),
      Point(x: 17.89339665661175, y: 46.892742750704436)),
  'EPSG:2708': ProjectAndUnProjectResult(
      Point(x: -1783038.6165094986, y: 5653839.691149153),
      Point(x: 17.90374169339023, y: 46.893856907596486)),
  'EPSG:2709': ProjectAndUnProjectResult(
      Point(x: -2006400.0574959628, y: 5754282.564756225),
      Point(x: 17.930912766487186, y: 46.89707896829051)),
  'EPSG:2710': ProjectAndUnProjectResult(
      Point(x: -2227931.7514988896, y: 5866011.283740241),
      Point(x: 17.99888115808944, y: 46.90582854474073)),
  'EPSG:2711': ProjectAndUnProjectResult(
      Point(x: -2447142.3192905476, y: 5989465.549310994),
      Point(x: 18.163085249950498, y: 46.92853675095355)),
  'EPSG:2712': ProjectAndUnProjectResult(
      Point(x: -2663439.73122723, y: 6125100.410874365),
      Point(x: 18.55070173800883, y: 46.98565566739177)),
  'EPSG:2713': ProjectAndUnProjectResult(
      Point(x: -2876116.3057343345, y: 6273376.642920781),
      Point(x: 19.453977225641804, y: 47.12654815721369)),
  'EPSG:2714': ProjectAndUnProjectResult(
      Point(x: -3084332.118961408, y: 6434748.779247259),
      Point(x: 21.551848481426063, y: 47.47097185323701)),
  'EPSG:2715': ProjectAndUnProjectResult(
      Point(x: -3287096.703733949, y: 6609650.442058996),
      Point(x: 26.45354646467008, y: 48.31387174213733)),
  'EPSG:2716': ProjectAndUnProjectResult(
      Point(x: -3483248.915928807, y: 6798476.576720871),
      Point(x: 38.08831473467017, y: 50.40023120211537)),
  'EPSG:2717': ProjectAndUnProjectResult(
      Point(x: -3671434.8463999643, y: 7001562.176153691),
      Point(x: 66.44656806390067, y: 55.68157108625792)),
  'EPSG:2718': ProjectAndUnProjectResult(
      Point(x: -3850083.656581538, y: 7219157.052094408),
      Point(x: 138.3170738035691, y: 69.52842660642166)),
  'EPSG:2719': ProjectAndUnProjectResult(
      Point(x: -4017381.2158948015, y: 7451396.183664046),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2720': ProjectAndUnProjectResult(
      Point(x: -4171241.419086039, y: 7698265.146911397),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2721': ProjectAndUnProjectResult(
      Point(x: -4309275.061622056, y: 7959560.102225089),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2722': ProjectAndUnProjectResult(
      Point(x: -4428756.151270143, y: 8234841.789731057),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2723': ProjectAndUnProjectResult(
      Point(x: -4526585.5339893205, y: 8523382.956016758),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2724': ProjectAndUnProjectResult(
      Point(x: -4599251.71225967, y: 8824108.608748099),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2725': ProjectAndUnProjectResult(
      Point(x: -4642788.733976571, y: 9135528.468969345),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2726': ProjectAndUnProjectResult(
      Point(x: -4652731.030036646, y: 9455660.96410075),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2727': ProjectAndUnProjectResult(
      Point(x: -4624065.078742239, y: 9781948.077873092),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2728': ProjectAndUnProjectResult(
      Point(x: -4551177.775151228, y: 10111160.346662756),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2729': ProjectAndUnProjectResult(
      Point(x: -4427801.383499, y: 10439291.264915409),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2730': ProjectAndUnProjectResult(
      Point(x: -4246954.950819392, y: 10761440.335570734),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2731': ProjectAndUnProjectResult(
      Point(x: -4000882.0598914055, y: 11071683.97462519),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2732': ProjectAndUnProjectResult(
      Point(x: -3680984.799638518, y: 11362933.452194152),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2733': ProjectAndUnProjectResult(
      Point(x: -3277753.8311074045, y: 11626779.025659218),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2734': ProjectAndUnProjectResult(
      Point(x: -2780694.4271528777, y: 11853319.39371094),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2735': ProjectAndUnProjectResult(
      Point(x: -2178248.363955864, y: 12030975.573321657),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2737': ProjectAndUnProjectResult(
      Point(x: -1105017.0721617588, y: 15414023.693316529),
      Point(x: 17.888508936697153, y: 46.892290537214905)),
  'EPSG:2738': ProjectAndUnProjectResult(
      Point(x: -1457711.5425012028, y: 12146288.274907539),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2739': ProjectAndUnProjectResult(
      Point(x: -605147.2181421507, y: 12183697.82416335),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2740': ProjectAndUnProjectResult(
      Point(x: 394705.28362169425, y: 12125305.652278015),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2741': ProjectAndUnProjectResult(
      Point(x: 1558526.4870261499, y: 11950616.349463312),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2742': ProjectAndUnProjectResult(
      Point(x: 2904517.443457079, y: 11636259.249952596),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2743': ProjectAndUnProjectResult(
      Point(x: 4452505.288271218, y: 11155688.489850847),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2744': ProjectAndUnProjectResult(
      Point(x: 6224053.798896154, y: 10478860.452441784),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:2745': ProjectAndUnProjectResult(
      Point(x: 8242579.076082804, y: 9571887.488782195),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2746': ProjectAndUnProjectResult(
      Point(x: 10533470.470183605, y: 8396666.774638083),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2747': ProjectAndUnProjectResult(
      Point(x: 13124216.874329505, y: 6910483.138041684),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2748': ProjectAndUnProjectResult(
      Point(x: 16044538.506378785, y: 5065584.664972954),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2749': ProjectAndUnProjectResult(
      Point(x: 19326524.301511526, y: 2808729.8638930563),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2750': ProjectAndUnProjectResult(
      Point(x: 23004775.037342105, y: 80705.1430827397),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2751': ProjectAndUnProjectResult(
      Point(x: 27116552.31342323, y: -3184188.6720379107),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2752': ProjectAndUnProjectResult(
      Point(x: 31701933.507015165, y: -7058682.08120732),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2753': ProjectAndUnProjectResult(
      Point(x: 36803972.82699252, y: -11623116.237611713),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:2754': ProjectAndUnProjectResult(
      Point(x: 42468868.58776212, y: -16966057.215315938),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:2755': ProjectAndUnProjectResult(
      Point(x: 48746136.82506581, y: -23184946.595761795),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:2756': ProjectAndUnProjectResult(
      Point(x: 55688791.37553995, y: -30386789.780033987),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:2757': ProjectAndUnProjectResult(
      Point(x: 63353530.541906394, y: -38688883.46037097),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:2758': ProjectAndUnProjectResult(
      Point(x: 71800930.46566641, y: -48219583.711172454),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:2759': ProjectAndUnProjectResult(
      Point(x: 4175252.6559100477, y: 8132636.419234506), Point(x: 0, y: 90)),
  'EPSG:2760': ProjectAndUnProjectResult(
      Point(x: 4335563.615183162, y: 8328698.3072116645), Point(x: 0, y: 90)),
  'EPSG:2761': ProjectAndUnProjectResult(
      Point(x: -3169861.026850693, y: 7913822.186592112), Point(x: 0, y: 90)),
  'EPSG:2762': ProjectAndUnProjectResult(
      Point(x: -4128150.708307095, y: 7585988.433132556), Point(x: 0, y: 90)),
  'EPSG:2763': ProjectAndUnProjectResult(
      Point(x: -5215796.690656631, y: 7168396.858414973), Point(x: 0, y: 90)),
  'EPSG:2764': ProjectAndUnProjectResult(
      Point(x: 7280845.10476574, y: 5698018.880729793),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:2765': ProjectAndUnProjectResult(
      Point(x: 7441828.743390062, y: 6181711.961229637),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:2766': ProjectAndUnProjectResult(
      Point(x: 8713369.04628296, y: 8228903.974584526),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2767': ProjectAndUnProjectResult(
      Point(x: 8988852.870882323, y: 8299543.835321399),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:2768': ProjectAndUnProjectResult(
      Point(x: 9196533.03998033, y: 8221416.367224062),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2769': ProjectAndUnProjectResult(
      Point(x: 9364631.99275643, y: 8154335.033546976),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:2770': ProjectAndUnProjectResult(
      Point(x: 9657012.346788008, y: 8138321.005032831),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2771': ProjectAndUnProjectResult(
      Point(x: 9857792.552179694, y: 8039982.800465539),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:2772': ProjectAndUnProjectResult(
      Point(x: 7609906.701740923, y: 6737108.930826646),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2773': ProjectAndUnProjectResult(
      Point(x: 7746779.736843174, y: 6828729.263310314),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:9012': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:2774': ProjectAndUnProjectResult(
      Point(x: 7902404.853652807, y: 6873456.4247696595),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2775': ProjectAndUnProjectResult(
      Point(x: 6039095.133709748, y: 4143749.064976011),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:2776': ProjectAndUnProjectResult(
      Point(x: 5117848.770438616, y: 6252732.387920412), Point(x: 0, y: 90)),
  'EPSG:2777': ProjectAndUnProjectResult(
      Point(x: 4721237.687280814, y: 8356420.754737286), Point(x: 0, y: 90)),
  'EPSG:2778': ProjectAndUnProjectResult(
      Point(x: 4625113.957471083, y: 8456488.815026179), Point(x: 0, y: 90)),
  'EPSG:2779': ProjectAndUnProjectResult(
      Point(x: 7714848.02247523, y: 5442253.479619011),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:2780': ProjectAndUnProjectResult(
      Point(x: 4608098.742447868, y: 7844758.075159398), Point(x: 0, y: 90)),
  'EPSG:2781': ProjectAndUnProjectResult(
      Point(x: 4887189.5243078265, y: 8036713.270922709), Point(x: 0, y: 90)),
  'EPSG:2782': ProjectAndUnProjectResult(
      Point(x: -68690821.23140611, y: -47885351.84872058), Point(x: 0, y: -90)),
  'EPSG:2783': ProjectAndUnProjectResult(
      Point(x: -72121220.72359695, y: -51990013.836311065),
      Point(x: 0, y: -90)),
  'EPSG:2784': ProjectAndUnProjectResult(
      Point(x: -76202390.86573209, y: -56842739.61567939), Point(x: 0, y: -90)),
  'EPSG:2785': ProjectAndUnProjectResult(
      Point(x: -81001618.96536075, y: -62615395.648396604),
      Point(x: 0, y: -90)),
  'EPSG:2786': ProjectAndUnProjectResult(
      Point(x: -83208947.34861997, y: -65252448.177499056),
      Point(x: 0, y: -90)),
  'EPSG:2787': ProjectAndUnProjectResult(
      Point(x: -4284867.971020522, y: 6350434.242753448), Point(x: 0, y: 90)),
  'EPSG:2788': ProjectAndUnProjectResult(
      Point(x: -5084440.623114015, y: 5921630.496325042), Point(x: 0, y: 90)),
  'EPSG:2789': ProjectAndUnProjectResult(
      Point(x: -5919234.386603765, y: 5433186.325411458), Point(x: 0, y: 90)),
  'EPSG:2790': ProjectAndUnProjectResult(
      Point(x: 3905071.6147695784, y: 7655783.660641345), Point(x: 0, y: 90)),
  'EPSG:2791': ProjectAndUnProjectResult(
      Point(x: 3990597.385999085, y: 7789443.487367855), Point(x: 0, y: 90)),
  'EPSG:2792': ProjectAndUnProjectResult(
      Point(x: 4097701.446227201, y: 7591591.6682478), Point(x: 0, y: 90)),
  'EPSG:2793': ProjectAndUnProjectResult(
      Point(x: 4698254.479714725, y: 7712933.359383934), Point(x: 0, y: 90)),
  'EPSG:2794': ProjectAndUnProjectResult(
      Point(x: 7754185.385967116, y: 6441441.897699313),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:2795': ProjectAndUnProjectResult(
      Point(x: 6883654.037123509, y: 5522527.676852138),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:2796': ProjectAndUnProjectResult(
      Point(x: 7071987.862697571, y: 5919601.754797991),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:2797': ProjectAndUnProjectResult(
      Point(x: 7225695.016863069, y: 6455856.986343259),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:2798': ProjectAndUnProjectResult(
      Point(x: 6854798.276271999, y: 4982007.395728776),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2799': ProjectAndUnProjectResult(
      Point(x: 7000500.0764196385, y: 5649813.9503045585),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:2800': ProjectAndUnProjectResult(
      Point(x: 8293004.335917232, y: 5912444.595764324),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:2801': ProjectAndUnProjectResult(
      Point(x: 8460640.04761491, y: 5922044.6080015665),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2802': ProjectAndUnProjectResult(
      Point(x: 5434242.727510438, y: 4865567.286727372),
      Point(x: -3577911303.5949883, y: 784422263.488511)),
  'EPSG:2803': ProjectAndUnProjectResult(
      Point(x: 6005972.529556511, y: 5140915.469168544),
      Point(x: -2514978608650.738, y: 548342325600.6209)),
  'EPSG:2804': ProjectAndUnProjectResult(
      Point(x: 6458859.816901178, y: 4494509.018460154),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:2805': ProjectAndUnProjectResult(
      Point(x: 5851118.614199274, y: 4670879.245324666),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:2806': ProjectAndUnProjectResult(
      Point(x: 6154332.406766824, y: 3817884.2153315847),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:2807': ProjectAndUnProjectResult(
      Point(x: 13856577.937746815, y: 4794610.454685856),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3050': ProjectAndUnProjectResult(
      Point(x: -1557536.5212347228, y: 5561950.163916144),
      Point(x: 17.89339993357438, y: 46.89274299727956)),
  'EPSG:2808': ProjectAndUnProjectResult(
      Point(x: 11889319.027601004, y: 4694603.857861964),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:2809': ProjectAndUnProjectResult(
      Point(x: 10027794.9275133, y: 4787933.322479354),
      Point(x: 17.8880585602815, y: 46.892264067008746)),
  'EPSG:2810': ProjectAndUnProjectResult(
      Point(x: 6637522.089340442, y: 5241976.733282339),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:2811': ProjectAndUnProjectResult(
      Point(x: 6763552.011142525, y: 5414428.169782657),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:2812': ProjectAndUnProjectResult(
      Point(x: 6907731.6671998175, y: 5516216.609642071),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:2813': ProjectAndUnProjectResult(
      Point(x: 3822984.905080838, y: 8488545.1484227), Point(x: 0, y: 90)),
  'EPSG:2814': ProjectAndUnProjectResult(
      Point(x: 3960143.9403490187, y: 8595620.856387978), Point(x: 0, y: 90)),
  'EPSG:2815': ProjectAndUnProjectResult(
      Point(x: 3479281.287680031, y: 7904330.11893151), Point(x: 0, y: 90)),
  'EPSG:2960': ProjectAndUnProjectResult(
      Point(x: 5625552.597278097, y: 9753575.672750814),
      Point(x: -14563147143.452982, y: 3188443837.820243)),
  'EPSG:2816': ProjectAndUnProjectResult(
      Point(x: 3333355.4118026467, y: 8025679.559234873), Point(x: 0, y: 90)),
  'EPSG:2817': ProjectAndUnProjectResult(
      Point(x: 3236399.2997552953, y: 8083966.915915788), Point(x: 0, y: 90)),
  'EPSG:2818': ProjectAndUnProjectResult(
      Point(x: 6556297.784221025, y: 6590553.712986213),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2819': ProjectAndUnProjectResult(
      Point(x: 6975000.373432801, y: 6039872.843451777),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:2820': ProjectAndUnProjectResult(
      Point(x: -6407205.481935473, y: 14250720.322452161), Point(x: 0, y: 90)),
  'EPSG:2821': ProjectAndUnProjectResult(
      Point(x: -6848369.235542074, y: 11911589.980849914),
      Point(x: 189531435637.07315, y: 59487357072.499916)),
  'EPSG:2822': ProjectAndUnProjectResult(
      Point(x: -7945837.346430153, y: 9227187.99242025),
      Point(x: 53494776.36427391, y: 20053499.392547227)),
  'EPSG:2823': ProjectAndUnProjectResult(
      Point(x: 5368091.402649273, y: 5342638.370730873), Point(x: 0, y: 90)),
  'EPSG:2824': ProjectAndUnProjectResult(
      Point(x: 5111955.253111458, y: 6059884.249141174), Point(x: 0, y: 90)),
  'EPSG:2825': ProjectAndUnProjectResult(
      Point(x: -530531.6564737859, y: 8584058.195630815), Point(x: 0, y: 90)),
  'EPSG:2826': ProjectAndUnProjectResult(
      Point(x: -998074.9727628597, y: 8428106.011472125), Point(x: 0, y: 90)),
  'EPSG:2827': ProjectAndUnProjectResult(
      Point(x: -1388949.665557478, y: 8254150.647986836), Point(x: 0, y: 90)),
  'EPSG:2828': ProjectAndUnProjectResult(
      Point(x: 5111955.253111458, y: 6059884.249141174), Point(x: 0, y: 90)),
  'EPSG:2829': ProjectAndUnProjectResult(
      Point(x: 5102989.244976103, y: 6156462.138120647), Point(x: 0, y: 90)),
  'EPSG:2830': ProjectAndUnProjectResult(
      Point(x: 5070627.948794095, y: 6369472.582025805), Point(x: 0, y: 90)),
  'EPSG:2831': ProjectAndUnProjectResult(
      Point(x: 6120506.5914582675, y: 4115911.994870667),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2832': ProjectAndUnProjectResult(
      Point(x: 6465460.630965634, y: 5661785.323388806),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2833': ProjectAndUnProjectResult(
      Point(x: 6573964.729929726, y: 5741275.293893124),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2834': ProjectAndUnProjectResult(
      Point(x: 6701563.894453452, y: 4762473.447759279),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:2835': ProjectAndUnProjectResult(
      Point(x: 6823927.076346041, y: 4856567.2808180135),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:2836': ProjectAndUnProjectResult(
      Point(x: 7606719.341866343, y: 6088830.052103923),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:2837': ProjectAndUnProjectResult(
      Point(x: 7788873.682746351, y: 6165418.092119623),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:2838': ProjectAndUnProjectResult(
      Point(x: 8597033.820587108, y: 7390016.602283895),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2839': ProjectAndUnProjectResult(
      Point(x: 7874076.89548586, y: 7497850.224338042),
      Point(x: 17.88805856028154, y: 46.892264067008725)),
  'EPSG:2840': ProjectAndUnProjectResult(
      Point(x: 5173030.8098551845, y: 5481823.207905864), Point(x: 0, y: 90)),
  'EPSG:2841': ProjectAndUnProjectResult(
      Point(x: 6731916.633515107, y: 5806582.369900572),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:2842': ProjectAndUnProjectResult(
      Point(x: 6870716.757738419, y: 5915239.061073107),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:2843': ProjectAndUnProjectResult(
      Point(x: 7240825.507643389, y: 5300270.815013457),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:2844': ProjectAndUnProjectResult(
      Point(x: 7393138.261094371, y: 7401668.656500031),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2845': ProjectAndUnProjectResult(
      Point(x: 7989143.282984504, y: 8276494.464586326),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2846': ProjectAndUnProjectResult(
      Point(x: 8418734.087582087, y: 9472776.726556078),
      Point(x: 17.88805856028155, y: 46.892264067008746)),
  'EPSG:2847': ProjectAndUnProjectResult(
      Point(x: 8486728.051005203, y: 10453504.590111742),
      Point(x: 17.88805856028154, y: 46.89226406700874)),
  'EPSG:2848': ProjectAndUnProjectResult(
      Point(x: 8484246.042842139, y: 11469435.827622361),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:2849': ProjectAndUnProjectResult(
      Point(x: 7132858.074758168, y: 7841015.069017461),
      Point(x: 17.888058560281525, y: 46.892264067008746)),
  'EPSG:2850': ProjectAndUnProjectResult(
      Point(x: 7316582.822330039, y: 8971163.047072299),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:2851': ProjectAndUnProjectResult(
      Point(x: 7595059.15054545, y: 10017430.541012172),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:2852': ProjectAndUnProjectResult(
      Point(x: 5541768.404689928, y: 5434133.661562179), Point(x: 0, y: 90)),
  'EPSG:2853': ProjectAndUnProjectResult(
      Point(x: 9634482.513941199, y: 6581020.355130133),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:2854': ProjectAndUnProjectResult(
      Point(x: 9723405.910334777, y: 5663039.725072842),
      Point(x: 17.888058560281486, y: 46.892264067008746)),
  'EPSG:2855': ProjectAndUnProjectResult(
      Point(x: 6208880.764422776, y: 7201291.121268816),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:2856': ProjectAndUnProjectResult(
      Point(x: 6409557.023981855, y: 7281838.145229915),
      Point(x: 17.88805856028154, y: 46.892264067008746)),
  'EPSG:2857': ProjectAndUnProjectResult(
      Point(x: 6701578.612677592, y: 4608732.256874052),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2858': ProjectAndUnProjectResult(
      Point(x: 6860107.275988375, y: 4799756.489364472),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2859': ProjectAndUnProjectResult(
      Point(x: 6517033.000426102, y: 4968571.836722961),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:2860': ProjectAndUnProjectResult(
      Point(x: 6611250.719513921, y: 5046926.8438626565),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:2861': ProjectAndUnProjectResult(
      Point(x: 6723783.25810189, y: 5169377.719135766),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:2862': ProjectAndUnProjectResult(
      Point(x: -835360.288822798, y: 7469523.565254046), Point(x: 0, y: 90)),
  'EPSG:2863': ProjectAndUnProjectResult(
      Point(x: -1585501.348464507, y: 7359986.274514455), Point(x: 0, y: 90)),
  'EPSG:2864': ProjectAndUnProjectResult(
      Point(x: -2061507.894929119, y: 7079113.201731387), Point(x: 0, y: 90)),
  'EPSG:2865': ProjectAndUnProjectResult(
      Point(x: -2539578.0552160507, y: 6974103.5782705145), Point(x: 0, y: 90)),
  'EPSG:2939': ProjectAndUnProjectResult(
      Point(x: -189086.55047460692, y: 5731335.689237101),
      Point(x: 17.92777665801155, y: 46.89669453733006)),
  'EPSG:2866': ProjectAndUnProjectResult(
      Point(x: 7328037.617013937, y: 5241769.00316173),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:2867': ProjectAndUnProjectResult(
      Point(x: -10399806.518539019, y: 25963983.55181139), Point(x: 0, y: 90)),
  'EPSG:2868': ProjectAndUnProjectResult(
      Point(x: -13543801.5364406, y: 24888413.49452938), Point(x: 0, y: 90)),
  'EPSG:2869': ProjectAndUnProjectResult(
      Point(x: -17112193.866983697, y: 23518362.396374583), Point(x: 0, y: 90)),
  'EPSG:2870': ProjectAndUnProjectResult(
      Point(x: 28587111.613013346, y: 26997662.4569494),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2871': ProjectAndUnProjectResult(
      Point(x: 29490928.127553087, y: 27229420.066716958),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:2872': ProjectAndUnProjectResult(
      Point(x: 30172292.14900214, y: 26973096.865134276),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:2873': ProjectAndUnProjectResult(
      Point(x: 30723796.79656839, y: 26753014.189562038),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:2874': ProjectAndUnProjectResult(
      Point(x: 31683048.00808699, y: 26700474.83101188),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2875': ProjectAndUnProjectResult(
      Point(x: 32341774.398609553, y: 26377843.57152736),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:2876': ProjectAndUnProjectResult(
      Point(x: 24966835.570312265, y: 22103331.550557755),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2877': ProjectAndUnProjectResult(
      Point(x: 25415893.18631023, y: 22403922.591381256),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2878': ProjectAndUnProjectResult(
      Point(x: 25926473.257043168, y: 22550664.95360246),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2879': ProjectAndUnProjectResult(
      Point(x: 19813264.617850065, y: 13594950.05734413),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:2880': ProjectAndUnProjectResult(
      Point(x: 16790808.84134736, y: 20514172.84270222), Point(x: 0, y: 90)),
  'EPSG:2881': ProjectAndUnProjectResult(
      Point(x: 15489593.979353804, y: 27416023.75950058), Point(x: 0, y: 90)),
  'EPSG:2882': ProjectAndUnProjectResult(
      Point(x: 15174228.04246971, y: 27744330.38729839), Point(x: 0, y: 90)),
  'EPSG:2883': ProjectAndUnProjectResult(
      Point(x: 25311130.553737484, y: 17855126.624383375),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:2884': ProjectAndUnProjectResult(
      Point(x: 15118403.957847713, y: 25737343.784918793), Point(x: 0, y: 90)),
  'EPSG:2885': ProjectAndUnProjectResult(
      Point(x: 16034054.29733326, y: 26367116.78968559), Point(x: 0, y: 90)),
  'EPSG:2886': ProjectAndUnProjectResult(
      Point(x: -14057937.667923164, y: 20834716.344766937), Point(x: 0, y: 90)),
  'EPSG:2887': ProjectAndUnProjectResult(
      Point(x: -16681202.277333234, y: 19427882.72002641), Point(x: 0, y: 90)),
  'EPSG:2888': ProjectAndUnProjectResult(
      Point(x: -19420021.483049188, y: 17825378.802620757), Point(x: 0, y: 90)),
  'EPSG:2889': ProjectAndUnProjectResult(
      Point(x: 13443875.494497076, y: 24904663.66490966), Point(x: 0, y: 90)),
  'EPSG:3573': ProjectAndUnProjectResult(
      Point(x: 4149159.5345805907, y: 2195759.8266752437),
      Point(x: 17.888058560281525, y: 46.892264069112215)),
  'EPSG:2890': ProjectAndUnProjectResult(
      Point(x: 15414189.905530728, y: 25302765.529912125), Point(x: 0, y: 90)),
  'EPSG:2891': ProjectAndUnProjectResult(
      Point(x: 22489450.678402383, y: 16345135.930820161),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2892': ProjectAndUnProjectResult(
      Point(x: 22967474.00105343, y: 18536097.935624205),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:2893': ProjectAndUnProjectResult(
      Point(x: 21190442.582283285, y: 14745735.004731355),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:2894': ProjectAndUnProjectResult(
      Point(x: 19196544.98708545, y: 15324376.324036008),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:2895': ProjectAndUnProjectResult(
      Point(x: 20191338.90486749, y: 12525841.796467042),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:2896': ProjectAndUnProjectResult(
      Point(x: 45461213.70641344, y: 15730349.260780366),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2897': ProjectAndUnProjectResult(
      Point(x: 39006952.19021326, y: 15402243.62815605),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:2898': ProjectAndUnProjectResult(
      Point(x: 32899589.65714337, y: 15708442.659052998),
      Point(x: 17.8880585602815, y: 46.892264067008746)),
  'EPSG:2899': ProjectAndUnProjectResult(
      Point(x: 12542576.309419384, y: 27849501.87445014), Point(x: 0, y: 90)),
  'EPSG:2900': ProjectAndUnProjectResult(
      Point(x: 12992572.243961738, y: 28200799.426332895), Point(x: 0, y: 90)),
  'EPSG:2901': ProjectAndUnProjectResult(
      Point(x: 21510163.334050607, y: 21622551.551792037),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2902': ProjectAndUnProjectResult(
      Point(x: -1740585.942947746, y: 28162864.26349877), Point(x: 0, y: 90)),
  'EPSG:2903': ProjectAndUnProjectResult(
      Point(x: -3274517.639472816, y: 27651211.139304798), Point(x: 0, y: 90)),
  'EPSG:2904': ProjectAndUnProjectResult(
      Point(x: -4556912.360749827, y: 27080492.584270146), Point(x: 0, y: 90)),
  'EPSG:2905': ProjectAndUnProjectResult(
      Point(x: 16771473.19291651, y: 19881470.240724005), Point(x: 0, y: 90)),
  'EPSG:2949': ProjectAndUnProjectResult(
      Point(x: 5403037.173898023, y: 9920877.559935424),
      Point(x: -34661211008946.938, y: 7546306826338.474)),
  'EPSG:2906': ProjectAndUnProjectResult(
      Point(x: 16742057.214225767, y: 20198326.19815082), Point(x: 0, y: 90)),
  'EPSG:2907': ProjectAndUnProjectResult(
      Point(x: 16635885.195668627, y: 20897177.962862995), Point(x: 0, y: 90)),
  'EPSG:2908': ProjectAndUnProjectResult(
      Point(x: 20080362.042142667, y: 13503621.26983818),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2909': ProjectAndUnProjectResult(
      Point(x: 21212141.1777009, y: 18575411.16597377),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2910': ProjectAndUnProjectResult(
      Point(x: 21568125.75435474, y: 18836205.032457754),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2911': ProjectAndUnProjectResult(
      Point(x: 24956378.374106497, y: 19976436.59594429),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:2912': ProjectAndUnProjectResult(
      Point(x: 25553996.407476988, y: 20227709.190562464),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:2913': ProjectAndUnProjectResult(
      Point(x: 28205491.53782647, y: 24245461.29358233),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:2914': ProjectAndUnProjectResult(
      Point(x: 25833585.615591403, y: 24599246.142841343),
      Point(x: 17.88805856028154, y: 46.892264067008725)),
  'EPSG:2915': ProjectAndUnProjectResult(
      Point(x: 23755941.686326686, y: 17389305.165589985),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:2916': ProjectAndUnProjectResult(
      Point(x: 24255654.445273783, y: 24283641.25020052),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:2917': ProjectAndUnProjectResult(
      Point(x: 26211047.58759166, y: 27153798.922896974),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:2918': ProjectAndUnProjectResult(
      Point(x: 27620463.418675568, y: 31078601.6437094),
      Point(x: 17.88805856028155, y: 46.892264067008746)),
  'EPSG:2919': ProjectAndUnProjectResult(
      Point(x: 27843540.280672904, y: 34296206.30905828),
      Point(x: 17.88805856028154, y: 46.89226406700874)),
  'EPSG:2920': ProjectAndUnProjectResult(
      Point(x: 27835397.225557923, y: 37629307.37812436),
      Point(x: 17.88805856028154, y: 46.89226406700874)),
  'EPSG:2921': ProjectAndUnProjectResult(
      Point(x: 23401765.337626535, y: 25725115.05581844),
      Point(x: 17.888058560281525, y: 46.892264067008746)),
  'EPSG:2922': ProjectAndUnProjectResult(
      Point(x: 24004536.819161545, y: 29432949.629476044),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:2923': ProjectAndUnProjectResult(
      Point(x: 24918173.066587433, y: 32865585.764436252),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:2924': ProjectAndUnProjectResult(
      Point(x: 31609131.381488748, y: 21591230.948789448),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:2925': ProjectAndUnProjectResult(
      Point(x: 31900874.224490017, y: 18579489.497676484),
      Point(x: 17.888058560281486, y: 46.892264067008746)),
  'EPSG:2926': ProjectAndUnProjectResult(
      Point(x: 20370302.974943724, y: 23626235.95369611),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:2927': ProjectAndUnProjectResult(
      Point(x: 21028688.336513802, y: 23890497.31480848),
      Point(x: 17.88805856028154, y: 46.892264067008746)),
  'EPSG:2928': ProjectAndUnProjectResult(
      Point(x: 21381299.102231305, y: 16301056.100981915),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:2929': ProjectAndUnProjectResult(
      Point(x: 21690411.73560526, y: 16558125.8202394),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:2930': ProjectAndUnProjectResult(
      Point(x: 22059612.239289284, y: 16959866.73353126),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:2931': ProjectAndUnProjectResult(
      Point(x: 872393.827671501, y: 5204619.094332747),
      Point(x: 17.88805855772476, y: 46.89226406150547)),
  'EPSG:2932': ProjectAndUnProjectResult(
      Point(x: -2322441.615643253, y: 3356641.705803981),
      Point(x: 17.93400798832915, y: 46.897461336768856)),
  'EPSG:2933': ProjectAndUnProjectResult(
      Point(x: -3997734.585355228, y: 21067298.242641147),
      Point(x: 120.50579613101817, y: 89.9928915527733)),
  'EPSG:2934': ProjectAndUnProjectResult(
      Point(x: -6323035.080961468, y: 6774706.861113531),
      Point(x: 17.888059822235856, y: 46.89226431455566)),
  'EPSG:2935': ProjectAndUnProjectResult(
      Point(x: -497150.86136644287, y: 5460896.054330236),
      Point(x: 17.889420558941982, y: 46.89236440013524)),
  'EPSG:2936': ProjectAndUnProjectResult(
      Point(x: 276821.2142744588, y: 5538390.984857211),
      Point(x: 17.892537316600897, y: 46.892656808665606)),
  'EPSG:2937': ProjectAndUnProjectResult(
      Point(x: 1051844.2311837403, y: 5626309.735105842),
      Point(x: 17.901391234225017, y: 46.89359466914904)),
  'EPSG:2938': ProjectAndUnProjectResult(
      Point(x: 1828236.8877569116, y: 5725035.22820721),
      Point(x: 17.92485713545289, y: 46.896338925427834)),
  'EPSG:2940': ProjectAndUnProjectResult(
      Point(x: 589223.4007894667, y: 5842171.1657247655),
      Point(x: 17.991156893829547, y: 46.90480499334767)),
  'EPSG:2941': ProjectAndUnProjectResult(
      Point(x: 1369812.852999465, y: 5964697.31797293),
      Point(x: 18.14462398150659, y: 46.92591733038659)),
  'EPSG:2942': ProjectAndUnProjectResult(
      Point(x: 2989336.6321898815, y: 5743675.774051212),
      Point(x: 17.848186258386445, y: 46.89671218490431)),
  'EPSG:2943': ProjectAndUnProjectResult(
      Point(x: 2989123.8164639603, y: 5743989.038279564),
      Point(x: 17.848192280561175, y: 46.89671153282365)),
  'EPSG:2944': ProjectAndUnProjectResult(
      Point(x: 5277537.244089515, y: 8355177.8227729015),
      Point(x: -15979.524499782834, y: 3524.3478798098868)),
  'EPSG:2945': ProjectAndUnProjectResult(
      Point(x: 5365095.243901447, y: 8649032.835441044),
      Point(x: -76314.668724916, y: 16624.267920019753)),
  'EPSG:2946': ProjectAndUnProjectResult(
      Point(x: 5425861.74852327, y: 8954491.865918288),
      Point(x: -519603.48216074344, y: 113747.10753176517)),
  'EPSG:2947': ProjectAndUnProjectResult(
      Point(x: 5455664.100526009, y: 9269865.456694849),
      Point(x: -6859630.010890731, y: 1508686.9880534173)),
  'EPSG:2948': ProjectAndUnProjectResult(
      Point(x: 5449809.877896608, y: 9592937.814035818),
      Point(x: -411243275.37217355, y: 90346346.30780989)),
  'EPSG:3574': ProjectAndUnProjectResult(
      Point(x: 3976163.557800372, y: -2495397.6479635886),
      Point(x: 17.888058560281518, y: 46.892264069112215)),
  'EPSG:2950': ProjectAndUnProjectResult(
      Point(x: 5309461.530223562, y: 10250138.320860693), Point(x: 0, y: 90)),
  'EPSG:2951': ProjectAndUnProjectResult(
      Point(x: 5162519.4015817605, y: 10576348.404652024), Point(x: 0, y: 90)),
  'EPSG:2952': ProjectAndUnProjectResult(
      Point(x: 4954908.029848009, y: 10894188.79017561), Point(x: 0, y: 90)),
  'EPSG:2953': ProjectAndUnProjectResult(
      Point(x: 8016398.141955978, y: 11184245.693301002),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:2954': ProjectAndUnProjectResult(
      Point(x: 5757390.397843242, y: 4104942.040903113),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:2955': ProjectAndUnProjectResult(
      Point(x: -7081100.809078519, y: 9644074.035715306),
      Point(x: 16894389367.285646, y: 5473429537.796183)),
  'EPSG:2956': ProjectAndUnProjectResult(
      Point(x: -3328981.2161364346, y: 11193210.773121612), Point(x: 0, y: 90)),
  'EPSG:2957': ProjectAndUnProjectResult(
      Point(x: -465963.8528201919, y: 11963247.506900493), Point(x: 0, y: 90)),
  'EPSG:2958': ProjectAndUnProjectResult(
      Point(x: 5019695.054228077, y: 11044701.550210133), Point(x: 0, y: 90)),
  'EPSG:2959': ProjectAndUnProjectResult(
      Point(x: 5436818.00586931, y: 10410808.927530395), Point(x: 0, y: 90)),
  'EPSG:2961': ProjectAndUnProjectResult(
      Point(x: 5638571.782971076, y: 9108330.901623307),
      Point(x: -1685042.2535846238, y: 369929.7983349917)),
  'EPSG:2962': ProjectAndUnProjectResult(
      Point(x: 5518117.362620078, y: 8498017.126823647),
      Point(x: -33811.09013364492, y: 7380.196889868285)),
  'EPSG:2964': ProjectAndUnProjectResult(
      Point(x: 8871383.233963447, y: 30123220.645564575),
      Point(x: 17.88805856028151, y: 46.89226404782316)),
  'EPSG:2965': ProjectAndUnProjectResult(
      Point(x: 13443875.494497076, y: 24906746.99790966), Point(x: 0, y: 90)),
  'EPSG:2966': ProjectAndUnProjectResult(
      Point(x: 15414189.905530728, y: 25304848.862912126), Point(x: 0, y: 90)),
  'EPSG:2967': ProjectAndUnProjectResult(
      Point(x: 13443875.494497076, y: 24906746.99790966), Point(x: 0, y: 90)),
  'EPSG:2968': ProjectAndUnProjectResult(
      Point(x: 15414189.905530728, y: 25304848.862912126), Point(x: 0, y: 90)),
  'EPSG:2969': ProjectAndUnProjectResult(
      Point(x: 5638030.4083165405, y: 9108444.058088304),
      Point(x: 45, y: double.nan)),
  'EPSG:2970': ProjectAndUnProjectResult(
      Point(x: 5638821.68229843, y: 9108451.568282675),
      Point(x: 45, y: double.nan)),
  'EPSG:2971': ProjectAndUnProjectResult(
      Point(x: 5297833.539434429, y: 7936267.20626459),
      Point(x: 45, y: double.nan)),
  'EPSG:2972': ProjectAndUnProjectResult(
      Point(x: 5297700.047163907, y: 7936385.43186829),
      Point(x: -2039.797629755838, y: 544.0590624611513)),
  'EPSG:2973': ProjectAndUnProjectResult(
      Point(x: 5638431.222110403, y: 9108112.13901292),
      Point(x: 45, y: double.nan)),
  'EPSG:2975': ProjectAndUnProjectResult(
      Point(x: -2446060.569136869, y: 15986999.55129112),
      Point(x: 18.163219782904886, y: 46.928551724201576)),
  'EPSG:2976': ProjectAndUnProjectResult(
      Point(x: -47238241.791791975, y: -12684235.369017046),
      Point(x: 35.83765295421251, y: -89.99821089503064)),
  'EPSG:2977': ProjectAndUnProjectResult(
      Point(x: -61723076.4507759, y: -28013018.417478703),
      Point(x: 83.4714222027855, y: -89.9964372072665)),
  'EPSG:2978': ProjectAndUnProjectResult(
      Point(x: -35386780.19318476, y: -1253098.2452161983),
      Point(x: 72.95606606360943, y: -89.99743421647453)),
  'EPSG:2979': ProjectAndUnProjectResult(
      Point(x: -3285584.1671327204, y: 16607021.600969851),
      Point(x: 26.45060222505478, y: 48.31343513168791)),
  'EPSG:2980': ProjectAndUnProjectResult(
      Point(x: -1557696.7992339493, y: 15562081.722529389),
      Point(x: 17.893401851904233, y: 46.89274301979043)),
  'EPSG:2981': ProjectAndUnProjectResult(
      Point(x: 19318385.721916463, y: 12798487.193376364),
      Point(x: 45, y: double.nan)),
  'EPSG:2982': ProjectAndUnProjectResult(
      Point(x: 19319689.20488807, y: 12812694.987694262),
      Point(x: 45, y: double.nan)),
  'EPSG:2983': ProjectAndUnProjectResult(
      Point(x: 19321033.480886627, y: 12813617.24279347),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2984': ProjectAndUnProjectResult(
      Point(x: -20824342.277973093, y: -637938.8069908209),
      Point(x: 17.888058560281515, y: 46.89226409307015)),
  'EPSG:2987': ProjectAndUnProjectResult(
      Point(x: 5517979.500171914, y: 8497458.820071144),
      Point(x: 45, y: double.nan)),
  'EPSG:2988': ProjectAndUnProjectResult(
      Point(x: 48718866.92910844, y: -13181254.090421572),
      Point(x: -27.552811576681403, y: -89.99744523474538)),
  'EPSG:2989': ProjectAndUnProjectResult(
      Point(x: 5638571.782947235, y: 9108330.90168845),
      Point(x: -1685042.2533001453, y: 369929.7982766386)),
  'EPSG:2990': ProjectAndUnProjectResult(
      Point(x: -2789201.6978123337, y: 8423972.817739557),
      Point(x: 18.064677355390117, y: 46.91475667121765)),
  'EPSG:2991': ProjectAndUnProjectResult(
      Point(x: 6621080.326600361, y: 7550611.109639786),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:2992': ProjectAndUnProjectResult(
      Point(x: 21722704.48359173, y: 24772346.160235517),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:2993': ProjectAndUnProjectResult(
      Point(x: 6621080.326600361, y: 7550611.109639786),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:2994': ProjectAndUnProjectResult(
      Point(x: 21722704.48359173, y: 24772346.160235517),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:2995': ProjectAndUnProjectResult(
      Point(x: 19319145.214816272, y: 12800204.247129302),
      Point(x: 45, y: double.nan)),
  'EPSG:2996': ProjectAndUnProjectResult(
      Point(x: 19319689.20488807, y: 12812694.987694262),
      Point(x: 45, y: double.nan)),
  'EPSG:2997': ProjectAndUnProjectResult(
      Point(x: 19303908.749990877, y: 12808786.439515695),
      Point(x: double.nan, y: double.nan)),
  'EPSG:2998': ProjectAndUnProjectResult(
      Point(x: 19319620.827037334, y: 12812705.427088493),
      Point(x: 45, y: double.nan)),
  'EPSG:2999': ProjectAndUnProjectResult(
      Point(x: -1558483.4925988754, y: 15562140.280238377),
      Point(x: 17.893421731407496, y: 46.89274467264032)),
  'EPSG:3000': ProjectAndUnProjectResult(
      Point(x: -6323035.080961468, y: 6774706.861113531),
      Point(x: 17.888059822235856, y: 46.89226431455566)),
  'EPSG:3001': ProjectAndUnProjectResult(
      Point(x: -6323019.301218599, y: 6774822.740257204),
      Point(x: 17.888059883263967, y: 46.89226423543208)),
  'EPSG:3002': ProjectAndUnProjectResult(
      Point(x: -6322890.078644928, y: 6774362.061687819),
      Point(x: 17.888059768494053, y: 46.8922646303815)),
  'EPSG:3003': ProjectAndUnProjectResult(
      Point(x: 2176932.512591173, y: 5231692.879029004),
      Point(x: 17.888058440115767, y: 46.89226402774989)),
  'EPSG:3004': ProjectAndUnProjectResult(
      Point(x: 2740014.784146443, y: 5197260.952675889),
      Point(x: 17.888058564860476, y: 46.89226406744901)),
  'EPSG:3005': ProjectAndUnProjectResult(
      Point(x: 5852641.094495805, y: 8044112.188266415),
      Point(x: 17.88805856028151, y: 46.89226406700877)),
  'EPSG:3006': ProjectAndUnProjectResult(
      Point(x: 720001.2298400886, y: 5197241.60997254),
      Point(x: 17.888058560302017, y: 46.89226406695651)),
  'EPSG:3007': ProjectAndUnProjectResult(
      Point(x: 598669.2683445803, y: 5212129.891160676),
      Point(x: 17.888058558416994, y: 46.89226406333179)),
  'EPSG:3008': ProjectAndUnProjectResult(
      Point(x: 484387.03616155894, y: 5204627.243488797),
      Point(x: 17.888058560316225, y: 46.89226406636951)),
  'EPSG:3009': ProjectAndUnProjectResult(
      Point(x: 370089.2655463072, y: 5199321.338507943),
      Point(x: 17.888058560302017, y: 46.89226406695651)),
  'EPSG:3010': ProjectAndUnProjectResult(
      Point(x: 255781.53174686513, y: 5196205.585950036),
      Point(x: 17.88805856028205, y: 46.892264067008135)),
  'EPSG:3011': ProjectAndUnProjectResult(
      Point(x: 141469.08374790964, y: 5195276.111849979),
      Point(x: 17.888058560281515, y: 46.892264067008774)),
  'EPSG:3012': ProjectAndUnProjectResult(
      Point(x: 427239.7350572513, y: 5201700.173692855),
      Point(x: 17.888058560331274, y: 46.89226406680042)),
  'EPSG:3019': ProjectAndUnProjectResult(
      Point(x: 2001544.817457878, y: 5215710.302426993),
      Point(x: 17.88805857994177, y: 46.89226402330031)),
  'EPSG:3020': ProjectAndUnProjectResult(
      Point(x: 1830145.677861884, y: 5203752.839792749),
      Point(x: 17.888058586340236, y: 46.892264029780634)),
  'EPSG:3021': ProjectAndUnProjectResult(
      Point(x: 1658711.959966589, y: 5196737.44236798),
      Point(x: 17.88805858630439, y: 46.8922640303641)),
  'EPSG:3022': ProjectAndUnProjectResult(
      Point(x: 1487262.185685372, y: 5194644.499455127),
      Point(x: 17.888058586300215, y: 46.89226403037144)),
  'EPSG:3023': ProjectAndUnProjectResult(
      Point(x: 1315813.6865043738, y: 5197468.153934496),
      Point(x: 17.888058586291464, y: 46.89226403035352)),
  'EPSG:3024': ProjectAndUnProjectResult(
      Point(x: 1144383.8892775094, y: 5205216.307122136),
      Point(x: 17.888058586327574, y: 46.8922640294506)),
  'EPSG:3025': ProjectAndUnProjectResult(
      Point(x: 2001308.1589802196, y: 5215734.855545628),
      Point(x: 17.888058553952913, y: 46.89226412598594)),
  'EPSG:3026': ProjectAndUnProjectResult(
      Point(x: 1829910.2364057195, y: 5203784.14132612),
      Point(x: 17.88805856032184, y: 46.89226413245026)),
  'EPSG:3027': ProjectAndUnProjectResult(
      Point(x: 1658477.7552794372, y: 5196775.451293881),
      Point(x: 17.88805856028566, y: 46.89226413303138)),
  'EPSG:3028': ProjectAndUnProjectResult(
      Point(x: 1487029.2385625124, y: 5194689.193910075),
      Point(x: 17.888058560281515, y: 46.89226413303865)),
  'EPSG:3032': ProjectAndUnProjectResult(
      Point(x: -9372187.53738209, y: 23985732.066905674),
      Point(x: 17.888058560281507, y: 46.89226406700877)),
  'EPSG:3033': ProjectAndUnProjectResult(
      Point(x: -15691757.104784992, y: 19987677.563023202),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3034': ProjectAndUnProjectResult(
      Point(x: 4580708.59132307, y: 2282143.4053414315),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3035': ProjectAndUnProjectResult(
      Point(x: 4921381.502448138, y: 2674052.203833336),
      Point(x: 17.888058560281518, y: 46.89226406911223)),
  'EPSG:3036': ProjectAndUnProjectResult(
      Point(x: -650192.2096599129, y: 15305193.291340299),
      Point(x: 17.88807717323444, y: 46.892264059984264)),
  'EPSG:3037': ProjectAndUnProjectResult(
      Point(x: -1105125.5281863362, y: 15413941.856486619),
      Point(x: 17.888509189327262, y: 46.89229076369042)),
  'EPSG:3038': ProjectAndUnProjectResult(
      Point(x: 3859134.0088134822, y: 6259299.996916991),
      Point(x: 16.418121572269165, y: 47.11123824637778)),
  'EPSG:3039': ProjectAndUnProjectResult(
      Point(x: 3429800.759174801, y: 5977375.01459784),
      Point(x: 17.630645767876164, y: 46.92603298659015)),
  'EPSG:3040': ProjectAndUnProjectResult(
      Point(x: 2988896.0169453374, y: 5744023.033448553),
      Point(x: 17.848196835452992, y: 46.89671142260442)),
  'EPSG:3041': ProjectAndUnProjectResult(
      Point(x: 2540720.5313290567, y: 5555692.513083512),
      Point(x: 17.883147133968766, y: 46.89269979625903)),
  'EPSG:9014': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:3051': ProjectAndUnProjectResult(
      Point(x: -2005500.4108122215, y: 5751900.446586641),
      Point(x: 17.930935679469886, y: 46.897081134395314)),
  'EPSG:3054': ProjectAndUnProjectResult(
      Point(x: 3859157.810789082, y: 6259506.3603128055),
      Point(x: 16.41840354445261, y: 47.111198602251044)),
  'EPSG:3055': ProjectAndUnProjectResult(
      Point(x: 3429814.2657366567, y: 5977577.866379512),
      Point(x: 17.630700043837315, y: 46.92602576759613)),
  'EPSG:3056': ProjectAndUnProjectResult(
      Point(x: 2988898.398450671, y: 5744223.267668888),
      Point(x: 17.848206650771143, y: 46.896710089813766)),
  'EPSG:3057': ProjectAndUnProjectResult(
      Point(x: 3270199.377220549, y: -713939.791333823),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3058': ProjectAndUnProjectResult(
      Point(x: 2054060.1313930212, y: -2255423.451762745),
      Point(x: 17.883990728740315, y: 46.89261711237233)),
  'EPSG:3059': ProjectAndUnProjectResult(
      Point(x: 34461.49600235146, y: -788646.7322226427),
      Point(x: 17.888058563129825, y: 46.89226406242482)),
  'EPSG:3060': ProjectAndUnProjectResult(
      Point(x: 19319665.211244963, y: 12812694.974072788),
      Point(x: 45, y: double.nan)),
  'EPSG:3061': ProjectAndUnProjectResult(
      Point(x: 2989334.701886293, y: 5743673.122949152),
      Point(x: 17.848186710785654, y: 46.896712144934384)),
  'EPSG:3062': ProjectAndUnProjectResult(
      Point(x: 3859149.6975052455, y: 6259267.374531108),
      Point(x: 16.419180407627582, y: 47.11110164766341)),
  'EPSG:3063': ProjectAndUnProjectResult(
      Point(x: 3859061.888372134, y: 6259398.089319992),
      Point(x: 16.419106517341948, y: 47.111109475818566)),
  'EPSG:3064': ProjectAndUnProjectResult(
      Point(x: 1176891.2872133553, y: 5231671.834139232),
      Point(x: 17.88805843543735, y: 46.89226402744535)),
  'EPSG:3065': ProjectAndUnProjectResult(
      Point(x: 720001.2298381603, y: 5197241.610093783),
      Point(x: 17.888058560302017, y: 46.89226406695652)),
  'EPSG:3066': ProjectAndUnProjectResult(
      Point(x: -953959.9291653531, y: 2374702.880146075),
      Point(x: 17.888231299026007, y: 46.892271822834914)),
  'EPSG:3067': ProjectAndUnProjectResult(
      Point(x: -193931.3475621267, y: 5233642.279931091),
      Point(x: 17.88805871864152, y: 46.89226402167793)),
  'EPSG:3068': ProjectAndUnProjectResult(
      Point(x: 364681.23507698195, y: -595677.6445180769),
      Point(x: 17.888042968155737, y: 46.89226462663772)),
  'EPSG:3069': ProjectAndUnProjectResult(
      Point(x: 3819244.9687302676, y: 7332769.1263250355), Point(x: 0, y: 90)),
  'EPSG:3070': ProjectAndUnProjectResult(
      Point(x: 3839622.300083163, y: 7353217.56768338), Point(x: 0, y: 90)),
  'EPSG:3071': ProjectAndUnProjectResult(
      Point(x: 3839622.300083163, y: 7353217.56768338), Point(x: 0, y: 90)),
  'EPSG:3072': ProjectAndUnProjectResult(
      Point(x: 5841926.85039724, y: 4779293.471123142),
      Point(x: -856956604.9425999, y: 188140569.70074788)),
  'EPSG:3073': ProjectAndUnProjectResult(
      Point(x: 5625524.243963247, y: 5008333.052615764),
      Point(x: -21737319794.916904, y: 4757338589.639994)),
  'EPSG:3074': ProjectAndUnProjectResult(
      Point(x: 5401485.579875652, y: 5163842.641810937),
      Point(x: -11503948981851.02, y: 2505985965549.347)),
  'EPSG:3075': ProjectAndUnProjectResult(
      Point(x: 5841926.85039724, y: 4779293.471123142),
      Point(x: -856956604.9425999, y: 188140569.70074788)),
  'EPSG:3076': ProjectAndUnProjectResult(
      Point(x: 5625524.243963247, y: 5008333.052615764),
      Point(x: -21737319794.916904, y: 4757338589.639994)),
  'EPSG:3077': ProjectAndUnProjectResult(
      Point(x: 5401485.579875652, y: 5163842.641810937),
      Point(x: -11503948981851.02, y: 2505985965549.347)),
  'EPSG:3078': ProjectAndUnProjectResult(
      Point(x: 8386430.7898983145, y: 2796245.837725366),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3079': ProjectAndUnProjectResult(
      Point(x: 8386430.7898983145, y: 2796245.837725366),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3080': ProjectAndUnProjectResult(
      Point(x: 28148468.047498412, y: 23622097.92894205),
      Point(x: 17.888058560281525, y: 46.89226404782303)),
  'EPSG:3081': ProjectAndUnProjectResult(
      Point(x: 8665245.955593321, y: 7285398.725447465),
      Point(x: 17.888058560281525, y: 46.89226406700872)),
  'EPSG:3082': ProjectAndUnProjectResult(
      Point(x: 9154307.075487461, y: 12759946.896370977),
      Point(x: 17.88805856028155, y: 46.892264067008725)),
  'EPSG:3083': ProjectAndUnProjectResult(
      Point(x: 9202342.771606717, y: 13714424.334539425),
      Point(x: 17.88805856028155, y: 46.89226406700876)),
  'EPSG:3084': ProjectAndUnProjectResult(
      Point(x: 9154307.075487461, y: 12759946.896370977),
      Point(x: 17.88805856028155, y: 46.892264067008725)),
  'EPSG:3085': ProjectAndUnProjectResult(
      Point(x: 9202342.771606717, y: 13714424.334539425),
      Point(x: 17.88805856028155, y: 46.89226406700876)),
  'EPSG:3086': ProjectAndUnProjectResult(
      Point(x: 7788718.898020689, y: 5738991.145189423),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:3087': ProjectAndUnProjectResult(
      Point(x: 7788718.898020689, y: 5738991.145189423),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:3088': ProjectAndUnProjectResult(
      Point(x: 7954314.818287251, y: 6181092.986200401),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3089': ProjectAndUnProjectResult(
      Point(x: 26096781.19966409, y: 20279135.905225817),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3099': ProjectAndUnProjectResult(
      Point(x: -604157.4780445739, y: 12178763.901223246), Point(x: 0, y: 90)),
  'EPSG:3090': ProjectAndUnProjectResult(
      Point(x: 7954314.818287251, y: 6181092.986200401),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3091': ProjectAndUnProjectResult(
      Point(x: 26096781.19966409, y: 20279135.905225817),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3092': ProjectAndUnProjectResult(
      Point(x: -3275094.502145118, y: 11622330.41070981),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:3093': ProjectAndUnProjectResult(
      Point(x: -2175354.4993099896, y: 12026499.549733672),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:3094': ProjectAndUnProjectResult(
      Point(x: -601983.2851017124, y: 12179274.005560895),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:3095': ProjectAndUnProjectResult(
      Point(x: 1562008.62827783, y: 11946361.42379529),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:3096': ProjectAndUnProjectResult(
      Point(x: 4456369.102143075, y: 11151767.958105998),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:3097': ProjectAndUnProjectResult(
      Point(x: -3275967.0652893055, y: 11622144.51821889), Point(x: 0, y: 90)),
  'EPSG:3098': ProjectAndUnProjectResult(
      Point(x: -2176781.840373538, y: 12026151.471395677), Point(x: 0, y: 90)),
  'EPSG:3100': ProjectAndUnProjectResult(
      Point(x: 1558843.5538291563, y: 11945699.00761955), Point(x: 0, y: 90)),
  'EPSG:3101': ProjectAndUnProjectResult(
      Point(x: 4451906.623195637, y: 11150975.810983855), Point(x: 0, y: 90)),
  'EPSG:3103': ProjectAndUnProjectResult(
      Point(x: 2988853.9655160126, y: 5744078.669052498),
      Point(x: 17.848193246526034, y: 46.89671010445272)),
  'EPSG:3104': ProjectAndUnProjectResult(
      Point(x: 2540689.9359594667, y: 5555742.024561414),
      Point(x: 17.883147068514432, y: 46.8926992677133)),
  'EPSG:3105': ProjectAndUnProjectResult(
      Point(x: 2088164.6801670862, y: 5409237.98513725),
      Point(x: 17.8876521804974, y: 46.89228740565478)),
  'EPSG:3106': ProjectAndUnProjectResult(
      Point(x: -4426383.991075835, y: 8231328.301935496),
      Point(x: 45, y: double.nan)),
  'EPSG:3107': ProjectAndUnProjectResult(
      Point(x: -19053509.31088796, y: 2429151.340795912),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3108': ProjectAndUnProjectResult(
      Point(x: 1591648.0571654972, y: -35997.282725631696),
      Point(x: 17.88774938384045, y: 46.89228072495099)),
  'EPSG:3575': ProjectAndUnProjectResult(
      Point(x: 644243.1674465525, y: -4649928.687737088),
      Point(x: 17.88805856028151, y: 46.89226406911223)),
  'EPSG:3109': ProjectAndUnProjectResult(
      Point(x: 1563317.4333017708, y: 8866.23042817536),
      Point(x: 17.887788309575704, y: 46.89227809050608)),
  'EPSG:3110': ProjectAndUnProjectResult(
      Point(x: -19287915.88389734, y: 1257475.2044985937),
      Point(x: 17.888058560873176, y: 46.89226405813341)),
  'EPSG:3111': ProjectAndUnProjectResult(
      Point(x: -19288382.890973657, y: -742437.3449551277),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:3112': ProjectAndUnProjectResult(
      Point(x: -18704187.61509478, y: -1254790.7080928627),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3113': ProjectAndUnProjectResult(
      Point(x: 7793785.573916676, y: 12769791.385874765),
      Point(x: -4967267525.63053, y: 1643558557.1708627)),
  'EPSG:3114': ProjectAndUnProjectResult(
      Point(x: 5602973.338735154, y: 11446759.200280566), Point(x: 0, y: 90)),
  'EPSG:3115': ProjectAndUnProjectResult(
      Point(x: 5823190.1736905165, y: 11131197.294986518), Point(x: 0, y: 90)),
  'EPSG:3116': ProjectAndUnProjectResult(
      Point(x: 5981235.610502521, y: 10806121.017854199), Point(x: 0, y: 90)),
  'EPSG:3117': ProjectAndUnProjectResult(
      Point(x: 828646.8766494016, y: 913215.0489469176),
      Point(
          x: -72.61999999999692,
          y: 3.809999999999964)), // cannot represent as 64 bit double without overflow, therefore used Point(x: -72.62, y: 3.81)
  'EPSG:3118': ProjectAndUnProjectResult(
      Point(x: 6139873.062745825, y: 10148520.923470223),
      Point(x: -1319338140.740411, y: 289535161.569949)),
  'EPSG:3119': ProjectAndUnProjectResult(
      Point(x: 1562499.0954302107, y: 6216696.097143596),
      Point(x: 17.88805853282264, y: 46.892264054463574)),
  'EPSG:3120': ProjectAndUnProjectResult(
      Point(x: 4393448.659624081, y: 5056980.26449201),
      Point(x: 17.888058572338835, y: 46.89226406879691)),
  'EPSG:3121': ProjectAndUnProjectResult(
      Point(x: -3999952.4295648923, y: 11070865.301464126),
      Point(x: 49.31246603655868, y: 89.99967755776827)),
  'EPSG:3122': ProjectAndUnProjectResult(
      Point(x: -3795425.8148139464, y: 11267554.54350462),
      Point(x: 49.31246603655868, y: 89.99967755776827)),
  'EPSG:3123': ProjectAndUnProjectResult(
      Point(x: -3555338.8268887005, y: 11453401.630602693),
      Point(x: 49.31246603655868, y: 89.99967755776827)),
  'EPSG:3124': ProjectAndUnProjectResult(
      Point(x: -3276732.630196556, y: 11625703.487254022),
      Point(x: 49.31246603655868, y: 89.99967755776827)),
  'EPSG:3125': ProjectAndUnProjectResult(
      Point(x: -2956448.8089276785, y: 11781450.763102124),
      Point(x: 49.31246603655868, y: 89.99967755776827)),
  'EPSG:3126': ProjectAndUnProjectResult(
      Point(x: 415260.6822780034, y: 5195870.378755134),
      Point(x: 17.888058560281344, y: 46.892264067008604)),
  'EPSG:3127': ProjectAndUnProjectResult(
      Point(x: 339053.9538040216, y: 5197436.0837356355),
      Point(x: 17.888058560277017, y: 46.892264067000774)),
  'EPSG:3128': ProjectAndUnProjectResult(
      Point(x: 262850.42813212634, y: 5199974.092247936),
      Point(x: 17.888058560253082, y: 46.89226406692702)),
  'EPSG:3129': ProjectAndUnProjectResult(
      Point(x: 186651.6820958571, y: 5203485.806494309),
      Point(x: 17.888058560226206, y: 46.892264066575265)),
  'EPSG:3130': ProjectAndUnProjectResult(
      Point(x: 110459.36197448388, y: 5207973.165191365),
      Point(x: 17.888058560563294, y: 46.89226406541965)),
  'EPSG:3131': ProjectAndUnProjectResult(
      Point(x: 34275.2060847854, y: 5213438.643234651),
      Point(x: 17.888058563129828, y: 46.892264062424815)),
  'EPSG:3132': ProjectAndUnProjectResult(
      Point(x: -41898.93239802774, y: 5219885.251244588),
      Point(x: 17.888058574348563, y: 46.89226405586626)),
  'EPSG:3133': ProjectAndUnProjectResult(
      Point(x: -118061.06233451399, y: 5227316.534974944),
      Point(x: 17.888058612001338, y: 46.89226404327183)),
  'EPSG:3134': ProjectAndUnProjectResult(
      Point(x: -194209.03117459663, y: 5235736.574560914),
      Point(x: 17.88805871864152, y: 46.892264021677924)),
  'EPSG:3135': ProjectAndUnProjectResult(
      Point(x: -270340.5011148328, y: 5245149.983579845),
      Point(x: 17.8880589858763, y: 46.89226398852624)),
  'EPSG:3136': ProjectAndUnProjectResult(
      Point(x: -346452.9248036217, y: 5255561.907893532),
      Point(x: 17.888059595624604, y: 46.892263943722426)),
  'EPSG:3137': ProjectAndUnProjectResult(
      Point(x: -422543.52053862845, y: 5266978.024236943),
      Point(x: 17.88806088688771, y: 46.892263893655276)),
  'EPSG:3138': ProjectAndUnProjectResult(
      Point(x: -498609.24690069736, y: 5279404.538514145),
      Point(x: 17.88806345975466, y: 46.892263858362384)),
  'EPSG:3140': ProjectAndUnProjectResult(
      Point(x: -70846215.69226253, y: 171216270.43656492),
      Point(x: -135, y: double.nan)),
  'EPSG:3141': ProjectAndUnProjectResult(
      Point(x: 36791302.72040419, y: -1636910.1416756026),
      Point(x: 55.45244904959525, y: -89.99581610201355)),
  'EPSG:3142': ProjectAndUnProjectResult(
      Point(x: 48727963.127472386, y: -13199510.650172744),
      Point(x: 55.45244904959525, y: -89.99581610201355)),
  'EPSG:3143': ProjectAndUnProjectResult(
      Point(x: 41534985.39582845, y: -8759157.318267493), Point(x: 0, y: -90)),
  'EPSG:3146': ProjectAndUnProjectResult(
      Point(x: 6491595.854716621, y: 5195415.255041711),
      Point(x: 17.888058570172564, y: 46.8922640684501)),
  'EPSG:3147': ProjectAndUnProjectResult(
      Point(x: 491595.85471662134, y: 5195415.255041711),
      Point(x: 17.888058570172564, y: 46.8922640684501)),
  'EPSG:3148': ProjectAndUnProjectResult(
      Point(x: -4621172.327771767, y: 9777964.631748272),
      Point(x: 45, y: double.nan)),
  'EPSG:3149': ProjectAndUnProjectResult(
      Point(x: -4424645.783326176, y: 10434962.949856797),
      Point(x: 77.33354503728617, y: 89.99191517377592)),
  'EPSG:3150': ProjectAndUnProjectResult(
      Point(x: 6491598.327011086, y: 5195408.12931237),
      Point(x: 17.88805857029885, y: 46.8922640691192)),
  'EPSG:3151': ProjectAndUnProjectResult(
      Point(x: 491598.32701108593, y: 5195408.12931237),
      Point(x: 17.88805857029885, y: 46.8922640691192)),
  'EPSG:3152': ProjectAndUnProjectResult(
      Point(x: 87243.23643798723, y: -1305360.6412097253),
      Point(x: 17.888058560281515, y: 46.892264067008774)),
  'EPSG:3153': ProjectAndUnProjectResult(
      Point(x: 5852641.094495805, y: 8044112.188266415),
      Point(x: 17.88805856028151, y: 46.89226406700877)),
  'EPSG:3154': ProjectAndUnProjectResult(
      Point(x: -35393329.62055659, y: -11254044.783678558),
      Point(x: 0, y: -90)),
  'EPSG:3155': ProjectAndUnProjectResult(
      Point(x: -25785988.545412734, y: -2920563.7794431755),
      Point(x: 72517.82979839807, y: -135482.78856909208)),
  'EPSG:3156': ProjectAndUnProjectResult(
      Point(x: -18063024.2834307, y: 2990541.0425813603),
      Point(x: 5728.679566272616, y: 8118.480468517206)),
  'EPSG:3157': ProjectAndUnProjectResult(
      Point(x: -11916549.256324729, y: 7029722.072663035),
      Point(x: 169423.46825792477, y: 95274.64648021963)),
  'EPSG:3158': ProjectAndUnProjectResult(
      Point(x: 1672650.061907484, y: 12179046.047871836), Point(x: 0, y: 90)),
  'EPSG:3159': ProjectAndUnProjectResult(
      Point(x: 3225639.745211993, y: 12014873.557768293), Point(x: 0, y: 90)),
  'EPSG:3160': ProjectAndUnProjectResult(
      Point(x: 4309153.746567462, y: 11603618.623518256), Point(x: 0, y: 90)),
  'EPSG:3161': ProjectAndUnProjectResult(
      Point(x: 6564186.411249067, y: 16793420.77755385),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3162': ProjectAndUnProjectResult(
      Point(x: 6564186.411249067, y: 16793420.77755385),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3163': ProjectAndUnProjectResult(
      Point(x: -20823545.932266816, y: -637843.0603015926),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3164': ProjectAndUnProjectResult(
      Point(x: 19321817.894282714, y: 12806583.39311519),
      Point(x: 45, y: double.nan)),
  'EPSG:3165': ProjectAndUnProjectResult(
      Point(x: -21380462.210016996, y: -1321687.6461589648),
      Point(x: 17.888058787489044, y: 46.89226397545256)),
  'EPSG:3166': ProjectAndUnProjectResult(
      Point(x: -21380465.884373542, y: -1321714.4450936352),
      Point(x: 17.888058787489044, y: 46.89226397545256)),
  'EPSG:3167': ProjectAndUnProjectResult(
      Point(x: -302285.34430120606, y: 346447.6805758034),
      Point(x: 17.888058560281515, y: 46.89226425953235)),
  'EPSG:3178': ProjectAndUnProjectResult(
      Point(x: 5436818.00586931, y: 10410808.927530395), Point(x: 0, y: 90)),
  'EPSG:3168': ProjectAndUnProjectResult(
      Point(x: -5316330.273683353, y: 6969403.456909375),
      Point(x: 17.888058560281515, y: 46.89226425953235)),
  'EPSG:3169': ProjectAndUnProjectResult(
      Point(x: 13120822.691871341, y: 16907087.333848983),
      Point(x: -142413.85807935635, y: 81938.05169573172)),
  'EPSG:3170': ProjectAndUnProjectResult(
      Point(x: 19321105.829017498, y: 12806678.893239),
      Point(x: -5175.116548601758, y: 7749.823533021951)),
  'EPSG:3171': ProjectAndUnProjectResult(
      Point(x: 27108574.549169235, y: 6815768.467481233),
      Point(x: -103767.21820745953, y: -188871.77584871996)),
  'EPSG:3172': ProjectAndUnProjectResult(
      Point(x: 27105417.18839756, y: 6807327.911945123),
      Point(x: -135, y: double.nan)),
  'EPSG:3174': ProjectAndUnProjectResult(
      Point(x: 6847270.573878591, y: 5470326.95949224),
      Point(x: 17.8880585602815, y: 46.89226406700877)),
  'EPSG:3175': ProjectAndUnProjectResult(
      Point(x: 6819680.24281576, y: 5382704.742806314),
      Point(x: 17.88805856028151, y: 46.89226406700877)),
  'EPSG:3176': ProjectAndUnProjectResult(
      Point(x: -4602041.108342849, y: 9887504.204212872),
      Point(x: 45, y: double.nan)),
  'EPSG:3177': ProjectAndUnProjectResult(
      Point(x: 1067485.2187028376, y: 5177491.749015629),
      Point(x: 17.888058563770656, y: 46.892264062483235)),
  'EPSG:3179': ProjectAndUnProjectResult(
      Point(x: 5625552.597278097, y: 9753575.672750814),
      Point(x: -14563147143.452982, y: 3188443837.820243)),
  'EPSG:3180': ProjectAndUnProjectResult(
      Point(x: 5638571.782971076, y: 9108330.901623307),
      Point(x: -1685042.2535846238, y: 369929.7983349917)),
  'EPSG:3181': ProjectAndUnProjectResult(
      Point(x: 5518117.362620078, y: 8498017.126823647),
      Point(x: -33811.09013364492, y: 7380.196889868285)),
  'EPSG:3182': ProjectAndUnProjectResult(
      Point(x: 5297700.047163907, y: 7936385.43186829),
      Point(x: -2039.797629755838, y: 544.0590624611513)),
  'EPSG:3183': ProjectAndUnProjectResult(
      Point(x: 5003589.298485577, y: 7430562.416711468),
      Point(x: 87.06844226328268, y: 103.32192587414212)),
  'EPSG:3184': ProjectAndUnProjectResult(
      Point(x: 4656108.536534103, y: 6983077.859512636),
      Point(x: -27.574000095106953, y: 55.09636167021371)),
  'EPSG:3185': ProjectAndUnProjectResult(
      Point(x: 4270751.307769986, y: 6593435.187347272),
      Point(x: 9.84627979268085, y: 48.22214374762894)),
  'EPSG:3186': ProjectAndUnProjectResult(
      Point(x: 3859134.0088134822, y: 6259299.996916991),
      Point(x: 16.418121572269165, y: 47.11123824637778)),
  'EPSG:3187': ProjectAndUnProjectResult(
      Point(x: 3429800.759174801, y: 5977375.01459784),
      Point(x: 17.630645767876164, y: 46.92603298659015)),
  'EPSG:3188': ProjectAndUnProjectResult(
      Point(x: 2988896.0169453374, y: 5744023.033448553),
      Point(x: 17.848196835452992, y: 46.89671142260442)),
  'EPSG:3189': ProjectAndUnProjectResult(
      Point(x: 2540720.5313290567, y: 5555692.513083512),
      Point(x: 17.883147133968766, y: 46.89269979625903)),
  'EPSG:3190': ProjectAndUnProjectResult(
      Point(x: 877209.3222541497, y: 5233533.337462733),
      Point(x: 17.88805843897405, y: 46.8922640227178)),
  'EPSG:3191': ProjectAndUnProjectResult(
      Point(x: 724891.4800218983, y: 5218123.515214661),
      Point(x: 17.888058553630767, y: 46.89226405318974)),
  'EPSG:3192': ProjectAndUnProjectResult(
      Point(x: 572527.2977369023, y: 5206649.574759262),
      Point(x: 17.88805856365352, y: 46.892264061260164)),
  'EPSG:3193': ProjectAndUnProjectResult(
      Point(x: 420131.9517814456, y: 5199086.2463922445),
      Point(x: 17.88805856379132, y: 46.89226406243074)),
  'EPSG:3194': ProjectAndUnProjectResult(
      Point(x: 267718.86045348976, y: 5195416.833344885),
      Point(x: 17.888058563770656, y: 46.892264062483235)),
  'EPSG:3195': ProjectAndUnProjectResult(
      Point(x: 115300.40990425537, y: 5195633.223828336),
      Point(x: 17.88805856377042, y: 46.89226406248311)),
  'EPSG:3196': ProjectAndUnProjectResult(
      Point(x: -37111.330227248225, y: 5199735.896408298),
      Point(x: 17.88805856374189, y: 46.89226406240126)),
  'EPSG:3197': ProjectAndUnProjectResult(
      Point(x: -189503.8943491241, y: 5207733.9196965825),
      Point(x: 17.88805856404742, y: 46.89226406088829)),
  'EPSG:3198': ProjectAndUnProjectResult(
      Point(x: -341863.70448730537, y: 5219644.946301369),
      Point(x: 17.888058577796404, y: 46.89226405129616)),
  'EPSG:3199': ProjectAndUnProjectResult(
      Point(x: 1176972.287139605, y: 5231701.509203208),
      Point(x: 17.88805843897405, y: 46.8922640227178)),
  'EPSG:3201': ProjectAndUnProjectResult(
      Point(x: 720054.9017458203, y: 5197266.4752174495),
      Point(x: 17.888058563791315, y: 46.89226406243074)),
  'EPSG:3202': ProjectAndUnProjectResult(
      Point(x: 262971.6628879871, y: 5197915.8978446275),
      Point(x: 17.888058563741893, y: 46.89226406240126)),
  'EPSG:3203': ProjectAndUnProjectResult(
      Point(x: -193932.36923983018, y: 5233662.684987512),
      Point(x: 17.888058721904446, y: 46.89226401694902)),
  'EPSG:3204': ProjectAndUnProjectResult(
      Point(x: 25066432.253421612, y: 7151955.946894791),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3205': ProjectAndUnProjectResult(
      Point(x: 23323815.20985978, y: 11639421.971816815),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3206': ProjectAndUnProjectResult(
      Point(x: 20785721.617491703, y: 15729916.612043316),
      Point(x: 17.888058560281518, y: 46.89226406700873)),
  'EPSG:3207': ProjectAndUnProjectResult(
      Point(x: -12052973.866507681, y: -24271874.65087082),
      Point(x: 17.888058560281486, y: 46.89226406700873)),
  'EPSG:3208': ProjectAndUnProjectResult(
      Point(x: 26366664.576902073, y: 6260756.917772714),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3209': ProjectAndUnProjectResult(
      Point(x: 24694733.172770705, y: 11161013.915409265),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3210': ProjectAndUnProjectResult(
      Point(x: -10164627.588845657, y: 25121274.33221449),
      Point(x: 17.888058560281518, y: 46.89226406700873)),
  'EPSG:3211': ProjectAndUnProjectResult(
      Point(x: -14756779.039045539, y: 22729618.353309125),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3212': ProjectAndUnProjectResult(
      Point(x: -18810260.96647724, y: 19508258.775896005),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3213': ProjectAndUnProjectResult(
      Point(x: -22177108.346414044, y: 15574785.50368234),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3214': ProjectAndUnProjectResult(
      Point(x: -24734420.506115302, y: 11072782.862540206),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3215': ProjectAndUnProjectResult(
      Point(x: -26388847.39154885, y: 6166588.314444775),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:9017': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:3216': ProjectAndUnProjectResult(
      Point(x: -27079997.14223665, y: 1035293.6157229327),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3217': ProjectAndUnProjectResult(
      Point(x: -26782640.58686839, y: -4133792.6035218327),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:3218': ProjectAndUnProjectResult(
      Point(x: -25507632.188558858, y: -9151982.20209688),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3219': ProjectAndUnProjectResult(
      Point(x: -23301513.822308376, y: -13836095.246964507),
      Point(x: 17.88805856028146, y: 46.89226406700873)),
  'EPSG:3220': ProjectAndUnProjectResult(
      Point(x: -20244815.848053504, y: -18015146.66531206),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3221': ProjectAndUnProjectResult(
      Point(x: 25990281.16802446, y: -10854991.565167855),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3222': ProjectAndUnProjectResult(
      Point(x: 27611245.951654006, y: -5562791.93122503),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3223': ProjectAndUnProjectResult(
      Point(x: 28165980.28820513, y: -55780.617352245325),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3224': ProjectAndUnProjectResult(
      Point(x: 27633062.66556257, y: 5453384.7098773355),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3225': ProjectAndUnProjectResult(
      Point(x: 15638727.285663286, y: 23425536.6204807),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3226': ProjectAndUnProjectResult(
      Point(x: 10755720.571876656, y: 26031519.971998196),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3227': ProjectAndUnProjectResult(
      Point(x: 5457373.066367603, y: 27632275.264395382),
      Point(x: 17.888058560281518, y: 46.89226406700871)),
  'EPSG:3228': ProjectAndUnProjectResult(
      Point(x: -51715.284904636, y: 28165988.04590634),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:3229': ProjectAndUnProjectResult(
      Point(x: -5558806.608898887, y: 27612048.568653747),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3230': ProjectAndUnProjectResult(
      Point(x: -10851240.149386862, y: 25991847.65062242),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:3231': ProjectAndUnProjectResult(
      Point(x: -15724644.332920264, y: 23367950.65203601),
      Point(x: 17.888058560281518, y: 46.892264067008725)),
  'EPSG:3232': ProjectAndUnProjectResult(
      Point(x: -19990828.74134481, y: 19841681.46370297),
      Point(x: 17.888058560281518, y: 46.892264067008725)),
  'EPSG:3233': ProjectAndUnProjectResult(
      Point(x: -23485051.23600155, y: 15549209.803562805),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:9019': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:3234': ProjectAndUnProjectResult(
      Point(x: -26072379.607775677, y: 10656292.913620332),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3235': ProjectAndUnProjectResult(
      Point(x: -27652902.09276468, y: 5351874.710865592),
      Point(x: 17.8880585602815, y: 46.892264067008725)),
  'EPSG:3236': ProjectAndUnProjectResult(
      Point(x: -28165585.545317043, y: -159210.43389043925),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3237': ProjectAndUnProjectResult(
      Point(x: -27590632.281989515, y: -5664147.539821861),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3238': ProjectAndUnProjectResult(
      Point(x: -25950244.585000012, y: -10950359.03756172),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3239': ProjectAndUnProjectResult(
      Point(x: -23307767.34326102, y: -15813713.622841641),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3240': ProjectAndUnProjectResult(
      Point(x: -19765241.938598897, y: -20066408.950818367),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3241': ProjectAndUnProjectResult(
      Point(x: -15459465.835807992, y: -23544223.77451246),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:3242': ProjectAndUnProjectResult(
      Point(x: 7915976.904349618, y: -28130001.131981343),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3243': ProjectAndUnProjectResult(
      Point(x: 15924849.697899364, y: -24502220.63680724),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3244': ProjectAndUnProjectResult(
      Point(x: 22492160.213056713, y: -18656430.070773367),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3245': ProjectAndUnProjectResult(
      Point(x: 27023416.992210645, y: -11121806.872112503),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3246': ProjectAndUnProjectResult(
      Point(x: 29108437.900493056, y: -2580406.3688898585),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3247': ProjectAndUnProjectResult(
      Point(x: 28558480.96871375, y: 6194579.791647082),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3248': ProjectAndUnProjectResult(
      Point(x: 19986787.255225956, y: 21318723.912321888),
      Point(x: 17.888058560281507, y: 46.892264067008725)),
  'EPSG:3249': ProjectAndUnProjectResult(
      Point(x: 12740984.347538726, y: 26298801.719683748),
      Point(x: 17.888058560281518, y: 46.89226406700872)),
  'EPSG:3250': ProjectAndUnProjectResult(
      Point(x: 4341831.6266081985, y: 28898237.872950878),
      Point(x: 17.888058560281518, y: 46.892264067008725)),
  'EPSG:3251': ProjectAndUnProjectResult(
      Point(x: -4450355.930492564, y: 28881724.085092243),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:3252': ProjectAndUnProjectResult(
      Point(x: -12839684.7255628, y: 26250755.23072845),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:3253': ProjectAndUnProjectResult(
      Point(x: -20066729.070986774, y: 21243494.025867827),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3254': ProjectAndUnProjectResult(
      Point(x: -25477276.543396596, y: 14313211.867598465),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3255': ProjectAndUnProjectResult(
      Point(x: -28581549.136114668, y: 6087257.429691194),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:3256': ProjectAndUnProjectResult(
      Point(x: -29098539.344743643, y: -2689732.707514648),
      Point(x: 17.8880585602815, y: 46.89226406700872)),
  'EPSG:3257': ProjectAndUnProjectResult(
      Point(x: -26981447.758476138, y: -11223240.659100695),
      Point(x: 17.888058560281486, y: 46.892264067008725)),
  'EPSG:3258': ProjectAndUnProjectResult(
      Point(x: -22421919.474663854, y: -18740789.23383852),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3259': ProjectAndUnProjectResult(
      Point(x: -15832695.844459012, y: -24561868.74674479),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3260': ProjectAndUnProjectResult(
      Point(x: -5079505.619102587, y: -29787133.712741956),
      Point(x: 17.888058560281486, y: 46.892264067008725)),
  'EPSG:3261': ProjectAndUnProjectResult(
      Point(x: 11140937.19215027, y: -28088329.08230438),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3262': ProjectAndUnProjectResult(
      Point(x: 21408794.86977613, y: -21324591.77520429),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3263': ProjectAndUnProjectResult(
      Point(x: 28132015.648163404, y: -11030159.007319545),
      Point(x: 17.8880585602815, y: 46.892264067008725)),
  'EPSG:3264': ProjectAndUnProjectResult(
      Point(x: 30197441.285675492, y: 1090528.2909876592),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3265': ProjectAndUnProjectResult(
      Point(x: 27263100.925386924, y: 13030657.699726043),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:3266': ProjectAndUnProjectResult(
      Point(x: 19814830.93404658, y: 22813311.623050563),
      Point(x: 17.888058560281518, y: 46.892264067008725)),
  'EPSG:3267': ProjectAndUnProjectResult(
      Point(x: 9085835.366688324, y: 28818783.94111554),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:3268': ProjectAndUnProjectResult(
      Point(x: -3147494.634115184, y: 30052753.445956983),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:3269': ProjectAndUnProjectResult(
      Point(x: -14859696.486972794, y: 26310912.8019214),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3270': ProjectAndUnProjectResult(
      Point(x: -24111590.377630733, y: 18212795.54644504),
      Point(x: 17.888058560281507, y: 46.892264067008725)),
  'EPSG:3271': ProjectAndUnProjectResult(
      Point(x: -29371347.69676528, y: 7099200.421947815),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3272': ProjectAndUnProjectResult(
      Point(x: -29768114.667325903, y: -5189803.590522423),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:3273': ProjectAndUnProjectResult(
      Point(x: -25236198.902010895, y: -16619536.008367002),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3274': ProjectAndUnProjectResult(
      Point(x: -16525946.03884843, y: -25297585.25386036),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3275': ProjectAndUnProjectResult(
      Point(x: -2626837.3094702517, y: -42025122.184959166),
      Point(x: 17.888058560281486, y: 46.892264067008796)),
  'EPSG:3276': ProjectAndUnProjectResult(
      Point(x: 22104681.510286804, y: -33899868.49320108),
      Point(x: 17.88805856028151, y: 46.89226406700877)),
  'EPSG:3277': ProjectAndUnProjectResult(
      Point(x: 33301399.052557427, y: -14150126.260992123),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:3278': ProjectAndUnProjectResult(
      Point(x: 31462597.968168505, y: 4053492.064715128),
      Point(x: 17.888058560281525, y: 46.892264067008796)),
  'EPSG:3576': ProjectAndUnProjectResult(
      Point(x: -4467414.170635901, y: -1441907.3090332332),
      Point(x: 17.88805856028151, y: 46.89226406911223)),
  'EPSG:3279': ProjectAndUnProjectResult(
      Point(x: 23150261.113035463, y: 16319003.929201927),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:3280': ProjectAndUnProjectResult(
      Point(x: 12471924.843447963, y: 23104122.077209495),
      Point(x: 17.88805856028152, y: 46.892264067008796)),
  'EPSG:3281': ProjectAndUnProjectResult(
      Point(x: 1103852.2551319317, y: 25470665.800847154),
      Point(x: 17.888058560281515, y: 46.892264067008796)),
  'EPSG:3282': ProjectAndUnProjectResult(
      Point(x: -10309393.687707765, y: 23878475.35928181),
      Point(x: 17.888058560281518, y: 46.89226406700877)),
  'EPSG:3283': ProjectAndUnProjectResult(
      Point(x: -21202208.554394092, y: 18014079.9791714),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:3284': ProjectAndUnProjectResult(
      Point(x: -30192603.849358, y: 6892130.713762165),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:3285': ProjectAndUnProjectResult(
      Point(x: -33751773.048849516, y: -10268502.196978046),
      Point(x: 17.88805856028151, y: 46.892264067008824)),
  'EPSG:3286': ProjectAndUnProjectResult(
      Point(x: -25511536.266271953, y: -30503614.806282505),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:3287': ProjectAndUnProjectResult(
      Point(x: 10784254.570625905, y: -40361186.90605476),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:3288': ProjectAndUnProjectResult(
      Point(x: 33578755.47565658, y: -4388836.8107325),
      Point(x: 17.888058560281525, y: 46.892264067008796)),
  'EPSG:3289': ProjectAndUnProjectResult(
      Point(x: 17963688.375040907, y: 20321341.841684457),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:3290': ProjectAndUnProjectResult(
      Point(x: -4625063.11851251, y: 25170834.079063877),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:3291': ProjectAndUnProjectResult(
      Point(x: -26086446.762597557, y: 13186002.111183606),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:3292': ProjectAndUnProjectResult(
      Point(x: -31533030.537370343, y: -20511507.72833474),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:3293': ProjectAndUnProjectResult(
      Point(x: 6822587.382640078, y: 24793123.719373565),
      Point(x: 17.88805856028152, y: 46.892264067008796)),
  'EPSG:3294': ProjectAndUnProjectResult(
      Point(x: -19026280.71559294, y: -24834579.9604708),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:3296': ProjectAndUnProjectResult(
      Point(x: -61735463.176954165, y: -28016594.951940276),
      Point(x: -86.6465565062472, y: -89.99999039506186)),
  'EPSG:3297': ProjectAndUnProjectResult(
      Point(x: -47240401.012996905, y: -12681661.900930036),
      Point(x: -86.6465565062472, y: -89.99999039506186)),
  'EPSG:3298': ProjectAndUnProjectResult(
      Point(x: -35393329.646095246, y: -1254055.9244119413),
      Point(x: -86.6465565062472, y: -89.99999039506186)),
  'EPSG:3299': ProjectAndUnProjectResult(
      Point(x: -25785989.10306636, y: 7079427.632138512),
      Point(x: double.nan, y: double.nan)),
  'EPSG:3300': ProjectAndUnProjectResult(
      Point(x: 25839.563645003887, y: 5205792.531377736),
      Point(x: 17.88805856028127, y: 46.89226406700888)),
  'EPSG:3301': ProjectAndUnProjectResult(
      Point(x: 25838.491262051102, y: 5205792.771843453),
      Point(x: 17.888058560281515, y: 46.89226406700873)),
  'EPSG:3302': ProjectAndUnProjectResult(
      Point(x: -35390770.97883007, y: -1264997.329977367),
      Point(x: 21.684279511380645, y: -89.9967410921108)),
  'EPSG:3303': ProjectAndUnProjectResult(
      Point(x: -35348198.75874902, y: -1257214.812359048),
      Point(x: 178.95069879385608, y: -89.9835963167484)),
  'EPSG:3304': ProjectAndUnProjectResult(
      Point(x: -47236120.84229232, y: -12682927.269916963),
      Point(x: 16.72849264240772, y: -89.99752868231589)),
  'EPSG:3305': ProjectAndUnProjectResult(
      Point(x: -47235881.245043844, y: -12682415.433746733),
      Point(x: 10.383541988888735, y: -89.99756364633852)),
  'EPSG:3306': ProjectAndUnProjectResult(
      Point(x: -61729546.77380761, y: -28025035.69683808),
      Point(x: 21.834218758086283, y: -89.99790673911238)),
  'EPSG:3307': ProjectAndUnProjectResult(
      Point(x: -2005500.502904219, y: 5751899.89571239),
      Point(x: 17.930935645172486, y: 46.897081131244555)),
  'EPSG:3308': ProjectAndUnProjectResult(
      Point(x: -12032145.999217626, y: 2197042.8317936016),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3309': ProjectAndUnProjectResult(
      Point(x: 7280996.841594052, y: 7461281.7510663625),
      Point(x: 17.88805856028151, y: 46.892264047823176)),
  'EPSG:3310': ProjectAndUnProjectResult(
      Point(x: 7281011.174753069, y: 7461253.495639747),
      Point(x: 17.88805856028151, y: 46.89226406700877)),
  'EPSG:3311': ProjectAndUnProjectResult(
      Point(x: 7281011.174753069, y: 7461253.495639747),
      Point(x: 17.88805856028151, y: 46.89226406700877)),
  'EPSG:3312': ProjectAndUnProjectResult(
      Point(x: 5518315.136613884, y: 8497907.967102254),
      Point(x: 45, y: double.nan)),
  'EPSG:3313': ProjectAndUnProjectResult(
      Point(x: 5518117.362620078, y: 8498017.126823647),
      Point(x: -33811.09013364492, y: 7380.196889868285)),
  'EPSG:3314': ProjectAndUnProjectResult(
      Point(x: -1055285.432354479, y: 6401037.133927785),
      Point(x: 17.888058574909916, y: 46.89226391727645)),
  'EPSG:3315': ProjectAndUnProjectResult(
      Point(x: -617944.0258468045, y: 6221382.2504441235),
      Point(x: 17.88805862648417, y: 46.89226389324595)),
  'EPSG:3316': ProjectAndUnProjectResult(
      Point(x: 186686.6636181362, y: 15203001.834715065),
      Point(x: 17.888058560221207, y: 46.89226403015354)),
  'EPSG:3317': ProjectAndUnProjectResult(
      Point(x: 34327.24022968224, y: 15212954.069742147),
      Point(x: 17.888058563083174, y: 46.89226402593301)),
  'EPSG:4579': ProjectAndUnProjectResult(
      Point(x: -3671578.659419, y: 7001646.258530278),
      Point(x: 66.46970363157362, y: 55.685356944014764)),
  'EPSG:3318': ProjectAndUnProjectResult(
      Point(x: 948619.1450499085, y: 15211645.39685935),
      Point(x: 17.888058558454585, y: 46.89226402685545)),
  'EPSG:3319': ProjectAndUnProjectResult(
      Point(x: 796256.1471057797, y: 15202130.988102555),
      Point(x: 17.88805856034169, y: 46.89226403027896)),
  'EPSG:3320': ProjectAndUnProjectResult(
      Point(x: 643868.8332100438, y: 15196517.53453229),
      Point(x: 17.88805856028415, y: 46.89226403059007)),
  'EPSG:3321': ProjectAndUnProjectResult(
      Point(x: 491470.03549351613, y: 15194792.635503057),
      Point(x: 17.888058560281515, y: 46.89226403059423)),
  'EPSG:3322': ProjectAndUnProjectResult(
      Point(x: 339071.9127455106, y: 15196952.477118291),
      Point(x: 17.888058560276875, y: 46.89226403058609)),
  'EPSG:3323': ProjectAndUnProjectResult(
      Point(x: 186686.6636181362, y: 15203001.834715065),
      Point(x: 17.888058560221207, y: 46.89226403015354)),
  'EPSG:3324': ProjectAndUnProjectResult(
      Point(x: 34327.24022968224, y: 15212954.069742147),
      Point(x: 17.888058563083174, y: 46.89226402593301)),
  'EPSG:3325': ProjectAndUnProjectResult(
      Point(x: -117991.93070256803, y: 15226831.120450601),
      Point(x: 17.88805861175282, y: 46.89226400643564)),
  'EPSG:3326': ProjectAndUnProjectResult(
      Point(x: -270254.2120697646, y: 15244663.484771553),
      Point(x: 17.888058984926975, y: 46.892263950533305)),
  'EPSG:3345': ProjectAndUnProjectResult(
      Point(x: 2088186.225893158, y: 5409193.676598077),
      Point(x: 17.88765211923516, y: 46.89228755974916)),
  'EPSG:3327': ProjectAndUnProjectResult(
      Point(x: -422439.99878881604, y: 15266490.192710988),
      Point(x: 17.888060884008283, y: 46.89226385259459)),
  'EPSG:3328': ProjectAndUnProjectResult(
      Point(x: 402506.7856733964, y: -86004.79593155836),
      Point(x: 17.888058572338835, y: 46.89226406879691)),
  'EPSG:3329': ProjectAndUnProjectResult(
      Point(x: 5720215.259152802, y: 5199459.086602302),
      Point(x: 17.88805857235939, y: 46.89226406874446)),
  'EPSG:3330': ProjectAndUnProjectResult(
      Point(x: 6491592.8664638065, y: 5195409.057455721),
      Point(x: 17.888058572338835, y: 46.892264068796905)),
  'EPSG:3331': ProjectAndUnProjectResult(
      Point(x: 7262971.978117633, y: 5200102.372851052),
      Point(x: 17.888058572310474, y: 46.8922640687154)),
  'EPSG:3332': ProjectAndUnProjectResult(
      Point(x: 8034394.508663201, y: 5213562.372602202),
      Point(x: 17.88805857517946, y: 46.892264064220754)),
  'EPSG:3333': ProjectAndUnProjectResult(
      Point(x: 3720215.2591528012, y: 5199459.086602302),
      Point(x: 17.888058572359384, y: 46.89226406874446)),
  'EPSG:3334': ProjectAndUnProjectResult(
      Point(x: 4262971.978117633, y: 5200102.372851052),
      Point(x: 17.888058572310474, y: 46.8922640687154)),
  'EPSG:3335': ProjectAndUnProjectResult(
      Point(x: 4805908.013583425, y: 5235855.842461305),
      Point(x: 17.888058730440267, y: 46.89226402351891)),
  'EPSG:3336': ProjectAndUnProjectResult(
      Point(x: -3285584.1671327204, y: 16607021.600969851),
      Point(x: 26.45060222505478, y: 48.31343513168791)),
  'EPSG:3338': ProjectAndUnProjectResult(
      Point(x: 2704046.3736966117, y: 9181485.899239805),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3339': ProjectAndUnProjectResult(
      Point(x: 948736.018879219, y: 15211662.523968946),
      Point(x: 17.888058571306285, y: 46.892264093084535)),
  'EPSG:3340': ProjectAndUnProjectResult(
      Point(x: 796373.2574316089, y: 15202145.101290386),
      Point(x: 17.88805857319896, y: 46.89226409651302)),
  'EPSG:3341': ProjectAndUnProjectResult(
      Point(x: 643986.1687837165, y: 15196528.645945756),
      Point(x: 17.888058573141397, y: 46.892264096824874)),
  'EPSG:3342': ProjectAndUnProjectResult(
      Point(x: 720115.8665552917, y: 15197290.418284832),
      Point(x: 17.888058573160055, y: 46.892264096775754)),
  'EPSG:3343': ProjectAndUnProjectResult(
      Point(x: 2988896.0169453374, y: 5744023.033448553),
      Point(x: 17.848196835452992, y: 46.89671142260442)),
  'EPSG:3344': ProjectAndUnProjectResult(
      Point(x: 2540720.5313290567, y: 5555692.513083512),
      Point(x: 17.883147133968766, y: 46.89269979625903)),
  'EPSG:3346': ProjectAndUnProjectResult(
      Point(x: 34368.35104356846, y: 5212395.955506003),
      Point(x: 17.888058563129828, y: 46.892264062424815)),
  'EPSG:3347': ProjectAndUnProjectResult(
      Point(x: 11031109.518585373, y: 6836755.258922908),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3348': ProjectAndUnProjectResult(
      Point(x: 11031109.518585373, y: 6836755.258922908),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3349': ProjectAndUnProjectResult(
      Point(x: 18689213.18920183, y: 5893297.075909311),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3350': ProjectAndUnProjectResult(
      Point(x: -59414.37916993268, y: 5192362.31648339),
      Point(x: 17.888058570116137, y: 46.89226406804821)),
  'EPSG:3351': ProjectAndUnProjectResult(
      Point(x: 712031.6335790958, y: 5208610.178109246),
      Point(x: 17.888058583240415, y: 46.89226405777175)),
  'EPSG:3352': ProjectAndUnProjectResult(
      Point(x: 1483585.748638447, y: 5233721.696957675),
      Point(x: 17.88805897567233, y: 46.89226399200145)),
  'EPSG:3353': ProjectAndUnProjectResult(
      Point(x: 1176912.664618199, y: 15231864.35310246),
      Point(x: 17.888058435548967, y: 46.8922640533178)),
  'EPSG:3354': ProjectAndUnProjectResult(
      Point(x: 1176912.664618199, y: 15231864.35310246),
      Point(x: 17.888058435548967, y: 46.8922640533178)),
  'EPSG:3355': ProjectAndUnProjectResult(
      Point(x: -383784.54290119535, y: 2769255.2682439834),
      Point(x: 17.888063467962947, y: 46.892263858774484)),
  'EPSG:3356': ProjectAndUnProjectResult(
      Point(x: 5019379.247384459, y: 11043955.065641468),
      Point(x: 67.37067473281468, y: 89.99832277875188)),
  'EPSG:3357': ProjectAndUnProjectResult(
      Point(x: 5019656.189583162, y: 11044647.487448085),
      Point(x: -147.13337001567663, y: 89.99933128624545)),
  'EPSG:3358': ProjectAndUnProjectResult(
      Point(x: 7013164.842371999, y: 4867653.736840957),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3359': ProjectAndUnProjectResult(
      Point(x: 23009071.002540804, y: 15969992.574937522),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3360': ProjectAndUnProjectResult(
      Point(x: 7231101.448544078, y: 5119305.1873058975),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3361': ProjectAndUnProjectResult(
      Point(x: 23724086.117270596, y: 16795620.69326082),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:3362': ProjectAndUnProjectResult(
      Point(x: 6522469.313095474, y: 4396559.711847568),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3363': ProjectAndUnProjectResult(
      Point(x: 21399134.738047402, y: 14424379.654619897),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3364': ProjectAndUnProjectResult(
      Point(x: 6583746.193120701, y: 4440183.096793512),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3365': ProjectAndUnProjectResult(
      Point(x: 21600173.968596835, y: 14567500.710063381),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3366': ProjectAndUnProjectResult(
      Point(x: -6292484.848644223, y: 9166740.961036524),
      Point(x: -78.49319663914245, y: -17.124395706761387)),
  'EPSG:3367': ProjectAndUnProjectResult(
      Point(x: 2988853.9655160126, y: 5744078.669052498),
      Point(x: 17.848193246526034, y: 46.89671010445272)),
  'EPSG:3368': ProjectAndUnProjectResult(
      Point(x: 2540689.9359594667, y: 5555742.024561414),
      Point(x: 17.883147068514432, y: 46.8926992677133)),
  'EPSG:3369': ProjectAndUnProjectResult(
      Point(x: 2088164.6801670862, y: 5409237.98513725),
      Point(x: 17.8876521804974, y: 46.89228740565478)),
  'EPSG:3370': ProjectAndUnProjectResult(
      Point(x: 27107442.378677644, y: -3188819.666916854),
      Point(x: -135, y: double.nan)),
  'EPSG:3371': ProjectAndUnProjectResult(
      Point(x: 36790914.623916954, y: -11626122.648703013),
      Point(x: 0, y: -90)),
  'EPSG:3372': ProjectAndUnProjectResult(
      Point(x: 27108574.549169235, y: -3184231.5325187673),
      Point(x: -103767.21820745963, y: -188871.77584872008)),
  'EPSG:3373': ProjectAndUnProjectResult(
      Point(x: 36792794.61949032, y: -11620286.792548649), Point(x: 0, y: -90)),
  'EPSG:3375': ProjectAndUnProjectResult(
      Point(x: -5316992.27272053, y: 6970349.875876519),
      Point(x: 17.8880585602815, y: 46.89226406700872)),
  'EPSG:3376': ProjectAndUnProjectResult(
      Point(x: -20667926.15717817, y: 7397843.038706061),
      Point(x: 17.888058560281486, y: 46.89226406700866)),
  'EPSG:3377': ProjectAndUnProjectResult(
      Point(x: -5705379.234758854, y: 9716999.979202269),
      Point(x: 94692083409.60115, y: 5676562.371421338)),
  'EPSG:3378': ProjectAndUnProjectResult(
      Point(x: -5602862.580164545, y: 9443189.715987837),
      Point(x: 55719602.863625646, y: 63729.94375745346)),
  'EPSG:3379': ProjectAndUnProjectResult(
      Point(x: -5636618.162312897, y: 9386937.853361819),
      Point(x: 180421399.4631877, y: 130124.96319345839)),
  'EPSG:3380': ProjectAndUnProjectResult(
      Point(x: -5607595.484272222, y: 9314627.423811605),
      Point(x: 14355450.81207967, y: 27803.04191092491)),
  'EPSG:3381': ProjectAndUnProjectResult(
      Point(x: -5650253.512894152, y: 9346448.277887724),
      Point(x: 4441144281.598458, y: 900733.2604377113)),
  'EPSG:3382': ProjectAndUnProjectResult(
      Point(x: -5512661.1732170805, y: 8928688.985765466),
      Point(x: 2460159.551547343, y: 9298.755975760438)),
  'EPSG:3383': ProjectAndUnProjectResult(
      Point(x: -5529427.544852741, y: 8906674.954400184),
      Point(x: 3794590.2338328245, y: 12200.08423819763)),
  'EPSG:3413': ProjectAndUnProjectResult(
      Point(x: 4335895.047095751, y: -302799.18728261034),
      Point(x: 17.88805856028151, y: 46.89226406700877)),
  'EPSG:3384': ProjectAndUnProjectResult(
      Point(x: -5539729.187695043, y: 9185880.408929028),
      Point(x: 5049506.595575011, y: 14577.275165292263)),
  'EPSG:3385': ProjectAndUnProjectResult(
      Point(x: -5611801.979102653, y: 9135643.677975701),
      Point(x: 141899987.77163473, y: 112487.87681589273)),
  'EPSG:3386': ProjectAndUnProjectResult(
      Point(x: 491651.84826049313, y: 5195429.334983544),
      Point(x: 17.888058569538547, y: 46.892264085278)),
  'EPSG:3387': ProjectAndUnProjectResult(
      Point(x: 4349486.602413602, y: 5307438.843630845),
      Point(x: 17.88807715206505, y: 46.892264073559815)),
  'EPSG:3389': ProjectAndUnProjectResult(
      Point(x: 102468753.1875995, y: -16966271.673058722),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:3390': ProjectAndUnProjectResult(
      Point(x: 102468868.58776212, y: -16966057.215315938),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:3391': ProjectAndUnProjectResult(
      Point(x: -1104822.2425478345, y: 5413686.603402038),
      Point(x: 17.88850822826112, y: 46.892290606348894)),
  'EPSG:3392': ProjectAndUnProjectResult(
      Point(x: -1557244.8215218945, y: 5561671.40799943),
      Point(x: 17.893390714868918, y: 46.8927417854785)),
  'EPSG:3393': ProjectAndUnProjectResult(
      Point(x: -2005220.9784956514, y: 5751597.95431283),
      Point(x: 17.93087373704674, y: 46.897073596907575)),
  'EPSG:3395': ProjectAndUnProjectResult(
      Point(x: 1991289.5702107965, y: 5893297.075909311),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:3396': ProjectAndUnProjectResult(
      Point(x: 4177087.538008534, y: 5233165.822182404),
      Point(x: 17.88805843535868, y: 46.892264093608865)),
  'EPSG:3397': ProjectAndUnProjectResult(
      Point(x: 4948619.814255216, y: 5211532.968062555),
      Point(x: 17.888058558410155, y: 46.892264129373)),
  'EPSG:3398': ProjectAndUnProjectResult(
      Point(x: 4948619.814255216, y: 5211532.968062555),
      Point(x: 17.888058558410155, y: 46.892264129373)),
  'EPSG:3399': ProjectAndUnProjectResult(
      Point(x: 5720065.001582181, y: 5198725.952166574),
      Point(x: 17.888058560301882, y: 46.89226413298655)),
  'EPSG:3400': ProjectAndUnProjectResult(
      Point(x: -5717776.119356243, y: 10259186.452845959), Point(x: 0, y: 90)),
  'EPSG:3401': ProjectAndUnProjectResult(
      Point(x: -6217776.119356243, y: 10259186.452845959), Point(x: 0, y: 90)),
  'EPSG:3402': ProjectAndUnProjectResult(
      Point(x: -5717776.119356243, y: 10259186.452845959), Point(x: 0, y: 90)),
  'EPSG:3403': ProjectAndUnProjectResult(
      Point(x: -6217776.119356243, y: 10259186.452845959), Point(x: 0, y: 90)),
  'EPSG:3404': ProjectAndUnProjectResult(
      Point(x: 23009024.984398805, y: 15969960.634952374),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:3405': ProjectAndUnProjectResult(
      Point(x: -4622050.158160007, y: 9778105.069422388),
      Point(x: double.nan, y: double.nan)),
  'EPSG:3406': ProjectAndUnProjectResult(
      Point(x: -4425799.903473968, y: 10435218.105899157),
      Point(x: -168.37939778999916, y: 89.99824032468668)),
  'EPSG:3407': ProjectAndUnProjectResult(
      Point(x: -20644820.551084325, y: 30074879.277563635),
      Point(x: -78.49319663914245, y: -17.124395706761387)),
  'EPSG:3411': ProjectAndUnProjectResult(
      Point(x: 4335988.0113786, y: -302806.5645456136),
      Point(x: 17.888058560281515, y: 46.89226406679031)),
  'EPSG:3412': ProjectAndUnProjectResult(
      Point(x: 4983059.599090704, y: 20349383.884305336),
      Point(x: 17.888058560281515, y: 46.89226406679028)),
  'EPSG:3414': ProjectAndUnProjectResult(
      Point(x: -5112096.108141312, y: 9542168.098918451),
      Point(x: 1261949784.1230948, y: 276952866.8896538)),
  'EPSG:3415': ProjectAndUnProjectResult(
      Point(x: -7204353.301434718, y: 5865505.121917041),
      Point(x: 17.888058560281515, y: 46.892264066568394)),
  'EPSG:3416': ProjectAndUnProjectResult(
      Point(x: 746812.466775743, y: 342624.3366221152),
      Point(x: 17.888058560281515, y: 46.892264067008746)),
  'EPSG:3417': ProjectAndUnProjectResult(
      Point(x: 25440189.887127113, y: 21133297.2926685),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3418': ProjectAndUnProjectResult(
      Point(x: 22584121.62016271, y: 18118492.88647239),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3419': ProjectAndUnProjectResult(
      Point(x: 23202013.512833614, y: 19421226.757199746),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:3420': ProjectAndUnProjectResult(
      Point(x: 23706301.067791585, y: 21180590.79599451),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3421': ProjectAndUnProjectResult(
      Point(x: -21020973.318616632, y: 46754238.25794514), Point(x: 0, y: 90)),
  'EPSG:3463': ProjectAndUnProjectResult(
      Point(x: 5625524.243963247, y: 4952785.35904863),
      Point(x: -21737319794.91784, y: 4757338589.640197)),
  'EPSG:3422': ProjectAndUnProjectResult(
      Point(x: -22468358.066907622, y: 39079941.46217176),
      Point(x: 189531435637.07315, y: 59487357072.499916)),
  'EPSG:3423': ProjectAndUnProjectResult(
      Point(x: -26068968.027379595, y: 30272865.938432105),
      Point(x: 53494776.36427391, y: 20053499.392547227)),
  'EPSG:3424': ProjectAndUnProjectResult(
      Point(x: 16771473.19291651, y: 19881470.240724005), Point(x: 0, y: 90)),
  'EPSG:3425': ProjectAndUnProjectResult(
      Point(x: 25440189.887127113, y: 21133297.2926685),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3426': ProjectAndUnProjectResult(
      Point(x: 22584121.62016271, y: 18118492.88647239),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3427': ProjectAndUnProjectResult(
      Point(x: 23202013.512833614, y: 19421226.757199746),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:3428': ProjectAndUnProjectResult(
      Point(x: 23706301.067791585, y: 21180590.79599451),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3429': ProjectAndUnProjectResult(
      Point(x: -21020973.318616632, y: 46754238.25794514), Point(x: 0, y: 90)),
  'EPSG:3430': ProjectAndUnProjectResult(
      Point(x: -22468358.066907622, y: 39079941.46217176),
      Point(x: 189531435637.07315, y: 59487357072.499916)),
  'EPSG:3431': ProjectAndUnProjectResult(
      Point(x: -26068968.027379595, y: 30272865.938432105),
      Point(x: 53494776.36427391, y: 20053499.392547227)),
  'EPSG:3432': ProjectAndUnProjectResult(
      Point(x: 16771473.19291651, y: 19881470.240724005), Point(x: 0, y: 90)),
  'EPSG:3433': ProjectAndUnProjectResult(
      Point(x: 23887239.314518936, y: 18694250.277860995),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3434': ProjectAndUnProjectResult(
      Point(x: 24415399.802238896, y: 20281166.659434237),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3435': ProjectAndUnProjectResult(
      Point(x: 12811889.12278986, y: 25117350.226620816), Point(x: 0, y: 90)),
  'EPSG:3436': ProjectAndUnProjectResult(
      Point(x: 13092484.923865333, y: 25555865.841472708), Point(x: 0, y: 90)),
  'EPSG:3437': ProjectAndUnProjectResult(
      Point(x: 17611813.210191824, y: 17528306.05463954), Point(x: 0, y: 90)),
  'EPSG:3881': ProjectAndUnProjectResult(
      Point(x: 26805790.968825404, y: 5235736.574560914),
      Point(x: 17.888058718641528, y: 46.892264021677924)),
  'EPSG:3438': ProjectAndUnProjectResult(
      Point(x: 16971851.915299885, y: 17984948.307937823), Point(x: 0, y: 90)),
  'EPSG:3439': ProjectAndUnProjectResult(
      Point(x: -2005663.1576885711, y: 5751645.122566836),
      Point(x: 17.930945136317163, y: 46.89708117813383)),
  'EPSG:3440': ProjectAndUnProjectResult(
      Point(x: -2446242.709452183, y: 5986762.705533587),
      Point(x: 18.16328759692206, y: 46.92856003870482)),
  'EPSG:3441': ProjectAndUnProjectResult(
      Point(x: 23887239.314518936, y: 18694250.277860995),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3442': ProjectAndUnProjectResult(
      Point(x: 24415399.802238896, y: 20281166.659434237),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3443': ProjectAndUnProjectResult(
      Point(x: 12811889.12278986, y: 25117350.226620816), Point(x: 0, y: 90)),
  'EPSG:3444': ProjectAndUnProjectResult(
      Point(x: 13092484.923865333, y: 25555865.841472708), Point(x: 0, y: 90)),
  'EPSG:3445': ProjectAndUnProjectResult(
      Point(x: 17611813.210191824, y: 17528306.05463954), Point(x: 0, y: 90)),
  'EPSG:3446': ProjectAndUnProjectResult(
      Point(x: 16971851.915299885, y: 17984948.307937823), Point(x: 0, y: 90)),
  'EPSG:3447': ProjectAndUnProjectResult(
      Point(x: 1177562.2460995112, y: -174450.21423480567),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:3449': ProjectAndUnProjectResult(
      Point(x: 5019695.054259717, y: 11044701.550245335), Point(x: 0, y: 90)),
  'EPSG:3450': ProjectAndUnProjectResult(
      Point(x: 5436818.00587551, y: 10410808.927574996), Point(x: 0, y: 90)),
  'EPSG:3451': ProjectAndUnProjectResult(
      Point(x: 27207965.058721785, y: 19397745.31127012),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3452': ProjectAndUnProjectResult(
      Point(x: 27757949.88951659, y: 19429241.351418473),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3453': ProjectAndUnProjectResult(
      Point(x: 28933630.503382377, y: 19794529.601754144),
      Point(x: 17.888058560281486, y: 46.89226406700874)),
  'EPSG:3454': ProjectAndUnProjectResult(
      Point(x: 22541676.56268013, y: 19406913.486204017),
      Point(x: 17.8880585602815, y: 46.892264067008746)),
  'EPSG:3455': ProjectAndUnProjectResult(
      Point(x: 22541676.56268013, y: 19406913.486204017),
      Point(x: 17.8880585602815, y: 46.892264067008746)),
  'EPSG:3456': ProjectAndUnProjectResult(
      Point(x: 27207965.058721785, y: 19397745.31127012),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3457': ProjectAndUnProjectResult(
      Point(x: 27757949.88951659, y: 19429241.351418473),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3458': ProjectAndUnProjectResult(
      Point(x: 22086296.488457482, y: 19050428.99191546),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:3459': ProjectAndUnProjectResult(
      Point(x: 22541676.56268013, y: 19406913.486204017),
      Point(x: 17.8880585602815, y: 46.892264067008746)),
  'EPSG:3460': ProjectAndUnProjectResult(
      Point(x: 41534985.39582845, y: -8759157.318267493), Point(x: 0, y: -90)),
  'EPSG:3461': ProjectAndUnProjectResult(
      Point(x: 2988856.582037813, y: 5743920.265944972),
      Point(x: 17.848205185661666, y: 46.89670904018824)),
  'EPSG:3462': ProjectAndUnProjectResult(
      Point(x: 2540679.084689201, y: 5555587.727476858),
      Point(x: 17.88314874018998, y: 46.89269917289242)),
  'EPSG:3464': ProjectAndUnProjectResult(
      Point(x: 5625524.243963247, y: 4952785.35904863),
      Point(x: -21737319794.91784, y: 4757338589.640197)),
  'EPSG:3465': ProjectAndUnProjectResult(
      Point(x: 4175252.6559100477, y: 8132636.419234506), Point(x: 0, y: 90)),
  'EPSG:3466': ProjectAndUnProjectResult(
      Point(x: 4335563.615183162, y: 8328698.3072116645), Point(x: 0, y: 90)),
  'EPSG:3467': ProjectAndUnProjectResult(
      Point(x: 2704046.3736966117, y: 9181485.899239805),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3468': ProjectAndUnProjectResult(
      Point(x: 6508725.5759530235, y: 4717646.787048834),
      Point(x: 17.88805856028155, y: 46.89226406700871)),
  'EPSG:3469': ProjectAndUnProjectResult(
      Point(x: -37213279.522647545, y: -18912875.961270504),
      Point(x: 0, y: -90)),
  'EPSG:3470': ProjectAndUnProjectResult(
      Point(x: -45107405.43757957, y: -26521048.301904406),
      Point(x: 0, y: -90)),
  'EPSG:3471': ProjectAndUnProjectResult(
      Point(x: -54145589.80520173, y: -35798007.60070698), Point(x: 0, y: -90)),
  'EPSG:3472': ProjectAndUnProjectResult(
      Point(x: -64460118.121024735, y: -47015897.944632985),
      Point(x: 0, y: -90)),
  'EPSG:3473': ProjectAndUnProjectResult(
      Point(x: -76195487.58152132, y: -60481645.41980923), Point(x: 0, y: -90)),
  'EPSG:3474': ProjectAndUnProjectResult(
      Point(x: -89509253.44187886, y: -76540389.67400539), Point(x: 0, y: -90)),
  'EPSG:3475': ProjectAndUnProjectResult(
      Point(x: 77897438.88146861, y: -61308557.825420626), Point(x: 0, y: -90)),
  'EPSG:3476': ProjectAndUnProjectResult(
      Point(x: 66078013.4794075, y: -47707169.16826724), Point(x: 0, y: -90)),
  'EPSG:3477': ProjectAndUnProjectResult(
      Point(x: -3067782.7230528235, y: 8760315.521445647),
      Point(x: 17.888058560281486, y: 46.89226406700873)),
  'EPSG:3478': ProjectAndUnProjectResult(
      Point(x: -4128150.708307095, y: 7585988.433132556), Point(x: 0, y: 90)),
  'EPSG:3479': ProjectAndUnProjectResult(
      Point(x: -13543801.5364406, y: 24888413.49452938), Point(x: 0, y: 90)),
  'EPSG:3480': ProjectAndUnProjectResult(
      Point(x: -3169861.026850693, y: 7913822.186592112), Point(x: 0, y: 90)),
  'EPSG:3481': ProjectAndUnProjectResult(
      Point(x: -10399806.518539019, y: 25963983.55181139), Point(x: 0, y: 90)),
  'EPSG:3482': ProjectAndUnProjectResult(
      Point(x: -5215796.690656631, y: 7168396.858414973), Point(x: 0, y: 90)),
  'EPSG:3483': ProjectAndUnProjectResult(
      Point(x: -17112193.866983697, y: 23518362.396374583), Point(x: 0, y: 90)),
  'EPSG:3484': ProjectAndUnProjectResult(
      Point(x: 7280845.10476574, y: 5698018.880729793),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3485': ProjectAndUnProjectResult(
      Point(x: 23887239.314518936, y: 18694250.277860995),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3486': ProjectAndUnProjectResult(
      Point(x: 7441828.743390062, y: 6181711.961229637),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3487': ProjectAndUnProjectResult(
      Point(x: 24415399.802238896, y: 20281166.659434237),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3488': ProjectAndUnProjectResult(
      Point(x: 7281011.174753069, y: 7461253.495639747),
      Point(x: 17.88805856028151, y: 46.89226406700877)),
  'EPSG:3489': ProjectAndUnProjectResult(
      Point(x: 8713369.04628296, y: 8228903.974584526),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3490': ProjectAndUnProjectResult(
      Point(x: 28587111.613013346, y: 26997662.4569494),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3491': ProjectAndUnProjectResult(
      Point(x: 8988852.870882323, y: 8299543.835321399),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3492': ProjectAndUnProjectResult(
      Point(x: 29490928.127553087, y: 27229420.066716958),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3493': ProjectAndUnProjectResult(
      Point(x: 9196533.03998033, y: 8221416.367224062),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3494': ProjectAndUnProjectResult(
      Point(x: 30172292.14900214, y: 26973096.865134276),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:3495': ProjectAndUnProjectResult(
      Point(x: 9364631.99275643, y: 8154335.033546976),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:3496': ProjectAndUnProjectResult(
      Point(x: 30723796.79656839, y: 26753014.189562038),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:3497': ProjectAndUnProjectResult(
      Point(x: 9657012.346788008, y: 8138321.005032831),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3498': ProjectAndUnProjectResult(
      Point(x: 31683048.00808699, y: 26700474.83101188),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3499': ProjectAndUnProjectResult(
      Point(x: 9857792.552179694, y: 8039982.800465539),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3500': ProjectAndUnProjectResult(
      Point(x: 32341774.398609553, y: 26377843.57152736),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:3501': ProjectAndUnProjectResult(
      Point(x: 7746779.736843174, y: 6828729.263310314),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3502': ProjectAndUnProjectResult(
      Point(x: 25415893.18631023, y: 22403922.591381256),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3503': ProjectAndUnProjectResult(
      Point(x: 7609906.701740923, y: 6737108.930826646),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3504': ProjectAndUnProjectResult(
      Point(x: 24966835.570312265, y: 22103331.550557755),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3513': ProjectAndUnProjectResult(
      Point(x: 7788718.898020689, y: 5738991.145189423),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:3505': ProjectAndUnProjectResult(
      Point(x: 7902404.853652807, y: 6873456.4247696595),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3506': ProjectAndUnProjectResult(
      Point(x: 25926473.257043168, y: 22550664.95360246),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3507': ProjectAndUnProjectResult(
      Point(x: 6039095.133709748, y: 4143749.064976011),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:3508': ProjectAndUnProjectResult(
      Point(x: 19813264.617850065, y: 13594950.05734413),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:3509': ProjectAndUnProjectResult(
      Point(x: 5117848.770438616, y: 6252732.387920412), Point(x: 0, y: 90)),
  'EPSG:3510': ProjectAndUnProjectResult(
      Point(x: 16790808.84134736, y: 20514172.84270222), Point(x: 0, y: 90)),
  'EPSG:3511': ProjectAndUnProjectResult(
      Point(x: 4721237.687280814, y: 8356420.754737286), Point(x: 0, y: 90)),
  'EPSG:3512': ProjectAndUnProjectResult(
      Point(x: 15489593.979353804, y: 27416023.75950058), Point(x: 0, y: 90)),
  'EPSG:3514': ProjectAndUnProjectResult(
      Point(x: 7714848.02247523, y: 5442253.479619011),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:3515': ProjectAndUnProjectResult(
      Point(x: 25311130.553737484, y: 17855126.624383375),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:3516': ProjectAndUnProjectResult(
      Point(x: 4625113.957471083, y: 8456488.815026179), Point(x: 0, y: 90)),
  'EPSG:3517': ProjectAndUnProjectResult(
      Point(x: 15174228.04246971, y: 27744330.38729839), Point(x: 0, y: 90)),
  'EPSG:3518': ProjectAndUnProjectResult(
      Point(x: 4608098.742447868, y: 7844758.075159398), Point(x: 0, y: 90)),
  'EPSG:3519': ProjectAndUnProjectResult(
      Point(x: 15118403.957847713, y: 25737343.784918793), Point(x: 0, y: 90)),
  'EPSG:3520': ProjectAndUnProjectResult(
      Point(x: 4887189.5243078265, y: 8036713.270922709), Point(x: 0, y: 90)),
  'EPSG:3521': ProjectAndUnProjectResult(
      Point(x: 16034054.29733326, y: 26367116.78968559), Point(x: 0, y: 90)),
  'EPSG:3554': ProjectAndUnProjectResult(
      Point(x: 5625524.243963247, y: 4952785.35904863),
      Point(x: -21737319794.91784, y: 4757338589.640197)),
  'EPSG:3522': ProjectAndUnProjectResult(
      Point(x: -5084440.623114015, y: 5921630.496325042), Point(x: 0, y: 90)),
  'EPSG:3523': ProjectAndUnProjectResult(
      Point(x: -16681202.277333234, y: 19427882.72002641), Point(x: 0, y: 90)),
  'EPSG:3524': ProjectAndUnProjectResult(
      Point(x: -4284867.971020522, y: 6350434.242753448), Point(x: 0, y: 90)),
  'EPSG:3525': ProjectAndUnProjectResult(
      Point(x: -14057937.667923164, y: 20834716.344766937), Point(x: 0, y: 90)),
  'EPSG:3526': ProjectAndUnProjectResult(
      Point(x: -5919234.386603765, y: 5433186.325411458), Point(x: 0, y: 90)),
  'EPSG:3527': ProjectAndUnProjectResult(
      Point(x: -19420021.483049188, y: 17825378.802620757), Point(x: 0, y: 90)),
  'EPSG:3528': ProjectAndUnProjectResult(
      Point(x: 3905071.6147695784, y: 7655783.660641345), Point(x: 0, y: 90)),
  'EPSG:3529': ProjectAndUnProjectResult(
      Point(x: 12811889.12278986, y: 25117350.226620816), Point(x: 0, y: 90)),
  'EPSG:3571': ProjectAndUnProjectResult(
      Point(x: -1441907.3090332334, y: 4467414.170635901),
      Point(x: 17.88805856028151, y: 46.892264069112215)),
  'EPSG:3530': ProjectAndUnProjectResult(
      Point(x: 3990597.385999085, y: 7789443.487367855), Point(x: 0, y: 90)),
  'EPSG:3531': ProjectAndUnProjectResult(
      Point(x: 13092484.923865333, y: 25555865.841472708), Point(x: 0, y: 90)),
  'EPSG:3532': ProjectAndUnProjectResult(
      Point(x: 4097701.446227201, y: 7591591.6682478), Point(x: 0, y: 90)),
  'EPSG:3533': ProjectAndUnProjectResult(
      Point(x: 13443875.494497076, y: 24906746.99790966), Point(x: 0, y: 90)),
  'EPSG:3534': ProjectAndUnProjectResult(
      Point(x: 4698254.479714725, y: 7712933.359383934), Point(x: 0, y: 90)),
  'EPSG:3535': ProjectAndUnProjectResult(
      Point(x: 15414189.905530728, y: 25304848.862912126), Point(x: 0, y: 90)),
  'EPSG:3536': ProjectAndUnProjectResult(
      Point(x: 7754185.385967116, y: 6441441.897699313),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3537': ProjectAndUnProjectResult(
      Point(x: 25440189.887127113, y: 21133297.2926685),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3538': ProjectAndUnProjectResult(
      Point(x: 6883654.037123509, y: 5522527.676852138),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3539': ProjectAndUnProjectResult(
      Point(x: 22584121.62016271, y: 18118492.88647239),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3540': ProjectAndUnProjectResult(
      Point(x: 7071987.862697571, y: 5919601.754797991),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:3541': ProjectAndUnProjectResult(
      Point(x: 23202013.512833614, y: 19421226.757199746),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:3542': ProjectAndUnProjectResult(
      Point(x: 7225695.016863069, y: 6455856.986343259),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3543': ProjectAndUnProjectResult(
      Point(x: 23706301.067791585, y: 21180590.79599451),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3544': ProjectAndUnProjectResult(
      Point(x: 6854798.276271999, y: 4982007.395728776),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3545': ProjectAndUnProjectResult(
      Point(x: 22489450.678402383, y: 16345135.930820161),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3546': ProjectAndUnProjectResult(
      Point(x: 7954314.818287251, y: 6181092.986200401),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3547': ProjectAndUnProjectResult(
      Point(x: 26096781.19966409, y: 20279135.905225817),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3548': ProjectAndUnProjectResult(
      Point(x: 7000500.0764196385, y: 5649813.9503045585),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:3549': ProjectAndUnProjectResult(
      Point(x: 22967474.00105343, y: 18536097.935624205),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:3550': ProjectAndUnProjectResult(
      Point(x: 8293004.335917232, y: 5912444.595764324),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3551': ProjectAndUnProjectResult(
      Point(x: 27207965.058721785, y: 19397745.31127012),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3552': ProjectAndUnProjectResult(
      Point(x: 8460640.04761491, y: 5922044.6080015665),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3553': ProjectAndUnProjectResult(
      Point(x: 27757949.88951659, y: 19429241.351418473),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3555': ProjectAndUnProjectResult(
      Point(x: 5841926.85039724, y: 4779293.471123142),
      Point(x: -856956604.9425999, y: 188140569.70074788)),
  'EPSG:3556': ProjectAndUnProjectResult(
      Point(x: 5401485.579875652, y: 5163842.641810937),
      Point(x: -11503948981851.02, y: 2505985965549.347)),
  'EPSG:3557': ProjectAndUnProjectResult(
      Point(x: 5434242.727510438, y: 4865567.286727372),
      Point(x: -3577911303.5949883, y: 784422263.488511)),
  'EPSG:3558': ProjectAndUnProjectResult(
      Point(x: 6005972.529556511, y: 5140915.469168544),
      Point(x: -2514978608650.738, y: 548342325600.6209)),
  'EPSG:3559': ProjectAndUnProjectResult(
      Point(x: 6458859.816901178, y: 4494509.018460154),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:3560': ProjectAndUnProjectResult(
      Point(x: 23401718.533635758, y: 25725063.605568122),
      Point(x: 17.888058560281525, y: 46.892264067008746)),
  'EPSG:3561': ProjectAndUnProjectResult(
      Point(x: -226509367.85061833, y: -157187120.40956476),
      Point(x: -77.91897303995458, y: -89.9973905988209)),
  'EPSG:3562': ProjectAndUnProjectResult(
      Point(x: -237763453.1298117, y: -170657720.7220814),
      Point(x: -77.91897303995458, y: -89.9973905988209)),
  'EPSG:3572': ProjectAndUnProjectResult(
      Point(x: 984978.7257927118, y: 4589847.815513896),
      Point(x: 17.88805856028151, y: 46.89226406911223)),
  'EPSG:3563': ProjectAndUnProjectResult(
      Point(x: -251152486.4530942, y: -186583351.1754257),
      Point(x: -77.91897303995458, y: -89.9973905988209)),
  'EPSG:3564': ProjectAndUnProjectResult(
      Point(x: -266897201.1541538, y: -205527944.67993367),
      Point(x: -77.91897303995458, y: -89.9973905988209)),
  'EPSG:3565': ProjectAndUnProjectResult(
      Point(x: -274138717.7977724, y: -214182199.98964313),
      Point(x: -77.91897303995458, y: -89.9973905988209)),
  'EPSG:3566': ProjectAndUnProjectResult(
      Point(x: 24004488.809627805, y: 29432890.76363637),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:3567': ProjectAndUnProjectResult(
      Point(x: 24918123.2297812, y: 32865520.033304103),
      Point(x: 17.88805856028155, y: 46.89226406700872)),
  'EPSG:3568': ProjectAndUnProjectResult(
      Point(x: 23401718.533635758, y: 25725063.605568122),
      Point(x: 17.888058560281525, y: 46.892264067008746)),
  'EPSG:3569': ProjectAndUnProjectResult(
      Point(x: 24004488.809627805, y: 29432890.76363637),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:3570': ProjectAndUnProjectResult(
      Point(x: 24918123.2297812, y: 32865520.033304103),
      Point(x: 17.88805856028155, y: 46.89226406700872)),
  'EPSG:3577': ProjectAndUnProjectResult(
      Point(x: -14998999.735860841, y: -3382655.442324089),
      Point(x: 17.888058560281525, y: 46.89226406700871)),
  'EPSG:3578': ProjectAndUnProjectResult(
      Point(x: 3966851.041648818, y: 7733236.104704684),
      Point(x: 17.88805856028151, y: 46.89226406700877)),
  'EPSG:3579': ProjectAndUnProjectResult(
      Point(x: 3966851.041648818, y: 7733236.104704684),
      Point(x: 17.88805856028151, y: 46.89226406700877)),
  'EPSG:3580': ProjectAndUnProjectResult(
      Point(x: 4380052.028530439, y: 14032309.962545056),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3581': ProjectAndUnProjectResult(
      Point(x: 4380052.028530439, y: 14032309.962545056),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3582': ProjectAndUnProjectResult(
      Point(x: 21190442.582283285, y: 14745735.004731355),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:3583': ProjectAndUnProjectResult(
      Point(x: 6154332.406766824, y: 3817884.2153315847),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3584': ProjectAndUnProjectResult(
      Point(x: 20191338.90486749, y: 12525841.796467042),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3709': ProjectAndUnProjectResult(
      Point(x: 63333518.09556754, y: -38676678.41783912), Point(x: 0, y: -90)),
  'EPSG:3585': ProjectAndUnProjectResult(
      Point(x: 5851118.614199274, y: 4670879.245324666),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:3586': ProjectAndUnProjectResult(
      Point(x: 19196544.98708545, y: 15324376.324036008),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:3587': ProjectAndUnProjectResult(
      Point(x: 11889319.027601004, y: 4694603.857861964),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:3588': ProjectAndUnProjectResult(
      Point(x: 39006952.19021326, y: 15402243.62815605),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3589': ProjectAndUnProjectResult(
      Point(x: 13856577.937746815, y: 4794610.454685856),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3590': ProjectAndUnProjectResult(
      Point(x: 45461213.70641344, y: 15730349.260780366),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3591': ProjectAndUnProjectResult(
      Point(x: 8386430.7898983145, y: 2796245.837725366),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3592': ProjectAndUnProjectResult(
      Point(x: 10027794.9275133, y: 4787933.322479354),
      Point(x: 17.8880585602815, y: 46.892264067008746)),
  'EPSG:3593': ProjectAndUnProjectResult(
      Point(x: 32899589.65714337, y: 15708442.659052998),
      Point(x: 17.8880585602815, y: 46.892264067008746)),
  'EPSG:3594': ProjectAndUnProjectResult(
      Point(x: 6763552.011142525, y: 5414428.169782657),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3595': ProjectAndUnProjectResult(
      Point(x: 6637522.089340442, y: 5241976.733282339),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3596': ProjectAndUnProjectResult(
      Point(x: 6907731.6671998175, y: 5516216.609642071),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3597': ProjectAndUnProjectResult(
      Point(x: 3822984.905080838, y: 8488545.1484227), Point(x: 0, y: 90)),
  'EPSG:3598': ProjectAndUnProjectResult(
      Point(x: 12542576.309419384, y: 27849501.87445014), Point(x: 0, y: 90)),
  'EPSG:3599': ProjectAndUnProjectResult(
      Point(x: 3960143.9403490187, y: 8595620.856387978), Point(x: 0, y: 90)),
  'EPSG:3600': ProjectAndUnProjectResult(
      Point(x: 12992572.243961738, y: 28200799.426332895), Point(x: 0, y: 90)),
  'EPSG:3601': ProjectAndUnProjectResult(
      Point(x: 3333355.4118026467, y: 8025679.559234873), Point(x: 0, y: 90)),
  'EPSG:3602': ProjectAndUnProjectResult(
      Point(x: 3479281.287680031, y: 7904330.11893151), Point(x: 0, y: 90)),
  'EPSG:3603': ProjectAndUnProjectResult(
      Point(x: 3236399.2997552953, y: 8083966.915915788), Point(x: 0, y: 90)),
  'EPSG:3604': ProjectAndUnProjectResult(
      Point(x: 6556297.784221025, y: 6590553.712986213),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3605': ProjectAndUnProjectResult(
      Point(x: 21510163.334050607, y: 21622551.551792037),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3606': ProjectAndUnProjectResult(
      Point(x: 6975000.373432801, y: 6039872.843451777),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:3607': ProjectAndUnProjectResult(
      Point(x: -6848369.235542074, y: 11911589.980849914),
      Point(x: 189531435637.07315, y: 59487357072.499916)),
  'EPSG:3608': ProjectAndUnProjectResult(
      Point(x: -22468358.066907622, y: 39079941.46217176),
      Point(x: 189531435637.07315, y: 59487357072.499916)),
  'EPSG:3609': ProjectAndUnProjectResult(
      Point(x: -6407205.481935473, y: 14250720.322452161), Point(x: 0, y: 90)),
  'EPSG:3610': ProjectAndUnProjectResult(
      Point(x: -21020973.318616632, y: 46754238.25794514), Point(x: 0, y: 90)),
  'EPSG:3611': ProjectAndUnProjectResult(
      Point(x: -7945837.346430153, y: 9227187.99242025),
      Point(x: 53494776.36427391, y: 20053499.392547227)),
  'EPSG:3612': ProjectAndUnProjectResult(
      Point(x: -26068968.027379595, y: 30272865.938432105),
      Point(x: 53494776.36427391, y: 20053499.392547227)),
  'EPSG:3613': ProjectAndUnProjectResult(
      Point(x: 5368091.402649273, y: 5342638.370730873), Point(x: 0, y: 90)),
  'EPSG:3614': ProjectAndUnProjectResult(
      Point(x: 17611813.210191824, y: 17528306.05463954), Point(x: 0, y: 90)),
  'EPSG:3615': ProjectAndUnProjectResult(
      Point(x: 5111955.253111458, y: 6059884.249141174), Point(x: 0, y: 90)),
  'EPSG:3616': ProjectAndUnProjectResult(
      Point(x: 16771473.19291651, y: 19881470.240724005), Point(x: 0, y: 90)),
  'EPSG:3617': ProjectAndUnProjectResult(
      Point(x: -998074.9727628597, y: 8428106.011472125), Point(x: 0, y: 90)),
  'EPSG:3618': ProjectAndUnProjectResult(
      Point(x: -3274517.639472816, y: 27651211.139304798), Point(x: 0, y: 90)),
  'EPSG:3619': ProjectAndUnProjectResult(
      Point(x: -530531.6564737859, y: 8584058.195630815), Point(x: 0, y: 90)),
  'EPSG:3620': ProjectAndUnProjectResult(
      Point(x: -1740585.942947746, y: 28162864.26349877), Point(x: 0, y: 90)),
  'EPSG:3621': ProjectAndUnProjectResult(
      Point(x: -1388949.665557478, y: 8254150.647986836), Point(x: 0, y: 90)),
  'EPSG:3622': ProjectAndUnProjectResult(
      Point(x: -4556912.360749827, y: 27080492.584270146), Point(x: 0, y: 90)),
  'EPSG:3623': ProjectAndUnProjectResult(
      Point(x: 5102989.244976103, y: 6156462.138120647), Point(x: 0, y: 90)),
  'EPSG:3624': ProjectAndUnProjectResult(
      Point(x: 16742057.214225767, y: 20198326.19815082), Point(x: 0, y: 90)),
  'EPSG:3625': ProjectAndUnProjectResult(
      Point(x: 5111955.253111458, y: 6059884.249141174), Point(x: 0, y: 90)),
  'EPSG:3626': ProjectAndUnProjectResult(
      Point(x: 16771473.19291651, y: 19881470.240724005), Point(x: 0, y: 90)),
  'EPSG:3643': ProjectAndUnProjectResult(
      Point(x: 6621080.326600361, y: 7550611.109639786),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3627': ProjectAndUnProjectResult(
      Point(x: 6120506.5914582675, y: 4115911.994870667),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3628': ProjectAndUnProjectResult(
      Point(x: 20080362.042142667, y: 13503621.26983818),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3629': ProjectAndUnProjectResult(
      Point(x: 5070627.948794095, y: 6369472.582025805), Point(x: 0, y: 90)),
  'EPSG:3630': ProjectAndUnProjectResult(
      Point(x: 16635885.195668627, y: 20897177.962862995), Point(x: 0, y: 90)),
  'EPSG:3631': ProjectAndUnProjectResult(
      Point(x: 7013164.842371999, y: 4867653.736840957),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3632': ProjectAndUnProjectResult(
      Point(x: 23009024.984398805, y: 15969960.634952374),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:3633': ProjectAndUnProjectResult(
      Point(x: 6465460.630965634, y: 5661785.323388806),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3634': ProjectAndUnProjectResult(
      Point(x: 21212141.1777009, y: 18575411.16597377),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3635': ProjectAndUnProjectResult(
      Point(x: 6573964.729929726, y: 5741275.293893124),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3636': ProjectAndUnProjectResult(
      Point(x: 21568125.75435474, y: 18836205.032457754),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3637': ProjectAndUnProjectResult(
      Point(x: 6701563.894453452, y: 4762473.447759279),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3638': ProjectAndUnProjectResult(
      Point(x: 6823927.076346041, y: 4856567.2808180135),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:3639': ProjectAndUnProjectResult(
      Point(x: 7606719.341866343, y: 6088830.052103923),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:3640': ProjectAndUnProjectResult(
      Point(x: 24956378.374106497, y: 19976436.59594429),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:3641': ProjectAndUnProjectResult(
      Point(x: 7788873.682746351, y: 6165418.092119623),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3642': ProjectAndUnProjectResult(
      Point(x: 25553996.407476988, y: 20227709.190562464),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3644': ProjectAndUnProjectResult(
      Point(x: 21722704.48359173, y: 24772346.160235517),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3645': ProjectAndUnProjectResult(
      Point(x: 8597033.820587108, y: 7390016.602283895),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3646': ProjectAndUnProjectResult(
      Point(x: 28205491.53782647, y: 24245461.29358233),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:3647': ProjectAndUnProjectResult(
      Point(x: 7874076.89548586, y: 7497850.224338042),
      Point(x: 17.88805856028154, y: 46.892264067008725)),
  'EPSG:3648': ProjectAndUnProjectResult(
      Point(x: 25833585.615591403, y: 24599246.142841343),
      Point(x: 17.88805856028154, y: 46.892264067008725)),
  'EPSG:3649': ProjectAndUnProjectResult(
      Point(x: 6522469.313095474, y: 4396559.711847568),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3650': ProjectAndUnProjectResult(
      Point(x: 21399134.738047402, y: 14424379.654619897),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3651': ProjectAndUnProjectResult(
      Point(x: 6583746.193120701, y: 4440183.096793512),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3652': ProjectAndUnProjectResult(
      Point(x: 21600173.968596835, y: 14567500.710063381),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3653': ProjectAndUnProjectResult(
      Point(x: 5173030.8098551845, y: 5481823.207905864), Point(x: 0, y: 90)),
  'EPSG:3654': ProjectAndUnProjectResult(
      Point(x: 16971851.915299885, y: 17984948.307937823), Point(x: 0, y: 90)),
  'EPSG:3655': ProjectAndUnProjectResult(
      Point(x: 7231101.448544078, y: 5119305.1873058975),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3656': ProjectAndUnProjectResult(
      Point(x: 23724086.117270596, y: 16795620.69326082),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:3657': ProjectAndUnProjectResult(
      Point(x: 6731916.633515107, y: 5806582.369900572),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:3658': ProjectAndUnProjectResult(
      Point(x: 22086296.488457482, y: 19050428.99191546),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:3659': ProjectAndUnProjectResult(
      Point(x: 6870716.757738419, y: 5915239.061073107),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3660': ProjectAndUnProjectResult(
      Point(x: 22541676.56268013, y: 19406913.486204017),
      Point(x: 17.8880585602815, y: 46.892264067008746)),
  'EPSG:3661': ProjectAndUnProjectResult(
      Point(x: 7240825.507643389, y: 5300270.815013457),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:3662': ProjectAndUnProjectResult(
      Point(x: 23755941.686326686, y: 17389305.165589985),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:3663': ProjectAndUnProjectResult(
      Point(x: 8418734.087582087, y: 9472776.726556078),
      Point(x: 17.88805856028155, y: 46.892264067008746)),
  'EPSG:3664': ProjectAndUnProjectResult(
      Point(x: 27620463.418675568, y: 31078601.6437094),
      Point(x: 17.88805856028155, y: 46.892264067008746)),
  'EPSG:3665': ProjectAndUnProjectResult(
      Point(x: 9202342.771606717, y: 13714424.334539425),
      Point(x: 17.88805856028155, y: 46.89226406700876)),
  'EPSG:3666': ProjectAndUnProjectResult(
      Point(x: 9154307.075487461, y: 12759946.896370977),
      Point(x: 17.88805856028155, y: 46.892264067008725)),
  'EPSG:3667': ProjectAndUnProjectResult(
      Point(x: 7393138.261094371, y: 7401668.656500031),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3668': ProjectAndUnProjectResult(
      Point(x: 24255654.445273783, y: 24283641.25020052),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3669': ProjectAndUnProjectResult(
      Point(x: 7989143.282984504, y: 8276494.464586326),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3670': ProjectAndUnProjectResult(
      Point(x: 26211047.58759166, y: 27153798.922896974),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:3671': ProjectAndUnProjectResult(
      Point(x: 8484246.042842139, y: 11469435.827622361),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:3672': ProjectAndUnProjectResult(
      Point(x: 27835397.225557923, y: 37629307.37812436),
      Point(x: 17.88805856028154, y: 46.89226406700874)),
  'EPSG:3673': ProjectAndUnProjectResult(
      Point(x: 8486728.051005203, y: 10453504.590111742),
      Point(x: 17.88805856028154, y: 46.89226406700874)),
  'EPSG:3674': ProjectAndUnProjectResult(
      Point(x: 27843540.280672904, y: 34296206.30905828),
      Point(x: 17.88805856028154, y: 46.89226406700874)),
  'EPSG:3699': ProjectAndUnProjectResult(
      Point(x: 6723783.25810189, y: 5169377.719135766),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:3675': ProjectAndUnProjectResult(
      Point(x: 7316582.822330039, y: 8971163.047072299),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:3676': ProjectAndUnProjectResult(
      Point(x: 24004536.819161545, y: 29432949.629476044),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:3677': ProjectAndUnProjectResult(
      Point(x: 24004488.809627805, y: 29432890.76363637),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:3678': ProjectAndUnProjectResult(
      Point(x: 7132858.074758168, y: 7841015.069017461),
      Point(x: 17.888058560281525, y: 46.892264067008746)),
  'EPSG:3679': ProjectAndUnProjectResult(
      Point(x: 23401765.337626535, y: 25725115.05581844),
      Point(x: 17.888058560281525, y: 46.892264067008746)),
  'EPSG:3680': ProjectAndUnProjectResult(
      Point(x: 23401718.533635758, y: 25725063.605568122),
      Point(x: 17.888058560281525, y: 46.892264067008746)),
  'EPSG:3681': ProjectAndUnProjectResult(
      Point(x: 7595059.15054545, y: 10017430.541012172),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:3682': ProjectAndUnProjectResult(
      Point(x: 24918173.066587433, y: 32865585.764436252),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:3683': ProjectAndUnProjectResult(
      Point(x: 24918123.2297812, y: 32865520.033304103),
      Point(x: 17.88805856028155, y: 46.89226406700872)),
  'EPSG:3684': ProjectAndUnProjectResult(
      Point(x: 5541768.404689928, y: 5434133.661562179), Point(x: 0, y: 90)),
  'EPSG:3685': ProjectAndUnProjectResult(
      Point(x: 9634482.513941199, y: 6581020.355130133),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3686': ProjectAndUnProjectResult(
      Point(x: 31609131.381488748, y: 21591230.948789448),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3687': ProjectAndUnProjectResult(
      Point(x: 9723405.910334777, y: 5663039.725072842),
      Point(x: 17.888058560281486, y: 46.892264067008746)),
  'EPSG:3688': ProjectAndUnProjectResult(
      Point(x: 31900874.224490017, y: 18579489.497676484),
      Point(x: 17.888058560281486, y: 46.892264067008746)),
  'EPSG:3689': ProjectAndUnProjectResult(
      Point(x: 6208880.764422776, y: 7201291.121268816),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:3690': ProjectAndUnProjectResult(
      Point(x: 20370302.974943724, y: 23626235.95369611),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:3691': ProjectAndUnProjectResult(
      Point(x: 6409557.023981855, y: 7281838.145229915),
      Point(x: 17.88805856028154, y: 46.892264067008746)),
  'EPSG:3692': ProjectAndUnProjectResult(
      Point(x: 21028688.336513802, y: 23890497.31480848),
      Point(x: 17.88805856028154, y: 46.892264067008746)),
  'EPSG:3693': ProjectAndUnProjectResult(
      Point(x: 6701578.612677592, y: 4608732.256874052),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3694': ProjectAndUnProjectResult(
      Point(x: 6860107.275988375, y: 4799756.489364472),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3695': ProjectAndUnProjectResult(
      Point(x: 6611250.719513921, y: 5046926.8438626565),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3696': ProjectAndUnProjectResult(
      Point(x: 21690411.73560526, y: 16558125.8202394),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3697': ProjectAndUnProjectResult(
      Point(x: 6517033.000426102, y: 4968571.836722961),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:3698': ProjectAndUnProjectResult(
      Point(x: 21381299.102231305, y: 16301056.100981915),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:3700': ProjectAndUnProjectResult(
      Point(x: 22059612.239289284, y: 16959866.73353126),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:3701': ProjectAndUnProjectResult(
      Point(x: 3839622.300083163, y: 7353217.56768338), Point(x: 0, y: 90)),
  'EPSG:3702': ProjectAndUnProjectResult(
      Point(x: -835360.288822798, y: 7469523.565254046), Point(x: 0, y: 90)),
  'EPSG:3703': ProjectAndUnProjectResult(
      Point(x: -1585501.348464507, y: 7359986.274514455), Point(x: 0, y: 90)),
  'EPSG:3704': ProjectAndUnProjectResult(
      Point(x: -2061507.894929119, y: 7079113.201731387), Point(x: 0, y: 90)),
  'EPSG:3705': ProjectAndUnProjectResult(
      Point(x: -2539578.0552160507, y: 6974103.5782705145), Point(x: 0, y: 90)),
  'EPSG:3706': ProjectAndUnProjectResult(
      Point(x: 27108574.549169235, y: -3184231.5325187673),
      Point(x: -103767.21820745963, y: -188871.77584872008)),
  'EPSG:3707': ProjectAndUnProjectResult(
      Point(x: 36792794.61949032, y: -11620286.792548649), Point(x: 0, y: -90)),
  'EPSG:3708': ProjectAndUnProjectResult(
      Point(x: 48730994.20351042, y: -23178134.332903616), Point(x: 0, y: -90)),
  'EPSG:3710': ProjectAndUnProjectResult(
      Point(x: 81069695.4839798, y: -59099747.1391181), Point(x: 0, y: -90)),
  'EPSG:3711': ProjectAndUnProjectResult(
      Point(x: -79345537.23281473, y: -58236069.63248695), Point(x: 0, y: -90)),
  'EPSG:3712': ProjectAndUnProjectResult(
      Point(x: -61735465.01028672, y: -38016576.899930514),
      Point(x: 0, y: -90)),
  'EPSG:3713': ProjectAndUnProjectResult(
      Point(x: -47240401.76333124, y: -22681647.638609204),
      Point(x: 0, y: -90)),
  'EPSG:3714': ProjectAndUnProjectResult(
      Point(x: -35393329.62055659, y: -11254044.783678558),
      Point(x: 0, y: -90)),
  'EPSG:3715': ProjectAndUnProjectResult(
      Point(x: -25785988.545412734, y: -2920563.7794431755),
      Point(x: 72517.82979839807, y: -135482.78856909208)),
  'EPSG:3716': ProjectAndUnProjectResult(
      Point(x: -18063024.2834307, y: 2990541.0425813603),
      Point(x: 5728.679566272616, y: 8118.480468517206)),
  'EPSG:3717': ProjectAndUnProjectResult(
      Point(x: -11916549.256324729, y: 7029722.072663035),
      Point(x: 169423.46825792477, y: 95274.64648021963)),
  'EPSG:3718': ProjectAndUnProjectResult(
      Point(x: -7081100.809078519, y: 9644074.035715306),
      Point(x: 16894389367.285646, y: 5473429537.796183)),
  'EPSG:3719': ProjectAndUnProjectResult(
      Point(x: -3328981.2161364346, y: 11193210.773121612), Point(x: 0, y: 90)),
  'EPSG:3720': ProjectAndUnProjectResult(
      Point(x: -465963.8528201919, y: 11963247.506900493), Point(x: 0, y: 90)),
  'EPSG:3721': ProjectAndUnProjectResult(
      Point(x: 1672650.061907484, y: 12179046.047871836), Point(x: 0, y: 90)),
  'EPSG:3722': ProjectAndUnProjectResult(
      Point(x: 3225639.745211993, y: 12014873.557768293), Point(x: 0, y: 90)),
  'EPSG:3723': ProjectAndUnProjectResult(
      Point(x: 4309153.746567462, y: 11603618.623518256), Point(x: 0, y: 90)),
  'EPSG:3724': ProjectAndUnProjectResult(
      Point(x: 5019695.054228077, y: 11044701.550210133), Point(x: 0, y: 90)),
  'EPSG:3725': ProjectAndUnProjectResult(
      Point(x: 5436818.00586931, y: 10410808.927530395), Point(x: 0, y: 90)),
  'EPSG:3726': ProjectAndUnProjectResult(
      Point(x: 5625552.597278097, y: 9753575.672750814),
      Point(x: -14563147143.452982, y: 3188443837.820243)),
  'EPSG:3727': ProjectAndUnProjectResult(
      Point(x: -2679201.6978123337, y: 8313972.817739558),
      Point(x: 18.06467735539011, y: 46.91475667121766)),
  'EPSG:3728': ProjectAndUnProjectResult(
      Point(x: 21986714.210386034, y: 15624881.636523569),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3729': ProjectAndUnProjectResult(
      Point(x: 22388167.416311968, y: 15933587.820483766),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3730': ProjectAndUnProjectResult(
      Point(x: -2740677.880879463, y: 24506261.897004317), Point(x: 0, y: 90)),
  'EPSG:3731': ProjectAndUnProjectResult(
      Point(x: -5201765.674120637, y: 24146888.30226951), Point(x: 0, y: 90)),
  'EPSG:3732': ProjectAndUnProjectResult(
      Point(x: -6763463.818613284, y: 23225390.562680393), Point(x: 0, y: 90)),
  'EPSG:3733': ProjectAndUnProjectResult(
      Point(x: -8331932.336121327, y: 22880871.48967585), Point(x: 0, y: 90)),
  'EPSG:3734': ProjectAndUnProjectResult(
      Point(x: 21986714.210386034, y: 15624881.636523569),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3735': ProjectAndUnProjectResult(
      Point(x: 22388167.416311968, y: 15933587.820483766),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3736': ProjectAndUnProjectResult(
      Point(x: -2740677.880879463, y: 24506261.897004317), Point(x: 0, y: 90)),
  'EPSG:3737': ProjectAndUnProjectResult(
      Point(x: -5201765.674120637, y: 24146888.30226951), Point(x: 0, y: 90)),
  'EPSG:3738': ProjectAndUnProjectResult(
      Point(x: -6763463.818613284, y: 23225390.562680393), Point(x: 0, y: 90)),
  'EPSG:3739': ProjectAndUnProjectResult(
      Point(x: -8331932.336121327, y: 22880871.48967585), Point(x: 0, y: 90)),
  'EPSG:3740': ProjectAndUnProjectResult(
      Point(x: -11916549.256324729, y: 7029722.072663035),
      Point(x: 169423.46825792477, y: 95274.64648021963)),
  'EPSG:3741': ProjectAndUnProjectResult(
      Point(x: -7081100.809078519, y: 9644074.035715306),
      Point(x: 16894389367.285646, y: 5473429537.796183)),
  'EPSG:3742': ProjectAndUnProjectResult(
      Point(x: -3328981.2161364346, y: 11193210.773121612), Point(x: 0, y: 90)),
  'EPSG:3743': ProjectAndUnProjectResult(
      Point(x: -465963.8528201919, y: 11963247.506900493), Point(x: 0, y: 90)),
  'EPSG:3744': ProjectAndUnProjectResult(
      Point(x: 1672650.061907484, y: 12179046.047871836), Point(x: 0, y: 90)),
  'EPSG:3745': ProjectAndUnProjectResult(
      Point(x: 3225639.745211993, y: 12014873.557768293), Point(x: 0, y: 90)),
  'EPSG:3746': ProjectAndUnProjectResult(
      Point(x: 4309153.746567462, y: 11603618.623518256), Point(x: 0, y: 90)),
  'EPSG:3747': ProjectAndUnProjectResult(
      Point(x: 5019695.054228077, y: 11044701.550210133), Point(x: 0, y: 90)),
  'EPSG:3748': ProjectAndUnProjectResult(
      Point(x: 5436818.00586931, y: 10410808.927530395), Point(x: 0, y: 90)),
  'EPSG:3749': ProjectAndUnProjectResult(
      Point(x: 5625552.597278097, y: 9753575.672750814),
      Point(x: -14563147143.452982, y: 3188443837.820243)),
  'EPSG:3750': ProjectAndUnProjectResult(
      Point(x: -79345537.23281473, y: -58236069.63248695), Point(x: 0, y: -90)),
  'EPSG:3751': ProjectAndUnProjectResult(
      Point(x: -61735465.01028672, y: -38016576.899930514),
      Point(x: 0, y: -90)),
  'EPSG:3752': ProjectAndUnProjectResult(
      Point(x: -9140659.50911656, y: 5893297.075909311),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3753': ProjectAndUnProjectResult(
      Point(x: 21986714.210386034, y: 15624881.636523569),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3754': ProjectAndUnProjectResult(
      Point(x: 22388167.416311968, y: 15933587.820483766),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3755': ProjectAndUnProjectResult(
      Point(x: -2740677.880879463, y: 24506261.897004317), Point(x: 0, y: 90)),
  'EPSG:3756': ProjectAndUnProjectResult(
      Point(x: -5201765.674120637, y: 24146888.30226951), Point(x: 0, y: 90)),
  'EPSG:3757': ProjectAndUnProjectResult(
      Point(x: -6763463.818613284, y: 23225390.562680393), Point(x: 0, y: 90)),
  'EPSG:3758': ProjectAndUnProjectResult(
      Point(x: -8331932.336121327, y: 22880871.48967585), Point(x: 0, y: 90)),
  'EPSG:3759': ProjectAndUnProjectResult(
      Point(x: -250007344.03195605, y: -186491554.88910815),
      Point(x: 0, y: -90)),
  'EPSG:3760': ProjectAndUnProjectResult(
      Point(x: -250007344.03195605, y: -186491554.88910815),
      Point(x: 0, y: -90)),
  'EPSG:3761': ProjectAndUnProjectResult(
      Point(x: 5297700.047163907, y: 7936385.43186829),
      Point(x: -2039.797629755838, y: 544.0590624611513)),
  'EPSG:3762': ProjectAndUnProjectResult(
      Point(x: 17081659.805985913, y: 12801289.11576897),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3763': ProjectAndUnProjectResult(
      Point(x: 1976343.1973906928, y: 1141528.2391083618),
      Point(x: 17.88452802467779, y: 46.8925640012033)),
  'EPSG:3764': ProjectAndUnProjectResult(
      Point(x: 49759786.10502441, y: -18642657.73954776), Point(x: 0, y: -90)),
  'EPSG:3765': ProjectAndUnProjectResult(
      Point(x: 605770.9535936904, y: 5195685.96539144),
      Point(x: 17.88805856028205, y: 46.89226406700813)),
  'EPSG:3766': ProjectAndUnProjectResult(
      Point(x: 105837.67697366881, y: 5679623.375791372),
      Point(x: 17.888058560281515, y: 46.89226406700873)),
  'EPSG:3767': ProjectAndUnProjectResult(
      Point(x: 720001.2298400886, y: 5197241.60997254),
      Point(x: 17.888058560302017, y: 46.89226406695651)),
  'EPSG:3768': ProjectAndUnProjectResult(
      Point(x: 262945.2879608735, y: 5197894.102611037),
      Point(x: 17.888058560253082, y: 46.89226406692702)),
  'EPSG:3769': ProjectAndUnProjectResult(
      Point(x: 5638607.8020625105, y: 9107976.472020885),
      Point(x: 45, y: double.nan)),
  'EPSG:3770': ProjectAndUnProjectResult(
      Point(x: 5702322.033172766, y: 5855606.138266369),
      Point(x: -8926004.214320635, y: 1963487.1834776804)),
  'EPSG:3771': ProjectAndUnProjectResult(
      Point(x: -3830366.5034900955, y: 11195042.8496128), Point(x: 0, y: 90)),
  'EPSG:3772': ProjectAndUnProjectResult(
      Point(x: -5584339.8977337275, y: 10533727.568597334), Point(x: 0, y: 90)),
  'EPSG:3773': ProjectAndUnProjectResult(
      Point(x: -7583447.275791653, y: 9644915.93419388),
      Point(x: 45, y: double.nan)),
  'EPSG:3774': ProjectAndUnProjectResult(
      Point(x: -9852922.31173094, y: 8490832.235667415),
      Point(x: 45, y: double.nan)),
  'EPSG:3775': ProjectAndUnProjectResult(
      Point(x: -3830130.3701628856, y: 11196570.080076331), Point(x: 0, y: 90)),
  'EPSG:3776': ProjectAndUnProjectResult(
      Point(x: -5584176.085407431, y: 10535502.054303104), Point(x: 0, y: 90)),
  'EPSG:3777': ProjectAndUnProjectResult(
      Point(x: -7583376.049417379, y: 9646968.415678004),
      Point(x: 16894389367.28522, y: 5473429537.796048)),
  'EPSG:3778': ProjectAndUnProjectResult(
      Point(x: -9852967.05118569, y: 8493196.416506361),
      Point(x: 4033210.384574377, y: 1716529.2179819506)),
  'EPSG:3779': ProjectAndUnProjectResult(
      Point(x: -3830130.3701628856, y: 11196570.080076331), Point(x: 0, y: 90)),
  'EPSG:3780': ProjectAndUnProjectResult(
      Point(x: -5584176.085407431, y: 10535502.054303104), Point(x: 0, y: 90)),
  'EPSG:3781': ProjectAndUnProjectResult(
      Point(x: -7583376.049417379, y: 9646968.415678004),
      Point(x: 16894389367.28522, y: 5473429537.796048)),
  'EPSG:3782': ProjectAndUnProjectResult(
      Point(x: -9852967.05118569, y: 8493196.416506361),
      Point(x: 4033210.384574377, y: 1716529.2179819506)),
  'EPSG:3783': ProjectAndUnProjectResult(
      Point(x: -19861661.407229125, y: 4840375.223816268),
      Point(x: 3672.385536278773, y: 6427.295982975643)),
  'EPSG:4500': ProjectAndUnProjectResult(
      Point(x: 19822147.018433835, y: 12030963.856938452), Point(x: 0, y: 90)),
  'EPSG:3784': ProjectAndUnProjectResult(
      Point(x: -18060473.97244752, y: 12988594.393711671),
      Point(x: 45, y: double.nan)),
  'EPSG:3785': ProjectAndUnProjectResult(
      Point(x: 1991289.5702107965, y: 5893278.543519946),
      Point(x: 17.888058560281515, y: 46.89192236199592)),
  'EPSG:3786': ProjectAndUnProjectResult(
      Point(x: 1989063.5448627048, y: 5192833.0079527255),
      Point(x: 17.888058560281515, y: 46.89213681286046)),
  'EPSG:3787': ProjectAndUnProjectResult(
      Point(x: 720138.75396052, y: 198308.65335589834),
      Point(x: 17.888058571100018, y: 46.89226407189716)),
  'EPSG:3788': ProjectAndUnProjectResult(
      Point(x: 23508992.97721879, y: 11953860.642492454),
      Point(x: -3495.2654541591555, y: 6261.852299637183)),
  'EPSG:3789': ProjectAndUnProjectResult(
      Point(x: 27327750.28054091, y: 9054325.12605308),
      Point(x: -6731.8090189592995, y: -10215.908700804841)),
  'EPSG:3790': ProjectAndUnProjectResult(
      Point(x: 43518643.3112175, y: -5094769.094075678), Point(x: 0, y: -90)),
  'EPSG:3791': ProjectAndUnProjectResult(
      Point(x: 49586485.74482371, y: -11010600.087366953), Point(x: 0, y: -90)),
  'EPSG:3793': ProjectAndUnProjectResult(
      Point(x: 52859786.10502441, y: -14316480.109144565), Point(x: 0, y: -90)),
  'EPSG:3843': ProjectAndUnProjectResult(
      Point(x: 6491592.1383437645, y: 5195408.990945579),
      Point(x: 17.88805857140871, y: 46.8922640695898)),
  'EPSG:3794': ProjectAndUnProjectResult(
      Point(x: 720067.2566197526, y: 198801.4063740922),
      Point(x: 17.888058560302017, y: 46.8922640669565)),
  'EPSG:3795': ProjectAndUnProjectResult(
      Point(x: 8252634.361718159, y: 5734234.3314232705),
      Point(x: 17.888058560281486, y: 46.89226404782306)),
  'EPSG:3796': ProjectAndUnProjectResult(
      Point(x: 8148736.411561452, y: 5547224.271027205),
      Point(x: 17.8880585602815, y: 46.89226404782307)),
  'EPSG:3797': ProjectAndUnProjectResult(
      Point(x: 6135826.579964523, y: 3742577.6135534844),
      Point(x: 17.8880585602815, y: 46.89226404782307)),
  'EPSG:3798': ProjectAndUnProjectResult(
      Point(x: 6135878.182828185, y: 3742375.532173249),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3799': ProjectAndUnProjectResult(
      Point(x: 6135878.182828185, y: 3742375.532173249),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3800': ProjectAndUnProjectResult(
      Point(x: -9852922.31173094, y: 8490832.235667415),
      Point(x: 45, y: double.nan)),
  'EPSG:3801': ProjectAndUnProjectResult(
      Point(x: -9852967.05118569, y: 8493196.416506361),
      Point(x: 4033210.384574377, y: 1716529.2179819506)),
  'EPSG:3802': ProjectAndUnProjectResult(
      Point(x: -9852967.05118569, y: 8493196.416506361),
      Point(x: 4033210.384574377, y: 1716529.2179819506)),
  'EPSG:4580': ProjectAndUnProjectResult(
      Point(x: -4017517.7106918134, y: 7451501.090610668),
      Point(x: 45, y: double.nan)),
  'EPSG:3812': ProjectAndUnProjectResult(
      Point(x: 1676562.2460995112, y: 324549.78576519433),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:3814': ProjectAndUnProjectResult(
      Point(x: 3865026.376812202, y: 9521806.905574037), Point(x: 0, y: 90)),
  'EPSG:3815': ProjectAndUnProjectResult(
      Point(x: 3865026.376812202, y: 9521806.905574037), Point(x: 0, y: 90)),
  'EPSG:3816': ProjectAndUnProjectResult(
      Point(x: 3865026.376812202, y: 9521806.905574037), Point(x: 0, y: 90)),
  'EPSG:3825': ProjectAndUnProjectResult(
      Point(x: -4045746.5963645335, y: 11267350.164167067), Point(x: 0, y: 90)),
  'EPSG:3826': ProjectAndUnProjectResult(
      Point(x: -3805683.3210804434, y: 11453259.871461695), Point(x: 0, y: 90)),
  'EPSG:3827': ProjectAndUnProjectResult(
      Point(x: -4045761.1277527884, y: 11267389.831065152), Point(x: 0, y: 90)),
  'EPSG:3828': ProjectAndUnProjectResult(
      Point(x: -3805696.976732799, y: 11453300.087234417), Point(x: 0, y: 90)),
  'EPSG:3829': ProjectAndUnProjectResult(
      Point(x: -3277058.9646783243, y: 11622837.343428625),
      Point(x: -139.24351272925054, y: 89.99247103826126)),
  'EPSG:3832': ProjectAndUnProjectResult(
      Point(x: -14706634.04878024, y: 5893297.075909311),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3833': ProjectAndUnProjectResult(
      Point(x: 3177292.4585295245, y: 5233913.198984689),
      Point(x: 17.888058447269415, y: 46.89226402919728)),
  'EPSG:3834': ProjectAndUnProjectResult(
      Point(x: 3177291.738831021, y: 5233913.048442174),
      Point(x: 17.88805844634046, y: 46.892264029990585)),
  'EPSG:3835': ProjectAndUnProjectResult(
      Point(x: 3720214.533676548, y: 5199458.992247189),
      Point(x: 17.88805857142926, y: 46.89226406953736)),
  'EPSG:3836': ProjectAndUnProjectResult(
      Point(x: 4262971.247483608, y: 5200102.334203057),
      Point(x: 17.88805857138035, y: 46.89226406950829)),
  'EPSG:3837': ProjectAndUnProjectResult(
      Point(x: 4177292.4585295245, y: 5233913.198984689),
      Point(x: 17.888058447269415, y: 46.89226402919728)),
  'EPSG:3838': ProjectAndUnProjectResult(
      Point(x: 4948797.440905435, y: 5212272.602643184),
      Point(x: 17.888058570467997, y: 46.89226406511432)),
  'EPSG:3839': ProjectAndUnProjectResult(
      Point(x: 8805908.013583425, y: 5235855.842461305),
      Point(x: 17.888058730440267, y: 46.89226402351891)),
  'EPSG:3840': ProjectAndUnProjectResult(
      Point(x: 9577571.257314079, y: 5267092.896177837),
      Point(x: 17.888060896105355, y: 46.89226389559344)),
  'EPSG:3841': ProjectAndUnProjectResult(
      Point(x: 6491592.1383437645, y: 5195408.990945579),
      Point(x: 17.88805857140871, y: 46.8922640695898)),
  'EPSG:3842': ProjectAndUnProjectResult(
      Point(x: 6491592.1383437645, y: 5195408.990945579),
      Point(x: 17.88805857140871, y: 46.8922640695898)),
  'EPSG:3844': ProjectAndUnProjectResult(
      Point(x: -41341.30947954103, y: 623553.6394246925),
      Point(x: 17.88805857428828, y: 46.89226406887063)),
  'EPSG:3845': ProjectAndUnProjectResult(
      Point(x: 2001546.03277511, y: 5215709.308746594),
      Point(x: 17.888058553945477, y: 46.892264059921224)),
  'EPSG:3846': ProjectAndUnProjectResult(
      Point(x: 1830146.453751276, y: 5203751.662381472),
      Point(x: 17.888058560322833, y: 46.89226406641694)),
  'EPSG:3847': ProjectAndUnProjectResult(
      Point(x: 1658712.2897811641, y: 5196736.080162084),
      Point(x: 17.8880585602857, y: 46.892264067001435)),
  'EPSG:3848': ProjectAndUnProjectResult(
      Point(x: 1487261.984023453, y: 5194642.981301733),
      Point(x: 17.888058560281515, y: 46.89226406700878)),
  'EPSG:3849': ProjectAndUnProjectResult(
      Point(x: 1315812.9384282234, y: 5197466.4870422),
      Point(x: 17.888058560272697, y: 46.89226406699075)),
  'EPSG:3850': ProjectAndUnProjectResult(
      Point(x: 1144382.5556121343, y: 5205214.671890977),
      Point(x: 17.888058560307403, y: 46.89226406608369)),
  'EPSG:3851': ProjectAndUnProjectResult(
      Point(x: -18977849.49411334, y: -4931722.017871851),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3852': ProjectAndUnProjectResult(
      Point(x: -20458557.0628475, y: -21767259.770745546),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:3854': ProjectAndUnProjectResult(
      Point(x: 87241.68909288984, y: -1305361.7569410224),
      Point(x: 17.888058560281515, y: 46.892264067008796)),
  'EPSG:3857': ProjectAndUnProjectResult(
      Point(x: 1991289.5702107965, y: 5893297.075909311),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:3873': ProjectAndUnProjectResult(
      Point(x: 19415260.682278004, y: 5195870.378755134),
      Point(x: 17.888058560281344, y: 46.892264067008604)),
  'EPSG:3874': ProjectAndUnProjectResult(
      Point(x: 20339053.95380402, y: 5197436.0837356355),
      Point(x: 17.888058560276995, y: 46.892264067000774)),
  'EPSG:3875': ProjectAndUnProjectResult(
      Point(x: 21262850.428132128, y: 5199974.092247936),
      Point(x: 17.888058560253103, y: 46.89226406692703)),
  'EPSG:3876': ProjectAndUnProjectResult(
      Point(x: 22186651.682095855, y: 5203485.806494309),
      Point(x: 17.888058560226185, y: 46.892264066575265)),
  'EPSG:3877': ProjectAndUnProjectResult(
      Point(x: 23110459.361974485, y: 5207973.165191365),
      Point(x: 17.88805856056331, y: 46.89226406541965)),
  'EPSG:3878': ProjectAndUnProjectResult(
      Point(x: 24034275.206084784, y: 5213438.643234651),
      Point(x: 17.888058563129807, y: 46.892264062424815)),
  'EPSG:3879': ProjectAndUnProjectResult(
      Point(x: 24958101.06760197, y: 5219885.251244588),
      Point(x: 17.88805857434855, y: 46.89226405586626)),
  'EPSG:3880': ProjectAndUnProjectResult(
      Point(x: 25881938.937665485, y: 5227316.534974944),
      Point(x: 17.888058612001327, y: 46.89226404327183)),
  'EPSG:3882': ProjectAndUnProjectResult(
      Point(x: 27729659.498885166, y: 5245149.983579845),
      Point(x: 17.888058985876285, y: 46.89226398852624)),
  'EPSG:3883': ProjectAndUnProjectResult(
      Point(x: 28653547.075196378, y: 5255561.907893532),
      Point(x: 17.888059595624597, y: 46.892263943722426)),
  'EPSG:3884': ProjectAndUnProjectResult(
      Point(x: 29577456.479461372, y: 5266978.024236943),
      Point(x: 17.88806088688771, y: 46.892263893655276)),
  'EPSG:3885': ProjectAndUnProjectResult(
      Point(x: 30501390.753099304, y: 5279404.538514145),
      Point(x: 17.888063459754676, y: 46.89226385836239)),
  'EPSG:3890': ProjectAndUnProjectResult(
      Point(x: -1105125.5282006196, y: 5413941.856367431),
      Point(x: 17.888509189327227, y: 46.89229076369037)),
  'EPSG:3891': ProjectAndUnProjectResult(
      Point(x: -1557536.5212347228, y: 5561950.163916144),
      Point(x: 17.89339993357438, y: 46.89274299727956)),
  'EPSG:3892': ProjectAndUnProjectResult(
      Point(x: -2005500.4108122215, y: 5751900.446586641),
      Point(x: 17.930935679469886, y: 46.897081134395314)),
  'EPSG:3893': ProjectAndUnProjectResult(
      Point(x: -1369606.4975917106, y: 2394150.580290248),
      Point(x: 17.897306238005868, y: 46.89314965105123)),
  'EPSG:3907': ProjectAndUnProjectResult(
      Point(x: 5720441.9003260825, y: 5198321.17970864),
      Point(x: 17.888058599075265, y: 46.89226406920315)),
  'EPSG:3908': ProjectAndUnProjectResult(
      Point(x: 6491873.651574707, y: 5194261.4486098),
      Point(x: 17.888058599054723, y: 46.89226406925582)),
  'EPSG:3909': ProjectAndUnProjectResult(
      Point(x: 7263306.8569601495, y: 5198942.980445724),
      Point(x: 17.88805859902672, y: 46.892264069175155)),
  'EPSG:3910': ProjectAndUnProjectResult(
      Point(x: 8034783.418643825, y: 5212389.0560713485),
      Point(x: 17.888058601884644, y: 46.89226406470986)),
  'EPSG:3911': ProjectAndUnProjectResult(
      Point(x: 720441.9003260823, y: 5198321.17970864),
      Point(x: 17.888058599075265, y: 46.89226406920315)),
  'EPSG:3912': ProjectAndUnProjectResult(
      Point(x: 720441.9003260823, y: 198321.1797086401),
      Point(x: 17.888058599075265, y: 46.89226406920315)),
  'EPSG:3920': ProjectAndUnProjectResult(
      Point(x: 5638217.881119642, y: 9108240.784409625),
      Point(x: 45, y: double.nan)),
  'EPSG:3942': ProjectAndUnProjectResult(
      Point(x: 2833019.020964736, y: 1843010.238864202),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:3943': ProjectAndUnProjectResult(
      Point(x: 2831230.4452139637, y: 2733351.460029819),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:3944': ProjectAndUnProjectResult(
      Point(x: 2829809.467316524, y: 3623806.128266886),
      Point(x: 17.888058560281515, y: 46.89226406700873)),
  'EPSG:3945': ProjectAndUnProjectResult(
      Point(x: 2828749.7083356986, y: 4514339.235565409),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:4501': ProjectAndUnProjectResult(
      Point(x: 22395400.682228316, y: 12183637.356165713), Point(x: 0, y: 90)),
  'EPSG:3946': ProjectAndUnProjectResult(
      Point(x: 2828044.8465021546, y: 5404916.276155287),
      Point(x: 17.888058560281515, y: 46.89226406700872)),
  'EPSG:3947': ProjectAndUnProjectResult(
      Point(x: 2827688.5944718597, y: 6295503.259692606),
      Point(x: 17.888058560281518, y: 46.89226406700873)),
  'EPSG:3948': ProjectAndUnProjectResult(
      Point(x: 2827674.6755720135, y: 7186066.727791753),
      Point(x: 17.888058560281515, y: 46.89226406700873)),
  'EPSG:3949': ProjectAndUnProjectResult(
      Point(x: 2827996.798953069, y: 8076573.774209488),
      Point(x: 17.888058560281515, y: 46.89226406700874)),
  'EPSG:3950': ProjectAndUnProjectResult(
      Point(x: 2828648.6335579734, y: 8966992.069017563),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:3968': ProjectAndUnProjectResult(
      Point(x: 6197425.928759272, y: 4812816.468950871),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3969': ProjectAndUnProjectResult(
      Point(x: 6197425.928759272, y: 4812816.468950871),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3970': ProjectAndUnProjectResult(
      Point(x: 6197425.928759272, y: 4812816.468950871),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:3976': ProjectAndUnProjectResult(
      Point(x: 4982953.187166658, y: 20348945.033028428),
      Point(x: 17.888058560281515, y: 46.892264067008796)),
  'EPSG:3978': ProjectAndUnProjectResult(
      Point(x: 4788140.837784415, y: 5644744.4698402),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3979': ProjectAndUnProjectResult(
      Point(x: 4788140.837784415, y: 5644744.4698402),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:3985': ProjectAndUnProjectResult(
      Point(x: -555285.4323544791, y: 5877947.93768952),
      Point(x: 17.888058574909916, y: 46.89226391727645)),
  'EPSG:3986': ProjectAndUnProjectResult(
      Point(x: -722541.7847238699, y: 6762290.366029819),
      Point(x: 17.88806090026733, y: 46.89226374072787)),
  'EPSG:3987': ProjectAndUnProjectResult(
      Point(x: -570342.9657933954, y: 6740461.229478745),
      Point(x: 17.88805900001187, y: 46.892263837701535)),
  'EPSG:3988': ProjectAndUnProjectResult(
      Point(x: -418067.6393746793, y: 6722626.775799283),
      Point(x: 17.88805862648417, y: 46.89226389324595)),
  'EPSG:3989': ProjectAndUnProjectResult(
      Point(x: -265735.4130786186, y: 6708747.971663814),
      Point(x: 17.8880585777285, y: 46.89226391263836)),
  'EPSG:3991': ProjectAndUnProjectResult(
      Point(x: 23885697.09035628, y: 16541981.799064778),
      Point(x: 17.888058574820878, y: 46.892264016315934)),
  'EPSG:3992': ProjectAndUnProjectResult(
      Point(x: 23885697.09035628, y: 16641981.799064776),
      Point(x: 17.888058574820878, y: 46.892264016315934)),
  'EPSG:3995': ProjectAndUnProjectResult(
      Point(x: 1410164.281460657, y: -2531074.364577075),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:3996': ProjectAndUnProjectResult(
      Point(x: 1431589.0683036793, y: -2992813.9170321603),
      Point(x: 17.888058560281518, y: 46.892264067008796)),
  'EPSG:3997': ProjectAndUnProjectResult(
      Point(x: -2325776.769166882, y: 5919332.318772699),
      Point(x: 18.05485171379697, y: 46.913391088377765)),
  'EPSG:4026': ProjectAndUnProjectResult(
      Point(x: -600739.8591220279, y: 248879.67376995925),
      Point(x: 17.8880591741222, y: 46.89226397184953)),
  'EPSG:4037': ProjectAndUnProjectResult(
      Point(x: -193931.3475560262, y: 5233642.280052007),
      Point(x: 17.88805871864152, y: 46.89226402167793)),
  'EPSG:4038': ProjectAndUnProjectResult(
      Point(x: -650192.2096599129, y: 5305193.291340299),
      Point(x: 17.88807717323444, y: 46.892264059984264)),
  'EPSG:4048': ProjectAndUnProjectResult(
      Point(x: 948624.4014177459, y: 15211608.67817156),
      Point(x: 17.888058558416994, y: 46.89226406333179)),
  'EPSG:4049': ProjectAndUnProjectResult(
      Point(x: 796259.5929516172, y: 15202094.645796508),
      Point(x: 17.88805856033801, y: 46.892264066698644)),
  'EPSG:4050': ProjectAndUnProjectResult(
      Point(x: 643870.49935693, y: 15196481.41480021),
      Point(x: 17.88805856028407, y: 46.892264067004696)),
  'EPSG:4051': ProjectAndUnProjectResult(
      Point(x: 491469.93683953484, y: 15194756.584238794),
      Point(x: 17.888058560281515, y: 46.89226406700878)),
  'EPSG:4056': ProjectAndUnProjectResult(
      Point(x: 339070.0484086412, y: 15196916.340127263),
      Point(x: 17.888058560277017, y: 46.89226406700078)),
  'EPSG:4057': ProjectAndUnProjectResult(
      Point(x: 186683.01692764752, y: 15202965.45791366),
      Point(x: 17.888058560226206, y: 46.89226406657527)),
  'EPSG:4058': ProjectAndUnProjectResult(
      Point(x: 34321.77856417687, y: 15212917.299370328),
      Point(x: 17.888058563129825, y: 46.89226406242482)),
  'EPSG:4059': ProjectAndUnProjectResult(
      Point(x: -117999.2562282806, y: 15226793.803321447),
      Point(x: 17.888058612001338, y: 46.89226404327183)),
  'EPSG:4060': ProjectAndUnProjectResult(
      Point(x: -270263.4670647214, y: 15244625.468581486),
      Point(x: 17.8880589858763, y: 46.89226398852623)),
  'EPSG:4061': ProjectAndUnProjectResult(
      Point(x: 720001.2298400886, y: 15197241.60997254),
      Point(x: 17.888058560302017, y: 46.89226406695651)),
  'EPSG:4062': ProjectAndUnProjectResult(
      Point(x: 262945.2879608735, y: 15197894.102611037),
      Point(x: 17.888058560253082, y: 46.89226406692702)),
  'EPSG:4063': ProjectAndUnProjectResult(
      Point(x: -193931.3475621267, y: 15233642.27993109),
      Point(x: 17.88805871864152, y: 46.89226402167793)),
  'EPSG:4071': ProjectAndUnProjectResult(
      Point(x: 5003530.875008845, y: 17430536.684955057),
      Point(x: 45, y: double.nan)),
  'EPSG:4082': ProjectAndUnProjectResult(
      Point(x: 3429800.759174801, y: 5977375.01459784),
      Point(x: 17.630645767876164, y: 46.92603298659015)),
  'EPSG:4083': ProjectAndUnProjectResult(
      Point(x: 2988896.0169453374, y: 5744023.033448553),
      Point(x: 17.848196835452992, y: 46.89671142260442)),
  'EPSG:4087': ProjectAndUnProjectResult(
      Point(x: 1991289.5702107965, y: 5220022.958083138),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:4088': ProjectAndUnProjectResult(
      Point(x: 1989063.5448627048, y: 5192833.0079527255),
      Point(x: 17.888058560281515, y: 46.89213681286046)),
  'EPSG:4093': ProjectAndUnProjectResult(
      Point(x: 877148.6088370954, y: 233660.6648475537),
      Point(x: 17.88805843543735, y: 46.892264027445336)),
  'EPSG:4094': ProjectAndUnProjectResult(
      Point(x: 1000998.7964341316, y: 225462.53667102847),
      Point(x: 17.88805852091921, y: 46.89226404676562)),
  'EPSG:4095': ProjectAndUnProjectResult(
      Point(x: 1067705.024527477, y: 213490.246378907),
      Point(x: 17.88805855729504, y: 46.89226406230804)),
  'EPSG:4096': ProjectAndUnProjectResult(
      Point(x: 1020089.2655463072, y: 199321.33850794286),
      Point(x: 17.888058560302017, y: 46.89226406695651)),
  'EPSG:4217': ProjectAndUnProjectResult(
      Point(x: 88938715.0033994, y: -10446932.952938655),
      Point(x: -103767.21820745953, y: -188871.77584871996)),
  'EPSG:4390': ProjectAndUnProjectResult(
      Point(x: -5698165.362472042, y: 9736035.912200946),
      Point(x: 45, y: double.nan)),
  'EPSG:4391': ProjectAndUnProjectResult(
      Point(x: -5604622.307152719, y: 9438907.891860066),
      Point(x: 45, y: double.nan)),
  'EPSG:4392': ProjectAndUnProjectResult(
      Point(x: -5632958.824296879, y: 9396433.12592997),
      Point(x: 45, y: double.nan)),
  'EPSG:4393': ProjectAndUnProjectResult(
      Point(x: -5601177.96215366, y: 9330757.128539324),
      Point(x: 45, y: double.nan)),
  'EPSG:4394': ProjectAndUnProjectResult(
      Point(x: -5659498.2444535075, y: 9322620.390490994),
      Point(x: 45, y: double.nan)),
  'EPSG:4395': ProjectAndUnProjectResult(
      Point(x: -5512526.412522346, y: 8929130.571910942),
      Point(x: 45, y: double.nan)),
  'EPSG:4396': ProjectAndUnProjectResult(
      Point(x: -5529298.499217718, y: 8907078.102076367),
      Point(x: 45, y: double.nan)),
  'EPSG:4397': ProjectAndUnProjectResult(
      Point(x: -5539604.655705645, y: 9186310.35590149),
      Point(x: 45, y: double.nan)),
  'EPSG:4398': ProjectAndUnProjectResult(
      Point(x: -5618007.426769636, y: 9119926.757573389),
      Point(x: 45, y: double.nan)),
  'EPSG:4399': ProjectAndUnProjectResult(
      Point(x: 88935000.54071158, y: -10461985.857209712),
      Point(x: -135, y: double.nan)),
  'EPSG:4400': ProjectAndUnProjectResult(
      Point(x: 120704859.06530087, y: -38143370.72328647), Point(x: 0, y: -90)),
  'EPSG:4401': ProjectAndUnProjectResult(
      Point(x: 159868822.122673, y: -76067708.87164263), Point(x: 0, y: -90)),
  'EPSG:4402': ProjectAndUnProjectResult(
      Point(x: 207772968.42297474, y: -126921833.20002197),
      Point(x: 0, y: -90)),
  'EPSG:4403': ProjectAndUnProjectResult(
      Point(x: 265956861.69256803, y: -193933682.1282317), Point(x: 0, y: -90)),
  'EPSG:4404': ProjectAndUnProjectResult(
      Point(x: -260300418.2619906, y: -191099809.5784561), Point(x: 0, y: -90)),
  'EPSG:4405': ProjectAndUnProjectResult(
      Point(x: -202530203.9613096, y: -124755906.71256794),
      Point(x: 0, y: -90)),
  'EPSG:4406': ProjectAndUnProjectResult(
      Point(x: -154978576.1760372, y: -74438616.12302032), Point(x: 0, y: -90)),
  'EPSG:4407': ProjectAndUnProjectResult(
      Point(x: -116113552.92774132, y: -36941624.14776285),
      Point(x: 0, y: -90)),
  'EPSG:4408': ProjectAndUnProjectResult(
      Point(x: -84595894.09133668, y: -9596798.322538331),
      Point(x: -135, y: double.nan)),
  'EPSG:4409': ProjectAndUnProjectResult(
      Point(x: -59259905.39206796, y: 9799874.399589209),
      Point(x: 45, y: double.nan)),
  'EPSG:4410': ProjectAndUnProjectResult(
      Point(x: -39095596.9440437, y: 23054449.05308375),
      Point(x: 45, y: double.nan)),
  'EPSG:4411': ProjectAndUnProjectResult(
      Point(x: -23232145.17953647, y: 31633867.73619707),
      Point(x: 45, y: double.nan)),
  'EPSG:4412': ProjectAndUnProjectResult(
      Point(x: -10922607.018261168, y: 36718049.92619765), Point(x: 0, y: 90)),
  'EPSG:4413': ProjectAndUnProjectResult(
      Point(x: -1529835.1258436253, y: 39245767.121649496), Point(x: 0, y: 90)),
  'EPSG:4414': ProjectAndUnProjectResult(
      Point(x: 2872651.044108846, y: 10239580.122362612), Point(x: 0, y: 90)),
  'EPSG:4415': ProjectAndUnProjectResult(
      Point(x: -555285.4323544791, y: 7899348.5500682),
      Point(x: 17.888058574909916, y: 46.89226391727645)),
  'EPSG:4417': ProjectAndUnProjectResult(
      Point(x: 7262971.247483608, y: 5200102.334203057),
      Point(x: 17.88805857138035, y: 46.89226406950829)),
  'EPSG:4418': ProjectAndUnProjectResult(
      Point(x: 17836313.255478315, y: 34155707.45323411), Point(x: 0, y: 90)),
  'EPSG:4419': ProjectAndUnProjectResult(
      Point(x: 18455654.406312, y: 31999659.633512203),
      Point(x: 45, y: double.nan)),
  'EPSG:4420': ProjectAndUnProjectResult(
      Point(x: 120711027.01744448, y: -38124224.251886696),
      Point(x: 0, y: -90)),
  'EPSG:4421': ProjectAndUnProjectResult(
      Point(x: 159878270.15268376, y: -76043595.72386795), Point(x: 0, y: -90)),
  'EPSG:4422': ProjectAndUnProjectResult(
      Point(x: 207786717.28854117, y: -126891735.77586052),
      Point(x: 0, y: -90)),
  'EPSG:4423': ProjectAndUnProjectResult(
      Point(x: 265976159.2703571, y: -193896420.40558997), Point(x: 0, y: -90)),
  'EPSG:4424': ProjectAndUnProjectResult(
      Point(x: -260319483.40132633, y: -191062838.45258427),
      Point(x: 0, y: -90)),
  'EPSG:4425': ProjectAndUnProjectResult(
      Point(x: -202543771.45124903, y: -124726052.71252203),
      Point(x: 0, y: -90)),
  'EPSG:4426': ProjectAndUnProjectResult(
      Point(x: -154987884.78186262, y: -74414705.62767036),
      Point(x: 0, y: -90)),
  'EPSG:4427': ProjectAndUnProjectResult(
      Point(x: -116119615.59344277, y: -36922645.26111874),
      Point(x: 0, y: -90)),
  'EPSG:4428': ProjectAndUnProjectResult(
      Point(x: -84599530.74940829, y: -9581882.999723151),
      Point(x: 72517.82979839812, y: -135482.78856909217)),
  'EPSG:4429': ProjectAndUnProjectResult(
      Point(x: -59261772.16655555, y: 9811466.737202346),
      Point(x: 5728.679566272616, y: 8118.480468517206)),
  'EPSG:4430': ProjectAndUnProjectResult(
      Point(x: -39096212.01512539, y: 23063346.500061978),
      Point(x: 169423.46825792495, y: 95274.64648021973)),
  'EPSG:4431': ProjectAndUnProjectResult(
      Point(x: -23231911.56778511, y: 31640599.5655093),
      Point(x: 16894389367.285646, y: 5473429537.796183)),
  'EPSG:4432': ProjectAndUnProjectResult(
      Point(x: -10921832.53660762, y: 36723059.011483155), Point(x: 0, y: 90)),
  'EPSG:4433': ProjectAndUnProjectResult(
      Point(x: -1528749.7371275797, y: 39249421.19555604), Point(x: 0, y: 90)),
  'EPSG:4434': ProjectAndUnProjectResult(
      Point(x: 8034393.775641421, y: 5213562.361972831),
      Point(x: 17.888058574249374, y: 46.8922640650136)),
  'EPSG:4437': ProjectAndUnProjectResult(
      Point(x: 7328037.617013937, y: 5241769.00316173),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:4438': ProjectAndUnProjectResult(
      Point(x: 17837293.744256232, y: 34156128.956405975), Point(x: 0, y: 90)),
  'EPSG:4439': ProjectAndUnProjectResult(
      Point(x: 18456500.482903223, y: 31999856.186349962),
      Point(x: -14563147143.452982, y: 3188443837.820243)),
  'EPSG:4455': ProjectAndUnProjectResult(
      Point(x: 21631580.131799556, y: 14568195.981304659),
      Point(x: 17.88805856028152, y: 46.89226404782306)),
  'EPSG:4456': ProjectAndUnProjectResult(
      Point(x: 21096015.858215142, y: 13482884.173489098),
      Point(x: 17.88805856028152, y: 46.89226404782306)),
  'EPSG:4457': ProjectAndUnProjectResult(
      Point(x: 22086296.488457482, y: 19050428.99191546),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:4462': ProjectAndUnProjectResult(
      Point(x: -18477009.85363386, y: 2101847.384202445),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:4467': ProjectAndUnProjectResult(
      Point(x: 5518117.362620078, y: 8498017.126823647),
      Point(x: -33811.09013364492, y: 7380.196889868285)),
  'EPSG:4471': ProjectAndUnProjectResult(
      Point(x: -1557536.5212347228, y: 15561950.163916145),
      Point(x: 17.893399933574372, y: 46.89274299727957)),
  'EPSG:4474': ProjectAndUnProjectResult(
      Point(x: -1557696.7992339493, y: 15562081.722529389),
      Point(x: 17.893401851904233, y: 46.89274301979043)),
  'EPSG:4484': ProjectAndUnProjectResult(
      Point(x: -7081100.809078519, y: 9644074.035715306),
      Point(x: 16894389367.285646, y: 5473429537.796183)),
  'EPSG:4485': ProjectAndUnProjectResult(
      Point(x: -3328981.2161364346, y: 11193210.773121612), Point(x: 0, y: 90)),
  'EPSG:4486': ProjectAndUnProjectResult(
      Point(x: -465963.8528201919, y: 11963247.506900493), Point(x: 0, y: 90)),
  'EPSG:4487': ProjectAndUnProjectResult(
      Point(x: 1672650.061907484, y: 12179046.047871836), Point(x: 0, y: 90)),
  'EPSG:4488': ProjectAndUnProjectResult(
      Point(x: 3225639.745211993, y: 12014873.557768293), Point(x: 0, y: 90)),
  'EPSG:4489': ProjectAndUnProjectResult(
      Point(x: 4309153.746567462, y: 11603618.623518256), Point(x: 0, y: 90)),
  'EPSG:4491': ProjectAndUnProjectResult(
      Point(x: 9328493.421913693, y: 7001526.991761912),
      Point(x: 66.46978443301275, y: 55.68536724688989)),
  'EPSG:4492': ProjectAndUnProjectResult(
      Point(x: 9982560.551391073, y: 7451374.141728269),
      Point(x: -29.203552236066788, y: 107.75568998077281)),
  'EPSG:4493': ProjectAndUnProjectResult(
      Point(x: 10690684.498695083, y: 7959551.541609481),
      Point(x: 2295.099359534543, y: 590.2186928219294)),
  'EPSG:4494': ProjectAndUnProjectResult(
      Point(x: 11473397.65464337, y: 8523387.62801148),
      Point(x: 38040.256750950364, y: 8289.769436944347)),
  'EPSG:4495': ProjectAndUnProjectResult(
      Point(x: 12357225.865975516, y: 9135545.190129392),
      Point(x: 2043698.7544900102, y: 448818.1175920101)),
  'EPSG:4496': ProjectAndUnProjectResult(
      Point(x: 13375991.145964216, y: 9781974.28340822),
      Point(x: 30362279619.50587, y: 6642887099.33437)),
  'EPSG:4497': ProjectAndUnProjectResult(
      Point(x: 14572309.67756597, y: 10439322.446499031), Point(x: 0, y: 90)),
  'EPSG:4498': ProjectAndUnProjectResult(
      Point(x: 15999300.709230509, y: 11071712.985662593), Point(x: 0, y: 90)),
  'EPSG:4499': ProjectAndUnProjectResult(
      Point(x: 17722521.94348809, y: 11626795.236313414), Point(x: 0, y: 90)),
  'EPSG:4502': ProjectAndUnProjectResult(
      Point(x: -3671506.5780863077, y: 7001526.991761912),
      Point(x: 66.4697844330128, y: 55.685367246889896)),
  'EPSG:4503': ProjectAndUnProjectResult(
      Point(x: -4017439.4486089284, y: 7451374.141728269),
      Point(x: -29.203552236066432, y: 107.75568998077289)),
  'EPSG:4504': ProjectAndUnProjectResult(
      Point(x: -4309315.501304916, y: 7959551.541609481),
      Point(x: 2295.09935953454, y: 590.2186928219286)),
  'EPSG:4505': ProjectAndUnProjectResult(
      Point(x: -4526602.34535663, y: 8523387.62801148),
      Point(x: 38040.256750950364, y: 8289.769436944347)),
  'EPSG:4506': ProjectAndUnProjectResult(
      Point(x: -4642774.134024484, y: 9135545.190129392),
      Point(x: 2043698.7544900102, y: 448818.1175920101)),
  'EPSG:4507': ProjectAndUnProjectResult(
      Point(x: -4624008.8540357845, y: 9781974.28340822),
      Point(x: 30362279619.50589, y: 6642887099.334377)),
  'EPSG:4508': ProjectAndUnProjectResult(
      Point(x: -4427690.32243403, y: 10439322.446499031), Point(x: 0, y: 90)),
  'EPSG:4509': ProjectAndUnProjectResult(
      Point(x: -4000699.2907694904, y: 11071712.985662593), Point(x: 0, y: 90)),
  'EPSG:4510': ProjectAndUnProjectResult(
      Point(x: -3277478.0565119097, y: 11626795.236313414), Point(x: 0, y: 90)),
  'EPSG:4511': ProjectAndUnProjectResult(
      Point(x: -2177852.9815661646, y: 12030963.856938452), Point(x: 0, y: 90)),
  'EPSG:4512': ProjectAndUnProjectResult(
      Point(x: -604599.3177716827, y: 12183637.356165713), Point(x: 0, y: 90)),
  'EPSG:4513': ProjectAndUnProjectResult(
      Point(x: 21328493.42191369, y: 7001526.991761912),
      Point(x: 66.46978443301293, y: 55.68536724688992)),
  'EPSG:4514': ProjectAndUnProjectResult(
      Point(x: 22149850.9068178, y: 7219128.371007296),
      Point(x: 138.3748532318848, y: 69.53969094405605)),
  'EPSG:4515': ProjectAndUnProjectResult(
      Point(x: 22982560.551391073, y: 7451374.141728269),
      Point(x: -29.203552236066788, y: 107.75568998077281)),
  'EPSG:4516': ProjectAndUnProjectResult(
      Point(x: 23828708.620324224, y: 7698249.8329235),
      Point(x: 525.4502355842208, y: 220.8876600242989)),
  'EPSG:4517': ProjectAndUnProjectResult(
      Point(x: 24690684.498695083, y: 7959551.541609481),
      Point(x: 2295.099359534543, y: 590.2186928219294)),
  'EPSG:4518': ProjectAndUnProjectResult(
      Point(x: 25571214.38243999, y: 8234839.92570492),
      Point(x: 8796.331693915801, y: 1973.2780739093816)),
  'EPSG:4519': ProjectAndUnProjectResult(
      Point(x: 26473397.65464337, y: 8523387.62801148),
      Point(x: 38040.25675095029, y: 8289.769436944327)),
  'EPSG:4520': ProjectAndUnProjectResult(
      Point(x: 27400746.069521375, y: 8824119.52784918),
      Point(x: 216927.18580758735, y: 47354.206459627494)),
  'EPSG:4521': ProjectAndUnProjectResult(
      Point(x: 28357225.865975514, y: 9135545.190129392),
      Point(x: 2043698.7544900167, y: 448818.1175920118)),
  'EPSG:4522': ProjectAndUnProjectResult(
      Point(x: 29347302.932592206, y: 9455682.854873288),
      Point(x: 53527735.06390822, y: 11775410.229742318)),
  'EPSG:4523': ProjectAndUnProjectResult(
      Point(x: 30375991.145964216, y: 9781974.28340822),
      Point(x: 30362279619.50587, y: 6642887099.33437)),
  'EPSG:4524': ProjectAndUnProjectResult(
      Point(x: 31448904.00420986, y: 10111189.750699412), Point(x: 0, y: 90)),
  'EPSG:4525': ProjectAndUnProjectResult(
      Point(x: 32572309.67756597, y: 10439322.446499031), Point(x: 0, y: 90)),
  'EPSG:4526': ProjectAndUnProjectResult(
      Point(x: 33753189.59793045, y: 10761471.521219483), Point(x: 0, y: 90)),
  'EPSG:4527': ProjectAndUnProjectResult(
      Point(x: 34999300.70923051, y: 11071712.985662593), Point(x: 0, y: 90)),
  'EPSG:4528': ProjectAndUnProjectResult(
      Point(x: 36319241.50049229, y: 11362957.64696107), Point(x: 0, y: 90)),
  'EPSG:4529': ProjectAndUnProjectResult(
      Point(x: 37722521.94348809, y: 11626795.236313414), Point(x: 0, y: 90)),
  'EPSG:4530': ProjectAndUnProjectResult(
      Point(x: 39219637.456836805, y: 11853323.85731819), Point(x: 0, y: 90)),
  'EPSG:4531': ProjectAndUnProjectResult(
      Point(x: 40822147.01843384, y: 12030963.856938452), Point(x: 0, y: 90)),
  'EPSG:4532': ProjectAndUnProjectResult(
      Point(x: 42542755.54808611, y: 12146255.194351697), Point(x: 0, y: 90)),
  'EPSG:4533': ProjectAndUnProjectResult(
      Point(x: 44395400.68222832, y: 12183637.356165713), Point(x: 0, y: 90)),
  'EPSG:4534': ProjectAndUnProjectResult(
      Point(x: -3671506.5780863077, y: 7001526.991761912),
      Point(x: 66.4697844330128, y: 55.685367246889896)),
  'EPSG:4535': ProjectAndUnProjectResult(
      Point(x: -3850149.093182198, y: 7219128.371007296),
      Point(x: 138.37485323188466, y: 69.53969094405603)),
  'EPSG:4536': ProjectAndUnProjectResult(
      Point(x: -4017439.4486089284, y: 7451374.141728269),
      Point(x: -29.203552236066432, y: 107.75568998077289)),
  'EPSG:4537': ProjectAndUnProjectResult(
      Point(x: -4171291.379675775, y: 7698249.8329235),
      Point(x: 525.4502355842197, y: 220.88766002429873)),
  'EPSG:4538': ProjectAndUnProjectResult(
      Point(x: -4309315.501304916, y: 7959551.541609481),
      Point(x: 2295.09935953454, y: 590.2186928219286)),
  'EPSG:4539': ProjectAndUnProjectResult(
      Point(x: -4428785.617560011, y: 8234839.92570492),
      Point(x: 8796.331693915807, y: 1973.2780739093832)),
  'EPSG:4540': ProjectAndUnProjectResult(
      Point(x: -4526602.34535663, y: 8523387.62801148),
      Point(x: 38040.256750950364, y: 8289.769436944347)),
  'EPSG:4541': ProjectAndUnProjectResult(
      Point(x: -4599253.930478623, y: 8824119.52784918),
      Point(x: 216927.18580758662, y: 47354.20645962731)),
  'EPSG:4542': ProjectAndUnProjectResult(
      Point(x: -4642774.134024484, y: 9135545.190129392),
      Point(x: 2043698.7544900102, y: 448818.1175920101)),
  'EPSG:4543': ProjectAndUnProjectResult(
      Point(x: -4652697.067407792, y: 9455682.854873288),
      Point(x: 53527735.06390806, y: 11775410.22974228)),
  'EPSG:4544': ProjectAndUnProjectResult(
      Point(x: -4624008.8540357845, y: 9781974.28340822),
      Point(x: 30362279619.50589, y: 6642887099.334377)),
  'EPSG:4545': ProjectAndUnProjectResult(
      Point(x: -4551095.995790138, y: 10111189.750699412), Point(x: 0, y: 90)),
  'EPSG:4546': ProjectAndUnProjectResult(
      Point(x: -4427690.32243403, y: 10439322.446499031), Point(x: 0, y: 90)),
  'EPSG:4547': ProjectAndUnProjectResult(
      Point(x: -4246810.402069545, y: 10761471.521219483), Point(x: 0, y: 90)),
  'EPSG:4548': ProjectAndUnProjectResult(
      Point(x: -4000699.2907694904, y: 11071712.985662593), Point(x: 0, y: 90)),
  'EPSG:4549': ProjectAndUnProjectResult(
      Point(x: -3680758.499507707, y: 11362957.64696107), Point(x: 0, y: 90)),
  'EPSG:4550': ProjectAndUnProjectResult(
      Point(x: -3277478.0565119097, y: 11626795.236313414), Point(x: 0, y: 90)),
  'EPSG:4551': ProjectAndUnProjectResult(
      Point(x: -2780362.5431631915, y: 11853323.85731819), Point(x: 0, y: 90)),
  'EPSG:4552': ProjectAndUnProjectResult(
      Point(x: -2177852.9815661646, y: 12030963.856938452), Point(x: 0, y: 90)),
  'EPSG:4553': ProjectAndUnProjectResult(
      Point(x: -1457244.451913892, y: 12146255.194351697), Point(x: 0, y: 90)),
  'EPSG:4554': ProjectAndUnProjectResult(
      Point(x: -604599.3177716827, y: 12183637.356165713), Point(x: 0, y: 90)),
  'EPSG:4578': ProjectAndUnProjectResult(
      Point(x: 22395376.983237706, y: 12183854.3923586), Point(x: 0, y: 90)),
  'EPSG:4559': ProjectAndUnProjectResult(
      Point(x: 5638571.782971076, y: 9108330.901623307),
      Point(x: -1685042.2535846238, y: 369929.7983349917)),
  'EPSG:4568': ProjectAndUnProjectResult(
      Point(x: 9328421.340581, y: 7001646.258530278),
      Point(x: 66.46970363157362, y: 55.685356944014764)),
  'EPSG:4569': ProjectAndUnProjectResult(
      Point(x: 9982482.289308187, y: 7451501.090610668),
      Point(x: 45, y: double.nan)),
  'EPSG:4570': ProjectAndUnProjectResult(
      Point(x: 10690600.918627873, y: 7959687.230352008),
      Point(x: 45, y: double.nan)),
  'EPSG:4571': ProjectAndUnProjectResult(
      Point(x: 11473309.968065696, y: 8523533.10121544),
      Point(x: 45, y: double.nan)),
  'EPSG:4572': ProjectAndUnProjectResult(
      Point(x: 12357135.740423597, y: 9135701.409461653),
      Point(x: 45, y: double.nan)),
  'EPSG:4573': ProjectAndUnProjectResult(
      Point(x: 13375900.836793115, y: 9782142.024768146),
      Point(x: 45, y: double.nan)),
  'EPSG:4574': ProjectAndUnProjectResult(
      Point(x: 14572222.187872892, y: 10439502.15507849), Point(x: 0, y: 90)),
  'EPSG:4575': ProjectAndUnProjectResult(
      Point(x: 15999219.982010296, y: 11071904.578322321), Point(x: 0, y: 90)),
  'EPSG:4576': ProjectAndUnProjectResult(
      Point(x: 17722453.090387028, y: 11626997.839069745), Point(x: 0, y: 90)),
  'EPSG:4577': ProjectAndUnProjectResult(
      Point(x: 19822096.589768603, y: 12031175.463608662), Point(x: 0, y: 90)),
  'EPSG:4581': ProjectAndUnProjectResult(
      Point(x: -4309399.081372126, y: 7959687.230352008),
      Point(x: 45, y: double.nan)),
  'EPSG:4582': ProjectAndUnProjectResult(
      Point(x: -4526690.031934304, y: 8523533.10121544),
      Point(x: 45, y: double.nan)),
  'EPSG:4583': ProjectAndUnProjectResult(
      Point(x: -4642864.259576404, y: 9135701.409461653),
      Point(x: 45, y: double.nan)),
  'EPSG:4584': ProjectAndUnProjectResult(
      Point(x: -4624099.163206885, y: 9782142.024768146),
      Point(x: 45, y: double.nan)),
  'EPSG:4585': ProjectAndUnProjectResult(
      Point(x: -4427777.812127108, y: 10439502.15507849), Point(x: 0, y: 90)),
  'EPSG:4586': ProjectAndUnProjectResult(
      Point(x: -4000780.0179897044, y: 11071904.578322321), Point(x: 0, y: 90)),
  'EPSG:4587': ProjectAndUnProjectResult(
      Point(x: -3277546.9096129737, y: 11626997.839069745), Point(x: 0, y: 90)),
  'EPSG:4588': ProjectAndUnProjectResult(
      Point(x: -2177903.4102313956, y: 12031175.463608662), Point(x: 0, y: 90)),
  'EPSG:4589': ProjectAndUnProjectResult(
      Point(x: -604623.0167622955, y: 12183854.3923586), Point(x: 0, y: 90)),
  'EPSG:4647': ProjectAndUnProjectResult(
      Point(x: 33176891.287219305, y: 5231671.834018296),
      Point(x: 17.888058435437348, y: 46.892264027445336)),
  'EPSG:4652': ProjectAndUnProjectResult(
      Point(x: 21328421.340581, y: 7001646.258530278),
      Point(x: 66.46970363157362, y: 55.685356944014764)),
  'EPSG:4653': ProjectAndUnProjectResult(
      Point(x: 22149775.645459887, y: 7219251.3477785075),
      Point(x: 138.37464126753517, y: 69.5396588188438)),
  'EPSG:4654': ProjectAndUnProjectResult(
      Point(x: 22982482.289308187, y: 7451501.090610668),
      Point(x: 45, y: double.nan)),
  'EPSG:4655': ProjectAndUnProjectResult(
      Point(x: 23828627.571863763, y: 7698381.019035124),
      Point(x: 45, y: double.nan)),
  'EPSG:4656': ProjectAndUnProjectResult(
      Point(x: 24690600.918627873, y: 7959687.230352008),
      Point(x: 45, y: double.nan)),
  'EPSG:4766': ProjectAndUnProjectResult(
      Point(x: 25571128.57196385, y: 8234980.379304201),
      Point(x: 45, y: double.nan)),
  'EPSG:4767': ProjectAndUnProjectResult(
      Point(x: 26473309.968065694, y: 8523533.10121544),
      Point(x: 45, y: double.nan)),
  'EPSG:4768': ProjectAndUnProjectResult(
      Point(x: 27400656.92167488, y: 8824270.262663634),
      Point(x: 45, y: double.nan)),
  'EPSG:4769': ProjectAndUnProjectResult(
      Point(x: 28357135.740423597, y: 9135701.409461653),
      Point(x: 45, y: double.nan)),
  'EPSG:4770': ProjectAndUnProjectResult(
      Point(x: 29347212.390682768, y: 9455844.75494226),
      Point(x: 45, y: double.nan)),
  'EPSG:4771': ProjectAndUnProjectResult(
      Point(x: 30375900.836793117, y: 9782142.024768146),
      Point(x: 45, y: double.nan)),
  'EPSG:4772': ProjectAndUnProjectResult(
      Point(x: 31448814.675557498, y: 10111363.447712325), Point(x: 0, y: 90)),
  'EPSG:4773': ProjectAndUnProjectResult(
      Point(x: 32572222.187872894, y: 10439502.15507849), Point(x: 0, y: 90)),
  'EPSG:4774': ProjectAndUnProjectResult(
      Point(x: 33753104.92938021, y: 10761657.224655224), Point(x: 0, y: 90)),
  'EPSG:4775': ProjectAndUnProjectResult(
      Point(x: 34999219.9820103, y: 11071904.578322321), Point(x: 0, y: 90)),
  'EPSG:4776': ProjectAndUnProjectResult(
      Point(x: 36319165.98830434, y: 11363154.915651683), Point(x: 0, y: 90)),
  'EPSG:4777': ProjectAndUnProjectResult(
      Point(x: 37722453.090387024, y: 11626997.839069745), Point(x: 0, y: 90)),
  'EPSG:4778': ProjectAndUnProjectResult(
      Point(x: 39219576.895470664, y: 11853531.29937249), Point(x: 0, y: 90)),
  'EPSG:4779': ProjectAndUnProjectResult(
      Point(x: 40822096.5897686, y: 12031175.463608662), Point(x: 0, y: 90)),
  'EPSG:4780': ProjectAndUnProjectResult(
      Point(x: 42542717.322696224, y: 12146470.080570836), Point(x: 0, y: 90)),
  'EPSG:4781': ProjectAndUnProjectResult(
      Point(x: 44395376.983237706, y: 12183854.3923586), Point(x: 0, y: 90)),
  'EPSG:4782': ProjectAndUnProjectResult(
      Point(x: -3671578.659419, y: 7001646.258530278),
      Point(x: 66.46970363157362, y: 55.685356944014764)),
  'EPSG:4783': ProjectAndUnProjectResult(
      Point(x: -3850224.3545401134, y: 7219251.3477785075),
      Point(x: 138.37464126753517, y: 69.5396588188438)),
  'EPSG:4784': ProjectAndUnProjectResult(
      Point(x: -4017517.7106918134, y: 7451501.090610668),
      Point(x: 45, y: double.nan)),
  'EPSG:4785': ProjectAndUnProjectResult(
      Point(x: -4171372.428136235, y: 7698381.019035124),
      Point(x: 45, y: double.nan)),
  'EPSG:4786': ProjectAndUnProjectResult(
      Point(x: -4309399.081372126, y: 7959687.230352008),
      Point(x: 45, y: double.nan)),
  'EPSG:4787': ProjectAndUnProjectResult(
      Point(x: -4428871.4280361505, y: 8234980.379304201),
      Point(x: 45, y: double.nan)),
  'EPSG:4788': ProjectAndUnProjectResult(
      Point(x: -4526690.031934304, y: 8523533.10121544),
      Point(x: 45, y: double.nan)),
  'EPSG:4789': ProjectAndUnProjectResult(
      Point(x: -4599343.078325118, y: 8824270.262663634),
      Point(x: 45, y: double.nan)),
  'EPSG:4790': ProjectAndUnProjectResult(
      Point(x: -4642864.259576404, y: 9135701.409461653),
      Point(x: 45, y: double.nan)),
  'EPSG:4791': ProjectAndUnProjectResult(
      Point(x: -4652787.609317232, y: 9455844.75494226),
      Point(x: 45, y: double.nan)),
  'EPSG:4792': ProjectAndUnProjectResult(
      Point(x: -4624099.163206885, y: 9782142.024768146),
      Point(x: 45, y: double.nan)),
  'EPSG:4793': ProjectAndUnProjectResult(
      Point(x: -4551185.324442502, y: 10111363.447712325), Point(x: 0, y: 90)),
  'EPSG:4794': ProjectAndUnProjectResult(
      Point(x: -4427777.812127108, y: 10439502.15507849), Point(x: 0, y: 90)),
  'EPSG:4795': ProjectAndUnProjectResult(
      Point(x: -4246895.070619788, y: 10761657.224655224), Point(x: 0, y: 90)),
  'EPSG:4796': ProjectAndUnProjectResult(
      Point(x: -4000780.0179897044, y: 11071904.578322321), Point(x: 0, y: 90)),
  'EPSG:4797': ProjectAndUnProjectResult(
      Point(x: -3680834.011695663, y: 11363154.915651683), Point(x: 0, y: 90)),
  'EPSG:4798': ProjectAndUnProjectResult(
      Point(x: -3277546.9096129737, y: 11626997.839069745), Point(x: 0, y: 90)),
  'EPSG:4799': ProjectAndUnProjectResult(
      Point(x: -2780423.104529338, y: 11853531.29937249), Point(x: 0, y: 90)),
  'EPSG:4800': ProjectAndUnProjectResult(
      Point(x: -2177903.4102313956, y: 12031175.463608662), Point(x: 0, y: 90)),
  'EPSG:4812': ProjectAndUnProjectResult(
      Point(x: -1457282.6773037752, y: 12146470.080570836), Point(x: 0, y: 90)),
  'EPSG:4822': ProjectAndUnProjectResult(
      Point(x: -604623.0167622955, y: 12183854.3923586), Point(x: 0, y: 90)),
  'EPSG:4826': ProjectAndUnProjectResult(
      Point(x: 3898447.9405131047, y: 4136629.738735613),
      Point(x: 17.888058560281518, y: 46.89226406700872)),
  'EPSG:4839': ProjectAndUnProjectResult(
      Point(x: 563086.4346155266, y: -428506.2201042669),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:4855': ProjectAndUnProjectResult(
      Point(x: 1043549.191261411, y: 6270307.943609711),
      Point(x: 17.888055685365153, y: 46.89226388108927)),
  'EPSG:4856': ProjectAndUnProjectResult(
      Point(x: 967465.1467680301, y: 6258613.481754404),
      Point(x: 17.888057256158355, y: 46.89226392990055)),
  'EPSG:4857': ProjectAndUnProjectResult(
      Point(x: 891358.461581458, y: 6247924.87268115),
      Point(x: 17.88805801138619, y: 46.892263977212124)),
  'EPSG:4858': ProjectAndUnProjectResult(
      Point(x: 815231.9865559447, y: 6238236.293358575),
      Point(x: 17.888058349819428, y: 46.892264013752765)),
  'EPSG:4859': ProjectAndUnProjectResult(
      Point(x: 739088.331249681, y: 6229542.451188974),
      Point(x: 17.888058488739624, y: 46.892264038336585)),
  'EPSG:4860': ProjectAndUnProjectResult(
      Point(x: 662929.8888774, y: 6221838.585496351),
      Point(x: 17.88805853966254, y: 46.89226405311322)),
  'EPSG:4861': ProjectAndUnProjectResult(
      Point(x: 586758.8607398072, y: 6215120.46875045),
      Point(x: 17.88805855566743, y: 46.89226406106193)),
  'EPSG:4862': ProjectAndUnProjectResult(
      Point(x: 510577.2801855649, y: 6209384.40756306),
      Point(x: 17.888058559664973, y: 46.89226406483602)),
  'EPSG:4863': ProjectAndUnProjectResult(
      Point(x: 434387.03616155894, y: 6204627.243488797),
      Point(x: 17.888058560316225, y: 46.89226406636951)),
  'EPSG:4864': ProjectAndUnProjectResult(
      Point(x: 358189.8964071749, y: 6200846.353658465),
      Point(x: 17.888058560321223, y: 46.89226406687275)),
  'EPSG:4865': ProjectAndUnProjectResult(
      Point(x: 281987.530348313, y: 6198039.651269007),
      Point(x: 17.888058560289807, y: 46.892264066992055)),
  'EPSG:4866': ProjectAndUnProjectResult(
      Point(x: 205781.53174686513, y: 6196205.585950036),
      Point(x: 17.88805856028205, y: 46.892264067008135)),
  'EPSG:4867': ProjectAndUnProjectResult(
      Point(x: 129573.44116138725, y: 6195343.144022762),
      Point(x: 17.888058560281515, y: 46.892264067008774)),
  'EPSG:4868': ProjectAndUnProjectResult(
      Point(x: 53364.7682746877, y: 6195451.84866315),
      Point(x: 17.888058560281507, y: 46.892264067008774)),
  'EPSG:4869': ProjectAndUnProjectResult(
      Point(x: -22842.985855933424, y: 6196531.759976973),
      Point(x: 17.888058560280374, y: 46.89226406700719)),
  'EPSG:4870': ProjectAndUnProjectResult(
      Point(x: -99048.30657007455, y: 6198583.4749904135),
      Point(x: 17.888058560268696, y: 46.89226406698017)),
  'EPSG:4871': ProjectAndUnProjectResult(
      Point(x: -175249.64334151713, y: 6201608.127555738),
      Point(x: 17.888058560232725, y: 46.89226406680921)),
  'EPSG:4872': ProjectAndUnProjectResult(
      Point(x: -251445.38742568332, y: 6205607.388167524),
      Point(x: 17.88805856029077, y: 46.89226406614835)),
  'EPSG:4873': ProjectAndUnProjectResult(
      Point(x: -327633.84936153685, y: 6210583.463680795),
      Point(x: 17.888058561328975, y: 46.89226406424212)),
  'EPSG:4874': ProjectAndUnProjectResult(
      Point(x: -403813.23627219687, y: 6216539.096918398),
      Point(x: 17.88805856692873, y: 46.892264059728824)),
  'EPSG:4875': ProjectAndUnProjectResult(
      Point(x: -479981.62890854396, y: 6223477.566150808),
      Point(x: 17.88805858801052, y: 46.892264050503584)),
  'EPSG:4876': ProjectAndUnProjectResult(
      Point(x: -556136.9583800837, y: 6231402.684427525),
      Point(x: 17.88805865250497, y: 46.892264033786056)),
  'EPSG:4877': ProjectAndUnProjectResult(
      Point(x: -632276.9825173458, y: 6240318.798735105),
      Point(x: 17.888058823564478, y: 46.89226400664556)),
  'EPSG:4878': ProjectAndUnProjectResult(
      Point(x: -708399.2618100875, y: 6250230.78895281),
      Point(x: 17.888059231433566, y: 46.89226396739856)),
  'EPSG:4879': ProjectAndUnProjectResult(
      Point(x: -784501.1348655766, y: 6261144.066572763),
      Point(x: 17.88806012621695, y: 46.892263918526474)),
  'EPSG:4880': ProjectAndUnProjectResult(
      Point(x: -860579.6933312244, y: 6273064.573147433),
      Point(x: 17.888061961568134, y: 46.89226387209039)),
  'EPSG:5014': ProjectAndUnProjectResult(
      Point(x: 4270751.307769986, y: 6593435.187347272),
      Point(x: 9.84627979268085, y: 48.22214374762894)),
  'EPSG:5015': ProjectAndUnProjectResult(
      Point(x: 3859134.0088134822, y: 6259299.996916991),
      Point(x: 16.418121572269165, y: 47.11123824637778)),
  'EPSG:5016': ProjectAndUnProjectResult(
      Point(x: 2988896.0169453374, y: 5744023.033448553),
      Point(x: 17.848196835452992, y: 46.89671142260442)),
  'EPSG:5018': ProjectAndUnProjectResult(
      Point(x: 1976382.4560408075, y: 1141499.2187266692),
      Point(x: 17.884530474033227, y: 46.8925636667179)),
  'EPSG:5041': ProjectAndUnProjectResult(
      Point(x: 3540763.4661860038, y: -2773696.963262149),
      Point(x: 17.888058560281515, y: 46.89226406700877)),
  'EPSG:5048': ProjectAndUnProjectResult(
      Point(x: -193931.3475621267, y: 5233642.279931091),
      Point(x: 17.88805871864152, y: 46.89226402167793)),
  'EPSG:5069': ProjectAndUnProjectResult(
      Point(x: 6774643.618959672, y: 7282784.610993413),
      Point(x: 17.88805856028151, y: 46.89226404782314)),
  'EPSG:5070': ProjectAndUnProjectResult(
      Point(x: 6774661.149690735, y: 7282623.854975374),
      Point(x: 17.88805856028151, y: 46.89226406700876)),
  'EPSG:5071': ProjectAndUnProjectResult(
      Point(x: 6774661.149690735, y: 7282623.854975374),
      Point(x: 17.88805856028151, y: 46.89226406700876)),
  'EPSG:5072': ProjectAndUnProjectResult(
      Point(x: 6774661.149690735, y: 7282623.854975374),
      Point(x: 17.88805856028151, y: 46.89226406700876)),
  'EPSG:5105': ProjectAndUnProjectResult(
      Point(x: 1043549.191261411, y: -160974.72827168927),
      Point(x: 17.888055685365156, y: 46.89226388108928)),
  'EPSG:5106': ProjectAndUnProjectResult(
      Point(x: 967465.1467680301, y: -172669.19012699788),
      Point(x: 17.888057256158355, y: 46.89226392990055)),
  'EPSG:5107': ProjectAndUnProjectResult(
      Point(x: 891358.461581458, y: -183357.79920025077),
      Point(x: 17.88805801138619, y: 46.892263977212124)),
  'EPSG:5108': ProjectAndUnProjectResult(
      Point(x: 815231.9865559447, y: -193046.3785228266),
      Point(x: 17.888058349819428, y: 46.892264013752765)),
  'EPSG:5109': ProjectAndUnProjectResult(
      Point(x: 739088.331249681, y: -201740.22069242736),
      Point(x: 17.888058488739624, y: 46.892264038336585)),
  'EPSG:5110': ProjectAndUnProjectResult(
      Point(x: 662929.8888774, y: -209444.0863850494),
      Point(x: 17.88805853966254, y: 46.89226405311323)),
  'EPSG:5111': ProjectAndUnProjectResult(
      Point(x: 586758.8607398072, y: -216162.20313095092),
      Point(x: 17.888058555667435, y: 46.89226406106194)),
  'EPSG:5112': ProjectAndUnProjectResult(
      Point(x: 510577.2801855649, y: -221898.26431834162),
      Point(x: 17.888058559664973, y: 46.89226406483602)),
  'EPSG:5113': ProjectAndUnProjectResult(
      Point(x: 434387.03616155894, y: -226655.42839260353),
      Point(x: 17.888058560316225, y: 46.89226406636952)),
  'EPSG:5114': ProjectAndUnProjectResult(
      Point(x: 358189.8964071749, y: -230436.31822293648),
      Point(x: 17.888058560321223, y: 46.89226406687275)),
  'EPSG:5115': ProjectAndUnProjectResult(
      Point(x: 281987.530348313, y: -233243.0206123935),
      Point(x: 17.88805856028981, y: 46.89226406699207)),
  'EPSG:5116': ProjectAndUnProjectResult(
      Point(x: 205781.53174686513, y: -235077.08593136515),
      Point(x: 17.88805856028205, y: 46.892264067008135)),
  'EPSG:5117': ProjectAndUnProjectResult(
      Point(x: 129573.44116138725, y: -235939.52785863844),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5118': ProjectAndUnProjectResult(
      Point(x: 53364.7682746877, y: -235830.82321825065),
      Point(x: 17.888058560281507, y: 46.892264067008774)),
  'EPSG:5119': ProjectAndUnProjectResult(
      Point(x: -22842.985855933424, y: -234750.9119044277),
      Point(x: 17.888058560280374, y: 46.8922640670072)),
  'EPSG:5120': ProjectAndUnProjectResult(
      Point(x: -99048.30657007455, y: -232699.1968909877),
      Point(x: 17.888058560268696, y: 46.89226406698017)),
  'EPSG:5121': ProjectAndUnProjectResult(
      Point(x: -175249.64334151713, y: -229674.54432566254),
      Point(x: 17.88805856023272, y: 46.89226406680922)),
  'EPSG:5122': ProjectAndUnProjectResult(
      Point(x: -251445.38742568332, y: -225675.28371387697),
      Point(x: 17.88805856029077, y: 46.89226406614835)),
  'EPSG:5123': ProjectAndUnProjectResult(
      Point(x: -327633.84936153685, y: -220699.20820060535),
      Point(x: 17.88805856132897, y: 46.89226406424213)),
  'EPSG:5124': ProjectAndUnProjectResult(
      Point(x: -403813.23627219687, y: -214743.5749630027),
      Point(x: 17.888058566928727, y: 46.89226405972883)),
  'EPSG:5125': ProjectAndUnProjectResult(
      Point(x: -479981.62890854396, y: -207805.10573059297),
      Point(x: 17.88805858801052, y: 46.892264050503584)),
  'EPSG:5126': ProjectAndUnProjectResult(
      Point(x: -556136.9583800837, y: -199879.98745387606),
      Point(x: 17.88805865250497, y: 46.892264033786056)),
  'EPSG:5127': ProjectAndUnProjectResult(
      Point(x: -632276.9825173458, y: -190963.87314629555),
      Point(x: 17.888058823564478, y: 46.89226400664556)),
  'EPSG:5128': ProjectAndUnProjectResult(
      Point(x: -708399.2618100875, y: -181051.882928591),
      Point(x: 17.888059231433566, y: 46.89226396739856)),
  'EPSG:5129': ProjectAndUnProjectResult(
      Point(x: -784501.1348655766, y: -170138.6053086382),
      Point(x: 17.88806012621695, y: 46.892263918526474)),
  'EPSG:5130': ProjectAndUnProjectResult(
      Point(x: -860579.6933312244, y: -158218.0987339674),
      Point(x: 17.888061961568134, y: 46.8922638720904)),
  'EPSG:5167': ProjectAndUnProjectResult(
      Point(x: -2011257.6923487503, y: 8407396.692423936), Point(x: 0, y: 90)),
  'EPSG:5168': ProjectAndUnProjectResult(
      Point(x: -2891594.3076343164, y: 8260304.863080276), Point(x: 0, y: 90)),
  'EPSG:5169': ProjectAndUnProjectResult(
      Point(x: -3256897.0694959406, y: 8074347.482084176), Point(x: 0, y: 90)),
  'EPSG:5170': ProjectAndUnProjectResult(
      Point(x: -2891594.3076343164, y: 8210304.863080276), Point(x: 0, y: 90)),
  'EPSG:5171': ProjectAndUnProjectResult(
      Point(x: -2477654.964744781, y: 8322681.944070417), Point(x: 0, y: 90)),
  'EPSG:5172': ProjectAndUnProjectResult(
      Point(x: -2011257.6923487503, y: 8407396.692423936), Point(x: 0, y: 90)),
  'EPSG:5173': ProjectAndUnProjectResult(
      Point(x: -3256402.496348738, y: 8074559.151882682), Point(x: 0, y: 90)),
  'EPSG:5174': ProjectAndUnProjectResult(
      Point(x: -2891032.0922573707, y: 8210485.212807267), Point(x: 0, y: 90)),
  'EPSG:5175': ProjectAndUnProjectResult(
      Point(x: -2891032.0922573707, y: 8260485.212807267), Point(x: 0, y: 90)),
  'EPSG:5176': ProjectAndUnProjectResult(
      Point(x: -2477019.7547918474, y: 8322825.359403476), Point(x: 0, y: 90)),
  'EPSG:5177': ProjectAndUnProjectResult(
      Point(x: -2010543.7921361616, y: 8407496.981572509), Point(x: 0, y: 90)),
  'EPSG:5178': ProjectAndUnProjectResult(
      Point(x: -1991617.2470911914, y: 9737666.13340406), Point(x: 0, y: 90)),
  'EPSG:5179': ProjectAndUnProjectResult(
      Point(x: -1991851.0034330576, y: 9738454.984542359), Point(x: 0, y: 90)),
  'EPSG:5180': ProjectAndUnProjectResult(
      Point(x: -3257184.580860154, y: 8075139.859388716), Point(x: 0, y: 90)),
  'EPSG:5181': ProjectAndUnProjectResult(
      Point(x: -2891839.482595572, y: 8211095.205943269), Point(x: 0, y: 90)),
  'EPSG:5182': ProjectAndUnProjectResult(
      Point(x: -2891839.482595572, y: 8261095.205943269), Point(x: 0, y: 90)),
  'EPSG:5183': ProjectAndUnProjectResult(
      Point(x: -2477852.9815661646, y: 8323465.837894738), Point(x: 0, y: 90)),
  'EPSG:5184': ProjectAndUnProjectResult(
      Point(x: -2011403.4038216677, y: 8408169.127970863), Point(x: 0, y: 90)),
  'EPSG:5185': ProjectAndUnProjectResult(
      Point(x: -3257184.580860154, y: 8175139.859388716), Point(x: 0, y: 90)),
  'EPSG:5186': ProjectAndUnProjectResult(
      Point(x: -2891839.482595572, y: 8311095.205943269), Point(x: 0, y: 90)),
  'EPSG:5187': ProjectAndUnProjectResult(
      Point(x: -2477852.9815661646, y: 8423465.837894738), Point(x: 0, y: 90)),
  'EPSG:5188': ProjectAndUnProjectResult(
      Point(x: -2011403.4038216677, y: 8508169.127970863), Point(x: 0, y: 90)),
  'EPSG:5221': ProjectAndUnProjectResult(
      Point(x: -528533.1922473328, y: -1425019.793700168),
      Point(x: 17.888058570312516, y: 46.89226406903086)),
  'EPSG:5223': ProjectAndUnProjectResult(
      Point(x: 948489.8006333073, y: 5710045.039325342),
      Point(x: 17.888058558416994, y: 46.892264063331794)),
  'EPSG:5234': ProjectAndUnProjectResult(
      Point(x: -4304830.484181836, y: 6858500.89478185),
      Point(x: 45, y: double.nan)),
  'EPSG:5235': ProjectAndUnProjectResult(
      Point(x: -4004722.705631966, y: 7158588.972797912),
      Point(x: double.nan, y: double.nan)),
  'EPSG:5243': ProjectAndUnProjectResult(
      Point(x: 563086.4346155266, y: -428506.2201042669),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:5247': ProjectAndUnProjectResult(
      Point(x: -20667926.15717817, y: 7397843.038706061),
      Point(x: 17.888058560281486, y: 46.89226406700866)),
  'EPSG:5253': ProjectAndUnProjectResult(
      Point(x: -194209.03117459663, y: 5235736.574560914),
      Point(x: 17.88805871864152, y: 46.892264021677924)),
  'EPSG:5254': ProjectAndUnProjectResult(
      Point(x: -422543.52053862845, y: 5266978.024236943),
      Point(x: 17.88806088688771, y: 46.892263893655276)),
  'EPSG:5255': ProjectAndUnProjectResult(
      Point(x: -650652.4706583421, y: 5307316.217707126),
      Point(x: 17.888077173234436, y: 46.89226405998426)),
  'EPSG:5256': ProjectAndUnProjectResult(
      Point(x: -878436.8754140371, y: 5356947.036220895),
      Point(x: 17.888161981005887, y: 46.89226782538483)),
  'EPSG:5257': ProjectAndUnProjectResult(
      Point(x: -1105767.8353347534, y: 5416108.299687305),
      Point(x: 17.888509189327227, y: 46.89229076369037)),
  'EPSG:5258': ProjectAndUnProjectResult(
      Point(x: -1332479.2650904243, y: 5485078.642525739),
      Point(x: 17.88971143187752, y: 46.89238970293439)),
  'EPSG:5259': ProjectAndUnProjectResult(
      Point(x: -1558359.8651807948, y: 5564175.834249844),
      Point(x: 17.893399933574372, y: 46.89274299727957)),
  'EPSG:5266': ProjectAndUnProjectResult(
      Point(x: -4678785.617560011, y: 8234839.92570492),
      Point(x: 8796.331693915807, y: 1973.2780739093832)),
  'EPSG:5269': ProjectAndUnProjectResult(
      Point(x: 8805790.968825404, y: 5235736.574560914),
      Point(x: 17.888058718641528, y: 46.892264021677924)),
  'EPSG:5270': ProjectAndUnProjectResult(
      Point(x: 9577456.479461372, y: 5266978.024236943),
      Point(x: 17.88806088688771, y: 46.892263893655276)),
  'EPSG:5271': ProjectAndUnProjectResult(
      Point(x: 10349347.529341659, y: 5307316.217707126),
      Point(x: 17.888077173234446, y: 46.89226405998426)),
  'EPSG:5272': ProjectAndUnProjectResult(
      Point(x: 11121563.124585964, y: 5356947.036220895),
      Point(x: 17.888161981005897, y: 46.89226782538483)),
  'EPSG:5273': ProjectAndUnProjectResult(
      Point(x: 11894232.164665246, y: 5416108.299687305),
      Point(x: 17.888509189327227, y: 46.89229076369037)),
  'EPSG:5274': ProjectAndUnProjectResult(
      Point(x: 12667520.734909575, y: 5485078.642525739),
      Point(x: 17.88971143187752, y: 46.89238970293439)),
  'EPSG:5275': ProjectAndUnProjectResult(
      Point(x: 13441640.134819206, y: 5564175.834249844),
      Point(x: 17.89339993357438, y: 46.89274299727957)),
  'EPSG:5292': ProjectAndUnProjectResult(
      Point(x: -4704823.252256, y: 5804184.223305238),
      Point(x: 12368.947008544978, y: 2739.7138155769444)),
  'EPSG:5293': ProjectAndUnProjectResult(
      Point(x: -4662165.298772348, y: 5692679.988942387),
      Point(x: 7163.607859871399, y: 1624.0876138576555)),
  'EPSG:5294': ProjectAndUnProjectResult(
      Point(x: -4673299.012484079, y: 5720753.247693101),
      Point(x: 8212.083846821457, y: 1848.2317842876012)),
  'EPSG:5295': ProjectAndUnProjectResult(
      Point(x: -4679997.537808284, y: 5737974.8139026435),
      Point(x: 8932.082225317181, y: 2002.3463047345429)),
  'EPSG:5296': ProjectAndUnProjectResult(
      Point(x: -4684218.174779552, y: 5748959.82406592),
      Point(x: 9425.095828579717, y: 2107.955968287918)),
  'EPSG:5297': ProjectAndUnProjectResult(
      Point(x: -4718463.647594405, y: 5842338.209170545),
      Point(x: 14954.685552803032, y: 3295.920727193336)),
  'EPSG:5298': ProjectAndUnProjectResult(
      Point(x: -4721810.471064476, y: 5851912.711262178),
      Point(x: 15689.153491218593, y: 3454.088930198865)),
  'EPSG:5299': ProjectAndUnProjectResult(
      Point(x: -4654625.2365574995, y: 5674038.970150215),
      Point(x: 6543.869347754224, y: 1491.7769995806423)),
  'EPSG:5300': ProjectAndUnProjectResult(
      Point(x: -4725682.777172484, y: 5863101.068562257),
      Point(x: 16596.04987922655, y: 3649.486874227715)),
  'EPSG:5301': ProjectAndUnProjectResult(
      Point(x: -4673299.012484079, y: 5720753.247693101),
      Point(x: 8212.083846821457, y: 1848.2317842876012)),
  'EPSG:5302': ProjectAndUnProjectResult(
      Point(x: -4732781.183870271, y: 5883930.972853467),
      Point(x: 18435.81554512733, y: 4046.180057951108)),
  'EPSG:5303': ProjectAndUnProjectResult(
      Point(x: -4643784.586701601, y: 5647733.411315759),
      Point(x: 5760.501454903568, y: 1324.7507163936098)),
  'EPSG:5304': ProjectAndUnProjectResult(
      Point(x: -4688405.866214727, y: 5759964.86292654),
      Point(x: 9947.317307311861, y: 2219.888560237287)),
  'EPSG:5305': ProjectAndUnProjectResult(
      Point(x: -4662165.298772348, y: 5692679.988942387),
      Point(x: 7163.607859871399, y: 1624.0876138576555)),
  'EPSG:5306': ProjectAndUnProjectResult(
      Point(x: -4738692.258740151, y: 5901608.346899323),
      Point(x: 20167.35354048827, y: 4419.867670027745)),
  'EPSG:5307': ProjectAndUnProjectResult(
      Point(x: -4696681.629514149, y: 5782034.811950033),
      Point(x: 11087.222373618311, y: 2464.431164926013)),
  'EPSG:5308': ProjectAndUnProjectResult(
      Point(x: -4684818.438036357, y: 5750530.747466841),
      Point(x: 9497.867227148303, y: 2123.549755149675)),
  'EPSG:5309': ProjectAndUnProjectResult(
      Point(x: -4683015.6317654345, y: 5745819.203669482),
      Point(x: 9281.335232246713, y: 2077.1541965185925)),
  'EPSG:5310': ProjectAndUnProjectResult(
      Point(x: -4732781.183870271, y: 5883930.972853467),
      Point(x: 18435.81554512733, y: 4046.180057951108)),
  'EPSG:5311': ProjectAndUnProjectResult(
      Point(x: -4709414.770178517, y: 5816876.53384172),
      Point(x: 13172.526666417933, y: 2912.4542979513362)),
  'EPSG:5316': ProjectAndUnProjectResult(
      Point(x: 2090999.5151226467, y: -495459.66639980115),
      Point(x: 17.885795631862905, y: 46.89244457913767)),
  'EPSG:5320': ProjectAndUnProjectResult(
      Point(x: 6585325.179032699, y: 10327216.83405834),
      Point(x: 17.8880585602815, y: 46.89226406700872)),
  'EPSG:5321': ProjectAndUnProjectResult(
      Point(x: 6585325.179032699, y: 10327216.83405834),
      Point(x: 17.8880585602815, y: 46.89226406700872)),
  'EPSG:5325': ProjectAndUnProjectResult(
      Point(x: 4470199.377220549, y: -913939.791333823),
      Point(x: 17.888058560281507, y: 46.89226406700873)),
  'EPSG:5329': ProjectAndUnProjectResult(
      Point(x: 5529701.475727246, y: 6774706.861113531),
      Point(x: 17.88805982223585, y: 46.89226431455566)),
  'EPSG:5330': ProjectAndUnProjectResult(
      Point(x: 5529717.255470115, y: 6774822.740257204),
      Point(x: 17.88805988326397, y: 46.89226423543208)),
  'EPSG:5331': ProjectAndUnProjectResult(
      Point(x: 5529846.478043787, y: 6774362.061687819),
      Point(x: 17.88805976849406, y: 46.8922646303815)),
  'EPSG:5337': ProjectAndUnProjectResult(
      Point(x: 4270529.335546437, y: 16593483.639644068),
      Point(x: 9.855241928320556, y: 48.22084640867507)),
  'EPSG:5343': ProjectAndUnProjectResult(
      Point(x: 6558199.158144748, y: 20088569.71969266), Point(x: 0, y: 90)),
  'EPSG:5344': ProjectAndUnProjectResult(
      Point(x: 7627603.63873359, y: 19759444.393447872),
      Point(x: -14563147143.451214, y: 3188443837.8198547)),
  'EPSG:5345': ProjectAndUnProjectResult(
      Point(x: 8653224.300104942, y: 19433509.59298006),
      Point(x: -39521738.61122337, y: 8695128.741618276)),
  'EPSG:5346': ProjectAndUnProjectResult(
      Point(x: 9640628.03418475, y: 19113941.421131436),
      Point(x: -1685042.2535845686, y: 369929.7983349795)),
  'EPSG:5347': ProjectAndUnProjectResult(
      Point(x: 10594786.08114166, y: 18803251.941004626),
      Point(x: -187879.9335986475, y: 41002.61340262109)),
  'EPSG:5348': ProjectAndUnProjectResult(
      Point(x: 11520125.412785191, y: 18503383.42313258),
      Point(x: -33811.090133644844, y: 7380.196889868265)),
  'EPSG:5349': ProjectAndUnProjectResult(
      Point(x: 12420576.82986139, y: 18215792.792734504),
      Point(x: -7903.831319008155, y: 1789.9479071178757)),
  'EPSG:5355': ProjectAndUnProjectResult(
      Point(x: 5638571.782971076, y: 19108330.90162331),
      Point(x: -1685042.253584662, y: 369929.7983350001)),
  'EPSG:5356': ProjectAndUnProjectResult(
      Point(x: 5625552.597278097, y: 19753575.672750816),
      Point(x: -14563147143.453583, y: 3188443837.820372)),
  'EPSG:5357': ProjectAndUnProjectResult(
      Point(x: 5518117.362620078, y: 18498017.12682365),
      Point(x: -33811.09013364537, y: 7380.196889868381)),
  'EPSG:5361': ProjectAndUnProjectResult(
      Point(x: 5625552.597278097, y: 19753575.672750816),
      Point(x: -14563147143.453583, y: 3188443837.820372)),
  'EPSG:5362': ProjectAndUnProjectResult(
      Point(x: 5436818.00586931, y: 20410808.927530393), Point(x: 0, y: 90)),
  'EPSG:5367': ProjectAndUnProjectResult(
      Point(x: 4706968.526695035, y: 11340922.422292411), Point(x: 0, y: 90)),
  'EPSG:5382': ProjectAndUnProjectResult(
      Point(x: 5518117.36258884, y: 18498017.1268986),
      Point(x: -33811.09013091508, y: 7380.196889341078)),
  'EPSG:5383': ProjectAndUnProjectResult(
      Point(x: 5297700.047128848, y: 17936385.431952223),
      Point(x: -2039.7976296405445, y: 544.0590624398534)),
  'EPSG:5387': ProjectAndUnProjectResult(
      Point(x: 5436818.00586931, y: 20410808.927530393), Point(x: 0, y: 90)),
  'EPSG:5388': ProjectAndUnProjectResult(
      Point(x: 5019695.054228077, y: 11044701.550210133), Point(x: 0, y: 90)),
  'EPSG:5389': ProjectAndUnProjectResult(
      Point(x: 5625552.597278097, y: 19753575.672750816),
      Point(x: -14563147143.453583, y: 3188443837.820372)),
  'EPSG:5396': ProjectAndUnProjectResult(
      Point(x: 3859134.0088134822, y: 16259299.99691699),
      Point(x: 16.418121572269165, y: 47.11123824637778)),
  'EPSG:5463': ProjectAndUnProjectResult(
      Point(x: 5019765.581687489, y: 11044729.306872435),
      Point(x: 176.26099850716986, y: 89.99940003205084)),
  'EPSG:5466': ProjectAndUnProjectResult(
      Point(x: 3622337.4680198547, y: 9986868.192057936), Point(x: 0, y: 90)),
  'EPSG:5472': ProjectAndUnProjectResult(
      Point(x: 7227331.737905409, y: 10317868.916699609),
      Point(x: -135, y: double.nan)),
  'EPSG:5479': ProjectAndUnProjectResult(
      Point(x: -11622728.1476195, y: -20155986.891862214),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:5480': ProjectAndUnProjectResult(
      Point(x: -13165854.550953317, y: -21831066.27411452),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:5481': ProjectAndUnProjectResult(
      Point(x: -15185803.60358078, y: -23172406.771932896),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:5490': ProjectAndUnProjectResult(
      Point(x: 5638571.782971076, y: 9108330.901623307),
      Point(x: -1685042.2535846238, y: 369929.7983349917)),
  'EPSG:5513': ProjectAndUnProjectResult(
      Point(x: -528533.1922473328, y: -1425019.793700168),
      Point(x: 17.888058570312516, y: 46.89226406903086)),
  'EPSG:5514': ProjectAndUnProjectResult(
      Point(x: -528533.1922473328, y: -1425019.793700168),
      Point(x: 17.888058570312516, y: 46.89226406903086)),
  'EPSG:5518': ProjectAndUnProjectResult(
      Point(x: 49706648.65922565, y: -18794448.933160026),
      Point(x: -12.251180423372775, y: -89.99839671850718)),
  'EPSG:5519': ProjectAndUnProjectResult(
      Point(x: 49707277.556579426, y: -18795224.49748884),
      Point(x: -8.331860198392532, y: -89.99842511388825)),
  'EPSG:5520': ProjectAndUnProjectResult(
      Point(x: 2633655.753655738, y: 5303558.113725107),
      Point(x: 17.88804237619113, y: 46.89226400489469)),
  'EPSG:5523': ProjectAndUnProjectResult(
      Point(x: 1986564.1571912412, y: 10713034.420684053),
      Point(x: 17.888058555667435, y: 46.89226406106194)),
  'EPSG:5530': ProjectAndUnProjectResult(
      Point(x: 9743888.799047105, y: 17533817.779493183),
      Point(x: 17.888058562695008, y: 46.89226406831664)),
  'EPSG:5531': ProjectAndUnProjectResult(
      Point(x: 5518150.943681081, y: 18498008.55077108),
      Point(x: 45, y: double.nan)),
  'EPSG:5532': ProjectAndUnProjectResult(
      Point(x: 5297725.110811591, y: 17936374.09694047),
      Point(x: 45, y: double.nan)),
  'EPSG:5533': ProjectAndUnProjectResult(
      Point(x: 5003608.4851662, y: 17430549.703619678),
      Point(x: 45, y: double.nan)),
  'EPSG:5534': ProjectAndUnProjectResult(
      Point(x: 4656121.615993274, y: 16983064.750315905),
      Point(x: -27.570127946245623, y: 55.09561109213326)),
  'EPSG:5535': ProjectAndUnProjectResult(
      Point(x: 4270758.917678879, y: 16593422.3639436),
      Point(x: 9.846955232606913, y: 48.22204658800775)),
  'EPSG:5536': ProjectAndUnProjectResult(
      Point(x: 5518224.65906046, y: 18498322.508853763),
      Point(x: 45, y: double.nan)),
  'EPSG:5537': ProjectAndUnProjectResult(
      Point(x: 5297812.557566325, y: 17936677.687824547),
      Point(x: 45, y: double.nan)),
  'EPSG:5538': ProjectAndUnProjectResult(
      Point(x: 5003702.71324619, y: 17430840.209902868),
      Point(x: 45, y: double.nan)),
  'EPSG:5539': ProjectAndUnProjectResult(
      Point(x: 4656219.226044899, y: 16983341.015504878),
      Point(x: -27.57641794586292, y: 55.09665946884065)),
  'EPSG:5550': ProjectAndUnProjectResult(
      Point(x: 1558843.5538291563, y: 21945699.007619552), Point(x: 0, y: 90)),
  'EPSG:5551': ProjectAndUnProjectResult(
      Point(x: 4451906.623195637, y: 21150975.810983855), Point(x: 0, y: 90)),
  'EPSG:5552': ProjectAndUnProjectResult(
      Point(x: 8240765.467341783, y: 19567647.747223884),
      Point(x: -4967267525.630645, y: 1643558557.1708994)),
  'EPSG:5562': ProjectAndUnProjectResult(
      Point(x: 4262977.023450082, y: 5200107.5557981115),
      Point(x: 17.888058571143702, y: 46.89226406858427)),
  'EPSG:5563': ProjectAndUnProjectResult(
      Point(x: 4805913.470558321, y: 5235860.647503206),
      Point(x: 17.888058729263665, y: 46.8922640233896)),
  'EPSG:5564': ProjectAndUnProjectResult(
      Point(x: 5349465.904755867, y: 5307431.144329979),
      Point(x: 17.888077165110133, y: 46.89226406159528)),
  'EPSG:5565': ProjectAndUnProjectResult(
      Point(x: 5894346.358031101, y: 5416214.116028281),
      Point(x: 17.888508861463574, y: 46.89229074889061)),
  'EPSG:5566': ProjectAndUnProjectResult(
      Point(x: 262977.02345008205, y: 5200107.5557981115),
      Point(x: 17.8880585711437, y: 46.89226406858427)),
  'EPSG:5567': ProjectAndUnProjectResult(
      Point(x: -194086.52944167913, y: 5235860.647503206),
      Point(x: 17.888058729263665, y: 46.8922640233896)),
  'EPSG:5568': ProjectAndUnProjectResult(
      Point(x: -650534.0952441327, y: 5307431.144329979),
      Point(x: 17.888077165110136, y: 46.89226406159528)),
  'EPSG:5569': ProjectAndUnProjectResult(
      Point(x: -1105653.6419688992, y: 5416214.116028281),
      Point(x: 17.888508861463574, y: 46.89229074889061)),
  'EPSG:5570': ProjectAndUnProjectResult(
      Point(x: 7262977.023450082, y: 5200107.5557981115),
      Point(x: 17.888058571143702, y: 46.89226406858427)),
  'EPSG:5571': ProjectAndUnProjectResult(
      Point(x: 8034399.759328651, y: 5213567.368145596),
      Point(x: 17.88805857401238, y: 46.89226406408987)),
  'EPSG:5572': ProjectAndUnProjectResult(
      Point(x: 8805913.470558321, y: 5235860.647503206),
      Point(x: 17.888058729263665, y: 46.8922640233896)),
  'EPSG:5573': ProjectAndUnProjectResult(
      Point(x: 9577576.922293972, y: 5267097.50637579),
      Point(x: 17.888060894831238, y: 46.89226389546803)),
  'EPSG:5574': ProjectAndUnProjectResult(
      Point(x: 10349465.904755868, y: 5307431.144329979),
      Point(x: 17.88807716511015, y: 46.89226406159528)),
  'EPSG:5575': ProjectAndUnProjectResult(
      Point(x: 11121679.419562321, y: 5357057.416403098),
      Point(x: 17.8881619026993, y: 46.89226782431081)),
  'EPSG:5576': ProjectAndUnProjectResult(
      Point(x: 11894346.358031102, y: 5416214.116028281),
      Point(x: 17.88850886146358, y: 46.892290748890616)),
  'EPSG:5577': ProjectAndUnProjectResult(
      Point(x: 262977.02345008205, y: 5200107.5557981115),
      Point(x: 17.8880585711437, y: 46.89226406858427)),
  'EPSG:5578': ProjectAndUnProjectResult(
      Point(x: 34399.75932865159, y: 5213567.368145596),
      Point(x: 17.888058574012387, y: 46.892264064089886)),
  'EPSG:5579': ProjectAndUnProjectResult(
      Point(x: -194086.52944167913, y: 5235860.647503206),
      Point(x: 17.888058729263665, y: 46.8922640233896)),
  'EPSG:5580': ProjectAndUnProjectResult(
      Point(x: -422423.0777060273, y: 5267097.50637579),
      Point(x: 17.888060894831245, y: 46.89226389546803)),
  'EPSG:5581': ProjectAndUnProjectResult(
      Point(x: -650534.0952441327, y: 5307431.144329979),
      Point(x: 17.888077165110136, y: 46.89226406159528)),
  'EPSG:5582': ProjectAndUnProjectResult(
      Point(x: -878320.5804376781, y: 5357057.416403098),
      Point(x: 17.888161902699313, y: 46.892267824310814)),
  'EPSG:5583': ProjectAndUnProjectResult(
      Point(x: -1105653.6419688992, y: 5416214.116028281),
      Point(x: 17.888508861463574, y: 46.89229074889061)),
  'EPSG:5588': ProjectAndUnProjectResult(
      Point(x: 19098094.57440187, y: 13088243.457659297),
      Point(x: 17.88805856028152, y: 46.892264047823105)),
  'EPSG:5589': ProjectAndUnProjectResult(
      Point(x: 11884415.902702041, y: 32765609.556738283), Point(x: 0, y: 90)),
  'EPSG:5596': ProjectAndUnProjectResult(
      Point(x: 1499454.8179030179, y: 5216171.863445401),
      Point(x: 17.888058554214552, y: 46.892264060090596)),
  'EPSG:5623': ProjectAndUnProjectResult(
      Point(x: 14429087.739256004, y: 22027871.647838622), Point(x: 0, y: 90)),
  'EPSG:5624': ProjectAndUnProjectResult(
      Point(x: 13577181.714980586, y: 22651971.964210976), Point(x: 0, y: 90)),
  'EPSG:5625': ProjectAndUnProjectResult(
      Point(x: 12102088.540377058, y: 23459364.607388716), Point(x: 0, y: 90)),
  'EPSG:5627': ProjectAndUnProjectResult(
      Point(x: 1405242.8678058116, y: 5262433.223564823),
      Point(x: 17.88805661187514, y: 46.89226390821537)),
  'EPSG:5629': ProjectAndUnProjectResult(
      Point(x: -1557536.5212162894, y: 15561950.164033774),
      Point(x: 17.893399933574567, y: 46.89274299727972)),
  'EPSG:5631': ProjectAndUnProjectResult(
      Point(x: 3177292.4585295245, y: 5233913.198984689),
      Point(x: 17.888058447269415, y: 46.89226402919728)),
  'EPSG:5632': ProjectAndUnProjectResult(
      Point(x: 4580708.59132307, y: 2282143.4053414315),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:5633': ProjectAndUnProjectResult(
      Point(x: 4921381.502448138, y: 2674052.203833336),
      Point(x: 17.888058560281518, y: 46.89226406911223)),
  'EPSG:5634': ProjectAndUnProjectResult(
      Point(x: 4580708.59132307, y: 2282143.4053414315),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:5635': ProjectAndUnProjectResult(
      Point(x: 4921381.502448138, y: 2674052.203833336),
      Point(x: 17.888058560281518, y: 46.89226406911223)),
  'EPSG:5636': ProjectAndUnProjectResult(
      Point(x: 4921381.502448138, y: 2674052.203833336),
      Point(x: 17.888058560281518, y: 46.89226406911223)),
  'EPSG:5637': ProjectAndUnProjectResult(
      Point(x: 4580708.59132307, y: 2282143.4053414315),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:5638': ProjectAndUnProjectResult(
      Point(x: 4921381.502448138, y: 2674052.203833336),
      Point(x: 17.888058560281518, y: 46.89226406911223)),
  'EPSG:5639': ProjectAndUnProjectResult(
      Point(x: 4580708.59132307, y: 2282143.4053414315),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:5643': ProjectAndUnProjectResult(
      Point(x: 1418749.1386416086, y: -90270.6623273138),
      Point(x: 17.888058565321924, y: 46.89226407177286)),
  'EPSG:5644': ProjectAndUnProjectResult(
      Point(x: -2005500.4108122215, y: 15751900.44658664),
      Point(x: 17.930935679469886, y: 46.897081134395314)),
  'EPSG:5646': ProjectAndUnProjectResult(
      Point(x: 18181618.507753536, y: 17828486.854641918), Point(x: 0, y: 90)),
  'EPSG:5649': ProjectAndUnProjectResult(
      Point(x: 32633185.606417127, y: 5301866.087016829),
      Point(x: 17.888042388656366, y: 46.892264000337974)),
  'EPSG:5650': ProjectAndUnProjectResult(
      Point(x: 33720001.22984009, y: 5197241.60997254),
      Point(x: 17.888058560302063, y: 46.89226406695651)),
  'EPSG:5651': ProjectAndUnProjectResult(
      Point(x: 32633185.606417127, y: 5301866.087016829),
      Point(x: 17.888042388656366, y: 46.892264000337974)),
  'EPSG:5652': ProjectAndUnProjectResult(
      Point(x: 33176891.287219305, y: 5231671.834018296),
      Point(x: 17.888058435437348, y: 46.892264027445336)),
  'EPSG:5653': ProjectAndUnProjectResult(
      Point(x: 33720001.22984009, y: 5197241.60997254),
      Point(x: 17.888058560302063, y: 46.89226406695651)),
  'EPSG:5654': ProjectAndUnProjectResult(
      Point(x: 18181618.507753536, y: 17828486.854641918), Point(x: 0, y: 90)),
  'EPSG:5655': ProjectAndUnProjectResult(
      Point(x: 18181618.507753536, y: 17828486.854641918), Point(x: 0, y: 90)),
  'EPSG:5659': ProjectAndUnProjectResult(
      Point(x: 1176985.5125911732, y: 1231872.879029004),
      Point(x: 17.888058440115774, y: 46.89226402774989)),
  'EPSG:5663': ProjectAndUnProjectResult(
      Point(x: 3720215.2591528012, y: 5199459.086602302),
      Point(x: 17.888058572359384, y: 46.89226406874446)),
  'EPSG:5664': ProjectAndUnProjectResult(
      Point(x: 3177291.738831021, y: 5233913.048442174),
      Point(x: 17.88805844634046, y: 46.892264029990585)),
  'EPSG:5665': ProjectAndUnProjectResult(
      Point(x: 3720214.533676548, y: 5199458.992247189),
      Point(x: 17.88805857142926, y: 46.89226406953736)),
  'EPSG:5666': ProjectAndUnProjectResult(
      Point(x: 4177087.538008534, y: 5233165.822182404),
      Point(x: 17.88805843535868, y: 46.892264093608865)),
  'EPSG:5667': ProjectAndUnProjectResult(
      Point(x: 4948619.814255216, y: 5211532.968062555),
      Point(x: 17.888058558410155, y: 46.892264129373)),
  'EPSG:5668': ProjectAndUnProjectResult(
      Point(x: 4948619.814255216, y: 5211532.968062555),
      Point(x: 17.888058558410155, y: 46.892264129373)),
  'EPSG:5669': ProjectAndUnProjectResult(
      Point(x: 5720065.001582181, y: 5198725.952166574),
      Point(x: 17.888058560301882, y: 46.89226413298655)),
  'EPSG:5670': ProjectAndUnProjectResult(
      Point(x: 4177292.4585295245, y: 5233913.198984689),
      Point(x: 17.888058447269415, y: 46.89226402919728)),
  'EPSG:5671': ProjectAndUnProjectResult(
      Point(x: 4948797.440905435, y: 5212272.602643184),
      Point(x: 17.888058570467997, y: 46.89226406511432)),
  'EPSG:5672': ProjectAndUnProjectResult(
      Point(x: 5720215.259152802, y: 5199459.086602302),
      Point(x: 17.88805857235939, y: 46.89226406874446)),
  'EPSG:5673': ProjectAndUnProjectResult(
      Point(x: 4177291.738831021, y: 5233913.048442174),
      Point(x: 17.88805844634046, y: 46.892264029990585)),
  'EPSG:5674': ProjectAndUnProjectResult(
      Point(x: 4948796.71822361, y: 5212272.480322573),
      Point(x: 17.88805856953789, y: 46.89226406590728)),
  'EPSG:6686': ProjectAndUnProjectResult(
      Point(x: -788366.1033867978, y: 9962400.81668543), Point(x: 0, y: 90)),
  'EPSG:5675': ProjectAndUnProjectResult(
      Point(x: 5720214.533676548, y: 5199458.992247189),
      Point(x: 17.88805857142926, y: 46.89226406953736)),
  'EPSG:5676': ProjectAndUnProjectResult(
      Point(x: 3405557.9712320073, y: 5263903.117962763),
      Point(x: 17.888056614893635, y: 46.89226390657308)),
  'EPSG:5677': ProjectAndUnProjectResult(
      Point(x: 4177240.9231268167, y: 5233330.939970062),
      Point(x: 17.88805844618341, y: 46.89226402887191)),
  'EPSG:5678': ProjectAndUnProjectResult(
      Point(x: 4948778.943728735, y: 5211691.55403255),
      Point(x: 17.888058569521185, y: 46.892264064681335)),
  'EPSG:5679': ProjectAndUnProjectResult(
      Point(x: 5720229.782756959, y: 5198878.037007652),
      Point(x: 17.888058571421293, y: 46.8922640683026)),
  'EPSG:5680': ProjectAndUnProjectResult(
      Point(x: 2633655.753655738, y: 5303558.113725107),
      Point(x: 17.88804237619113, y: 46.89226400489469)),
  'EPSG:5682': ProjectAndUnProjectResult(
      Point(x: 3405410.460859641, y: 5263731.414179802),
      Point(x: 17.888056607098953, y: 46.89226397138334)),
  'EPSG:5683': ProjectAndUnProjectResult(
      Point(x: 4177087.538008534, y: 5233165.822182404),
      Point(x: 17.88805843535868, y: 46.892264093608865)),
  'EPSG:5684': ProjectAndUnProjectResult(
      Point(x: 4948619.814255216, y: 5211532.968062555),
      Point(x: 17.888058558410155, y: 46.892264129373)),
  'EPSG:5685': ProjectAndUnProjectResult(
      Point(x: 5720065.001582181, y: 5198725.952166574),
      Point(x: 17.888058560301882, y: 46.89226413298655)),
  'EPSG:5700': ProjectAndUnProjectResult(
      Point(x: 48730994.20351042, y: -13178134.332903616), Point(x: 0, y: -90)),
  'EPSG:5825': ProjectAndUnProjectResult(
      Point(x: 5314852.692242589, y: 15238241.176835464),
      Point(x: -149.67352147660628, y: 89.99892064788257)),
  'EPSG:5836': ProjectAndUnProjectResult(
      Point(x: -1105125.5281863362, y: 5413941.8564866185),
      Point(x: 17.888509189327262, y: 46.89229076369042)),
  'EPSG:5837': ProjectAndUnProjectResult(
      Point(x: -2446060.569110333, y: 5986999.55140372),
      Point(x: 18.16321978290508, y: 46.92855172420238)),
  'EPSG:5839': ProjectAndUnProjectResult(
      Point(x: 5019695.054228077, y: 21044701.550210133), Point(x: 0, y: 90)),
  'EPSG:5842': ProjectAndUnProjectResult(
      Point(x: 948489.8006333073, y: 15210045.039325342),
      Point(x: 17.888058558416994, y: 46.892264063331794)),
  'EPSG:5844': ProjectAndUnProjectResult(
      Point(x: -422451.2661865746, y: 15266451.32643452),
      Point(x: 17.88806088688771, y: 46.892263893655276)),
  'EPSG:5858': ProjectAndUnProjectResult(
      Point(x: 5297726.05064618, y: 17936374.096953288),
      Point(x: 45, y: double.nan)),
  'EPSG:5875': ProjectAndUnProjectResult(
      Point(x: 5436878.798387973, y: 20410822.82640118),
      Point(x: 176.7028629916266, y: 89.99939601188143)),
  'EPSG:5876': ProjectAndUnProjectResult(
      Point(x: 5625603.638223884, y: 19753578.969879918),
      Point(x: 45, y: double.nan)),
  'EPSG:5877': ProjectAndUnProjectResult(
      Point(x: 5638613.720256775, y: 19108326.98291693),
      Point(x: 45, y: double.nan)),
  'EPSG:5879': ProjectAndUnProjectResult(
      Point(x: -1557699.303974138, y: 15562079.11344527),
      Point(x: 17.893401880235054, y: 46.89274302310201)),
  'EPSG:5880': ProjectAndUnProjectResult(
      Point(x: 9743867.12290849, y: 17533827.812023543),
      Point(x: 17.88805856028146, y: 46.89226406700877)),
  'EPSG:5887': ProjectAndUnProjectResult(
      Point(x: 49730994.20351042, y: -18178134.332903616), Point(x: 0, y: -90)),
  'EPSG:5890': ProjectAndUnProjectResult(
      Point(x: -4727263.692115386, y: 384726.04478125763),
      Point(x: 17.888058560281515, y: 46.89226406679031)),
  'EPSG:5921': ProjectAndUnProjectResult(
      Point(x: 3946363.3033214873, y: 3993207.894882794),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:5922': ProjectAndUnProjectResult(
      Point(x: 4130370.1796850013, y: -1786482.5598647278),
      Point(x: 17.888058560281518, y: 46.89226406700873)),
  'EPSG:5923': ProjectAndUnProjectResult(
      Point(x: -1280775.1754836992, y: -3825645.6795010297),
      Point(x: 17.888058560281515, y: 46.89226406700873)),
  'EPSG:5924': ProjectAndUnProjectResult(
      Point(x: -4956935.100909344, y: 638044.32832245),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:6329': ProjectAndUnProjectResult(
      Point(x: 36792794.61949032, y: -11620286.792548649), Point(x: 0, y: -90)),
  'EPSG:5925': ProjectAndUnProjectResult(
      Point(x: -1918247.3771278067, y: 5557907.863075018),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:5926': ProjectAndUnProjectResult(
      Point(x: 4122043.342458628, y: 4645933.03942385),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:5927': ProjectAndUnProjectResult(
      Point(x: 4015111.868376117, y: -937269.0846227852),
      Point(x: 17.888058560281518, y: 46.892264067008725)),
  'EPSG:5928': ProjectAndUnProjectResult(
      Point(x: -1232614.864771781, y: -2846442.8410716876),
      Point(x: 17.888058560281518, y: 46.892264067008725)),
  'EPSG:5929': ProjectAndUnProjectResult(
      Point(x: -4902148.795128584, y: 1362844.632131881),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:5930': ProjectAndUnProjectResult(
      Point(x: -2295159.4027560353, y: 6301183.0780229),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:5931': ProjectAndUnProjectResult(
      Point(x: 4471341.859223193, y: 5230666.620786624),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:5932': ProjectAndUnProjectResult(
      Point(x: 3929641.8091766406, y: -153133.01290731132),
      Point(x: 17.888058560281518, y: 46.892264067008725)),
  'EPSG:5933': ProjectAndUnProjectResult(
      Point(x: -1188183.3054560896, y: -1910006.2399837212),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:5934': ProjectAndUnProjectResult(
      Point(x: -4922351.672361038, y: 2005951.3756691637),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:5935': ProjectAndUnProjectResult(
      Point(x: -2924369.894691192, y: 7034550.211933859),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:5936': ProjectAndUnProjectResult(
      Point(x: 3052508.1786910295, y: 6904524.573246653),
      Point(x: 17.88805856028151, y: 46.89226406700877)),
  'EPSG:5937': ProjectAndUnProjectResult(
      Point(x: 6433623.011832415, y: 4346299.585462572),
      Point(x: 17.888058560281525, y: 46.89226406700877)),
  'EPSG:5938': ProjectAndUnProjectResult(
      Point(x: 5892134.678781038, y: -1164399.2159684584),
      Point(x: 17.888058560281518, y: 46.89226406700877)),
  'EPSG:5939': ProjectAndUnProjectResult(
      Point(x: 1990199.6469416232, y: -3016177.699092377),
      Point(x: 17.888058560281515, y: 46.89226406700877)),
  'EPSG:5940': ProjectAndUnProjectResult(
      Point(x: -3009816.1127397185, y: 1747260.465448589),
      Point(x: 17.88805856028151, y: 46.89226406700877)),
  'EPSG:6050': ProjectAndUnProjectResult(
      Point(x: 29211939.128542803, y: -1362813.9361472572),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6051': ProjectAndUnProjectResult(
      Point(x: 23160659.981976435, y: 1623551.285055918),
      Point(x: 17.888058560281518, y: 46.89226406700871)),
  'EPSG:32605': ProjectAndUnProjectResult(
      Point(x: -61735465.00836595, y: -38016576.898993805),
      Point(x: 0, y: -90)),
  'EPSG:6052': ProjectAndUnProjectResult(
      Point(x: 22962409.679766644, y: -942061.73976574),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:6053': ProjectAndUnProjectResult(
      Point(x: 34442149.482131094, y: 4362713.145756536),
      Point(x: 17.88805856028151, y: 46.89226406700875)),
  'EPSG:6054': ProjectAndUnProjectResult(
      Point(x: 35601258.94243822, y: 1988600.4054723177),
      Point(x: 17.888058560281493, y: 46.89226406700875)),
  'EPSG:6055': ProjectAndUnProjectResult(
      Point(x: 35778374.666366816, y: 372020.9731122027),
      Point(x: 17.88805856028148, y: 46.892264067008746)),
  'EPSG:6056': ProjectAndUnProjectResult(
      Point(x: 25358466.57476475, y: 5246069.499067494),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:6057': ProjectAndUnProjectResult(
      Point(x: 26553257.26057827, y: 3336471.7030962096),
      Point(x: 17.888058560281532, y: 46.892264067008725)),
  'EPSG:6058': ProjectAndUnProjectResult(
      Point(x: 27036297.27512765, y: 1924466.6802394548),
      Point(x: 17.888058560281507, y: 46.89226406700874)),
  'EPSG:6059': ProjectAndUnProjectResult(
      Point(x: 46300896.26590719, y: 6376729.593240524),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6060': ProjectAndUnProjectResult(
      Point(x: 47648187.08747809, y: 4877253.733754402),
      Point(x: 17.888058560281543, y: 46.89226406700871)),
  'EPSG:6061': ProjectAndUnProjectResult(
      Point(x: 48542355.72864429, y: 3672432.5309997974),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:6062': ProjectAndUnProjectResult(
      Point(x: 31136068.49182696, y: 7199586.558391113),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6063': ProjectAndUnProjectResult(
      Point(x: 32421052.784847174, y: 5938345.176547724),
      Point(x: 17.888058560281507, y: 46.892264067008746)),
  'EPSG:6064': ProjectAndUnProjectResult(
      Point(x: 33372556.836155962, y: 4937029.277303068),
      Point(x: 17.88805856028152, y: 46.89226406700873)),
  'EPSG:6065': ProjectAndUnProjectResult(
      Point(x: 15956946.664678477, y: 8124441.911095215),
      Point(x: 17.888058560281518, y: 46.892264067008746)),
  'EPSG:6066': ProjectAndUnProjectResult(
      Point(x: 17180671.17857993, y: 7020507.474058315),
      Point(x: 17.888058560281507, y: 46.892264067008746)),
  'EPSG:6067': ProjectAndUnProjectResult(
      Point(x: 24988565.14662123, y: 9481374.641974468),
      Point(x: 17.888058560281518, y: 46.89226406700872)),
  'EPSG:6068': ProjectAndUnProjectResult(
      Point(x: 26315741.595585834, y: 8517148.25571841),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:6069': ProjectAndUnProjectResult(
      Point(x: 22662665.73711388, y: -1590036.3203811347),
      Point(x: 17.888058560281497, y: 46.892264067008725)),
  'EPSG:6070': ProjectAndUnProjectResult(
      Point(x: 11235971.467963241, y: -175261.59021839453),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6071': ProjectAndUnProjectResult(
      Point(x: 27156829.82146629, y: 1268394.4999872595),
      Point(x: 17.888058560281507, y: 46.89226406700874)),
  'EPSG:6072': ProjectAndUnProjectResult(
      Point(x: 27170941.64473368, y: 1406513.1612420408),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:6073': ProjectAndUnProjectResult(
      Point(x: 11819165.364626842, y: 2636916.2905788487),
      Point(x: 17.888058560281507, y: 46.89226406700873)),
  'EPSG:6074': ProjectAndUnProjectResult(
      Point(x: 12192199.929272791, y: 2802568.3263358837),
      Point(x: 17.888058560281518, y: 46.892264067008746)),
  'EPSG:6075': ProjectAndUnProjectResult(
      Point(x: 21656762.289162662, y: -702350.0480100727),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:6076': ProjectAndUnProjectResult(
      Point(x: 21698827.159274917, y: 2051041.4263859903),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:6077': ProjectAndUnProjectResult(
      Point(x: 10766168.114906056, y: 639234.3425649977),
      Point(x: 17.888058560281518, y: 46.892264067008725)),
  'EPSG:6078': ProjectAndUnProjectResult(
      Point(x: 11048085.685612302, y: 2591547.0719774826),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6079': ProjectAndUnProjectResult(
      Point(x: 12554144.784253523, y: 5144849.75932946),
      Point(x: 17.8880585602815, y: 46.89226406700872)),
  'EPSG:6080': ProjectAndUnProjectResult(
      Point(x: 15420164.190572355, y: 7597061.539570538),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:6081': ProjectAndUnProjectResult(
      Point(x: 27400389.84062728, y: 2316444.435553908),
      Point(x: 17.8880585602815, y: 46.89226406700872)),
  'EPSG:6082': ProjectAndUnProjectResult(
      Point(x: 28132042.326904997, y: 3850759.657223044),
      Point(x: 17.888058560281525, y: 46.892264067008746)),
  'EPSG:6083': ProjectAndUnProjectResult(
      Point(x: 29571398.998838726, y: 5760866.3751071235),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:6084': ProjectAndUnProjectResult(
      Point(x: 31809296.274642088, y: 7737285.738799064),
      Point(x: 17.8880585602815, y: 46.892264067008746)),
  'EPSG:6085': ProjectAndUnProjectResult(
      Point(x: 34807189.61921593, y: 9459794.806370655),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:6086': ProjectAndUnProjectResult(
      Point(x: 38479333.41646298, y: 10684074.555158485),
      Point(x: 17.888058560281486, y: 46.892264067008725)),
  'EPSG:6087': ProjectAndUnProjectResult(
      Point(x: 12708090.446935492, y: 3489500.7605388165),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6088': ProjectAndUnProjectResult(
      Point(x: 13528951.815106094, y: 4622677.362694095),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6089': ProjectAndUnProjectResult(
      Point(x: 14759394.428896282, y: 6156818.745237717),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:6090': ProjectAndUnProjectResult(
      Point(x: 16560210.960804481, y: 7861557.522394458),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6091': ProjectAndUnProjectResult(
      Point(x: 18955366.504196048, y: 9531785.18616663),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6092': ProjectAndUnProjectResult(
      Point(x: 21897317.256455526, y: 10966545.49110287),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:6117': ProjectAndUnProjectResult(
      Point(x: 27754657.779008288, y: 5346680.714011554),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:6093': ProjectAndUnProjectResult(
      Point(x: 25272730.83141788, y: 11993212.842347767),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:6094': ProjectAndUnProjectResult(
      Point(x: 28672231.949399307, y: 12453101.772669625),
      Point(x: 17.888058560281486, y: 46.892264067008746)),
  'EPSG:6095': ProjectAndUnProjectResult(
      Point(x: 33446085.147038214, y: 12124067.20999254),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6096': ProjectAndUnProjectResult(
      Point(x: 13213266.737754596, y: 13796554.57464162),
      Point(x: 17.888058560281486, y: 46.89226406700873)),
  'EPSG:6097': ProjectAndUnProjectResult(
      Point(x: 18709561.0091406, y: 13447950.448874282),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6098': ProjectAndUnProjectResult(
      Point(x: 28282386.94989309, y: 3522610.5991332335),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:6099': ProjectAndUnProjectResult(
      Point(x: 18226991.753159028, y: 6702873.251982847),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6100': ProjectAndUnProjectResult(
      Point(x: 21481976.439178005, y: 3566045.551557177),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6101': ProjectAndUnProjectResult(
      Point(x: 28412020.37379972, y: 8791777.2991312),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6102': ProjectAndUnProjectResult(
      Point(x: 32008452.988568272, y: 6843724.140249735),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:6103': ProjectAndUnProjectResult(
      Point(x: 34442149.482131094, y: 4362713.145756536),
      Point(x: 17.88805856028151, y: 46.89226406700875)),
  'EPSG:6104': ProjectAndUnProjectResult(
      Point(x: 17536496.56207289, y: 10073776.32950361),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:6105': ProjectAndUnProjectResult(
      Point(x: 20869384.07738987, y: 8486849.534234472),
      Point(x: 17.888058560281525, y: 46.892264067008746)),
  'EPSG:6106': ProjectAndUnProjectResult(
      Point(x: 23435009.154089913, y: 6493110.821504261),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:6107': ProjectAndUnProjectResult(
      Point(x: 36572083.99074524, y: 11453650.89477485),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6108': ProjectAndUnProjectResult(
      Point(x: 39668677.127104156, y: 10240415.296023415),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:6109': ProjectAndUnProjectResult(
      Point(x: 42309909.87845571, y: 8735995.911881693),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6110': ProjectAndUnProjectResult(
      Point(x: 44425737.963693015, y: 7104726.16733988),
      Point(x: 17.888058560281525, y: 46.892264067008746)),
  'EPSG:6111': ProjectAndUnProjectResult(
      Point(x: 21719597.49526016, y: 12782575.461948223),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:6112': ProjectAndUnProjectResult(
      Point(x: 24718902.326839015, y: 11624345.555039367),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6113': ProjectAndUnProjectResult(
      Point(x: 27318746.029775776, y: 10217116.293077389),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6114': ProjectAndUnProjectResult(
      Point(x: 29462333.20469378, y: 8694129.298098769),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6115': ProjectAndUnProjectResult(
      Point(x: 26450870.175606057, y: -2894301.400468095),
      Point(x: 17.8880585602815, y: 46.892264067008725)),
  'EPSG:6116': ProjectAndUnProjectResult(
      Point(x: 24732905.80108915, y: 450840.2015568176),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6118': ProjectAndUnProjectResult(
      Point(x: 22597913.495447412, y: 6904605.098151971),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6119': ProjectAndUnProjectResult(
      Point(x: 23946253.226905465, y: 5420530.248920105),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6120': ProjectAndUnProjectResult(
      Point(x: 7762498.399899033, y: 7558409.844559555),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6121': ProjectAndUnProjectResult(
      Point(x: 13345103.129377346, y: 8305161.42974583),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6122': ProjectAndUnProjectResult(
      Point(x: 19408014.81123779, y: 9273898.483698972),
      Point(x: 17.88805856028154, y: 46.89226406700874)),
  'EPSG:6123': ProjectAndUnProjectResult(
      Point(x: 24566702.636361282, y: 9620633.58516803),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6124': ProjectAndUnProjectResult(
      Point(x: 13589094.96411597, y: 10994305.853383258),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:6125': ProjectAndUnProjectResult(
      Point(x: 49335237.01547448, y: 2979540.0928082597),
      Point(x: 17.888058560281507, y: 46.89226406700873)),
  'EPSG:6328': ProjectAndUnProjectResult(
      Point(x: 27108574.549169235, y: -3184231.5325187673),
      Point(x: -103767.21820745963, y: -188871.77584872008)),
  'EPSG:6128': ProjectAndUnProjectResult(
      Point(x: 16467779.683013316, y: 36233448.3780888),
      Point(x: 67.37067473281468, y: 89.99832277875188)),
  'EPSG:6129': ProjectAndUnProjectResult(
      Point(x: 16468688.286027435, y: 36235720.10317613),
      Point(x: -147.13337001567663, y: 89.99933128624545)),
  'EPSG:6141': ProjectAndUnProjectResult(
      Point(x: -14445916.42367035, y: 15565177.316419605),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6204': ProjectAndUnProjectResult(
      Point(x: 263306.856960149, y: 5198942.980445724),
      Point(x: 17.888058599026714, y: 46.892264069175155)),
  'EPSG:6210': ProjectAndUnProjectResult(
      Point(x: 5003589.298485577, y: 7430562.416711468),
      Point(x: 87.06844226328268, y: 103.32192587414212)),
  'EPSG:6211': ProjectAndUnProjectResult(
      Point(x: 4656108.536534103, y: 6983077.859512636),
      Point(x: -27.574000095106953, y: 55.09636167021371)),
  'EPSG:6307': ProjectAndUnProjectResult(
      Point(x: 7328037.617013937, y: 5241769.00316173),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:6312': ProjectAndUnProjectResult(
      Point(x: -950591.5443067134, y: 1807051.9048065823),
      Point(x: 17.88807717290827, y: 46.89226406004759)),
  'EPSG:6316': ProjectAndUnProjectResult(
      Point(x: 7263306.8569601495, y: 5198942.980445724),
      Point(x: 17.88805859902672, y: 46.892264069175155)),
  'EPSG:6330': ProjectAndUnProjectResult(
      Point(x: 48730994.20351042, y: -23178134.332903616), Point(x: 0, y: -90)),
  'EPSG:6331': ProjectAndUnProjectResult(
      Point(x: 63333518.09556754, y: -38676678.41783912), Point(x: 0, y: -90)),
  'EPSG:6332': ProjectAndUnProjectResult(
      Point(x: 81069695.4839798, y: -59099747.1391181), Point(x: 0, y: -90)),
  'EPSG:6333': ProjectAndUnProjectResult(
      Point(x: -79345537.23281473, y: -58236069.63248695), Point(x: 0, y: -90)),
  'EPSG:6334': ProjectAndUnProjectResult(
      Point(x: -61735465.01028672, y: -38016576.899930514),
      Point(x: 0, y: -90)),
  'EPSG:6335': ProjectAndUnProjectResult(
      Point(x: -47240401.76333124, y: -22681647.638609204),
      Point(x: 0, y: -90)),
  'EPSG:6336': ProjectAndUnProjectResult(
      Point(x: -35393329.62055659, y: -11254044.783678558),
      Point(x: 0, y: -90)),
  'EPSG:6337': ProjectAndUnProjectResult(
      Point(x: -25785988.545412734, y: -2920563.7794431755),
      Point(x: 72517.82979839807, y: -135482.78856909208)),
  'EPSG:6338': ProjectAndUnProjectResult(
      Point(x: -18063024.2834307, y: 2990541.0425813603),
      Point(x: 5728.679566272616, y: 8118.480468517206)),
  'EPSG:6339': ProjectAndUnProjectResult(
      Point(x: -11916549.256324729, y: 7029722.072663035),
      Point(x: 169423.46825792477, y: 95274.64648021963)),
  'EPSG:6340': ProjectAndUnProjectResult(
      Point(x: -7081100.809078519, y: 9644074.035715306),
      Point(x: 16894389367.285646, y: 5473429537.796183)),
  'EPSG:6341': ProjectAndUnProjectResult(
      Point(x: -3328981.2161364346, y: 11193210.773121612), Point(x: 0, y: 90)),
  'EPSG:6342': ProjectAndUnProjectResult(
      Point(x: -465963.8528201919, y: 11963247.506900493), Point(x: 0, y: 90)),
  'EPSG:6343': ProjectAndUnProjectResult(
      Point(x: 1672650.061907484, y: 12179046.047871836), Point(x: 0, y: 90)),
  'EPSG:6344': ProjectAndUnProjectResult(
      Point(x: 3225639.745211993, y: 12014873.557768293), Point(x: 0, y: 90)),
  'EPSG:6345': ProjectAndUnProjectResult(
      Point(x: 4309153.746567462, y: 11603618.623518256), Point(x: 0, y: 90)),
  'EPSG:6346': ProjectAndUnProjectResult(
      Point(x: 5019695.054228077, y: 11044701.550210133), Point(x: 0, y: 90)),
  'EPSG:6347': ProjectAndUnProjectResult(
      Point(x: 5436818.00586931, y: 10410808.927530395), Point(x: 0, y: 90)),
  'EPSG:6348': ProjectAndUnProjectResult(
      Point(x: 5625552.597278097, y: 9753575.672750814),
      Point(x: -14563147143.452982, y: 3188443837.820243)),
  'EPSG:6350': ProjectAndUnProjectResult(
      Point(x: 6774661.149690735, y: 7282623.854975374),
      Point(x: 17.88805856028151, y: 46.89226406700876)),
  'EPSG:6351': ProjectAndUnProjectResult(
      Point(x: 28672231.949399307, y: 12453101.772669625),
      Point(x: 17.888058560281486, y: 46.892264067008746)),
  'EPSG:6352': ProjectAndUnProjectResult(
      Point(x: 33446085.147038214, y: 12124067.20999254),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6353': ProjectAndUnProjectResult(
      Point(x: 13213266.737754596, y: 13796554.57464162),
      Point(x: 17.888058560281486, y: 46.89226406700873)),
  'EPSG:6354': ProjectAndUnProjectResult(
      Point(x: 18709561.0091406, y: 13447950.448874282),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6355': ProjectAndUnProjectResult(
      Point(x: 4175252.6559100477, y: 8132636.419234506), Point(x: 0, y: 90)),
  'EPSG:6356': ProjectAndUnProjectResult(
      Point(x: 4335563.615183162, y: 8328698.3072116645), Point(x: 0, y: 90)),
  'EPSG:6362': ProjectAndUnProjectResult(
      Point(x: 11336127.570348896, y: 7858098.963668537),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6366': ProjectAndUnProjectResult(
      Point(x: -7081100.809078519, y: 9644074.035715306),
      Point(x: 16894389367.285646, y: 5473429537.796183)),
  'EPSG:6367': ProjectAndUnProjectResult(
      Point(x: -3328981.2161364346, y: 11193210.773121612), Point(x: 0, y: 90)),
  'EPSG:6368': ProjectAndUnProjectResult(
      Point(x: -465963.8528201919, y: 11963247.506900493), Point(x: 0, y: 90)),
  'EPSG:6369': ProjectAndUnProjectResult(
      Point(x: 1672650.061907484, y: 12179046.047871836), Point(x: 0, y: 90)),
  'EPSG:6370': ProjectAndUnProjectResult(
      Point(x: 3225639.745211993, y: 12014873.557768293), Point(x: 0, y: 90)),
  'EPSG:6371': ProjectAndUnProjectResult(
      Point(x: 4309153.746567462, y: 11603618.623518256), Point(x: 0, y: 90)),
  'EPSG:6372': ProjectAndUnProjectResult(
      Point(x: 11336127.570348896, y: 7858098.963668537),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6381': ProjectAndUnProjectResult(
      Point(x: 62977.02345008202, y: 5200107.5557981115),
      Point(x: 17.8880585711437, y: 46.89226406858427)),
  'EPSG:6382': ProjectAndUnProjectResult(
      Point(x: -165600.2406713484, y: 5213567.368145596),
      Point(x: 17.888058574012387, y: 46.892264064089886)),
  'EPSG:6383': ProjectAndUnProjectResult(
      Point(x: -394086.52944167913, y: 5235860.647503206),
      Point(x: 17.888058729263665, y: 46.8922640233896)),
  'EPSG:6384': ProjectAndUnProjectResult(
      Point(x: -622423.0777060273, y: 5267097.50637579),
      Point(x: 17.888060894831245, y: 46.89226389546803)),
  'EPSG:6385': ProjectAndUnProjectResult(
      Point(x: -850534.0952441327, y: 5307431.144329979),
      Point(x: 17.888077165110136, y: 46.89226406159528)),
  'EPSG:6386': ProjectAndUnProjectResult(
      Point(x: -1078320.5804376781, y: 5357057.416403098),
      Point(x: 17.888161902699313, y: 46.892267824310814)),
  'EPSG:6387': ProjectAndUnProjectResult(
      Point(x: -1305653.6419688992, y: 5416214.116028281),
      Point(x: 17.888508861463574, y: 46.89229074889061)),
  'EPSG:6391': ProjectAndUnProjectResult(
      Point(x: 29383452.903728507, y: 20153323.98735387),
      Point(x: 17.888058560281486, y: 46.892264067008746)),
  'EPSG:6393': ProjectAndUnProjectResult(
      Point(x: 2704046.3736966117, y: 9181485.899239805),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6394': ProjectAndUnProjectResult(
      Point(x: 6508725.5759530235, y: 4717646.787048834),
      Point(x: 17.88805856028155, y: 46.89226406700871)),
  'EPSG:6395': ProjectAndUnProjectResult(
      Point(x: -37213279.522647545, y: -18912875.961270504),
      Point(x: 0, y: -90)),
  'EPSG:6396': ProjectAndUnProjectResult(
      Point(x: -45107405.43757957, y: -26521048.301904406),
      Point(x: 0, y: -90)),
  'EPSG:6397': ProjectAndUnProjectResult(
      Point(x: -54145589.80520173, y: -35798007.60070698), Point(x: 0, y: -90)),
  'EPSG:6398': ProjectAndUnProjectResult(
      Point(x: -64460118.121024735, y: -47015897.944632985),
      Point(x: 0, y: -90)),
  'EPSG:6399': ProjectAndUnProjectResult(
      Point(x: -76195487.58152132, y: -60481645.41980923), Point(x: 0, y: -90)),
  'EPSG:6400': ProjectAndUnProjectResult(
      Point(x: -89509253.44187886, y: -76540389.67400539), Point(x: 0, y: -90)),
  'EPSG:6401': ProjectAndUnProjectResult(
      Point(x: 77897438.88146861, y: -61308557.825420626), Point(x: 0, y: -90)),
  'EPSG:6402': ProjectAndUnProjectResult(
      Point(x: 66078013.4794075, y: -47707169.16826724), Point(x: 0, y: -90)),
  'EPSG:6403': ProjectAndUnProjectResult(
      Point(x: -3067782.7230528235, y: 8760315.521445647),
      Point(x: 17.888058560281486, y: 46.89226406700873)),
  'EPSG:6404': ProjectAndUnProjectResult(
      Point(x: -4128150.708307095, y: 7585988.433132556), Point(x: 0, y: 90)),
  'EPSG:6405': ProjectAndUnProjectResult(
      Point(x: -13543801.5364406, y: 24888413.49452938), Point(x: 0, y: 90)),
  'EPSG:6406': ProjectAndUnProjectResult(
      Point(x: -3169861.026850693, y: 7913822.186592112), Point(x: 0, y: 90)),
  'EPSG:6407': ProjectAndUnProjectResult(
      Point(x: -10399806.518539019, y: 25963983.55181139), Point(x: 0, y: 90)),
  'EPSG:6408': ProjectAndUnProjectResult(
      Point(x: -5215796.690656631, y: 7168396.858414973), Point(x: 0, y: 90)),
  'EPSG:6409': ProjectAndUnProjectResult(
      Point(x: -17112193.866983697, y: 23518362.396374583), Point(x: 0, y: 90)),
  'EPSG:6410': ProjectAndUnProjectResult(
      Point(x: 7280845.10476574, y: 5698018.880729793),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6411': ProjectAndUnProjectResult(
      Point(x: 23887239.314518936, y: 18694250.277860995),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6412': ProjectAndUnProjectResult(
      Point(x: 7441828.743390062, y: 6181711.961229637),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6413': ProjectAndUnProjectResult(
      Point(x: 24415399.802238896, y: 20281166.659434237),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6414': ProjectAndUnProjectResult(
      Point(x: 7281011.174753069, y: 7461253.495639747),
      Point(x: 17.88805856028151, y: 46.89226406700877)),
  'EPSG:6415': ProjectAndUnProjectResult(
      Point(x: 8713369.04628296, y: 8228903.974584526),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6416': ProjectAndUnProjectResult(
      Point(x: 28587111.613013346, y: 26997662.4569494),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6528': ProjectAndUnProjectResult(
      Point(x: -998074.9727628597, y: 8428106.011472125), Point(x: 0, y: 90)),
  'EPSG:6417': ProjectAndUnProjectResult(
      Point(x: 8988852.870882323, y: 8299543.835321399),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6418': ProjectAndUnProjectResult(
      Point(x: 29490928.127553087, y: 27229420.066716958),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6419': ProjectAndUnProjectResult(
      Point(x: 9196533.03998033, y: 8221416.367224062),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6420': ProjectAndUnProjectResult(
      Point(x: 30172292.14900214, y: 26973096.865134276),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:6421': ProjectAndUnProjectResult(
      Point(x: 9364631.99275643, y: 8154335.033546976),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:6422': ProjectAndUnProjectResult(
      Point(x: 30723796.79656839, y: 26753014.189562038),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:6423': ProjectAndUnProjectResult(
      Point(x: 9657012.346788008, y: 8138321.005032831),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6424': ProjectAndUnProjectResult(
      Point(x: 31683048.00808699, y: 26700474.83101188),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6425': ProjectAndUnProjectResult(
      Point(x: 9857792.552179694, y: 8039982.800465539),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6426': ProjectAndUnProjectResult(
      Point(x: 32341774.398609553, y: 26377843.57152736),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:6427': ProjectAndUnProjectResult(
      Point(x: 7746779.736843174, y: 6828729.263310314),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6428': ProjectAndUnProjectResult(
      Point(x: 25415893.18631023, y: 22403922.591381256),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6429': ProjectAndUnProjectResult(
      Point(x: 7609906.701740923, y: 6737108.930826646),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6430': ProjectAndUnProjectResult(
      Point(x: 24966835.570312265, y: 22103331.550557755),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6431': ProjectAndUnProjectResult(
      Point(x: 7902404.853652807, y: 6873456.4247696595),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6432': ProjectAndUnProjectResult(
      Point(x: 25926473.257043168, y: 22550664.95360246),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6433': ProjectAndUnProjectResult(
      Point(x: 6039095.133709748, y: 4143749.064976011),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:6434': ProjectAndUnProjectResult(
      Point(x: 19813264.617850065, y: 13594950.05734413),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:6435': ProjectAndUnProjectResult(
      Point(x: 5117848.770438616, y: 6252732.387920412), Point(x: 0, y: 90)),
  'EPSG:6436': ProjectAndUnProjectResult(
      Point(x: 16790808.84134736, y: 20514172.84270222), Point(x: 0, y: 90)),
  'EPSG:6437': ProjectAndUnProjectResult(
      Point(x: 4721237.687280814, y: 8356420.754737286), Point(x: 0, y: 90)),
  'EPSG:6438': ProjectAndUnProjectResult(
      Point(x: 15489593.979353804, y: 27416023.75950058), Point(x: 0, y: 90)),
  'EPSG:6439': ProjectAndUnProjectResult(
      Point(x: 7788718.898020689, y: 5738991.145189423),
      Point(x: 17.88805856028151, y: 46.892264067008796)),
  'EPSG:6440': ProjectAndUnProjectResult(
      Point(x: 7714848.02247523, y: 5442253.479619011),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:6441': ProjectAndUnProjectResult(
      Point(x: 25311130.553737484, y: 17855126.624383375),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:6442': ProjectAndUnProjectResult(
      Point(x: 4625113.957471083, y: 8456488.815026179), Point(x: 0, y: 90)),
  'EPSG:6443': ProjectAndUnProjectResult(
      Point(x: 15174228.04246971, y: 27744330.38729839), Point(x: 0, y: 90)),
  'EPSG:6444': ProjectAndUnProjectResult(
      Point(x: 4608098.742447868, y: 7844758.075159398), Point(x: 0, y: 90)),
  'EPSG:6445': ProjectAndUnProjectResult(
      Point(x: 15118403.957847713, y: 25737343.784918793), Point(x: 0, y: 90)),
  'EPSG:6446': ProjectAndUnProjectResult(
      Point(x: 4887189.5243078265, y: 8036713.270922709), Point(x: 0, y: 90)),
  'EPSG:6447': ProjectAndUnProjectResult(
      Point(x: 16034054.29733326, y: 26367116.78968559), Point(x: 0, y: 90)),
  'EPSG:6448': ProjectAndUnProjectResult(
      Point(x: -5084440.623114015, y: 5921630.496325042), Point(x: 0, y: 90)),
  'EPSG:6449': ProjectAndUnProjectResult(
      Point(x: -16681202.277333234, y: 19427882.72002641), Point(x: 0, y: 90)),
  'EPSG:6450': ProjectAndUnProjectResult(
      Point(x: -4284867.971020522, y: 6350434.242753448), Point(x: 0, y: 90)),
  'EPSG:6451': ProjectAndUnProjectResult(
      Point(x: -14057937.667923164, y: 20834716.344766937), Point(x: 0, y: 90)),
  'EPSG:6452': ProjectAndUnProjectResult(
      Point(x: -5919234.386603765, y: 5433186.325411458), Point(x: 0, y: 90)),
  'EPSG:6453': ProjectAndUnProjectResult(
      Point(x: -19420021.483049188, y: 17825378.802620757), Point(x: 0, y: 90)),
  'EPSG:6454': ProjectAndUnProjectResult(
      Point(x: 3905071.6147695784, y: 7655783.660641345), Point(x: 0, y: 90)),
  'EPSG:6455': ProjectAndUnProjectResult(
      Point(x: 12811889.12278986, y: 25117350.226620816), Point(x: 0, y: 90)),
  'EPSG:6456': ProjectAndUnProjectResult(
      Point(x: 3990597.385999085, y: 7789443.487367855), Point(x: 0, y: 90)),
  'EPSG:6457': ProjectAndUnProjectResult(
      Point(x: 13092484.923865333, y: 25555865.841472708), Point(x: 0, y: 90)),
  'EPSG:6458': ProjectAndUnProjectResult(
      Point(x: 4097701.446227201, y: 7591591.6682478), Point(x: 0, y: 90)),
  'EPSG:6459': ProjectAndUnProjectResult(
      Point(x: 13443875.494497076, y: 24906746.99790966), Point(x: 0, y: 90)),
  'EPSG:6460': ProjectAndUnProjectResult(
      Point(x: 4698254.479714725, y: 7712933.359383934), Point(x: 0, y: 90)),
  'EPSG:6461': ProjectAndUnProjectResult(
      Point(x: 15414189.905530728, y: 25304848.862912126), Point(x: 0, y: 90)),
  'EPSG:6462': ProjectAndUnProjectResult(
      Point(x: 7754185.385967116, y: 6441441.897699313),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6463': ProjectAndUnProjectResult(
      Point(x: 25440189.887127113, y: 21133297.2926685),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6464': ProjectAndUnProjectResult(
      Point(x: 6883654.037123509, y: 5522527.676852138),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6465': ProjectAndUnProjectResult(
      Point(x: 22584121.62016271, y: 18118492.88647239),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6466': ProjectAndUnProjectResult(
      Point(x: 7071987.862697571, y: 5919601.754797991),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:6467': ProjectAndUnProjectResult(
      Point(x: 23202013.512833614, y: 19421226.757199746),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:6673': ProjectAndUnProjectResult(
      Point(x: -1306115.9982166318, y: 8196578.576068864), Point(x: 0, y: 90)),
  'EPSG:6468': ProjectAndUnProjectResult(
      Point(x: 7225695.016863069, y: 6455856.986343259),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6469': ProjectAndUnProjectResult(
      Point(x: 23706301.067791585, y: 21180590.79599451),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6470': ProjectAndUnProjectResult(
      Point(x: 6854798.276271999, y: 4982007.395728776),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6471': ProjectAndUnProjectResult(
      Point(x: 22489450.678402383, y: 16345135.930820161),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6472': ProjectAndUnProjectResult(
      Point(x: 7954314.818287251, y: 6181092.986200401),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6473': ProjectAndUnProjectResult(
      Point(x: 26096781.19966409, y: 20279135.905225817),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6474': ProjectAndUnProjectResult(
      Point(x: 7000500.0764196385, y: 5649813.9503045585),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:6475': ProjectAndUnProjectResult(
      Point(x: 22967474.00105343, y: 18536097.935624205),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:6476': ProjectAndUnProjectResult(
      Point(x: 8293004.335917232, y: 5912444.595764324),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6477': ProjectAndUnProjectResult(
      Point(x: 27207965.058721785, y: 19397745.31127012),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6478': ProjectAndUnProjectResult(
      Point(x: 8460640.04761491, y: 5922044.6080015665),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6479': ProjectAndUnProjectResult(
      Point(x: 27757949.88951659, y: 19429241.351418473),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6480': ProjectAndUnProjectResult(
      Point(x: 5625524.243963247, y: 4952785.35904863),
      Point(x: -21737319794.91784, y: 4757338589.640197)),
  'EPSG:6481': ProjectAndUnProjectResult(
      Point(x: 5841926.85039724, y: 4779293.471123142),
      Point(x: -856956604.9425999, y: 188140569.70074788)),
  'EPSG:6482': ProjectAndUnProjectResult(
      Point(x: 5401485.579875652, y: 5163842.641810937),
      Point(x: -11503948981851.02, y: 2505985965549.347)),
  'EPSG:6483': ProjectAndUnProjectResult(
      Point(x: 5434242.727510438, y: 4865567.286727372),
      Point(x: -3577911303.5949883, y: 784422263.488511)),
  'EPSG:6484': ProjectAndUnProjectResult(
      Point(x: 17828844.681840498, y: 15963115.339871386),
      Point(x: -3577911303.5949883, y: 784422263.488511)),
  'EPSG:6485': ProjectAndUnProjectResult(
      Point(x: 6005972.529556511, y: 5140915.469168544),
      Point(x: -2514978608650.738, y: 548342325600.6209)),
  'EPSG:6486': ProjectAndUnProjectResult(
      Point(x: 19704594.87405332, y: 16866486.83509713),
      Point(x: -2514978608650.738, y: 548342325600.6209)),
  'EPSG:6487': ProjectAndUnProjectResult(
      Point(x: 6458859.816901178, y: 4494509.018460154),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:6488': ProjectAndUnProjectResult(
      Point(x: 21190442.582283285, y: 14745735.004731355),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:6489': ProjectAndUnProjectResult(
      Point(x: 6154332.406766824, y: 3817884.2153315847),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:6490': ProjectAndUnProjectResult(
      Point(x: 20191338.90486749, y: 12525841.796467042),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:6491': ProjectAndUnProjectResult(
      Point(x: 5851118.614199274, y: 4670879.245324666),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:6492': ProjectAndUnProjectResult(
      Point(x: 19196544.98708545, y: 15324376.324036008),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:6610': ProjectAndUnProjectResult(
      Point(x: 3839622.300083163, y: 7353217.56768338), Point(x: 0, y: 90)),
  'EPSG:6493': ProjectAndUnProjectResult(
      Point(x: 11889319.027601004, y: 4694603.857861964),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:6494': ProjectAndUnProjectResult(
      Point(x: 39006952.19021326, y: 15402243.62815605),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:6495': ProjectAndUnProjectResult(
      Point(x: 13856577.937746815, y: 4794610.454685856),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6496': ProjectAndUnProjectResult(
      Point(x: 45461213.70641344, y: 15730349.260780366),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6497': ProjectAndUnProjectResult(
      Point(x: 8386430.7898983145, y: 2796245.837725366),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:6498': ProjectAndUnProjectResult(
      Point(x: 10027794.9275133, y: 4787933.322479354),
      Point(x: 17.8880585602815, y: 46.892264067008746)),
  'EPSG:6499': ProjectAndUnProjectResult(
      Point(x: 32899589.65714337, y: 15708442.659052998),
      Point(x: 17.8880585602815, y: 46.892264067008746)),
  'EPSG:6500': ProjectAndUnProjectResult(
      Point(x: 6763552.011142525, y: 5414428.169782657),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:6501': ProjectAndUnProjectResult(
      Point(x: 22190086.889923435, y: 17763836.420328602),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:6502': ProjectAndUnProjectResult(
      Point(x: 6637522.089340442, y: 5241976.733282339),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6503': ProjectAndUnProjectResult(
      Point(x: 21776603.721477766, y: 17198051.99907714),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6504': ProjectAndUnProjectResult(
      Point(x: 6907731.6671998175, y: 5516216.609642071),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6505': ProjectAndUnProjectResult(
      Point(x: 22663116.311504737, y: 18097787.326767363),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6506': ProjectAndUnProjectResult(
      Point(x: 3822984.905080838, y: 8488545.1484227), Point(x: 0, y: 90)),
  'EPSG:6507': ProjectAndUnProjectResult(
      Point(x: 12542576.309419384, y: 27849501.87445014), Point(x: 0, y: 90)),
  'EPSG:6508': ProjectAndUnProjectResult(
      Point(x: 3865026.376812202, y: 9521806.905574037), Point(x: 0, y: 90)),
  'EPSG:6509': ProjectAndUnProjectResult(
      Point(x: 3960143.9403490187, y: 8595620.856387978), Point(x: 0, y: 90)),
  'EPSG:6510': ProjectAndUnProjectResult(
      Point(x: 12992572.243961738, y: 28200799.426332895), Point(x: 0, y: 90)),
  'EPSG:6511': ProjectAndUnProjectResult(
      Point(x: 3333355.4118026467, y: 8025679.559234873), Point(x: 0, y: 90)),
  'EPSG:6512': ProjectAndUnProjectResult(
      Point(x: 3479281.287680031, y: 7904330.11893151), Point(x: 0, y: 90)),
  'EPSG:6513': ProjectAndUnProjectResult(
      Point(x: 3236399.2997552953, y: 8083966.915915788), Point(x: 0, y: 90)),
  'EPSG:6514': ProjectAndUnProjectResult(
      Point(x: 6556297.784221025, y: 6590553.712986213),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6515': ProjectAndUnProjectResult(
      Point(x: 21510163.334050607, y: 21622551.551792037),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6516': ProjectAndUnProjectResult(
      Point(x: 6975000.373432801, y: 6039872.843451777),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:6517': ProjectAndUnProjectResult(
      Point(x: 22883813.725204114, y: 19815816.15389137),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:6518': ProjectAndUnProjectResult(
      Point(x: -6848369.235542074, y: 11911589.980849914),
      Point(x: 189531435637.07315, y: 59487357072.499916)),
  'EPSG:6519': ProjectAndUnProjectResult(
      Point(x: -22468358.066907622, y: 39079941.46217176),
      Point(x: 189531435637.07315, y: 59487357072.499916)),
  'EPSG:6520': ProjectAndUnProjectResult(
      Point(x: -6407205.481935473, y: 14250720.322452161), Point(x: 0, y: 90)),
  'EPSG:6521': ProjectAndUnProjectResult(
      Point(x: -21020973.318616632, y: 46754238.25794514), Point(x: 0, y: 90)),
  'EPSG:6522': ProjectAndUnProjectResult(
      Point(x: -7945837.346430153, y: 9227187.99242025),
      Point(x: 53494776.36427391, y: 20053499.392547227)),
  'EPSG:6523': ProjectAndUnProjectResult(
      Point(x: -26068968.027379595, y: 30272865.938432105),
      Point(x: 53494776.36427391, y: 20053499.392547227)),
  'EPSG:6524': ProjectAndUnProjectResult(
      Point(x: 5368091.402649273, y: 5342638.370730873), Point(x: 0, y: 90)),
  'EPSG:6525': ProjectAndUnProjectResult(
      Point(x: 17611813.210191824, y: 17528306.05463954), Point(x: 0, y: 90)),
  'EPSG:6526': ProjectAndUnProjectResult(
      Point(x: 5111955.253111458, y: 6059884.249141174), Point(x: 0, y: 90)),
  'EPSG:6527': ProjectAndUnProjectResult(
      Point(x: 16771473.19291651, y: 19881470.240724005), Point(x: 0, y: 90)),
  'EPSG:6529': ProjectAndUnProjectResult(
      Point(x: -3274517.639472816, y: 27651211.139304798), Point(x: 0, y: 90)),
  'EPSG:6530': ProjectAndUnProjectResult(
      Point(x: -530531.6564737859, y: 8584058.195630815), Point(x: 0, y: 90)),
  'EPSG:6531': ProjectAndUnProjectResult(
      Point(x: -1740585.942947746, y: 28162864.26349877), Point(x: 0, y: 90)),
  'EPSG:6532': ProjectAndUnProjectResult(
      Point(x: -1388949.665557478, y: 8254150.647986836), Point(x: 0, y: 90)),
  'EPSG:6533': ProjectAndUnProjectResult(
      Point(x: -4556912.360749827, y: 27080492.584270146), Point(x: 0, y: 90)),
  'EPSG:6534': ProjectAndUnProjectResult(
      Point(x: 5102989.244976103, y: 6156462.138120647), Point(x: 0, y: 90)),
  'EPSG:6535': ProjectAndUnProjectResult(
      Point(x: 16742057.214225767, y: 20198326.19815082), Point(x: 0, y: 90)),
  'EPSG:6536': ProjectAndUnProjectResult(
      Point(x: 5111955.253111458, y: 6059884.249141174), Point(x: 0, y: 90)),
  'EPSG:6537': ProjectAndUnProjectResult(
      Point(x: 16771473.19291651, y: 19881470.240724005), Point(x: 0, y: 90)),
  'EPSG:6538': ProjectAndUnProjectResult(
      Point(x: 6120506.5914582675, y: 4115911.994870667),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6539': ProjectAndUnProjectResult(
      Point(x: 20080362.042142667, y: 13503621.26983818),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6540': ProjectAndUnProjectResult(
      Point(x: 5070627.948794095, y: 6369472.582025805), Point(x: 0, y: 90)),
  'EPSG:6541': ProjectAndUnProjectResult(
      Point(x: 16635885.195668627, y: 20897177.962862995), Point(x: 0, y: 90)),
  'EPSG:6542': ProjectAndUnProjectResult(
      Point(x: 7013164.842371999, y: 4867653.736840957),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6543': ProjectAndUnProjectResult(
      Point(x: 23009024.984398805, y: 15969960.634952374),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:6544': ProjectAndUnProjectResult(
      Point(x: 6465460.630965634, y: 5661785.323388806),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6545': ProjectAndUnProjectResult(
      Point(x: 21212141.1777009, y: 18575411.16597377),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6611': ProjectAndUnProjectResult(
      Point(x: -835360.288822798, y: 7469523.565254046), Point(x: 0, y: 90)),
  'EPSG:6546': ProjectAndUnProjectResult(
      Point(x: 6573964.729929726, y: 5741275.293893124),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6547': ProjectAndUnProjectResult(
      Point(x: 21568125.75435474, y: 18836205.032457754),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6548': ProjectAndUnProjectResult(
      Point(x: 6701563.894453452, y: 4762473.447759279),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6549': ProjectAndUnProjectResult(
      Point(x: 21986714.210386034, y: 15624881.636523569),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6550': ProjectAndUnProjectResult(
      Point(x: 6823927.076346041, y: 4856567.2808180135),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:6551': ProjectAndUnProjectResult(
      Point(x: 22388167.416311968, y: 15933587.820483766),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:6552': ProjectAndUnProjectResult(
      Point(x: 7606719.341866343, y: 6088830.052103923),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:6553': ProjectAndUnProjectResult(
      Point(x: 24956378.374106497, y: 19976436.59594429),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:6674': ProjectAndUnProjectResult(
      Point(x: -788366.1033867978, y: 8189401.718133621), Point(x: 0, y: 90)),
  'EPSG:6554': ProjectAndUnProjectResult(
      Point(x: 7788873.682746351, y: 6165418.092119623),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6555': ProjectAndUnProjectResult(
      Point(x: 25553996.407476988, y: 20227709.190562464),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6556': ProjectAndUnProjectResult(
      Point(x: 6621080.326600361, y: 7550611.109639786),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6557': ProjectAndUnProjectResult(
      Point(x: 21722704.48359173, y: 24772346.160235517),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6558': ProjectAndUnProjectResult(
      Point(x: 8597033.820587108, y: 7390016.602283895),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6559': ProjectAndUnProjectResult(
      Point(x: 28205491.53782647, y: 24245461.29358233),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:6560': ProjectAndUnProjectResult(
      Point(x: 7874076.89548586, y: 7497850.224338042),
      Point(x: 17.88805856028154, y: 46.892264067008725)),
  'EPSG:6561': ProjectAndUnProjectResult(
      Point(x: 25833585.615591403, y: 24599246.142841343),
      Point(x: 17.88805856028154, y: 46.892264067008725)),
  'EPSG:6612': ProjectAndUnProjectResult(
      Point(x: -2740677.880879463, y: 24506261.897004317), Point(x: 0, y: 90)),
  'EPSG:6562': ProjectAndUnProjectResult(
      Point(x: 6522469.313095474, y: 4396559.711847568),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6563': ProjectAndUnProjectResult(
      Point(x: 21399134.738047402, y: 14424379.654619897),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6564': ProjectAndUnProjectResult(
      Point(x: 6583746.193120701, y: 4440183.096793512),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6565': ProjectAndUnProjectResult(
      Point(x: 21600173.968596835, y: 14567500.710063381),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6566': ProjectAndUnProjectResult(
      Point(x: 7328037.617013937, y: 5241769.00316173),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:6567': ProjectAndUnProjectResult(
      Point(x: 5173030.8098551845, y: 5481823.207905864), Point(x: 0, y: 90)),
  'EPSG:6568': ProjectAndUnProjectResult(
      Point(x: 16971851.915299885, y: 17984948.307937823), Point(x: 0, y: 90)),
  'EPSG:6569': ProjectAndUnProjectResult(
      Point(x: 7231101.448544078, y: 5119305.1873058975),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6671': ProjectAndUnProjectResult(
      Point(x: -1913282.6153144585, y: 8164170.9970185), Point(x: 0, y: 90)),
  'EPSG:6570': ProjectAndUnProjectResult(
      Point(x: 23724086.117270596, y: 16795620.69326082),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:6571': ProjectAndUnProjectResult(
      Point(x: 6731916.633515107, y: 5806582.369900572),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:6572': ProjectAndUnProjectResult(
      Point(x: 22086296.488457482, y: 19050428.99191546),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:6573': ProjectAndUnProjectResult(
      Point(x: 6870716.757738419, y: 5915239.061073107),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6574': ProjectAndUnProjectResult(
      Point(x: 22541676.56268013, y: 19406913.486204017),
      Point(x: 17.8880585602815, y: 46.892264067008746)),
  'EPSG:6575': ProjectAndUnProjectResult(
      Point(x: 7240825.507643389, y: 5300270.815013457),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:6576': ProjectAndUnProjectResult(
      Point(x: 23755941.686326686, y: 17389305.165589985),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:6577': ProjectAndUnProjectResult(
      Point(x: 8418734.087582087, y: 9472776.726556078),
      Point(x: 17.88805856028155, y: 46.892264067008746)),
  'EPSG:6578': ProjectAndUnProjectResult(
      Point(x: 27620463.418675568, y: 31078601.6437094),
      Point(x: 17.88805856028155, y: 46.892264067008746)),
  'EPSG:6579': ProjectAndUnProjectResult(
      Point(x: 9202342.771606717, y: 13714424.334539425),
      Point(x: 17.88805856028155, y: 46.89226406700876)),
  'EPSG:6580': ProjectAndUnProjectResult(
      Point(x: 9154307.075487461, y: 12759946.896370977),
      Point(x: 17.88805856028155, y: 46.892264067008725)),
  'EPSG:6581': ProjectAndUnProjectResult(
      Point(x: 7393138.261094371, y: 7401668.656500031),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6582': ProjectAndUnProjectResult(
      Point(x: 24255654.445273783, y: 24283641.25020052),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6583': ProjectAndUnProjectResult(
      Point(x: 7989143.282984504, y: 8276494.464586326),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6584': ProjectAndUnProjectResult(
      Point(x: 26211047.58759166, y: 27153798.922896974),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:6585': ProjectAndUnProjectResult(
      Point(x: 8484246.042842139, y: 11469435.827622361),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6586': ProjectAndUnProjectResult(
      Point(x: 27835397.225557923, y: 37629307.37812436),
      Point(x: 17.88805856028154, y: 46.89226406700874)),
  'EPSG:6587': ProjectAndUnProjectResult(
      Point(x: 8486728.051005203, y: 10453504.590111742),
      Point(x: 17.88805856028154, y: 46.89226406700874)),
  'EPSG:6588': ProjectAndUnProjectResult(
      Point(x: 27843540.280672904, y: 34296206.30905828),
      Point(x: 17.88805856028154, y: 46.89226406700874)),
  'EPSG:6589': ProjectAndUnProjectResult(
      Point(x: 5541768.404689928, y: 5434133.661562179), Point(x: 0, y: 90)),
  'EPSG:6590': ProjectAndUnProjectResult(
      Point(x: 18181618.507753536, y: 17828486.854641918), Point(x: 0, y: 90)),
  'EPSG:6591': ProjectAndUnProjectResult(
      Point(x: 6197425.928759272, y: 4812816.468950871),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:6592': ProjectAndUnProjectResult(
      Point(x: 9634482.513941199, y: 6581020.355130133),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6593': ProjectAndUnProjectResult(
      Point(x: 31609131.381488748, y: 21591230.948789448),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:6672': ProjectAndUnProjectResult(
      Point(x: -1548193.3456383753, y: 8522145.552706772), Point(x: 0, y: 90)),
  'EPSG:6594': ProjectAndUnProjectResult(
      Point(x: 9723405.910334777, y: 5663039.725072842),
      Point(x: 17.888058560281486, y: 46.892264067008746)),
  'EPSG:6595': ProjectAndUnProjectResult(
      Point(x: 31900874.224490017, y: 18579489.497676484),
      Point(x: 17.888058560281486, y: 46.892264067008746)),
  'EPSG:6596': ProjectAndUnProjectResult(
      Point(x: 6208880.764422776, y: 7201291.121268816),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:6597': ProjectAndUnProjectResult(
      Point(x: 20370302.974943724, y: 23626235.95369611),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:6598': ProjectAndUnProjectResult(
      Point(x: 6409557.023981855, y: 7281838.145229915),
      Point(x: 17.88805856028154, y: 46.892264067008746)),
  'EPSG:6599': ProjectAndUnProjectResult(
      Point(x: 21028688.336513802, y: 23890497.31480848),
      Point(x: 17.88805856028154, y: 46.892264067008746)),
  'EPSG:6600': ProjectAndUnProjectResult(
      Point(x: 6701578.612677592, y: 4608732.256874052),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6601': ProjectAndUnProjectResult(
      Point(x: 21986762.4984264, y: 15120482.412760952),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6602': ProjectAndUnProjectResult(
      Point(x: 6860107.275988375, y: 4799756.489364472),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6603': ProjectAndUnProjectResult(
      Point(x: 22506868.621305194, y: 15747201.08218994),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6604': ProjectAndUnProjectResult(
      Point(x: 6611250.719513921, y: 5046926.8438626565),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6605': ProjectAndUnProjectResult(
      Point(x: 21690411.73560526, y: 16558125.8202394),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6606': ProjectAndUnProjectResult(
      Point(x: 6517033.000426102, y: 4968571.836722961),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:6607': ProjectAndUnProjectResult(
      Point(x: 21381299.102231305, y: 16301056.100981915),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:6608': ProjectAndUnProjectResult(
      Point(x: 6723783.25810189, y: 5169377.719135766),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:6609': ProjectAndUnProjectResult(
      Point(x: 22059612.239289284, y: 16959866.73353126),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:32606': ProjectAndUnProjectResult(
      Point(x: -47240401.76177123, y: -22681647.63793224), Point(x: 0, y: -90)),
  'EPSG:6613': ProjectAndUnProjectResult(
      Point(x: -1585501.348464507, y: 7359986.274514455), Point(x: 0, y: 90)),
  'EPSG:6614': ProjectAndUnProjectResult(
      Point(x: -5201765.674120637, y: 24146888.30226951), Point(x: 0, y: 90)),
  'EPSG:6615': ProjectAndUnProjectResult(
      Point(x: -2539578.0552160507, y: 6974103.5782705145), Point(x: 0, y: 90)),
  'EPSG:6616': ProjectAndUnProjectResult(
      Point(x: -8331932.336121327, y: 22880871.48967585), Point(x: 0, y: 90)),
  'EPSG:6617': ProjectAndUnProjectResult(
      Point(x: -2061507.894929119, y: 7079113.201731387), Point(x: 0, y: 90)),
  'EPSG:6618': ProjectAndUnProjectResult(
      Point(x: -6763463.818613284, y: 23225390.562680393), Point(x: 0, y: 90)),
  'EPSG:6619': ProjectAndUnProjectResult(
      Point(x: 7316582.822330039, y: 8971163.047072299),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:6620': ProjectAndUnProjectResult(
      Point(x: 7132858.074758168, y: 7841015.069017461),
      Point(x: 17.888058560281525, y: 46.892264067008746)),
  'EPSG:6621': ProjectAndUnProjectResult(
      Point(x: 7595059.15054545, y: 10017430.541012172),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:6622': ProjectAndUnProjectResult(
      Point(x: 5088281.174172236, y: 3829932.5590575594),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6623': ProjectAndUnProjectResult(
      Point(x: 5116259.683303194, y: 3803425.7722843275),
      Point(x: 17.8880585602815, y: 46.892264067008796)),
  'EPSG:6624': ProjectAndUnProjectResult(
      Point(x: 5116259.683303194, y: 3803425.7722843275),
      Point(x: 17.8880585602815, y: 46.892264067008796)),
  'EPSG:6625': ProjectAndUnProjectResult(
      Point(x: 24004488.809627805, y: 29432890.76363637),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:6626': ProjectAndUnProjectResult(
      Point(x: 23401718.533635758, y: 25725063.605568122),
      Point(x: 17.888058560281525, y: 46.892264067008746)),
  'EPSG:6627': ProjectAndUnProjectResult(
      Point(x: 24918123.2297812, y: 32865520.033304103),
      Point(x: 17.88805856028155, y: 46.89226406700872)),
  'EPSG:6628': ProjectAndUnProjectResult(
      Point(x: -68690821.23140611, y: -47885351.84872058), Point(x: 0, y: -90)),
  'EPSG:6629': ProjectAndUnProjectResult(
      Point(x: -72121220.72359695, y: -51990013.836311065),
      Point(x: 0, y: -90)),
  'EPSG:6630': ProjectAndUnProjectResult(
      Point(x: -76202390.86573209, y: -56842739.61567939), Point(x: 0, y: -90)),
  'EPSG:6631': ProjectAndUnProjectResult(
      Point(x: -81001618.96536075, y: -62615395.648396604),
      Point(x: 0, y: -90)),
  'EPSG:6632': ProjectAndUnProjectResult(
      Point(x: -83208947.34861997, y: -65252448.177499056),
      Point(x: 0, y: -90)),
  'EPSG:6633': ProjectAndUnProjectResult(
      Point(x: -250007344.03195605, y: -186491554.88910815),
      Point(x: 0, y: -90)),
  'EPSG:6634': ProjectAndUnProjectResult(
      Point(x: -79345537.23281473, y: -58236069.63248695), Point(x: 0, y: -90)),
  'EPSG:6635': ProjectAndUnProjectResult(
      Point(x: -61735465.01028672, y: -38016576.899930514),
      Point(x: 0, y: -90)),
  'EPSG:6636': ProjectAndUnProjectResult(
      Point(x: 63333518.09556754, y: -28676678.417839117), Point(x: 0, y: -90)),
  'EPSG:6637': ProjectAndUnProjectResult(
      Point(x: 2872651.044108846, y: 10239580.122362612), Point(x: 0, y: 90)),
  'EPSG:6646': ProjectAndUnProjectResult(
      Point(x: -1369316.8477089084, y: 2393982.248421306),
      Point(x: 17.897293619219113, y: 46.8931481057004)),
  'EPSG:6669': ProjectAndUnProjectResult(
      Point(x: -2566056.9116173303, y: 8401313.58870162), Point(x: 0, y: 90)),
  'EPSG:6670': ProjectAndUnProjectResult(
      Point(x: -2211182.2634812854, y: 8462072.812029004), Point(x: 0, y: 90)),
  'EPSG:6675': ProjectAndUnProjectResult(
      Point(x: -398086.9536182322, y: 8165821.33190225), Point(x: 0, y: 90)),
  'EPSG:6676': ProjectAndUnProjectResult(
      Point(x: 77463.83204888566, y: 8118405.0916535165), Point(x: 0, y: 90)),
  'EPSG:6677': ProjectAndUnProjectResult(
      Point(x: 585959.9308690846, y: 8047327.498372015), Point(x: 0, y: 90)),
  'EPSG:6678': ProjectAndUnProjectResult(
      Point(x: 989901.510910523, y: 7533339.024756886), Point(x: 0, y: 90)),
  'EPSG:6679': ProjectAndUnProjectResult(
      Point(x: 751869.6886925661, y: 7131756.363145234), Point(x: 0, y: 90)),
  'EPSG:6680': ProjectAndUnProjectResult(
      Point(x: 1596744.7812366635, y: 6963379.403117015), Point(x: 0, y: 90)),
  'EPSG:6681': ProjectAndUnProjectResult(
      Point(x: 2526128.1328379745, y: 6728261.832241865), Point(x: 0, y: 90)),
  'EPSG:6682': ProjectAndUnProjectResult(
      Point(x: 1486633.193392855, y: 8984705.502253164), Point(x: 0, y: 90)),
  'EPSG:6683': ProjectAndUnProjectResult(
      Point(x: -2992748.9178998745, y: 9071307.830204587), Point(x: 0, y: 90)),
  'EPSG:6684': ProjectAndUnProjectResult(
      Point(x: -3622384.886812397, y: 8829268.069555495), Point(x: 0, y: 90)),
  'EPSG:6685': ProjectAndUnProjectResult(
      Point(x: -2211182.2634812854, y: 9237908.69123874), Point(x: 0, y: 90)),
  'EPSG:6687': ProjectAndUnProjectResult(
      Point(x: 8475126.70697138, y: 6334051.65944307),
      Point(x: -131825587.42186226, y: 47833306.95865751)),
  'EPSG:6688': ProjectAndUnProjectResult(
      Point(x: -3275967.0652893055, y: 11622144.51821889), Point(x: 0, y: 90)),
  'EPSG:6689': ProjectAndUnProjectResult(
      Point(x: -2176781.840373538, y: 12026151.471395677), Point(x: 0, y: 90)),
  'EPSG:6690': ProjectAndUnProjectResult(
      Point(x: -604157.4780445739, y: 12178763.901223246), Point(x: 0, y: 90)),
  'EPSG:6691': ProjectAndUnProjectResult(
      Point(x: 1558843.5538291563, y: 11945699.00761955), Point(x: 0, y: 90)),
  'EPSG:6692': ProjectAndUnProjectResult(
      Point(x: 4451906.623195637, y: 11150975.810983855), Point(x: 0, y: 90)),
  'EPSG:6703': ProjectAndUnProjectResult(
      Point(x: 5592748.166681155, y: 18797765.697358683),
      Point(x: -187879.93357770934, y: 41002.61339845493)),
  'EPSG:6707': ProjectAndUnProjectResult(
      Point(x: 1176891.287219305, y: 5231671.834018296),
      Point(x: 17.88805843543735, y: 46.892264027445336)),
  'EPSG:6708': ProjectAndUnProjectResult(
      Point(x: 720001.2298400886, y: 5197241.60997254),
      Point(x: 17.888058560302017, y: 46.89226406695651)),
  'EPSG:6709': ProjectAndUnProjectResult(
      Point(x: 262945.2879608735, y: 5197894.102611037),
      Point(x: 17.888058560253082, y: 46.89226406692702)),
  'EPSG:6720': ProjectAndUnProjectResult(
      Point(x: -5062786.461219813, y: 11150676.91109798),
      Point(x: 407030514275.89813, y: 88857755316.43858)),
  'EPSG:6721': ProjectAndUnProjectResult(
      Point(x: -5062792.289666137, y: 11150688.140546752),
      Point(x: 407030514824.1814, y: 88857755434.83792)),
  'EPSG:6722': ProjectAndUnProjectResult(
      Point(x: -5065145.27941917, y: 10313925.465505805),
      Point(x: 390580.8116510452, y: 85422.32821383733)),
  'EPSG:6723': ProjectAndUnProjectResult(
      Point(x: -5065113.923605251, y: 10413870.82307435),
      Point(x: 390580.8117010934, y: 85422.32822390879)),
  'EPSG:6732': ProjectAndUnProjectResult(
      Point(x: -2874856.201391816, y: 16270807.968937546),
      Point(x: 19.454709786887857, y: 47.12664126126566)),
  'EPSG:6733': ProjectAndUnProjectResult(
      Point(x: -3285663.9712863937, y: 16606958.937606297),
      Point(x: 26.457538859986695, y: 48.314441565488146)),
  'EPSG:6734': ProjectAndUnProjectResult(
      Point(x: -3669837.9754550727, y: 16998726.380965207),
      Point(x: 66.46978443301275, y: 55.68536724688989)),
  'EPSG:6735': ProjectAndUnProjectResult(
      Point(x: -4015632.4728294853, y: 17448393.592071578),
      Point(x: -29.203552236066432, y: 107.75568998077289)),
  'EPSG:6736': ProjectAndUnProjectResult(
      Point(x: -4524591.704418489, y: 18519978.272960275),
      Point(x: 38040.256750950444, y: 8289.769436944365)),
  'EPSG:6737': ProjectAndUnProjectResult(
      Point(x: -4640717.024370874, y: 19131890.97205334),
      Point(x: 2043698.7544900347, y: 448818.1175920155)),
  'EPSG:6738': ProjectAndUnProjectResult(
      Point(x: 27108574.549169235, y: 6815768.467481233),
      Point(x: -103767.21820745953, y: -188871.77584871996)),
  'EPSG:6784': ProjectAndUnProjectResult(
      Point(x: -8147695.9153572135, y: 4427066.586894405),
      Point(x: 424825018.9543009, y: 148741912.75836068)),
  'EPSG:6785': ProjectAndUnProjectResult(
      Point(x: -26731285.811539937, y: 14524496.676162746),
      Point(x: 424825018.9543003, y: 148741912.75836045)),
  'EPSG:6786': ProjectAndUnProjectResult(
      Point(x: -8147695.9153572135, y: 4427066.586894405),
      Point(x: 424825018.9543009, y: 148741912.75836068)),
  'EPSG:6787': ProjectAndUnProjectResult(
      Point(x: -26731285.811539937, y: 14524496.676162746),
      Point(x: 424825018.9543003, y: 148741912.75836045)),
  'EPSG:6788': ProjectAndUnProjectResult(
      Point(x: -11235933.756508114, y: 3058544.0947498605),
      Point(x: 506388.781575293, y: 252544.63146005027)),
  'EPSG:6789': ProjectAndUnProjectResult(
      Point(x: -36863299.72607754, y: 10034593.486712141),
      Point(x: 506388.7815752957, y: 252544.63146005166)),
  'EPSG:6790': ProjectAndUnProjectResult(
      Point(x: -11235933.756508114, y: 3058544.0947498605),
      Point(x: 506388.781575293, y: 252544.63146005027)),
  'EPSG:6791': ProjectAndUnProjectResult(
      Point(x: -36863299.72607754, y: 10034593.486712141),
      Point(x: 506388.7815752957, y: 252544.63146005166)),
  'EPSG:6800': ProjectAndUnProjectResult(
      Point(x: -12687334.617845144, y: 2142123.4901495352),
      Point(x: 131147.12864422146, y: 76287.34812805503)),
  'EPSG:6801': ProjectAndUnProjectResult(
      Point(x: -41625113.57560795, y: 7027964.206527346),
      Point(x: 131147.12864422126, y: 76287.3481280549)),
  'EPSG:6802': ProjectAndUnProjectResult(
      Point(x: -12687334.617845144, y: 2142123.4901495352),
      Point(x: 131147.12864422146, y: 76287.34812805503)),
  'EPSG:6803': ProjectAndUnProjectResult(
      Point(x: -41625113.57560795, y: 7027964.206527346),
      Point(x: 131147.12864422126, y: 76287.3481280549)),
  'EPSG:6808': ProjectAndUnProjectResult(
      Point(x: 14427099.751763076, y: 11533305.931524668),
      Point(x: 17.88805856028155, y: 46.892264067008696)),
  'EPSG:6809': ProjectAndUnProjectResult(
      Point(x: 47333004.43492636, y: 37838930.22157699),
      Point(x: 17.88805856028155, y: 46.892264067008696)),
  'EPSG:6819': ProjectAndUnProjectResult(
      Point(x: -34765375.73372051, y: 10217353.259960476),
      Point(x: 1116509.7241064152, y: 519843.67865306913)),
  'EPSG:6810': ProjectAndUnProjectResult(
      Point(x: 14427099.751763076, y: 11533305.931524668),
      Point(x: 17.88805856028155, y: 46.892264067008696)),
  'EPSG:6811': ProjectAndUnProjectResult(
      Point(x: 47333004.43492636, y: 37838930.22157699),
      Point(x: 17.88805856028155, y: 46.892264067008696)),
  'EPSG:6812': ProjectAndUnProjectResult(
      Point(x: -12676736.474988107, y: 2104993.2173343156),
      Point(x: 131147.12864422146, y: 76287.34812805503)),
  'EPSG:6813': ProjectAndUnProjectResult(
      Point(x: -41590342.76565966, y: 6906145.726162452),
      Point(x: 131147.12864422146, y: 76287.34812805503)),
  'EPSG:6814': ProjectAndUnProjectResult(
      Point(x: -12676736.474988107, y: 2104993.2173343156),
      Point(x: 131147.12864422146, y: 76287.34812805503)),
  'EPSG:6815': ProjectAndUnProjectResult(
      Point(x: -41590342.76565966, y: 6906145.726162452),
      Point(x: 131147.12864422146, y: 76287.34812805503)),
  'EPSG:6816': ProjectAndUnProjectResult(
      Point(x: -10596486.523637692, y: 3114249.273635953),
      Point(x: 1116509.7241064152, y: 519843.67865306913)),
  'EPSG:6817': ProjectAndUnProjectResult(
      Point(x: -34765375.73372051, y: 10217353.259960476),
      Point(x: 1116509.7241064152, y: 519843.67865306913)),
  'EPSG:6818': ProjectAndUnProjectResult(
      Point(x: -10596486.523637692, y: 3114249.273635953),
      Point(x: 1116509.7241064152, y: 519843.67865306913)),
  'EPSG:6820': ProjectAndUnProjectResult(
      Point(x: -12523661.992439302, y: 2095380.2220970227),
      Point(x: 148821.25440342294, y: 85106.37172100703)),
  'EPSG:6821': ProjectAndUnProjectResult(
      Point(x: -41088129.896405056, y: 6874607.027877371),
      Point(x: 148821.25440342294, y: 85106.37172100703)),
  'EPSG:6822': ProjectAndUnProjectResult(
      Point(x: -12523661.992439302, y: 2095380.2220970227),
      Point(x: 148821.25440342294, y: 85106.37172100703)),
  'EPSG:6823': ProjectAndUnProjectResult(
      Point(x: -41088129.896405056, y: 6874607.027877371),
      Point(x: 148821.25440342294, y: 85106.37172100703)),
  'EPSG:6824': ProjectAndUnProjectResult(
      Point(x: -12676991.00386344, y: 2225376.02393809),
      Point(x: 131147.12864422158, y: 76287.34812805509)),
  'EPSG:6825': ProjectAndUnProjectResult(
      Point(x: -41591177.834148295, y: 7301102.440741765),
      Point(x: 131147.1286442217, y: 76287.34812805516)),
  'EPSG:6826': ProjectAndUnProjectResult(
      Point(x: -12676991.00386344, y: 2225376.02393809),
      Point(x: 131147.12864422158, y: 76287.34812805509)),
  'EPSG:6827': ProjectAndUnProjectResult(
      Point(x: -41591177.834148295, y: 7301102.440741765),
      Point(x: 131147.1286442217, y: 76287.34812805516)),
  'EPSG:6828': ProjectAndUnProjectResult(
      Point(x: -11814330.286069289, y: 2401419.0651764544),
      Point(x: 294986.9593849864, y: 155421.92309333876)),
  'EPSG:6829': ProjectAndUnProjectResult(
      Point(x: -38760926.13534806, y: 7878671.473676031),
      Point(x: 294986.9593849864, y: 155421.92309333876)),
  'EPSG:6830': ProjectAndUnProjectResult(
      Point(x: -11814330.286069289, y: 2401419.0651764544),
      Point(x: 294986.9593849864, y: 155421.92309333876)),
  'EPSG:6831': ProjectAndUnProjectResult(
      Point(x: -38760926.13534806, y: 7878671.473676031),
      Point(x: 294986.9593849864, y: 155421.92309333876)),
  'EPSG:6832': ProjectAndUnProjectResult(
      Point(x: -8270468.869705044, y: 4310387.415937599),
      Point(x: 250531415.2064754, y: 89068140.86510274)),
  'EPSG:6833': ProjectAndUnProjectResult(
      Point(x: -27134084.218192924, y: 14141690.9971706),
      Point(x: 250531415.2064754, y: 89068140.86510274)),
  'EPSG:6834': ProjectAndUnProjectResult(
      Point(x: -8270468.869705044, y: 4310387.415937599),
      Point(x: 250531415.2064754, y: 89068140.86510274)),
  'EPSG:6835': ProjectAndUnProjectResult(
      Point(x: -27134084.218192924, y: 14141690.9971706),
      Point(x: 250531415.2064754, y: 89068140.86510274)),
  'EPSG:6836': ProjectAndUnProjectResult(
      Point(x: -7504892.876309951, y: 4857925.275995098),
      Point(x: 16894389367.285202, y: 5473429537.796041)),
  'EPSG:6837': ProjectAndUnProjectResult(
      Point(x: -24622351.956398528, y: 15938075.052477354),
      Point(x: 16894389367.285202, y: 5473429537.796041)),
  'EPSG:7847': ProjectAndUnProjectResult(
      Point(x: -4640717.024370874, y: 19131890.97205334),
      Point(x: 2043698.7544900347, y: 448818.1175920155)),
  'EPSG:6838': ProjectAndUnProjectResult(
      Point(x: -7504892.876309951, y: 4857925.275995098),
      Point(x: 16894389367.285202, y: 5473429537.796041)),
  'EPSG:6839': ProjectAndUnProjectResult(
      Point(x: -24622351.956398528, y: 15938075.052477354),
      Point(x: 16894389367.285202, y: 5473429537.796041)),
  'EPSG:6840': ProjectAndUnProjectResult(
      Point(x: 2751127.6973184827, y: 4303936.442977292),
      Point(x: 17.888058560281486, y: 46.892264067008746)),
  'EPSG:6841': ProjectAndUnProjectResult(
      Point(x: 9026009.505642002, y: 14120526.387681141),
      Point(x: 17.888058560281486, y: 46.892264067008746)),
  'EPSG:6842': ProjectAndUnProjectResult(
      Point(x: 2751127.6973184827, y: 4303936.442977292),
      Point(x: 17.888058560281486, y: 46.892264067008746)),
  'EPSG:6843': ProjectAndUnProjectResult(
      Point(x: 9026009.505642002, y: 14120526.387681141),
      Point(x: 17.888058560281486, y: 46.892264067008746)),
  'EPSG:6844': ProjectAndUnProjectResult(
      Point(x: -9135201.937584285, y: 3830973.6946668853),
      Point(x: 15892243.09761257, y: 6278261.590776778)),
  'EPSG:6845': ProjectAndUnProjectResult(
      Point(x: -29971134.965828493, y: 12568811.334208941),
      Point(x: 15892243.09761257, y: 6278261.590776778)),
  'EPSG:6846': ProjectAndUnProjectResult(
      Point(x: -9135201.937584285, y: 3830973.6946668853),
      Point(x: 15892243.09761257, y: 6278261.590776778)),
  'EPSG:6847': ProjectAndUnProjectResult(
      Point(x: -29971134.965828493, y: 12568811.334208941),
      Point(x: 15892243.09761257, y: 6278261.590776778)),
  'EPSG:6848': ProjectAndUnProjectResult(
      Point(x: -8529480.410920456, y: 4176775.823128944),
      Point(x: 98652277.72918534, y: 36154061.091848835)),
  'EPSG:6849': ProjectAndUnProjectResult(
      Point(x: -27983859.615831155, y: 13703332.753047716),
      Point(x: 98652277.72918534, y: 36154061.091848835)),
  'EPSG:6850': ProjectAndUnProjectResult(
      Point(x: -8529480.410920456, y: 4176775.823128944),
      Point(x: 98652277.72918534, y: 36154061.091848835)),
  'EPSG:6851': ProjectAndUnProjectResult(
      Point(x: -27983859.615831155, y: 13703332.753047716),
      Point(x: 98652277.72918534, y: 36154061.091848835)),
  'EPSG:6856': ProjectAndUnProjectResult(
      Point(x: -12447494.07457886, y: 2076261.6085382975),
      Point(x: 158722.84328641556, y: 90007.24762701495)),
  'EPSG:6857': ProjectAndUnProjectResult(
      Point(x: -40838235.15276843, y: 6811881.917776566),
      Point(x: 158722.84328641556, y: 90007.24762701495)),
  'EPSG:6858': ProjectAndUnProjectResult(
      Point(x: -12447494.07457886, y: 2076261.6085382975),
      Point(x: 158722.84328641556, y: 90007.24762701495)),
  'EPSG:6859': ProjectAndUnProjectResult(
      Point(x: -40838235.15276843, y: 6811881.917776566),
      Point(x: 158722.84328641556, y: 90007.24762701495)),
  'EPSG:6860': ProjectAndUnProjectResult(
      Point(x: -11973543.359605001, y: 2416720.646855334),
      Point(x: 255319.9002424107, y: 136694.2384865875)),
  'EPSG:6861': ProjectAndUnProjectResult(
      Point(x: -39283278.73886155, y: 7928873.5133049),
      Point(x: 255319.9002424107, y: 136694.2384865875)),
  'EPSG:6862': ProjectAndUnProjectResult(
      Point(x: -11973543.359605001, y: 2416720.646855334),
      Point(x: 255319.9002424107, y: 136694.2384865875)),
  'EPSG:6863': ProjectAndUnProjectResult(
      Point(x: -39283278.73886155, y: 7928873.5133049),
      Point(x: 255319.9002424107, y: 136694.2384865875)),
  'EPSG:6867': ProjectAndUnProjectResult(
      Point(x: 6621080.326600361, y: 7550611.109639786),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6868': ProjectAndUnProjectResult(
      Point(x: 21722704.48359173, y: 24772346.160235517),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:6870': ProjectAndUnProjectResult(
      Point(x: 339053.9538040216, y: 5197436.0837356355),
      Point(x: 17.888058560277017, y: 46.892264067000774)),
  'EPSG:6875': ProjectAndUnProjectResult(
      Point(x: 7447996.264442064, y: 5204311.696323936),
      Point(x: 17.888058558416997, y: 46.892264063331794)),
  'EPSG:6876': ProjectAndUnProjectResult(
      Point(x: 3448669.26834458, y: 5212129.891160676),
      Point(x: 17.888058558416994, y: 46.89226406333179)),
  'EPSG:6879': ProjectAndUnProjectResult(
      Point(x: 6611250.719513921, y: 5046926.8438626565),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:6880': ProjectAndUnProjectResult(
      Point(x: 22883813.725204114, y: 19815816.15389137),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:6884': ProjectAndUnProjectResult(
      Point(x: 8597033.820587108, y: 7390016.602283895),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:6885': ProjectAndUnProjectResult(
      Point(x: 28205491.53782647, y: 24245461.29358233),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:6886': ProjectAndUnProjectResult(
      Point(x: 7874076.89548586, y: 7497850.224338042),
      Point(x: 17.88805856028154, y: 46.892264067008725)),
  'EPSG:6887': ProjectAndUnProjectResult(
      Point(x: 25833585.615591403, y: 24599246.142841343),
      Point(x: 17.88805856028154, y: 46.892264067008725)),
  'EPSG:6915': ProjectAndUnProjectResult(
      Point(x: -2445789.535893212, y: 5987079.707584725),
      Point(x: 18.163104217855356, y: 46.928533619973805)),
  'EPSG:6922': ProjectAndUnProjectResult(
      Point(x: 7155977.5092980275, y: 6148778.096964074),
      Point(x: 17.888058560281525, y: 46.89226406700872)),
  'EPSG:6923': ProjectAndUnProjectResult(
      Point(x: 23477569.54505528, y: 20173116.139789633),
      Point(x: 17.888058560281525, y: 46.89226406700872)),
  'EPSG:6924': ProjectAndUnProjectResult(
      Point(x: 7155977.5092980275, y: 6148778.096964074),
      Point(x: 17.888058560281525, y: 46.89226406700872)),
  'EPSG:6925': ProjectAndUnProjectResult(
      Point(x: 23477569.54505528, y: 20173116.139789633),
      Point(x: 17.888058560281525, y: 46.89226406700872)),
  'EPSG:7005': ProjectAndUnProjectResult(
      Point(x: -1105167.6622423972, y: 5413518.053847402),
      Point(x: 17.888508896499072, y: 46.89229062656116)),
  'EPSG:6956': ProjectAndUnProjectResult(
      Point(x: -5152275.287064603, y: 9954768.882961797),
      Point(x: double.nan, y: double.nan)),
  'EPSG:6957': ProjectAndUnProjectResult(
      Point(x: -5123587.388099429, y: 10281039.67478536),
      Point(x: double.nan, y: double.nan)),
  'EPSG:6958': ProjectAndUnProjectResult(
      Point(x: -5050677.6545024095, y: 10610235.462374557),
      Point(x: -168.37939778999916, y: 89.99824032468668)),
  'EPSG:6959': ProjectAndUnProjectResult(
      Point(x: -5058590.894691086, y: 10582782.95357802),
      Point(x: -168.37939778999916, y: 89.99824032468668)),
  'EPSG:6962': ProjectAndUnProjectResult(
      Point(x: -161710.69187815275, y: 657428.9710477525),
      Point(x: 17.888058560281515, y: 46.892264067008725)),
  'EPSG:6984': ProjectAndUnProjectResult(
      Point(x: -1098554.857504982, y: 2457387.7290571346),
      Point(x: 17.88812602014107, y: 46.892265987645935)),
  'EPSG:6991': ProjectAndUnProjectResult(
      Point(x: -1098554.857504982, y: 2457387.7290571346),
      Point(x: 17.88812602014107, y: 46.892265987645935)),
  'EPSG:6996': ProjectAndUnProjectResult(
      Point(x: -11879282.52202792, y: 3169856.913904962),
      Point(x: 266510.07956063334, y: 141998.87855360404)),
  'EPSG:6997': ProjectAndUnProjectResult(
      Point(x: -38973946.07435327, y: 10399772.22503653),
      Point(x: 266510.0795606337, y: 141998.8785536042)),
  'EPSG:7006': ProjectAndUnProjectResult(
      Point(x: -1557610.1923113405, y: 5561529.295679336),
      Point(x: 17.89339771251983, y: 46.89274232210332)),
  'EPSG:7007': ProjectAndUnProjectResult(
      Point(x: -2005606.4598314841, y: 5751485.376458449),
      Point(x: 17.930922921082697, y: 46.89707837787241)),
  'EPSG:7059': ProjectAndUnProjectResult(
      Point(x: 23659396.327111464, y: 32775259.236593112), Point(x: 0, y: 90)),
  'EPSG:7062': ProjectAndUnProjectResult(
      Point(x: 23336606.10109816, y: 31781388.117976915), Point(x: 0, y: 90)),
  'EPSG:7063': ProjectAndUnProjectResult(
      Point(x: 25226146.542599436, y: 31855225.490231134), Point(x: 0, y: 90)),
  'EPSG:7064': ProjectAndUnProjectResult(
      Point(x: 26925283.91182929, y: 31926234.221029256), Point(x: 0, y: 90)),
  'EPSG:7065': ProjectAndUnProjectResult(
      Point(x: 28575914.851010647, y: 31980476.745277643), Point(x: 0, y: 90)),
  'EPSG:7067': ProjectAndUnProjectResult(
      Point(x: 32075379.757604606, y: 31934051.784694847), Point(x: 0, y: 90)),
  'EPSG:7069': ProjectAndUnProjectResult(
      Point(x: 33192213.201036148, y: 31016906.6763871), Point(x: 0, y: 90)),
  'EPSG:7070': ProjectAndUnProjectResult(
      Point(x: 34627310.72671447, y: 30685079.319513485), Point(x: 0, y: 90)),
  'EPSG:7074': ProjectAndUnProjectResult(
      Point(x: -1105125.5282006196, y: 15413941.856367432),
      Point(x: 17.888509189327223, y: 46.892290763690376)),
  'EPSG:7075': ProjectAndUnProjectResult(
      Point(x: -1557536.5212347228, y: 15561950.163916145),
      Point(x: 17.893399933574372, y: 46.89274299727957)),
  'EPSG:7076': ProjectAndUnProjectResult(
      Point(x: -2005500.4108122215, y: 15751900.44658664),
      Point(x: 17.930935679469886, y: 46.897081134395314)),
  'EPSG:7077': ProjectAndUnProjectResult(
      Point(x: -2446060.569136869, y: 15986999.55129112),
      Point(x: 18.163219782904886, y: 46.928551724201576)),
  'EPSG:7078': ProjectAndUnProjectResult(
      Point(x: -2874856.201391816, y: 16270807.968937546),
      Point(x: 19.454709786887857, y: 47.12664126126566)),
  'EPSG:7079': ProjectAndUnProjectResult(
      Point(x: -3285663.9712863937, y: 16606958.937606297),
      Point(x: 26.457538859986695, y: 48.314441565488146)),
  'EPSG:7080': ProjectAndUnProjectResult(
      Point(x: -3669837.9754550727, y: 16998726.380965207),
      Point(x: 66.46978443301275, y: 55.68536724688989)),
  'EPSG:7081': ProjectAndUnProjectResult(
      Point(x: -4015632.4728294853, y: 17448393.592071578),
      Point(x: -29.203552236066432, y: 107.75568998077289)),
  'EPSG:7109': ProjectAndUnProjectResult(
      Point(x: -4529224.4946787935, y: 5520223.694971471), Point(x: 0, y: 90)),
  'EPSG:7110': ProjectAndUnProjectResult(
      Point(x: -4579364.848956948, y: 5575997.430125581), Point(x: 0, y: 90)),
  'EPSG:7115': ProjectAndUnProjectResult(
      Point(x: -1980157.3253148668, y: 6739903.780372046), Point(x: 0, y: 90)),
  'EPSG:7118': ProjectAndUnProjectResult(
      Point(x: -2358766.854885466, y: 6897593.647641159), Point(x: 0, y: 90)),
  'EPSG:7119': ProjectAndUnProjectResult(
      Point(x: -14859660.415564805, y: 18110970.127859157), Point(x: 0, y: 90)),
  'EPSG:7120': ProjectAndUnProjectResult(
      Point(x: -15024162.890280012, y: 18293954.823246658), Point(x: 0, y: 90)),
  'EPSG:7125': ProjectAndUnProjectResult(
      Point(x: -6496579.15129812, y: 22112545.211194374), Point(x: 0, y: 90)),
  'EPSG:7128': ProjectAndUnProjectResult(
      Point(x: -7738720.9231034005, y: 22629855.15896937), Point(x: 0, y: 90)),
  'EPSG:7131': ProjectAndUnProjectResult(
      Point(x: -11879282.52202792, y: 3169856.913904962),
      Point(x: 266510.07956063334, y: 141998.87855360404)),
  'EPSG:7132': ProjectAndUnProjectResult(
      Point(x: -38973946.07435327, y: 10399772.22503653),
      Point(x: 266510.0795606337, y: 141998.8785536042)),
  'EPSG:7142': ProjectAndUnProjectResult(
      Point(x: -1148621.110313324, y: 1957398.2976502348),
      Point(x: 17.88812625153329, y: 46.89226592347)),
  'EPSG:7257': ProjectAndUnProjectResult(
      Point(x: 4331314.136537872, y: 6975315.389059721), Point(x: 0, y: 90)),
  'EPSG:7258': ProjectAndUnProjectResult(
      Point(x: 14210319.796291336, y: 22884847.2389401), Point(x: 0, y: 90)),
  'EPSG:7259': ProjectAndUnProjectResult(
      Point(x: 4318574.046028171, y: 6945483.081037194), Point(x: 0, y: 90)),
  'EPSG:7260': ProjectAndUnProjectResult(
      Point(x: 14168521.682677424, y: 22786972.408369526), Point(x: 0, y: 90)),
  'EPSG:7261': ProjectAndUnProjectResult(
      Point(x: 4213257.633919751, y: 7227647.487010904), Point(x: 0, y: 90)),
  'EPSG:7262': ProjectAndUnProjectResult(
      Point(x: 13822996.087285051, y: 23712706.796968274), Point(x: 0, y: 90)),
  'EPSG:7263': ProjectAndUnProjectResult(
      Point(x: 4006181.03954188, y: 7189760.266630081), Point(x: 0, y: 90)),
  'EPSG:7264': ProjectAndUnProjectResult(
      Point(x: 13143612.293896986, y: 23588405.141435526), Point(x: 0, y: 90)),
  'EPSG:7265': ProjectAndUnProjectResult(
      Point(x: 4273299.505410438, y: 7071357.478190964), Point(x: 0, y: 90)),
  'EPSG:7266': ProjectAndUnProjectResult(
      Point(x: 14019983.460667415, y: 23199945.326364856), Point(x: 0, y: 90)),
  'EPSG:7267': ProjectAndUnProjectResult(
      Point(x: 4123101.7501443964, y: 7217288.116291453), Point(x: 0, y: 90)),
  'EPSG:7268': ProjectAndUnProjectResult(
      Point(x: 13527209.658598742, y: 23678719.428199545), Point(x: 0, y: 90)),
  'EPSG:7269': ProjectAndUnProjectResult(
      Point(x: 4151281.3535266537, y: 7266740.90194746), Point(x: 0, y: 90)),
  'EPSG:7270': ProjectAndUnProjectResult(
      Point(x: 13619662.240695363, y: 23840965.77580596), Point(x: 0, y: 90)),
  'EPSG:7271': ProjectAndUnProjectResult(
      Point(x: 4101645.22528056, y: 7141124.513940572), Point(x: 0, y: 90)),
  'EPSG:7272': ProjectAndUnProjectResult(
      Point(x: 13456814.376607971, y: 23428839.342820026), Point(x: 0, y: 90)),
  'EPSG:7273': ProjectAndUnProjectResult(
      Point(x: 4137222.5344148865, y: 7103203.082842901), Point(x: 0, y: 90)),
  'EPSG:32607': ProjectAndUnProjectResult(
      Point(x: -35393329.619301565, y: -11254044.783200482),
      Point(x: 0, y: -90)),
  'EPSG:7274': ProjectAndUnProjectResult(
      Point(x: 13573537.598326175, y: 23304425.447627086), Point(x: 0, y: 90)),
  'EPSG:7275': ProjectAndUnProjectResult(
      Point(x: 4246811.760105154, y: 7299949.78739525), Point(x: 0, y: 90)),
  'EPSG:7276': ProjectAndUnProjectResult(
      Point(x: 13933081.582944993, y: 23949918.594145916), Point(x: 0, y: 90)),
  'EPSG:7277': ProjectAndUnProjectResult(
      Point(x: 4028582.689358129, y: 7321720.117252209), Point(x: 0, y: 90)),
  'EPSG:7278': ProjectAndUnProjectResult(
      Point(x: 13217108.373335795, y: 24021343.418018293), Point(x: 0, y: 90)),
  'EPSG:7279': ProjectAndUnProjectResult(
      Point(x: 4108833.0645097396, y: 7164691.613104125), Point(x: 0, y: 90)),
  'EPSG:7280': ProjectAndUnProjectResult(
      Point(x: 13480396.479145706, y: 23506159.067325782), Point(x: 0, y: 90)),
  'EPSG:7281': ProjectAndUnProjectResult(
      Point(x: 4123059.037562798, y: 7383732.239831039), Point(x: 0, y: 90)),
  'EPSG:7282': ProjectAndUnProjectResult(
      Point(x: 13527069.52573728, y: 24224794.85684567), Point(x: 0, y: 90)),
  'EPSG:7283': ProjectAndUnProjectResult(
      Point(x: 4035981.4071827894, y: 7395249.464870051), Point(x: 0, y: 90)),
  'EPSG:7284': ProjectAndUnProjectResult(
      Point(x: 13241382.33339887, y: 24262580.95266116), Point(x: 0, y: 90)),
  'EPSG:7285': ProjectAndUnProjectResult(
      Point(x: 4337621.842092536, y: 7181697.385461008), Point(x: 0, y: 90)),
  'EPSG:7286': ProjectAndUnProjectResult(
      Point(x: 14231014.326931931, y: 23561952.172133327), Point(x: 0, y: 90)),
  'EPSG:7287': ProjectAndUnProjectResult(
      Point(x: 4240206.014137559, y: 7199018.8409899585), Point(x: 0, y: 90)),
  'EPSG:7288': ProjectAndUnProjectResult(
      Point(x: 13911409.231382973, y: 23618780.980814558), Point(x: 0, y: 90)),
  'EPSG:7289': ProjectAndUnProjectResult(
      Point(x: 4331322.318887944, y: 6897590.084435026), Point(x: 0, y: 90)),
  'EPSG:7290': ProjectAndUnProjectResult(
      Point(x: 14210346.641218198, y: 22629843.468683917), Point(x: 0, y: 90)),
  'EPSG:7291': ProjectAndUnProjectResult(
      Point(x: 4058098.101393937, y: 7410544.829712538), Point(x: 0, y: 90)),
  'EPSG:7292': ProjectAndUnProjectResult(
      Point(x: 13313943.520989943, y: 24312762.495481886), Point(x: 0, y: 90)),
  'EPSG:7293': ProjectAndUnProjectResult(
      Point(x: 4213285.446000075, y: 7044490.1597183645), Point(x: 0, y: 90)),
  'EPSG:7294': ProjectAndUnProjectResult(
      Point(x: 13823087.334085247, y: 23111798.13234267), Point(x: 0, y: 90)),
  'EPSG:7295': ProjectAndUnProjectResult(
      Point(x: 4318602.5951614715, y: 7128747.953189529), Point(x: 0, y: 90)),
  'EPSG:7296': ProjectAndUnProjectResult(
      Point(x: 14168615.347625595, y: 23388233.90975598), Point(x: 0, y: 90)),
  'EPSG:7297': ProjectAndUnProjectResult(
      Point(x: 4006165.975254586, y: 7245252.280258383), Point(x: 0, y: 90)),
  'EPSG:7298': ProjectAndUnProjectResult(
      Point(x: 13143562.870481089, y: 23770465.189481046), Point(x: 0, y: 90)),
  'EPSG:7299': ProjectAndUnProjectResult(
      Point(x: 4151285.2646906725, y: 7055777.580320902), Point(x: 0, y: 90)),
  'EPSG:7300': ProjectAndUnProjectResult(
      Point(x: 13619675.072572649, y: 23148830.278102826), Point(x: 0, y: 90)),
  'EPSG:7301': ProjectAndUnProjectResult(
      Point(x: 3952890.3566686762, y: 7473443.057522163), Point(x: 0, y: 90)),
  'EPSG:7302': ProjectAndUnProjectResult(
      Point(x: 12968774.445170483, y: 24519121.097887296), Point(x: 0, y: 90)),
  'EPSG:7303': ProjectAndUnProjectResult(
      Point(x: 4233507.7029059185, y: 7064626.07468358), Point(x: 0, y: 90)),
  'EPSG:7304': ProjectAndUnProjectResult(
      Point(x: 13889433.188617168, y: 23177860.713357713), Point(x: 0, y: 90)),
  'EPSG:7305': ProjectAndUnProjectResult(
      Point(x: 4192849.0877581015, y: 7140884.329141924), Point(x: 0, y: 90)),
  'EPSG:7306': ProjectAndUnProjectResult(
      Point(x: 13756039.048753038, y: 23428051.336526465), Point(x: 0, y: 90)),
  'EPSG:7307': ProjectAndUnProjectResult(
      Point(x: 4220061.413900266, y: 7151166.4786150865), Point(x: 0, y: 90)),
  'EPSG:7308': ProjectAndUnProjectResult(
      Point(x: 13845318.155437792, y: 23461785.35525633), Point(x: 0, y: 90)),
  'EPSG:7309': ProjectAndUnProjectResult(
      Point(x: 4172157.8650031947, y: 7370339.8157332875), Point(x: 0, y: 90)),
  'EPSG:32608': ProjectAndUnProjectResult(
      Point(x: -25785988.54441397, y: -2920563.7791145765),
      Point(x: 72517.8297499813, y: -135482.78847814907)),
  'EPSG:7310': ProjectAndUnProjectResult(
      Point(x: 13688154.595431315, y: 24180856.54545163), Point(x: 0, y: 90)),
  'EPSG:7311': ProjectAndUnProjectResult(
      Point(x: 4266751.205587671, y: 7109160.613688538), Point(x: 0, y: 90)),
  'EPSG:7312': ProjectAndUnProjectResult(
      Point(x: 13998499.580332218, y: 23323971.113409813), Point(x: 0, y: 90)),
  'EPSG:7313': ProjectAndUnProjectResult(
      Point(x: 4172173.593209992, y: 7103916.781828795), Point(x: 0, y: 90)),
  'EPSG:7314': ProjectAndUnProjectResult(
      Point(x: 13688206.19705645, y: 23306766.975049973), Point(x: 0, y: 90)),
  'EPSG:7315': ProjectAndUnProjectResult(
      Point(x: 4260122.275477586, y: 7013606.951546695), Point(x: 0, y: 90)),
  'EPSG:7316': ProjectAndUnProjectResult(
      Point(x: 13976751.165462716, y: 23010475.473532785), Point(x: 0, y: 90)),
  'EPSG:7317': ProjectAndUnProjectResult(
      Point(x: 4199639.770194668, y: 7269668.482471146), Point(x: 0, y: 90)),
  'EPSG:7318': ProjectAndUnProjectResult(
      Point(x: 13778318.14604701, y: 23850570.679574084), Point(x: 0, y: 90)),
  'EPSG:7319': ProjectAndUnProjectResult(
      Point(x: 4036015.570400516, y: 7145499.315997849), Point(x: 0, y: 90)),
  'EPSG:7320': ProjectAndUnProjectResult(
      Point(x: 13241494.41722236, y: 23443192.339236278), Point(x: 0, y: 90)),
  'EPSG:7321': ProjectAndUnProjectResult(
      Point(x: 4324978.475543668, y: 7007637.420068591), Point(x: 0, y: 90)),
  'EPSG:7322': ProjectAndUnProjectResult(
      Point(x: 14189533.54851285, y: 22990890.435675036), Point(x: 0, y: 90)),
  'EPSG:7323': ProjectAndUnProjectResult(
      Point(x: 4279803.304733651, y: 7233358.377435937), Point(x: 0, y: 90)),
  'EPSG:7324': ProjectAndUnProjectResult(
      Point(x: 14041321.34228032, y: 23731443.276637737), Point(x: 0, y: 90)),
  'EPSG:7325': ProjectAndUnProjectResult(
      Point(x: 4220017.63480076, y: 7245457.388853361), Point(x: 0, y: 90)),
  'EPSG:7326': ProjectAndUnProjectResult(
      Point(x: 13845174.523508828, y: 23771138.116596404), Point(x: 0, y: 90)),
  'EPSG:7327': ProjectAndUnProjectResult(
      Point(x: 4172173.593209992, y: 7220503.237108599), Point(x: 0, y: 90)),
  'EPSG:32609': ProjectAndUnProjectResult(
      Point(x: -18063024.28264584, y: 2990541.0428002356),
      Point(x: 5728.679565344176, y: 8118.4804666046575)),
  'EPSG:7328': ProjectAndUnProjectResult(
      Point(x: 13688206.19705645, y: 23689267.70374713), Point(x: 0, y: 90)),
  'EPSG:7329': ProjectAndUnProjectResult(
      Point(x: 3983472.9667909928, y: 7429516.138336472), Point(x: 0, y: 90)),
  'EPSG:7330': ProjectAndUnProjectResult(
      Point(x: 13069110.891880115, y: 24375004.197192244), Point(x: 0, y: 90)),
  'EPSG:7331': ProjectAndUnProjectResult(
      Point(x: 4266727.046119294, y: 6942545.61351483), Point(x: 0, y: 90)),
  'EPSG:7332': ProjectAndUnProjectResult(
      Point(x: 13998420.317143051, y: 22777335.067006573), Point(x: 0, y: 90)),
  'EPSG:7333': ProjectAndUnProjectResult(
      Point(x: 3991092.2143407646, y: 7170156.678924834), Point(x: 0, y: 90)),
  'EPSG:7334': ProjectAndUnProjectResult(
      Point(x: 13094108.373216325, y: 23524089.037439227), Point(x: 0, y: 90)),
  'EPSG:7335': ProjectAndUnProjectResult(
      Point(x: 4087243.382869298, y: 7094049.956822051), Point(x: 0, y: 90)),
  'EPSG:7336': ProjectAndUnProjectResult(
      Point(x: 13409564.33196369, y: 23274395.56667368), Point(x: 0, y: 90)),
  'EPSG:7337': ProjectAndUnProjectResult(
      Point(x: 4123070.686448688, y: 7289396.167388706), Point(x: 0, y: 90)),
  'EPSG:7338': ProjectAndUnProjectResult(
      Point(x: 13527107.743790405, y: 23915293.92584111), Point(x: 0, y: 90)),
  'EPSG:7339': ProjectAndUnProjectResult(
      Point(x: 4058140.0996330883, y: 7271856.4540123865), Point(x: 0, y: 90)),
  'EPSG:7340': ProjectAndUnProjectResult(
      Point(x: 13314081.310212892, y: 23857749.049538974), Point(x: 0, y: 90)),
  'EPSG:7341': ProjectAndUnProjectResult(
      Point(x: 4065439.160186458, y: 7300950.447947321), Point(x: 0, y: 90)),
  'EPSG:7342': ProjectAndUnProjectResult(
      Point(x: 13338028.311378404, y: 23953201.594640505), Point(x: 0, y: 90)),
  'EPSG:7343': ProjectAndUnProjectResult(
      Point(x: 3998629.0287359925, y: 7288187.3363547595), Point(x: 0, y: 90)),
  'EPSG:7344': ProjectAndUnProjectResult(
      Point(x: 13118835.405111335, y: 23911327.952690575), Point(x: 0, y: 90)),
  'EPSG:7345': ProjectAndUnProjectResult(
      Point(x: 4094432.01033165, y: 7433959.560401595), Point(x: 0, y: 90)),
  'EPSG:7346': ProjectAndUnProjectResult(
      Point(x: 13433149.020563088, y: 24389582.32441757), Point(x: 0, y: 90)),
  'EPSG:7347': ProjectAndUnProjectResult(
      Point(x: 4006128.314536352, y: 7478312.248754668), Point(x: 0, y: 90)),
  'EPSG:7348': ProjectAndUnProjectResult(
      Point(x: 13143439.31194135, y: 24535096.102789275), Point(x: 0, y: 90)),
  'EPSG:7349': ProjectAndUnProjectResult(
      Point(x: 3906232.2832556735, y: 7541804.664876676), Point(x: 0, y: 90)),
  'EPSG:7350': ProjectAndUnProjectResult(
      Point(x: 12815697.082647989, y: 24743404.13801623), Point(x: 0, y: 90)),
  'EPSG:7351': ProjectAndUnProjectResult(
      Point(x: 4318627.065847156, y: 7078827.256747827), Point(x: 0, y: 90)),
  'EPSG:7352': ProjectAndUnProjectResult(
      Point(x: 14168695.631866878, y: 23224452.42484683), Point(x: 0, y: 90)),
  'EPSG:7353': ProjectAndUnProjectResult(
      Point(x: 4286363.709370842, y: 7190101.434668174), Point(x: 0, y: 90)),
  'EPSG:7354': ProjectAndUnProjectResult(
      Point(x: 14062844.936494172, y: 23589524.456907168), Point(x: 0, y: 90)),
  'EPSG:7848': ProjectAndUnProjectResult(
      Point(x: -4621959.250494171, y: 19778061.493694857),
      Point(x: 30362279619.504566, y: 6642887099.3340845)),
  'EPSG:7355': ProjectAndUnProjectResult(
      Point(x: 4206484.846873669, y: 7198746.935639589), Point(x: 0, y: 90)),
  'EPSG:7356': ProjectAndUnProjectResult(
      Point(x: 13800775.701784696, y: 23617888.904677555), Point(x: 0, y: 90)),
  'EPSG:7357': ProjectAndUnProjectResult(
      Point(x: 4043361.727567253, y: 7468773.283861903), Point(x: 0, y: 90)),
  'EPSG:7358': ProjectAndUnProjectResult(
      Point(x: 13265595.934526898, y: 24503800.348803595), Point(x: 0, y: 90)),
  'EPSG:7359': ProjectAndUnProjectResult(
      Point(x: 4324990.7300134245, y: 6874390.492505989), Point(x: 0, y: 90)),
  'EPSG:7360': ProjectAndUnProjectResult(
      Point(x: 14189573.753385711, y: 22553729.474163402), Point(x: 0, y: 90)),
  'EPSG:7361': ProjectAndUnProjectResult(
      Point(x: 3975876.1794218733, y: 7378089.272834579), Point(x: 0, y: 90)),
  'EPSG:7362': ProjectAndUnProjectResult(
      Point(x: 13044187.098653262, y: 24206281.222624782), Point(x: 0, y: 90)),
  'EPSG:7363': ProjectAndUnProjectResult(
      Point(x: 4065439.160186458, y: 7184367.597219087), Point(x: 0, y: 90)),
  'EPSG:7849': ProjectAndUnProjectResult(
      Point(x: -4425719.246305057, y: 20435146.71752043), Point(x: 0, y: 90)),
  'EPSG:7364': ProjectAndUnProjectResult(
      Point(x: 13338028.311378404, y: 23570712.69187629), Point(x: 0, y: 90)),
  'EPSG:7365': ProjectAndUnProjectResult(
      Point(x: 3968238.1250428315, y: 7504232.939900378), Point(x: 0, y: 90)),
  'EPSG:7366': ProjectAndUnProjectResult(
      Point(x: 13019127.915244691, y: 24620137.570323158), Point(x: 0, y: 90)),
  'EPSG:7367': ProjectAndUnProjectResult(
      Point(x: 3983491.6838750695, y: 7335190.891852938), Point(x: 0, y: 90)),
  'EPSG:7368': ProjectAndUnProjectResult(
      Point(x: 13069172.299513457, y: 24065538.78435418), Point(x: 0, y: 90)),
  'EPSG:7369': ProjectAndUnProjectResult(
      Point(x: 4292843.365713758, y: 7002385.784690029), Point(x: 0, y: 90)),
  'EPSG:7370': ProjectAndUnProjectResult(
      Point(x: 14084103.609012557, y: 22973660.69527054), Point(x: 0, y: 90)),
  'EPSG:7374': ProjectAndUnProjectResult(
      Point(x: -2005500.4108122215, y: 5751900.446586641),
      Point(x: 17.930935679469886, y: 46.897081134395314)),
  'EPSG:7375': ProjectAndUnProjectResult(
      Point(x: -2446060.569136869, y: 5986999.55129112),
      Point(x: 18.16321978290487, y: 46.92855172420158)),
  'EPSG:7376': ProjectAndUnProjectResult(
      Point(x: -2874856.201391816, y: 6270807.968937545),
      Point(x: 19.454709786887854, y: 47.126641261265654)),
  'EPSG:7528': ProjectAndUnProjectResult(
      Point(x: 3468290.683902232, y: 7034754.514808692), Point(x: 0, y: 90)),
  'EPSG:7529': ProjectAndUnProjectResult(
      Point(x: 3379674.584728664, y: 6816915.478636543), Point(x: 0, y: 90)),
  'EPSG:7530': ProjectAndUnProjectResult(
      Point(x: 3060937.2787154065, y: 6957068.465882632), Point(x: 0, y: 90)),
  'EPSG:7532': ProjectAndUnProjectResult(
      Point(x: 3689988.0851689526, y: 6931430.5799844805), Point(x: 0, y: 90)),
  'EPSG:7533': ProjectAndUnProjectResult(
      Point(x: 3153672.940117676, y: 7137461.697173122), Point(x: 0, y: 90)),
  'EPSG:7535': ProjectAndUnProjectResult(
      Point(x: 3822990.361101892, y: 6996993.411303278), Point(x: 0, y: 90)),
  'EPSG:7537': ProjectAndUnProjectResult(
      Point(x: 3390618.4191545607, y: 7056596.4442245625), Point(x: 0, y: 90)),
  'EPSG:7541': ProjectAndUnProjectResult(
      Point(x: 3796339.751557811, y: 7156497.446786959), Point(x: 0, y: 90)),
  'EPSG:7542': ProjectAndUnProjectResult(
      Point(x: 3929113.1757629644, y: 6712626.8544382695), Point(x: 0, y: 90)),
  'EPSG:7543': ProjectAndUnProjectResult(
      Point(x: 3013378.5853116503, y: 6877533.049658766), Point(x: 0, y: 90)),
  'EPSG:7544': ProjectAndUnProjectResult(
      Point(x: 3010580.2176696234, y: 7040185.373915163), Point(x: 0, y: 90)),
  'EPSG:7546': ProjectAndUnProjectResult(
      Point(x: 3769574.888567513, y: 6667205.568796816), Point(x: 0, y: 90)),
  'EPSG:7547': ProjectAndUnProjectResult(
      Point(x: 3832374.9261409976, y: 6864556.294344704), Point(x: 0, y: 90)),
  'EPSG:7548': ProjectAndUnProjectResult(
      Point(x: 3415636.1902642823, y: 7305642.758030209), Point(x: 0, y: 90)),
  'EPSG:7551': ProjectAndUnProjectResult(
      Point(x: 3405012.5367005337, y: 7137827.349102414), Point(x: 0, y: 90)),
  'EPSG:7552': ProjectAndUnProjectResult(
      Point(x: 3495775.4923990215, y: 6822835.282791732), Point(x: 0, y: 90)),
  'EPSG:7553': ProjectAndUnProjectResult(
      Point(x: 3191918.450618008, y: 7017760.476250788), Point(x: 0, y: 90)),
  'EPSG:7554': ProjectAndUnProjectResult(
      Point(x: 3860921.4795736372, y: 7005528.164366286), Point(x: 0, y: 90)),
  'EPSG:7555': ProjectAndUnProjectResult(
      Point(x: 3808127.092819137, y: 6861235.0608257), Point(x: 0, y: 90)),
  'EPSG:7556': ProjectAndUnProjectResult(
      Point(x: 3204291.414114237, y: 7111748.531335806), Point(x: 0, y: 90)),
  'EPSG:7558': ProjectAndUnProjectResult(
      Point(x: 3484867.686109837, y: 6852050.195405609), Point(x: 0, y: 90)),
  'EPSG:7560': ProjectAndUnProjectResult(
      Point(x: 3942161.367084428, y: 6715885.210692157), Point(x: 0, y: 90)),
  'EPSG:7561': ProjectAndUnProjectResult(
      Point(x: 3697276.437847649, y: 6768723.763080934), Point(x: 0, y: 90)),
  'EPSG:7563': ProjectAndUnProjectResult(
      Point(x: 3855689.606143715, y: 6764352.072904594), Point(x: 0, y: 90)),
  'EPSG:7566': ProjectAndUnProjectResult(
      Point(x: 2947228.968603797, y: 7053493.02016694), Point(x: 0, y: 90)),
  'EPSG:7568': ProjectAndUnProjectResult(
      Point(x: 3459761.570267035, y: 6936063.286349483), Point(x: 0, y: 90)),
  'EPSG:7570': ProjectAndUnProjectResult(
      Point(x: 3629429.2884092713, y: 7126247.272572763), Point(x: 0, y: 90)),
  'EPSG:7571': ProjectAndUnProjectResult(
      Point(x: 3372972.8871539193, y: 7044187.319239815), Point(x: 0, y: 90)),
  'EPSG:7572': ProjectAndUnProjectResult(
      Point(x: 3524640.118549972, y: 7088603.953742174), Point(x: 0, y: 90)),
  'EPSG:7574': ProjectAndUnProjectResult(
      Point(x: 3823405.313439519, y: 6858804.031463695), Point(x: 0, y: 90)),
  'EPSG:7575': ProjectAndUnProjectResult(
      Point(x: 2970988.8156491998, y: 7122908.373712409), Point(x: 0, y: 90)),
  'EPSG:7577': ProjectAndUnProjectResult(
      Point(x: 3320998.1229724446, y: 7147083.394483467), Point(x: 0, y: 90)),
  'EPSG:7692': ProjectAndUnProjectResult(
      Point(x: -2454926.226432084, y: 6595235.458561134),
      Point(x: 25.359226227943847, y: 48.12268107212026)),
  'EPSG:7582': ProjectAndUnProjectResult(
      Point(x: 3768447.9297039146, y: 6941092.747986726), Point(x: 0, y: 90)),
  'EPSG:7583': ProjectAndUnProjectResult(
      Point(x: 3831482.1536448947, y: 6992424.743299675), Point(x: 0, y: 90)),
  'EPSG:7584': ProjectAndUnProjectResult(
      Point(x: 3711070.401249271, y: 6943225.986154948), Point(x: 0, y: 90)),
  'EPSG:7587': ProjectAndUnProjectResult(
      Point(x: 11378883.685214741, y: 23079857.103862435), Point(x: 0, y: 90)),
  'EPSG:7588': ProjectAndUnProjectResult(
      Point(x: 11088149.032900875, y: 22365163.53324931), Point(x: 0, y: 90)),
  'EPSG:7589': ProjectAndUnProjectResult(
      Point(x: 10042425.055252131, y: 22824982.125635523), Point(x: 0, y: 90)),
  'EPSG:7591': ProjectAndUnProjectResult(
      Point(x: 12106235.909091806, y: 22740868.494165752), Point(x: 0, y: 90)),
  'EPSG:7592': ProjectAndUnProjectResult(
      Point(x: 10346675.304421574, y: 23416822.251727488), Point(x: 0, y: 90)),
  'EPSG:7594': ProjectAndUnProjectResult(
      Point(x: 12542594.209403375, y: 22955969.216841422), Point(x: 0, y: 90)),
  'EPSG:7596': ProjectAndUnProjectResult(
      Point(x: 11124053.930451838, y: 23151516.833878253), Point(x: 0, y: 90)),
  'EPSG:7600': ProjectAndUnProjectResult(
      Point(x: 12455158.00186667, y: 23479275.373399213), Point(x: 0, y: 90)),
  'EPSG:7601': ProjectAndUnProjectResult(
      Point(x: 12890765.47748966, y: 22023009.93872364), Point(x: 0, y: 90)),
  'EPSG:7602': ProjectAndUnProjectResult(
      Point(x: 9886392.908520725, y: 22564039.67997072), Point(x: 0, y: 90)),
  'EPSG:7603': ProjectAndUnProjectResult(
      Point(x: 9877211.930597758, y: 23097674.847744167), Point(x: 0, y: 90)),
  'EPSG:7605': ProjectAndUnProjectResult(
      Point(x: 12367346.946661, y: 21873990.270624973), Point(x: 0, y: 90)),
  'EPSG:7606': ProjectAndUnProjectResult(
      Point(x: 12573383.403229175, y: 22521465.109520163), Point(x: 0, y: 90)),
  'EPSG:7607': ProjectAndUnProjectResult(
      Point(x: 11206133.067307316, y: 23968596.282162443), Point(x: 0, y: 90)),
  'EPSG:7610': ProjectAndUnProjectResult(
      Point(x: 11171278.631028585, y: 23418021.894749753), Point(x: 0, y: 90)),
  'EPSG:7611': ProjectAndUnProjectResult(
      Point(x: 11469056.761512207, y: 22384585.423738793), Point(x: 0, y: 90)),
  'EPSG:7612': ProjectAndUnProjectResult(
      Point(x: 10472152.450069249, y: 23024102.495499462), Point(x: 0, y: 90)),
  'EPSG:7613': ProjectAndUnProjectResult(
      Point(x: 12667039.887473177, y: 22983970.31930564), Point(x: 0, y: 90)),
  'EPSG:7614': ProjectAndUnProjectResult(
      Point(x: 12493830.304164285, y: 22510568.69545532), Point(x: 0, y: 90)),
  'EPSG:7615': ProjectAndUnProjectResult(
      Point(x: 10512746.080779292, y: 23332461.64006414), Point(x: 0, y: 90)),
  'EPSG:7617': ProjectAndUnProjectResult(
      Point(x: 11433270.066707775, y: 22480434.68273107), Point(x: 0, y: 90)),
  'EPSG:7619': ProjectAndUnProjectResult(
      Point(x: 12933574.418677995, y: 22033700.06158052), Point(x: 0, y: 90)),
  'EPSG:7620': ProjectAndUnProjectResult(
      Point(x: 12130147.779973747, y: 22207054.54652695), Point(x: 0, y: 90)),
  'EPSG:7622': ProjectAndUnProjectResult(
      Point(x: 12649874.982788838, y: 22192711.759361073), Point(x: 0, y: 90)),
  'EPSG:7625': ProjectAndUnProjectResult(
      Point(x: 9669367.040981706, y: 23141335.016640786), Point(x: 0, y: 90)),
  'EPSG:7627': ProjectAndUnProjectResult(
      Point(x: 11350901.084650932, y: 22756067.632203847), Point(x: 0, y: 90)),
  'EPSG:7629': ProjectAndUnProjectResult(
      Point(x: 11907552.590417586, y: 23380029.59312281), Point(x: 0, y: 90)),
  'EPSG:7630': ProjectAndUnProjectResult(
      Point(x: 11066161.880922401, y: 23110804.56343446), Point(x: 0, y: 90)),
  'EPSG:7631': ProjectAndUnProjectResult(
      Point(x: 11563756.788785035, y: 23256528.138503537), Point(x: 0, y: 90)),
  'EPSG:7633': ProjectAndUnProjectResult(
      Point(x: 12543955.598754406, y: 22502592.892731138), Point(x: 0, y: 90)),
  'EPSG:7634': ProjectAndUnProjectResult(
      Point(x: 9747319.139011249, y: 23369075.222962216), Point(x: 0, y: 90)),
  'EPSG:7636': ProjectAndUnProjectResult(
      Point(x: 10895641.342093261, y: 23448389.436283093), Point(x: 0, y: 90)),
  'EPSG:7641': ProjectAndUnProjectResult(
      Point(x: 12363649.582382344, y: 22772568.457510624), Point(x: 0, y: 90)),
  'EPSG:7642': ProjectAndUnProjectResult(
      Point(x: 12570454.365361627, y: 22940980.17848752), Point(x: 0, y: 90)),
  'EPSG:7643': ProjectAndUnProjectResult(
      Point(x: 12175403.474904234, y: 22779567.256277528), Point(x: 0, y: 90)),
  'EPSG:7693': ProjectAndUnProjectResult(
      Point(x: -1652225.1502001407, y: 6781799.831137376),
      Point(x: 35.47110857973571, y: 49.92415331328578)),
  'EPSG:7694': ProjectAndUnProjectResult(
      Point(x: -841789.2963218018, y: 6982574.935512391),
      Point(x: 59.99335786653508, y: 54.464347104253086)),
  'EPSG:7695': ProjectAndUnProjectResult(
      Point(x: -22084.37828948628, y: 7197826.1699963305),
      Point(x: 121.69387903402314, y: 66.29050681235447)),
  'EPSG:7696': ProjectAndUnProjectResult(
      Point(x: 808662.7986178342, y: 7427709.184928953),
      Point(x: -74.82963703740957, y: 98.60767852673067)),
  'EPSG:7755': ProjectAndUnProjectResult(
      Point(x: -904525.2242868403, y: 7662006.413411753),
      Point(x: 17.8880585602815, y: 46.89226406700871)),
  'EPSG:7756': ProjectAndUnProjectResult(
      Point(x: -4537812.944278624, y: 5435359.218201913),
      Point(x: 17.888058560281525, y: 46.89226406700875)),
  'EPSG:7757': ProjectAndUnProjectResult(
      Point(x: -4793894.862831452, y: 5018079.864321054),
      Point(x: 17.888058560281486, y: 46.892264067008725)),
  'EPSG:7758': ProjectAndUnProjectResult(
      Point(x: -4803396.080620209, y: 5082432.190703118),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:7759': ProjectAndUnProjectResult(
      Point(x: -4329396.652758994, y: 4799971.999702074),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:7805': ProjectAndUnProjectResult(
      Point(x: -650192.2096700789, y: 5305193.291220044),
      Point(x: 17.888077173234436, y: 46.89226405998426)),
  'EPSG:7760': ProjectAndUnProjectResult(
      Point(x: -3568570.213336141, y: 4217053.680079004),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:7761': ProjectAndUnProjectResult(
      Point(x: -3413364.65840997, y: 4602536.007463008),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:7762': ProjectAndUnProjectResult(
      Point(x: -3472245.046728124, y: 4122318.2053158665),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:7763': ProjectAndUnProjectResult(
      Point(x: -3475071.64293346, y: 3955315.380494032),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:7764': ProjectAndUnProjectResult(
      Point(x: -3317546.9843740584, y: 3653661.867309805),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:7765': ProjectAndUnProjectResult(
      Point(x: -4442118.553801264, y: 4972542.376448838),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:7766': ProjectAndUnProjectResult(
      Point(x: -3875815.2016120413, y: 4675137.308257107),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:7767': ProjectAndUnProjectResult(
      Point(x: -4025661.4910184806, y: 5085650.173013702),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:7768': ProjectAndUnProjectResult(
      Point(x: -4975466.610302306, y: 5229258.121154087),
      Point(x: 17.8880585602815, y: 46.892264067008746)),
  'EPSG:7769': ProjectAndUnProjectResult(
      Point(x: -4733681.140773422, y: 5051119.995353898),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:7770': ProjectAndUnProjectResult(
      Point(x: -4907661.545821067, y: 5147218.432244681),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:7771': ProjectAndUnProjectResult(
      Point(x: -4874963.778807075, y: 5139522.661585951),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:7772': ProjectAndUnProjectResult(
      Point(x: -4557309.668833531, y: 5203221.256473009),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:7773': ProjectAndUnProjectResult(
      Point(x: -3364837.9800113374, y: 3941542.3492837846),
      Point(x: 17.888058560281525, y: 46.89226406700872)),
  'EPSG:7774': ProjectAndUnProjectResult(
      Point(x: -3408508.6930815615, y: 4257077.738464732),
      Point(x: 17.8880585602815, y: 46.89226406700871)),
  'EPSG:7775': ProjectAndUnProjectResult(
      Point(x: -3905776.862201918, y: 4494400.98317029),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:7776': ProjectAndUnProjectResult(
      Point(x: -3677837.4077699594, y: 4189795.4945500074),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:7777': ProjectAndUnProjectResult(
      Point(x: -4033381.4670982556, y: 8414069.773018373),
      Point(x: 43417.311257047084, y: 9457.129707704946)),
  'EPSG:7778': ProjectAndUnProjectResult(
      Point(x: -3582542.945106227, y: 6228518.862826186),
      Point(x: 132.0497408210313, y: 140.34639719975036)),
  'EPSG:7779': ProjectAndUnProjectResult(
      Point(x: -3109721.4653790244, y: 6231698.743099098),
      Point(x: 54.05194477113698, y: 53.35066333534962)),
  'EPSG:7780': ProjectAndUnProjectResult(
      Point(x: -3253826.0269146403, y: 6425549.121555907),
      Point(x: 91.20978257437393, y: 60.40106670039202)),
  'EPSG:7781': ProjectAndUnProjectResult(
      Point(x: -3231849.8605702557, y: 6910793.2310705315),
      Point(x: 83.37689035852588, y: 58.900522520461685)),
  'EPSG:7782': ProjectAndUnProjectResult(
      Point(x: -3054718.683256847, y: 6766785.493810551),
      Point(x: 45.88871152468898, y: 51.832863596870496)),
  'EPSG:7783': ProjectAndUnProjectResult(
      Point(x: -4019270.954122158, y: 6940372.217550638),
      Point(x: 33392.01075465661, y: 7281.584194438904)),
  'EPSG:7784': ProjectAndUnProjectResult(
      Point(x: -3871518.2802565703, y: 6038562.57568622),
      Point(x: 4472.214085329623, y: 1050.7053892111003)),
  'EPSG:7785': ProjectAndUnProjectResult(
      Point(x: -3370821.5563283507, y: 7043473.695279143),
      Point(x: 153.2526404573087, y: 72.45024304302119)),
  'EPSG:7786': ProjectAndUnProjectResult(
      Point(x: -3988603.459985815, y: 6773906.02038821),
      Point(x: 20167.353539006373, y: 4419.867669744238)),
  'EPSG:7787': ProjectAndUnProjectResult(
      Point(x: -3845521.7607766697, y: 6340845.19478786),
      Point(x: 3388.1823641108126, y: 820.9021764409059)),
  'EPSG:7791': ProjectAndUnProjectResult(
      Point(x: 1176891.287219305, y: 5231671.834018296),
      Point(x: 17.88805843543735, y: 46.892264027445336)),
  'EPSG:7792': ProjectAndUnProjectResult(
      Point(x: 720001.2298400886, y: 5197241.60997254),
      Point(x: 17.888058560302017, y: 46.89226406695651)),
  'EPSG:7793': ProjectAndUnProjectResult(
      Point(x: 262945.2879608735, y: 5197894.102611037),
      Point(x: 17.888058560253082, y: 46.89226406692702)),
  'EPSG:7794': ProjectAndUnProjectResult(
      Point(x: 7447996.264442064, y: 5204311.696323936),
      Point(x: 17.888058558416997, y: 46.892264063331794)),
  'EPSG:7795': ProjectAndUnProjectResult(
      Point(x: 3448669.26834458, y: 5212129.891160676),
      Point(x: 17.888058558416994, y: 46.89226406333179)),
  'EPSG:7799': ProjectAndUnProjectResult(
      Point(x: 262945.2879608735, y: 5197894.102611037),
      Point(x: 17.888058560253082, y: 46.89226406692702)),
  'EPSG:7800': ProjectAndUnProjectResult(
      Point(x: -193931.3475621267, y: 5233642.279931091),
      Point(x: 17.88805871864152, y: 46.89226402167793)),
  'EPSG:7801': ProjectAndUnProjectResult(
      Point(x: -80884.42055719334, y: 5221839.828291411),
      Point(x: 17.888058560281518, y: 46.89226406700873)),
  'EPSG:7803': ProjectAndUnProjectResult(
      Point(x: 262945.2879608735, y: 5197894.102611037),
      Point(x: 17.888058560253082, y: 46.89226406692702)),
  'EPSG:7804': ProjectAndUnProjectResult(
      Point(x: 262945.2879608735, y: 5197894.102611037),
      Point(x: 17.888058560253082, y: 46.89226406692702)),
  'EPSG:7825': ProjectAndUnProjectResult(
      Point(x: 872489.2518016153, y: 5201499.242895964),
      Point(x: 17.888058571216604, y: 46.89226406568868)),
  'EPSG:7826': ProjectAndUnProjectResult(
      Point(x: 1643984.1255450116, y: 5222313.870437039),
      Point(x: 17.88805866223247, y: 46.89226403526917)),
  'EPSG:7827': ProjectAndUnProjectResult(
      Point(x: 2415617.925272428, y: 5252050.725598798),
      Point(x: 17.88806013407137, y: 46.892263920106515)),
  'EPSG:7828': ProjectAndUnProjectResult(
      Point(x: 3187463.18589976, y: 5290855.850841106),
      Point(x: 17.888072114772392, y: 46.89226394621387)),
  'EPSG:7829': ProjectAndUnProjectResult(
      Point(x: 3959614.5918617975, y: 5338918.0329357125),
      Point(x: 17.888137727990788, y: 46.89226656331775)),
  'EPSG:7830': ProjectAndUnProjectResult(
      Point(x: 4732195.564958615, y: 5396468.1411800645),
      Point(x: 17.88841568534829, y: 46.892284060889814)),
  'EPSG:7831': ProjectAndUnProjectResult(
      Point(x: 5505365.445731573, y: 5463778.080756947),
      Point(x: 17.88940175952805, y: 46.89236278537433)),
  'EPSG:7845': ProjectAndUnProjectResult(
      Point(x: -18704187.61509478, y: -1254790.7080928627),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:7846': ProjectAndUnProjectResult(
      Point(x: -4524591.704418489, y: 18519978.272960275),
      Point(x: 38040.256750950444, y: 8289.769436944365)),
  'EPSG:32610': ProjectAndUnProjectResult(
      Point(x: -11916549.255717097, y: 7029722.0728038),
      Point(x: 169423.46822256624, y: 95274.64645617674)),
  'EPSG:7850': ProjectAndUnProjectResult(
      Point(x: -3998899.011053183, y: 21067284.300468326), Point(x: 0, y: 90)),
  'EPSG:7851': ProjectAndUnProjectResult(
      Point(x: -3275967.0652893055, y: 21622144.51821889), Point(x: 0, y: 90)),
  'EPSG:7852': ProjectAndUnProjectResult(
      Point(x: -2176781.840373538, y: 22026151.47139568), Point(x: 0, y: 90)),
  'EPSG:7853': ProjectAndUnProjectResult(
      Point(x: -604157.4780445739, y: 22178763.901223246), Point(x: 0, y: 90)),
  'EPSG:7854': ProjectAndUnProjectResult(
      Point(x: 1558843.5538291563, y: 21945699.007619552), Point(x: 0, y: 90)),
  'EPSG:7855': ProjectAndUnProjectResult(
      Point(x: 4451906.623195637, y: 21150975.810983855), Point(x: 0, y: 90)),
  'EPSG:7856': ProjectAndUnProjectResult(
      Point(x: 8240765.467341783, y: 19567647.747223884),
      Point(x: -4967267525.630645, y: 1643558557.1708994)),
  'EPSG:7857': ProjectAndUnProjectResult(
      Point(x: 13120822.691871341, y: 16907087.333848983),
      Point(x: -142413.85807935635, y: 81938.05169573172)),
  'EPSG:7858': ProjectAndUnProjectResult(
      Point(x: 19321105.829017498, y: 12806678.893239),
      Point(x: -5175.116548601758, y: 7749.823533021951)),
  'EPSG:7859': ProjectAndUnProjectResult(
      Point(x: 27108574.549169235, y: 6815768.467481233),
      Point(x: -103767.21820745953, y: -188871.77584871996)),
  'EPSG:8036': ProjectAndUnProjectResult(
      Point(x: 18104023.38076022, y: 27880577.8571665),
      Point(x: -33811.09013091508, y: 7380.196889341078)),
  'EPSG:7877': ProjectAndUnProjectResult(
      Point(x: 2093565.0269075555, y: 9238934.276275959),
      Point(x: 17.886723245397423, y: 46.892362026466806)),
  'EPSG:7878': ProjectAndUnProjectResult(
      Point(x: 2087552.4163158257, y: 15409458.985619914),
      Point(x: 17.887653938640504, y: 46.89228733327279)),
  'EPSG:7882': ProjectAndUnProjectResult(
      Point(x: 2093684.3122717913, y: 9239197.884007037),
      Point(x: 17.88671850889464, y: 46.892362491008505)),
  'EPSG:7883': ProjectAndUnProjectResult(
      Point(x: 2088186.153908987, y: 15409193.55548833),
      Point(x: 17.887652119491396, y: 46.892287559735976)),
  'EPSG:7887': ProjectAndUnProjectResult(
      Point(x: 2088186.225893158, y: 15409193.676598076),
      Point(x: 17.887652119235163, y: 46.89228755974916)),
  'EPSG:7899': ProjectAndUnProjectResult(
      Point(x: -19288382.890973657, y: -742437.3449551277),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:7991': ProjectAndUnProjectResult(
      Point(x: 4954580.012644431, y: 10893989.875088919), Point(x: 0, y: 90)),
  'EPSG:7992': ProjectAndUnProjectResult(
      Point(x: 719939.3038840751, y: 15197320.734539252),
      Point(x: 17.88805856587753, y: 46.89226406790358)),
  'EPSG:8013': ProjectAndUnProjectResult(
      Point(x: -4364591.050940062, y: 15259840.986237284), Point(x: 0, y: 90)),
  'EPSG:26707': ProjectAndUnProjectResult(
      Point(x: -35391481.71635498, y: -11259829.559897237),
      Point(x: 0, y: -90)),
  'EPSG:8014': ProjectAndUnProjectResult(
      Point(x: -4592675.328544364, y: 13592588.58950644), Point(x: 0, y: 90)),
  'EPSG:8015': ProjectAndUnProjectResult(
      Point(x: -3824831.0743253115, y: 13871049.84056003), Point(x: 0, y: 90)),
  'EPSG:8016': ProjectAndUnProjectResult(
      Point(x: -4587850.778673121, y: 14911545.652162079), Point(x: 0, y: 90)),
  'EPSG:8017': ProjectAndUnProjectResult(
      Point(x: -4719970.839155637, y: 13776125.45713849), Point(x: 0, y: 90)),
  'EPSG:8018': ProjectAndUnProjectResult(
      Point(x: -5062792.289666137, y: 11250688.140546752),
      Point(x: 407030514824.1814, y: 88857755434.83792)),
  'EPSG:8019': ProjectAndUnProjectResult(
      Point(x: -5065113.923605251, y: 10513870.82307435),
      Point(x: 390580.8117010934, y: 85422.32822390879)),
  'EPSG:8020': ProjectAndUnProjectResult(
      Point(x: -4556287.499120629, y: 15063396.152821098), Point(x: 0, y: 90)),
  'EPSG:8021': ProjectAndUnProjectResult(
      Point(x: -3887989.812019491, y: 15582447.82671999), Point(x: 0, y: 90)),
  'EPSG:8022': ProjectAndUnProjectResult(
      Point(x: -4692091.381984846, y: 13518544.556688145), Point(x: 0, y: 90)),
  'EPSG:8023': ProjectAndUnProjectResult(
      Point(x: -4654349.630470202, y: 14273000.531162012), Point(x: 0, y: 90)),
  'EPSG:8024': ProjectAndUnProjectResult(
      Point(x: -3930365.1803026157, y: 15299453.2110002), Point(x: 0, y: 90)),
  'EPSG:8025': ProjectAndUnProjectResult(
      Point(x: -4623743.292212465, y: 14514828.252957111), Point(x: 0, y: 90)),
  'EPSG:8026': ProjectAndUnProjectResult(
      Point(x: -4669221.323802059, y: 14494899.394310832), Point(x: 0, y: 90)),
  'EPSG:8027': ProjectAndUnProjectResult(
      Point(x: -4456932.123524749, y: 13614984.40370194), Point(x: 0, y: 90)),
  'EPSG:8028': ProjectAndUnProjectResult(
      Point(x: -2682434.7868312746, y: 14118541.30040039), Point(x: 0, y: 90)),
  'EPSG:8029': ProjectAndUnProjectResult(
      Point(x: -4593286.913603303, y: 14654695.324798925), Point(x: 0, y: 90)),
  'EPSG:8030': ProjectAndUnProjectResult(
      Point(x: -4609331.0448838845, y: 14933958.380309822), Point(x: 0, y: 90)),
  'EPSG:8031': ProjectAndUnProjectResult(
      Point(x: -4556092.659783599, y: 14851177.193981452), Point(x: 0, y: 90)),
  'EPSG:8032': ProjectAndUnProjectResult(
      Point(x: -4289840.523989684, y: 13729924.861604918), Point(x: 0, y: 90)),
  'EPSG:8035': ProjectAndUnProjectResult(
      Point(x: 18499214.258219387, y: 29882915.633289523),
      Point(x: -1685042.2533001453, y: 369929.7982766386)),
  'EPSG:8044': ProjectAndUnProjectResult(
      Point(x: -1054752.8599382653, y: -33385.30891520216),
      Point(x: 17.89440881200178, y: 46.8923462793757)),
  'EPSG:8045': ProjectAndUnProjectResult(
      Point(x: -1222094.1333567637, y: -18990.751455269477),
      Point(x: 17.901934033158252, y: 46.89243547415669)),
  'EPSG:8058': ProjectAndUnProjectResult(
      Point(x: -12032145.999217626, y: 2197042.8317936016),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:8059': ProjectAndUnProjectResult(
      Point(x: -19053509.31088796, y: 2429151.340795912),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:8065': ProjectAndUnProjectResult(
      Point(x: 19655901.422633134, y: 27122964.813796055),
      Point(x: 17.888058560281486, y: 46.89226406700875)),
  'EPSG:8066': ProjectAndUnProjectResult(
      Point(x: -12916232.579982523, y: 25630463.91394005), Point(x: 0, y: 90)),
  'EPSG:8067': ProjectAndUnProjectResult(
      Point(x: -16047526.030278021, y: 23804140.53235026), Point(x: 0, y: 90)),
  'EPSG:8082': ProjectAndUnProjectResult(
      Point(x: 29621061.74852327, y: 8954491.865918288),
      Point(x: -519603.4821607426, y: 113747.10753176491)),
  'EPSG:8083': ProjectAndUnProjectResult(
      Point(x: 30650864.10052601, y: 9269865.456694849),
      Point(x: -6859630.010890731, y: 1508686.9880534173)),
  'EPSG:8088': ProjectAndUnProjectResult(
      Point(x: 5470199.377220549, y: -913939.791333823),
      Point(x: 17.888058560281507, y: 46.89226406700873)),
  'EPSG:8090': ProjectAndUnProjectResult(
      Point(x: 3769574.888567513, y: 6667205.568796816), Point(x: 0, y: 90)),
  'EPSG:8091': ProjectAndUnProjectResult(
      Point(x: 12367346.946661, y: 21873990.270624973), Point(x: 0, y: 90)),
  'EPSG:26708': ProjectAndUnProjectResult(
      Point(x: -25784880.089815598, y: -2925109.978929641),
      Point(x: -135, y: double.nan)),
  'EPSG:8099': ProjectAndUnProjectResult(
      Point(x: 3711070.401249271, y: 6943225.986154948), Point(x: 0, y: 90)),
  'EPSG:8100': ProjectAndUnProjectResult(
      Point(x: 12175403.474904234, y: 22779567.256277528), Point(x: 0, y: 90)),
  'EPSG:8101': ProjectAndUnProjectResult(
      Point(x: 3831482.1536448947, y: 6992424.743299675), Point(x: 0, y: 90)),
  'EPSG:8102': ProjectAndUnProjectResult(
      Point(x: 12570454.365361627, y: 22940980.17848752), Point(x: 0, y: 90)),
  'EPSG:8103': ProjectAndUnProjectResult(
      Point(x: 3768447.9297039146, y: 6941092.747986726), Point(x: 0, y: 90)),
  'EPSG:8104': ProjectAndUnProjectResult(
      Point(x: 12363649.582382344, y: 22772568.457510624), Point(x: 0, y: 90)),
  'EPSG:8113': ProjectAndUnProjectResult(
      Point(x: 3320998.1229724446, y: 7147083.394483467), Point(x: 0, y: 90)),
  'EPSG:8114': ProjectAndUnProjectResult(
      Point(x: 10895641.342093261, y: 23448389.436283093), Point(x: 0, y: 90)),
  'EPSG:8117': ProjectAndUnProjectResult(
      Point(x: 2970988.8156491998, y: 7122908.373712409), Point(x: 0, y: 90)),
  'EPSG:8118': ProjectAndUnProjectResult(
      Point(x: 9747319.139011249, y: 23369075.222962216), Point(x: 0, y: 90)),
  'EPSG:8119': ProjectAndUnProjectResult(
      Point(x: 3823405.313439519, y: 6858804.031463695), Point(x: 0, y: 90)),
  'EPSG:8120': ProjectAndUnProjectResult(
      Point(x: 12543955.598754406, y: 22502592.892731138), Point(x: 0, y: 90)),
  'EPSG:8123': ProjectAndUnProjectResult(
      Point(x: 3524640.118549972, y: 7088603.953742174), Point(x: 0, y: 90)),
  'EPSG:8124': ProjectAndUnProjectResult(
      Point(x: 11563756.788785035, y: 23256528.138503537), Point(x: 0, y: 90)),
  'EPSG:8125': ProjectAndUnProjectResult(
      Point(x: 3372972.8871539193, y: 7044187.319239815), Point(x: 0, y: 90)),
  'EPSG:8126': ProjectAndUnProjectResult(
      Point(x: 11066161.880922401, y: 23110804.56343446), Point(x: 0, y: 90)),
  'EPSG:8127': ProjectAndUnProjectResult(
      Point(x: 3629429.2884092713, y: 7126247.272572763), Point(x: 0, y: 90)),
  'EPSG:8128': ProjectAndUnProjectResult(
      Point(x: 11907552.590417586, y: 23380029.59312281), Point(x: 0, y: 90)),
  'EPSG:8131': ProjectAndUnProjectResult(
      Point(x: 3459761.570267035, y: 6936063.286349483), Point(x: 0, y: 90)),
  'EPSG:8132': ProjectAndUnProjectResult(
      Point(x: 11350901.084650932, y: 22756067.632203847), Point(x: 0, y: 90)),
  'EPSG:8135': ProjectAndUnProjectResult(
      Point(x: 2947228.968603797, y: 7053493.02016694), Point(x: 0, y: 90)),
  'EPSG:8136': ProjectAndUnProjectResult(
      Point(x: 9669367.040981706, y: 23141335.016640786), Point(x: 0, y: 90)),
  'EPSG:8141': ProjectAndUnProjectResult(
      Point(x: 3855689.606143715, y: 6764352.072904594), Point(x: 0, y: 90)),
  'EPSG:8142': ProjectAndUnProjectResult(
      Point(x: 12649874.982788838, y: 22192711.759361073), Point(x: 0, y: 90)),
  'EPSG:8145': ProjectAndUnProjectResult(
      Point(x: 3697276.437847649, y: 6768723.763080934), Point(x: 0, y: 90)),
  'EPSG:8146': ProjectAndUnProjectResult(
      Point(x: 12130147.779973747, y: 22207054.54652695), Point(x: 0, y: 90)),
  'EPSG:8147': ProjectAndUnProjectResult(
      Point(x: 3942161.367084428, y: 6715885.210692157), Point(x: 0, y: 90)),
  'EPSG:8148': ProjectAndUnProjectResult(
      Point(x: 12933574.418677995, y: 22033700.06158052), Point(x: 0, y: 90)),
  'EPSG:8151': ProjectAndUnProjectResult(
      Point(x: 3484867.686109837, y: 6852050.195405609), Point(x: 0, y: 90)),
  'EPSG:8152': ProjectAndUnProjectResult(
      Point(x: 11433270.066707775, y: 22480434.68273107), Point(x: 0, y: 90)),
  'EPSG:8155': ProjectAndUnProjectResult(
      Point(x: 3204291.414114237, y: 7111748.531335806), Point(x: 0, y: 90)),
  'EPSG:8156': ProjectAndUnProjectResult(
      Point(x: 10512746.080779292, y: 23332461.64006414), Point(x: 0, y: 90)),
  'EPSG:8157': ProjectAndUnProjectResult(
      Point(x: 3808127.092819137, y: 6861235.0608257), Point(x: 0, y: 90)),
  'EPSG:8158': ProjectAndUnProjectResult(
      Point(x: 12493830.304164285, y: 22510568.69545532), Point(x: 0, y: 90)),
  'EPSG:8159': ProjectAndUnProjectResult(
      Point(x: 3860921.4795736372, y: 7005528.164366286), Point(x: 0, y: 90)),
  'EPSG:8160': ProjectAndUnProjectResult(
      Point(x: 12667039.887473177, y: 22983970.31930564), Point(x: 0, y: 90)),
  'EPSG:8161': ProjectAndUnProjectResult(
      Point(x: 3191918.450618008, y: 7017760.476250788), Point(x: 0, y: 90)),
  'EPSG:8162': ProjectAndUnProjectResult(
      Point(x: 10472152.450069249, y: 23024102.495499462), Point(x: 0, y: 90)),
  'EPSG:8163': ProjectAndUnProjectResult(
      Point(x: 3495775.4923990215, y: 6822835.282791732), Point(x: 0, y: 90)),
  'EPSG:8164': ProjectAndUnProjectResult(
      Point(x: 11469056.761512207, y: 22384585.423738793), Point(x: 0, y: 90)),
  'EPSG:8165': ProjectAndUnProjectResult(
      Point(x: 3405012.5367005337, y: 7137827.349102414), Point(x: 0, y: 90)),
  'EPSG:8166': ProjectAndUnProjectResult(
      Point(x: 11171278.631028585, y: 23418021.894749753), Point(x: 0, y: 90)),
  'EPSG:8171': ProjectAndUnProjectResult(
      Point(x: 3415636.1902642823, y: 7305642.758030209), Point(x: 0, y: 90)),
  'EPSG:8172': ProjectAndUnProjectResult(
      Point(x: 11206133.067307316, y: 23968596.282162443), Point(x: 0, y: 90)),
  'EPSG:8173': ProjectAndUnProjectResult(
      Point(x: 3832374.9261409976, y: 6864556.294344704), Point(x: 0, y: 90)),
  'EPSG:8177': ProjectAndUnProjectResult(
      Point(x: 12573383.403229175, y: 22521465.109520163), Point(x: 0, y: 90)),
  'EPSG:8179': ProjectAndUnProjectResult(
      Point(x: 3010580.2176696234, y: 7040185.373915163), Point(x: 0, y: 90)),
  'EPSG:8180': ProjectAndUnProjectResult(
      Point(x: 9877211.930597758, y: 23097674.847744167), Point(x: 0, y: 90)),
  'EPSG:8181': ProjectAndUnProjectResult(
      Point(x: 3013378.5853116503, y: 6877533.049658766), Point(x: 0, y: 90)),
  'EPSG:8182': ProjectAndUnProjectResult(
      Point(x: 9886392.908520725, y: 22564039.67997072), Point(x: 0, y: 90)),
  'EPSG:8184': ProjectAndUnProjectResult(
      Point(x: 3929113.1757629644, y: 6712626.8544382695), Point(x: 0, y: 90)),
  'EPSG:8185': ProjectAndUnProjectResult(
      Point(x: 12890765.47748966, y: 22023009.93872364), Point(x: 0, y: 90)),
  'EPSG:8187': ProjectAndUnProjectResult(
      Point(x: 3796339.751557811, y: 7156497.446786959), Point(x: 0, y: 90)),
  'EPSG:8189': ProjectAndUnProjectResult(
      Point(x: 12455158.00186667, y: 23479275.373399213), Point(x: 0, y: 90)),
  'EPSG:8201': ProjectAndUnProjectResult(
      Point(x: 3390618.4191545607, y: 7056596.4442245625), Point(x: 0, y: 90)),
  'EPSG:8202': ProjectAndUnProjectResult(
      Point(x: 11124053.930451838, y: 23151516.833878253), Point(x: 0, y: 90)),
  'EPSG:8205': ProjectAndUnProjectResult(
      Point(x: 3822990.361101892, y: 6996993.411303278), Point(x: 0, y: 90)),
  'EPSG:8206': ProjectAndUnProjectResult(
      Point(x: 12542594.209403375, y: 22955969.216841422), Point(x: 0, y: 90)),
  'EPSG:8209': ProjectAndUnProjectResult(
      Point(x: 3153672.940117676, y: 7137461.697173122), Point(x: 0, y: 90)),
  'EPSG:8210': ProjectAndUnProjectResult(
      Point(x: 10346675.304421574, y: 23416822.251727488), Point(x: 0, y: 90)),
  'EPSG:8212': ProjectAndUnProjectResult(
      Point(x: 3689988.0851689526, y: 6931430.5799844805), Point(x: 0, y: 90)),
  'EPSG:8213': ProjectAndUnProjectResult(
      Point(x: 12106235.909091806, y: 22740868.494165752), Point(x: 0, y: 90)),
  'EPSG:8218': ProjectAndUnProjectResult(
      Point(x: 3060937.2787154065, y: 6957068.465882632), Point(x: 0, y: 90)),
  'EPSG:8220': ProjectAndUnProjectResult(
      Point(x: 10042425.055252131, y: 22824982.125635523), Point(x: 0, y: 90)),
  'EPSG:8222': ProjectAndUnProjectResult(
      Point(x: 3379674.584728664, y: 6816915.478636543), Point(x: 0, y: 90)),
  'EPSG:8224': ProjectAndUnProjectResult(
      Point(x: 11088149.032900875, y: 22365163.53324931), Point(x: 0, y: 90)),
  'EPSG:8225': ProjectAndUnProjectResult(
      Point(x: 3468290.683902232, y: 7034754.514808692), Point(x: 0, y: 90)),
  'EPSG:8226': ProjectAndUnProjectResult(
      Point(x: 11378883.685214741, y: 23079857.103862435), Point(x: 0, y: 90)),
  'EPSG:8311': ProjectAndUnProjectResult(
      Point(x: -7975369.376852105, y: 4598229.7015076615),
      Point(x: 758426831.2235305, y: 261498166.30999714)),
  'EPSG:8312': ProjectAndUnProjectResult(
      Point(x: -26165910.02899352, y: 15086055.451140622),
      Point(x: 758426831.2235305, y: 261498166.30999714)),
  'EPSG:8313': ProjectAndUnProjectResult(
      Point(x: -9047651.86909182, y: 4093296.390494441),
      Point(x: 21903007.92161727, y: 8524499.952568647)),
  'EPSG:8314': ProjectAndUnProjectResult(
      Point(x: -29683897.208306756, y: 13429450.100047378),
      Point(x: 21903007.92161727, y: 8524499.952568647)),
  'EPSG:8317': ProjectAndUnProjectResult(
      Point(x: -9542274.605646268, y: 3749531.5095347357),
      Point(x: 7069759.790099894, y: 2911934.865820695)),
  'EPSG:8318': ProjectAndUnProjectResult(
      Point(x: -31306675.215375155, y: 12301612.56409034),
      Point(x: 7069759.790099894, y: 2911934.865820695)),
  'EPSG:8319': ProjectAndUnProjectResult(
      Point(x: -8542311.979663761, y: 4515564.93732704),
      Point(x: 79858529.9392508, y: 29488526.316998694)),
  'EPSG:8320': ProjectAndUnProjectResult(
      Point(x: -28025957.93853045, y: 14814845.594904987),
      Point(x: 79858529.9392508, y: 29488526.316998694)),
  'EPSG:8331': ProjectAndUnProjectResult(
      Point(x: -7934928.037013731, y: 4822593.757571801),
      Point(x: 1036345618.5015662, y: 354578869.8149666)),
  'EPSG:8332': ProjectAndUnProjectResult(
      Point(x: -26033228.467843737, y: 15822157.99728281),
      Point(x: 1036345618.5015662, y: 354578869.8149666)),
  'EPSG:8337': ProjectAndUnProjectResult(
      Point(x: -10056189.773874594, y: 3724599.912720571),
      Point(x: 2536611.3873870787, y: 1112250.8758671032)),
  'EPSG:8338': ProjectAndUnProjectResult(
      Point(x: -32992748.60190168, y: 12219815.986616045),
      Point(x: 2536611.3873870787, y: 1112250.8758671032)),
  'EPSG:8343': ProjectAndUnProjectResult(
      Point(x: -7884495.80102217, y: 4463267.0818563495),
      Point(x: 1440376520.9247227, y: 489022394.8755672)),
  'EPSG:8344': ProjectAndUnProjectResult(
      Point(x: -25867768.376057774, y: 14643264.704253115),
      Point(x: 1440376520.92472, y: 489022394.87556624)),
  'EPSG:8347': ProjectAndUnProjectResult(
      Point(x: -11513374.110879114, y: 2794604.711851623),
      Point(x: 398884.89595851535, y: 203629.51671519192)),
  'EPSG:8348': ProjectAndUnProjectResult(
      Point(x: -37773537.10918371, y: 9168650.629434457),
      Point(x: 398884.89595851535, y: 203629.51671519192)),
  'EPSG:20004': ProjectAndUnProjectResult(
      Point(x: 4262977.402920999, y: 5200101.235815557),
      Point(x: 17.888058570270495, y: 46.89226406903771)),
  'EPSG:20005': ProjectAndUnProjectResult(
      Point(x: 4805913.362838657, y: 5235854.283937308),
      Point(x: 17.888058728388472, y: 46.89226402384307)),
  'EPSG:20006': ProjectAndUnProjectResult(
      Point(x: 5349465.294601091, y: 5307424.743197788),
      Point(x: 17.888077164108278, y: 46.89226406201648)),
  'EPSG:20007': ProjectAndUnProjectResult(
      Point(x: 5894345.220306594, y: 5416207.687562138),
      Point(x: 17.888508858291356, y: 46.89229074846724)),
  'EPSG:20008': ProjectAndUnProjectResult(
      Point(x: 6441748.308090681, y: 5564265.926028976),
      Point(x: 17.89339665661175, y: 46.89274275070445)),
  'EPSG:20009': ProjectAndUnProjectResult(
      Point(x: 6993599.942504037, y: 5754282.564756225),
      Point(x: 17.930912766487186, y: 46.89707896829051)),
  'EPSG:20010': ProjectAndUnProjectResult(
      Point(x: 7552857.680709452, y: 5989465.549310994),
      Point(x: 18.163085249950498, y: 46.92853675095355)),
  'EPSG:20011': ProjectAndUnProjectResult(
      Point(x: 8123883.6942656655, y: 6273376.642920781),
      Point(x: 19.453977225641804, y: 47.12654815721369)),
  'EPSG:20012': ProjectAndUnProjectResult(
      Point(x: 8712903.296266051, y: 6609650.442058996),
      Point(x: 26.45354646467008, y: 48.31387174213733)),
  'EPSG:20013': ProjectAndUnProjectResult(
      Point(x: 9328565.153600035, y: 7001562.176153691),
      Point(x: 66.44656806390067, y: 55.68157108625792)),
  'EPSG:20014': ProjectAndUnProjectResult(
      Point(x: 9982618.784105198, y: 7451396.183664046),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20015': ProjectAndUnProjectResult(
      Point(x: 10690724.938377943, y: 7959560.102225089),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20016': ProjectAndUnProjectResult(
      Point(x: 11473414.466010679, y: 8523382.956016758),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20017': ProjectAndUnProjectResult(
      Point(x: 12357211.26602343, y: 9135528.468969345),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20018': ProjectAndUnProjectResult(
      Point(x: 13375934.92125776, y: 9781948.077873092),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20019': ProjectAndUnProjectResult(
      Point(x: 14572198.616501, y: 10439291.264915409),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:20020': ProjectAndUnProjectResult(
      Point(x: 15999117.940108594, y: 11071683.97462519),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:20021': ProjectAndUnProjectResult(
      Point(x: 17722246.168892596, y: 11626779.025659218),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:20022': ProjectAndUnProjectResult(
      Point(x: 19821751.636044137, y: 12030975.573321657),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:20023': ProjectAndUnProjectResult(
      Point(x: 22394852.78185785, y: 12183697.82416335),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:20024': ProjectAndUnProjectResult(
      Point(x: 25558526.48702615, y: 11950616.349463312),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:20025': ProjectAndUnProjectResult(
      Point(x: 29452505.28827122, y: 11155688.489850847),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:20026': ProjectAndUnProjectResult(
      Point(x: 34242579.0760828, y: 9571887.488782195),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20027': ProjectAndUnProjectResult(
      Point(x: 40124216.87432951, y: 6910483.138041684),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20028': ProjectAndUnProjectResult(
      Point(x: 47326524.301511526, y: 2808729.8638930563),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20029': ProjectAndUnProjectResult(
      Point(x: 56116552.31342323, y: -3184188.6720379107),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20030': ProjectAndUnProjectResult(
      Point(x: 66803972.82699252, y: -11623116.237611713),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:20031': ProjectAndUnProjectResult(
      Point(x: 79746136.8250658, y: -23184946.595761795),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:20032': ProjectAndUnProjectResult(
      Point(x: 95353530.54190639, y: -38688883.46037097),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:20064': ProjectAndUnProjectResult(
      Point(x: 262977.40292099846, y: 5200101.235815557),
      Point(x: 17.88805857027049, y: 46.89226406903771)),
  'EPSG:20065': ProjectAndUnProjectResult(
      Point(x: -194086.63716134313, y: 5235854.283937308),
      Point(x: 17.888058728388476, y: 46.89226402384307)),
  'EPSG:20066': ProjectAndUnProjectResult(
      Point(x: -650534.705398909, y: 5307424.743197788),
      Point(x: 17.888077164108275, y: 46.89226406201648)),
  'EPSG:20067': ProjectAndUnProjectResult(
      Point(x: -1105654.7796934056, y: 5416207.687562138),
      Point(x: 17.88850885829136, y: 46.89229074846724)),
  'EPSG:20068': ProjectAndUnProjectResult(
      Point(x: -1558251.691909319, y: 5564265.926028976),
      Point(x: 17.89339665661175, y: 46.892742750704436)),
  'EPSG:20069': ProjectAndUnProjectResult(
      Point(x: -2006400.0574959628, y: 5754282.564756225),
      Point(x: 17.930912766487186, y: 46.89707896829051)),
  'EPSG:20070': ProjectAndUnProjectResult(
      Point(x: -2447142.3192905476, y: 5989465.549310994),
      Point(x: 18.163085249950498, y: 46.92853675095355)),
  'EPSG:20071': ProjectAndUnProjectResult(
      Point(x: -2876116.3057343345, y: 6273376.642920781),
      Point(x: 19.453977225641804, y: 47.12654815721369)),
  'EPSG:20072': ProjectAndUnProjectResult(
      Point(x: -3287096.703733949, y: 6609650.442058996),
      Point(x: 26.45354646467008, y: 48.31387174213733)),
  'EPSG:20073': ProjectAndUnProjectResult(
      Point(x: -3671434.8463999643, y: 7001562.176153691),
      Point(x: 66.44656806390067, y: 55.68157108625792)),
  'EPSG:20074': ProjectAndUnProjectResult(
      Point(x: -4017381.2158948015, y: 7451396.183664046),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20075': ProjectAndUnProjectResult(
      Point(x: -4309275.061622056, y: 7959560.102225089),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20076': ProjectAndUnProjectResult(
      Point(x: -4526585.5339893205, y: 8523382.956016758),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20077': ProjectAndUnProjectResult(
      Point(x: -4642788.733976571, y: 9135528.468969345),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20078': ProjectAndUnProjectResult(
      Point(x: -4624065.078742239, y: 9781948.077873092),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20079': ProjectAndUnProjectResult(
      Point(x: -4427801.383499, y: 10439291.264915409),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:20080': ProjectAndUnProjectResult(
      Point(x: -4000882.0598914055, y: 11071683.97462519),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:20081': ProjectAndUnProjectResult(
      Point(x: -3277753.8311074045, y: 11626779.025659218),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:20082': ProjectAndUnProjectResult(
      Point(x: -2178248.363955864, y: 12030975.573321657),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:20083': ProjectAndUnProjectResult(
      Point(x: -605147.2181421507, y: 12183697.82416335),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:20084': ProjectAndUnProjectResult(
      Point(x: 1558526.4870261499, y: 11950616.349463312),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:20085': ProjectAndUnProjectResult(
      Point(x: 4452505.288271218, y: 11155688.489850847),
      Point(x: -79.4107417620655, y: 89.99880783975169)),
  'EPSG:20086': ProjectAndUnProjectResult(
      Point(x: 8242579.076082804, y: 9571887.488782195),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20087': ProjectAndUnProjectResult(
      Point(x: 13124216.874329505, y: 6910483.138041684),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20088': ProjectAndUnProjectResult(
      Point(x: 19326524.301511526, y: 2808729.8638930563),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20089': ProjectAndUnProjectResult(
      Point(x: 27116552.31342323, y: -3184188.6720379107),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20090': ProjectAndUnProjectResult(
      Point(x: 36803972.82699252, y: -11623116.237611713),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:20091': ProjectAndUnProjectResult(
      Point(x: 48746136.82506581, y: -23184946.595761795),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:20092': ProjectAndUnProjectResult(
      Point(x: 63353530.541906394, y: -38688883.46037097),
      Point(x: -79.4107417620655, y: -89.9988078701379)),
  'EPSG:20135': ProjectAndUnProjectResult(
      Point(x: -193989.91952406778, y: 5233426.444403471),
      Point(x: 17.888058720917073, y: 46.892264016196584)),
  'EPSG:20136': ProjectAndUnProjectResult(
      Point(x: -650265.0497236222, y: 5304983.662961927),
      Point(x: 17.88807716897722, y: 46.892264038056176)),
  'EPSG:20137': ProjectAndUnProjectResult(
      Point(x: -1105212.3681530352, y: 5413740.394243469),
      Point(x: 17.888509196023126, y: 46.8922906384822)),
  'EPSG:20138': ProjectAndUnProjectResult(
      Point(x: -1557636.82951435, y: 5561759.083299212),
      Point(x: 17.893400635272283, y: 46.89274253592148)),
  'EPSG:20248': ProjectAndUnProjectResult(
      Point(x: -4622235.1467402205, y: 19778104.862212006),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20249': ProjectAndUnProjectResult(
      Point(x: -4426000.167589979, y: 20435267.02775657),
      Point(x: -149.67352147660628, y: 89.99892064788257)),
  'EPSG:20250': ProjectAndUnProjectResult(
      Point(x: -3999169.5241860645, y: 21067503.653794892),
      Point(x: -149.67352147660628, y: 89.99892064788257)),
  'EPSG:20251': ProjectAndUnProjectResult(
      Point(x: -3276204.7558379634, y: 21622489.690544993),
      Point(x: -149.67352147660628, y: 89.99892064788257)),
  'EPSG:20252': ProjectAndUnProjectResult(
      Point(x: -2176955.319641473, y: 22026654.54365131),
      Point(x: -149.67352147660628, y: 89.99892064788257)),
  'EPSG:32611': ProjectAndUnProjectResult(
      Point(x: -7081100.808616535, y: 9644074.03580277),
      Point(x: 16894389361.82516, y: 5473429535.782776)),
  'EPSG:20253': ProjectAndUnProjectResult(
      Point(x: -604224.0046549756, y: 22179462.907330666),
      Point(x: -149.67352147660628, y: 89.99892064788257)),
  'EPSG:20254': ProjectAndUnProjectResult(
      Point(x: 1558940.884662633, y: 21946638.587478794),
      Point(x: -149.67352147660628, y: 89.99892064788257)),
  'EPSG:20255': ProjectAndUnProjectResult(
      Point(x: 4452242.1723437, y: 21152207.8535461),
      Point(x: -149.67352147660628, y: 89.99892064788257)),
  'EPSG:20256': ProjectAndUnProjectResult(
      Point(x: 8241434.878724841, y: 19569232.006123852),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20257': ProjectAndUnProjectResult(
      Point(x: 13121947.30877254, y: 16909091.995314084),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20258': ProjectAndUnProjectResult(
      Point(x: 19322837.757512502, y: 12809181.073089184),
      Point(x: double.nan, y: double.nan)),
  'EPSG:20348': ProjectAndUnProjectResult(
      Point(x: -4622272.993102797, y: 19778128.804077327),
      Point(x: 45, y: double.nan)),
  'EPSG:20349': ProjectAndUnProjectResult(
      Point(x: -4426031.9904679265, y: 20435302.762396805),
      Point(x: -160.29202115696808, y: 89.99872568051475)),
  'EPSG:20350': ProjectAndUnProjectResult(
      Point(x: -3999190.95806007, y: 21067553.24832288),
      Point(x: -160.29202115696808, y: 89.99872568051475)),
  'EPSG:20351': ProjectAndUnProjectResult(
      Point(x: -3276209.8909524027, y: 21622555.34907522),
      Point(x: -160.29202115696808, y: 89.99872568051475)),
  'EPSG:20352': ProjectAndUnProjectResult(
      Point(x: -2176936.3118064585, y: 22026738.54103172),
      Point(x: -160.29202115696808, y: 89.99872568051475)),
  'EPSG:20353': ProjectAndUnProjectResult(
      Point(x: -604170.6155427387, y: 22179567.49472751),
      Point(x: -160.29202115696808, y: 89.99872568051475)),
  'EPSG:20354': ProjectAndUnProjectResult(
      Point(x: 1559041.8246280754, y: 21946765.864305325),
      Point(x: -160.29202115696808, y: 89.99872568051475)),
  'EPSG:20355': ProjectAndUnProjectResult(
      Point(x: 4452407.386830603, y: 21152359.599669628),
      Point(x: -160.29202115696808, y: 89.99872568051475)),
  'EPSG:20356': ProjectAndUnProjectResult(
      Point(x: 8241685.362824231, y: 19569409.467709027),
      Point(x: 45, y: double.nan)),
  'EPSG:20357': ProjectAndUnProjectResult(
      Point(x: 13122309.149993569, y: 16909295.617063724),
      Point(x: 45, y: double.nan)),
  'EPSG:20358': ProjectAndUnProjectResult(
      Point(x: 19323343.07004738, y: 12809410.169026885),
      Point(x: 45, y: double.nan)),
  'EPSG:20436': ProjectAndUnProjectResult(
      Point(x: -650079.1230094759, y: 5305197.054337609),
      Point(x: 17.888077166533552, y: 46.892264049132216)),
  'EPSG:20437': ProjectAndUnProjectResult(
      Point(x: -1105040.1132607758, y: 5413936.022031834),
      Point(x: 17.888508697779297, y: 46.89229069893568)),
  'EPSG:20438': ProjectAndUnProjectResult(
      Point(x: -1557479.6483621148, y: 5561935.9774061125),
      Point(x: 17.893395148724522, y: 46.89274249309817)),
  'EPSG:20439': ProjectAndUnProjectResult(
      Point(x: -2005473.2504922682, y: 5751879.246288943),
      Point(x: 17.930902878382916, y: 46.89707762653953)),
  'EPSG:20440': ProjectAndUnProjectResult(
      Point(x: -2446064.6193928067, y: 5986972.899571523),
      Point(x: 18.163030126541507, y: 46.928529676153005)),
  'EPSG:20499': ProjectAndUnProjectResult(
      Point(x: -2005473.2504922682, y: 5751879.246288943),
      Point(x: 17.930902878382916, y: 46.89707762653953)),
  'EPSG:20538': ProjectAndUnProjectResult(
      Point(x: -1557467.7800683712, y: 5561897.0715479),
      Point(x: 17.893396126637377, y: 46.8927426993888)),
  'EPSG:20539': ProjectAndUnProjectResult(
      Point(x: -2005450.4060474252, y: 5751838.267121587),
      Point(x: 17.93090880521014, y: 46.897078606722125)),
  'EPSG:20790': ProjectAndUnProjectResult(
      Point(x: 1485626.39615992, y: 1242864.3727440475),
      Point(x: 17.88800538911005, y: 46.892265303091115)),
  'EPSG:20791': ProjectAndUnProjectResult(
      Point(x: 1285626.39615992, y: 942864.3727440477),
      Point(x: 17.88800538911005, y: 46.892265303091115)),
  'EPSG:20822': ProjectAndUnProjectResult(
      Point(x: 5297560.343683663, y: 17936338.051669482),
      Point(x: 45, y: double.nan)),
  'EPSG:20823': ProjectAndUnProjectResult(
      Point(x: 5003414.189983131, y: 17430548.95758912),
      Point(x: 45, y: double.nan)),
  'EPSG:20824': ProjectAndUnProjectResult(
      Point(x: 4655906.904421404, y: 16983096.455832127),
      Point(x: -27.52227924073892, y: 55.087818499163795)),
  'EPSG:20934': ProjectAndUnProjectResult(
      Point(x: 262992.9675964754, y: 15198010.002147272),
      Point(x: 17.888058525944736, y: 46.89226382367971)),
  'EPSG:20935': ProjectAndUnProjectResult(
      Point(x: -193871.89153113426, y: 15233756.299077833),
      Point(x: 17.888058683756118, y: 46.89226377759865)),
  'EPSG:20936': ProjectAndUnProjectResult(
      Point(x: -650120.1681442368, y: 15305306.59955037),
      Point(x: 17.888077122921967, y: 46.8922637992631)),
  'EPSG:21035': ProjectAndUnProjectResult(
      Point(x: -193955.4697416484, y: 15233778.718694203),
      Point(x: 17.88805875390028, y: 46.89226377087457)),
  'EPSG:21036': ProjectAndUnProjectResult(
      Point(x: -650202.5787004826, y: 15305335.771514956),
      Point(x: 17.888077205908342, y: 46.89226379271043)),
  'EPSG:21037': ProjectAndUnProjectResult(
      Point(x: -1105120.5281198488, y: 15414091.656997185),
      Point(x: 17.88850931299018, y: 46.892290396457014)),
  'EPSG:21095': ProjectAndUnProjectResult(
      Point(x: -193955.4697416484, y: 5233778.7186942035),
      Point(x: 17.88805875390028, y: 46.89226377087458)),
  'EPSG:21096': ProjectAndUnProjectResult(
      Point(x: -650202.5787004826, y: 5305335.771514956),
      Point(x: 17.888077205908342, y: 46.89226379271043)),
  'EPSG:21097': ProjectAndUnProjectResult(
      Point(x: -1105120.5281198488, y: 5414091.656997185),
      Point(x: 17.88850931299018, y: 46.892290396457014)),
  'EPSG:21100': ProjectAndUnProjectResult(
      Point(x: -6323019.301218599, y: 6774822.740257204),
      Point(x: 17.888059883263967, y: 46.89226423543208)),
  'EPSG:21148': ProjectAndUnProjectResult(
      Point(x: -4621394.608626379, y: 19778083.85181289),
      Point(x: 45, y: double.nan)),
  'EPSG:21149': ProjectAndUnProjectResult(
      Point(x: -4424849.281090214, y: 20435138.349359397),
      Point(x: 118.9688106325813, y: 89.99303026578566)),
  'EPSG:21150': ProjectAndUnProjectResult(
      Point(x: -3997643.071612212, y: 21067192.60890174),
      Point(x: 118.9688106325813, y: 89.99303026578566)),
  'EPSG:21291': ProjectAndUnProjectResult(
      Point(x: 5526165.179557358, y: 9002402.673669616),
      Point(x: 45, y: double.nan)),
  'EPSG:21292': ProjectAndUnProjectResult(
      Point(x: 5115430.486199884, y: 7374050.507310341),
      Point(x: 45, y: double.nan)),
  'EPSG:21413': ProjectAndUnProjectResult(
      Point(x: 9328573.28048693, y: 7001532.8404073985),
      Point(x: 66.44236062758634, y: 55.68084177388956)),
  'EPSG:21414': ProjectAndUnProjectResult(
      Point(x: 9982623.296146361, y: 7451365.034696903),
      Point(x: 45, y: double.nan)),
  'EPSG:21415': ProjectAndUnProjectResult(
      Point(x: 10690724.97687363, y: 7959527.594984778),
      Point(x: 45, y: double.nan)),
  'EPSG:21416': ProjectAndUnProjectResult(
      Point(x: 11473408.996789828, y: 8523349.850202367),
      Point(x: 45, y: double.nan)),
  'EPSG:21417': ProjectAndUnProjectResult(
      Point(x: 12357199.062648399, y: 9135495.940806963),
      Point(x: 45, y: double.nan)),
  'EPSG:21418': ProjectAndUnProjectResult(
      Point(x: 13375914.550852004, y: 9781917.858713986),
      Point(x: 45, y: double.nan)),
  'EPSG:21419': ProjectAndUnProjectResult(
      Point(x: 14572168.429462679, y: 10439265.810641618),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:21420': ProjectAndUnProjectResult(
      Point(x: 15999076.065135233, y: 11071666.670084072),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:21421': ProjectAndUnProjectResult(
      Point(x: 17722190.514904037, y: 11626774.428577727),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:21422': ProjectAndUnProjectResult(
      Point(x: 19821679.902753077, y: 12030989.702372357),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:21423': ProjectAndUnProjectResult(
      Point(x: 22394762.480899453, y: 12183738.496068094),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:21453': ProjectAndUnProjectResult(
      Point(x: -3671426.71951307, y: 7001532.8404073985),
      Point(x: 66.44236062758634, y: 55.68084177388956)),
  'EPSG:21454': ProjectAndUnProjectResult(
      Point(x: -4017376.703853639, y: 7451365.034696903),
      Point(x: 45, y: double.nan)),
  'EPSG:21455': ProjectAndUnProjectResult(
      Point(x: -4309275.023126369, y: 7959527.594984778),
      Point(x: 45, y: double.nan)),
  'EPSG:21456': ProjectAndUnProjectResult(
      Point(x: -4526591.003210171, y: 8523349.850202367),
      Point(x: 45, y: double.nan)),
  'EPSG:21457': ProjectAndUnProjectResult(
      Point(x: -4642800.937351601, y: 9135495.940806963),
      Point(x: 45, y: double.nan)),
  'EPSG:21458': ProjectAndUnProjectResult(
      Point(x: -4624085.449147995, y: 9781917.858713986),
      Point(x: 45, y: double.nan)),
  'EPSG:21459': ProjectAndUnProjectResult(
      Point(x: -4427831.570537322, y: 10439265.810641618),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:21460': ProjectAndUnProjectResult(
      Point(x: -4000923.934864768, y: 11071666.670084072),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:21461': ProjectAndUnProjectResult(
      Point(x: -3277809.485095963, y: 11626774.428577727),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:21462': ProjectAndUnProjectResult(
      Point(x: -2178320.097246922, y: 12030989.702372357),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:21463': ProjectAndUnProjectResult(
      Point(x: -605237.519100545, y: 12183738.496068094),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:21473': ProjectAndUnProjectResult(
      Point(x: -3671426.71951307, y: 7001532.8404073985),
      Point(x: 66.44236062758634, y: 55.68084177388956)),
  'EPSG:21474': ProjectAndUnProjectResult(
      Point(x: -4017376.703853639, y: 7451365.034696903),
      Point(x: 45, y: double.nan)),
  'EPSG:21475': ProjectAndUnProjectResult(
      Point(x: -4309275.023126369, y: 7959527.594984778),
      Point(x: 45, y: double.nan)),
  'EPSG:21476': ProjectAndUnProjectResult(
      Point(x: -4526591.003210171, y: 8523349.850202367),
      Point(x: 45, y: double.nan)),
  'EPSG:21477': ProjectAndUnProjectResult(
      Point(x: -4642800.937351601, y: 9135495.940806963),
      Point(x: 45, y: double.nan)),
  'EPSG:21478': ProjectAndUnProjectResult(
      Point(x: -4624085.449147995, y: 9781917.858713986),
      Point(x: 45, y: double.nan)),
  'EPSG:21479': ProjectAndUnProjectResult(
      Point(x: -4427831.570537322, y: 10439265.810641618),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:21480': ProjectAndUnProjectResult(
      Point(x: -4000923.934864768, y: 11071666.670084072),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:21481': ProjectAndUnProjectResult(
      Point(x: -3277809.485095963, y: 11626774.428577727),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:21482': ProjectAndUnProjectResult(
      Point(x: -2178320.097246922, y: 12030989.702372357),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:21483': ProjectAndUnProjectResult(
      Point(x: -605237.519100545, y: 12183738.496068094),
      Point(x: -84.15716911392471, y: 89.9986104387541)),
  'EPSG:21500': ProjectAndUnProjectResult(
      Point(x: 1502751.4328927896, y: -105604.1524077002),
      Point(x: 17.88805862001476, y: 46.892264104890415)),
  'EPSG:21780': ProjectAndUnProjectResult(
      Point(x: 1351598.6775416415, y: 147744.08036669105),
      Point(x: 17.88805857342886, y: 46.892264073036614)),
  'EPSG:21781': ProjectAndUnProjectResult(
      Point(x: 1393998.8609966785, y: 246372.86824183067),
      Point(x: 17.88805857342887, y: 46.892264073036614)),
  'EPSG:21782': ProjectAndUnProjectResult(
      Point(x: 793998.8609966785, y: 46372.86824183066),
      Point(x: 17.88805857342887, y: 46.892264073036614)),
  'EPSG:21817': ProjectAndUnProjectResult(
      Point(x: 5019299.948370005, y: 11044184.080581147),
      Point(x: 44.71868092095189, y: 89.9961317687478)),
  'EPSG:21818': ProjectAndUnProjectResult(
      Point(x: 5436290.945733045, y: 10410552.53972928),
      Point(x: 44.71868092095189, y: 89.9961317687478)),
  'EPSG:21891': ProjectAndUnProjectResult(
      Point(x: 5822486.707817163, y: 11130901.20700542),
      Point(x: 44.71868092095189, y: 89.9961317687478)),
  'EPSG:21892': ProjectAndUnProjectResult(
      Point(x: 5980547.218128094, y: 10805951.985049851),
      Point(x: 44.71868092095189, y: 89.9961317687478)),
  'EPSG:21893': ProjectAndUnProjectResult(
      Point(x: 6083896.608132482, y: 10476987.143738788),
      Point(x: 45, y: double.nan)),
  'EPSG:21894': ProjectAndUnProjectResult(
      Point(x: 6139234.891233048, y: 10148553.39473207),
      Point(x: 45, y: double.nan)),
  'EPSG:21896': ProjectAndUnProjectResult(
      Point(x: 5822486.707817163, y: 11130901.20700542),
      Point(x: 44.71868092095189, y: 89.9961317687478)),
  'EPSG:21897': ProjectAndUnProjectResult(
      Point(x: 5980547.218128094, y: 10805951.985049851),
      Point(x: 44.71868092095189, y: 89.9961317687478)),
  'EPSG:21898': ProjectAndUnProjectResult(
      Point(x: 6083896.608132482, y: 10476987.143738788),
      Point(x: 45, y: double.nan)),
  'EPSG:21899': ProjectAndUnProjectResult(
      Point(x: 6139234.891233048, y: 10148553.39473207),
      Point(x: 45, y: double.nan)),
  'EPSG:22032': ProjectAndUnProjectResult(
      Point(x: 1177192.8967686668, y: 15231789.804958716),
      Point(x: 17.888058209679155, y: 46.89226383289281)),
  'EPSG:22033': ProjectAndUnProjectResult(
      Point(x: 720312.0310997216, y: 15197333.920758303),
      Point(x: 17.88805833467396, y: 46.89226387324165)),
  'EPSG:22091': ProjectAndUnProjectResult(
      Point(x: 986869.6927901455, y: 15213141.478470605),
      Point(x: 17.888058330066944, y: 46.89226386722416)),
  'EPSG:22092': ProjectAndUnProjectResult(
      Point(x: 948796.1027579526, y: 15210149.953976382),
      Point(x: 17.888058332810644, y: 46.89226386954067)),
  'EPSG:22171': ProjectAndUnProjectResult(
      Point(x: 6558199.158144748, y: 20088569.71969266), Point(x: 0, y: 90)),
  'EPSG:32612': ProjectAndUnProjectResult(
      Point(x: -3328981.215793029, y: 11193210.77317494), Point(x: 0, y: 90)),
  'EPSG:22172': ProjectAndUnProjectResult(
      Point(x: 7627603.63873359, y: 19759444.393447872),
      Point(x: -14563147143.451214, y: 3188443837.8198547)),
  'EPSG:22173': ProjectAndUnProjectResult(
      Point(x: 8653224.300104942, y: 19433509.59298006),
      Point(x: -39521738.61122337, y: 8695128.741618276)),
  'EPSG:22174': ProjectAndUnProjectResult(
      Point(x: 9640628.03418475, y: 19113941.421131436),
      Point(x: -1685042.2535845686, y: 369929.7983349795)),
  'EPSG:22175': ProjectAndUnProjectResult(
      Point(x: 10594786.08114166, y: 18803251.941004626),
      Point(x: -187879.9335986475, y: 41002.61340262109)),
  'EPSG:22176': ProjectAndUnProjectResult(
      Point(x: 11520125.412785191, y: 18503383.42313258),
      Point(x: -33811.090133644844, y: 7380.196889868265)),
  'EPSG:22177': ProjectAndUnProjectResult(
      Point(x: 12420576.82986139, y: 18215792.792734504),
      Point(x: -7903.831319008155, y: 1789.9479071178757)),
  'EPSG:22181': ProjectAndUnProjectResult(
      Point(x: 6558199.15814112, y: 20088569.719824612), Point(x: 0, y: 90)),
  'EPSG:22182': ProjectAndUnProjectResult(
      Point(x: 7627603.638721798, y: 19759444.393584996),
      Point(x: -14563147131.784145, y: 3188443835.3104944)),
  'EPSG:22183': ProjectAndUnProjectResult(
      Point(x: 8653224.300086465, y: 19433509.593122367),
      Point(x: -39521738.5994028, y: 8695128.739126878)),
  'EPSG:22184': ProjectAndUnProjectResult(
      Point(x: 9640628.034160899, y: 19113941.421278868),
      Point(x: -1685042.253300147, y: 369929.79827663914)),
  'EPSG:22185': ProjectAndUnProjectResult(
      Point(x: 10594786.0811136, y: 18803251.941157054),
      Point(x: -187879.9335777107, y: 41002.613398455236)),
  'EPSG:22186': ProjectAndUnProjectResult(
      Point(x: 11520125.41275394, y: 18503383.423289828),
      Point(x: -33811.090130915225, y: 7380.196889341112)),
  'EPSG:22187': ProjectAndUnProjectResult(
      Point(x: 12420576.829827838, y: 18215792.79289636),
      Point(x: -7903.831318506849, y: 1789.947907023519)),
  'EPSG:22191': ProjectAndUnProjectResult(
      Point(x: 6558534.121290168, y: 20089010.094499655),
      Point(x: 137.41950921658076, y: 89.99820053262447)),
  'EPSG:22192': ProjectAndUnProjectResult(
      Point(x: 7627912.361139339, y: 19759860.055252463),
      Point(x: 45, y: double.nan)),
  'EPSG:22193': ProjectAndUnProjectResult(
      Point(x: 8653507.61669164, y: 19433904.376927037),
      Point(x: 45, y: double.nan)),
  'EPSG:22194': ProjectAndUnProjectResult(
      Point(x: 9640886.800785124, y: 19114318.70612948),
      Point(x: 45, y: double.nan)),
  'EPSG:22195': ProjectAndUnProjectResult(
      Point(x: 10595021.161234654, y: 18803614.694944397),
      Point(x: 45, y: double.nan)),
  'EPSG:22196': ProjectAndUnProjectResult(
      Point(x: 11520337.666243229, y: 18503734.24509125),
      Point(x: 45, y: double.nan)),
  'EPSG:22197': ProjectAndUnProjectResult(
      Point(x: 12420767.103514891, y: 18216133.95221853),
      Point(x: 45, y: double.nan)),
  'EPSG:22234': ProjectAndUnProjectResult(
      Point(x: 263012.21538582986, y: 15198008.697969045),
      Point(x: 17.888058510372446, y: 46.89226382534054)),
  'EPSG:22235': ProjectAndUnProjectResult(
      Point(x: -193852.7009693758, y: 15233753.505493216),
      Point(x: 17.88805866814209, y: 46.89226377926679)),
  'EPSG:22236': ProjectAndUnProjectResult(
      Point(x: -650101.0589285116, y: 15305302.272816662),
      Point(x: 17.888077104406324, y: 46.89226380089118)),
  'EPSG:22332': ProjectAndUnProjectResult(
      Point(x: 1176851.1186573808, y: 5231224.271853624),
      Point(x: 17.888058423427236, y: 46.89226401399397)),
  'EPSG:22521': ProjectAndUnProjectResult(
      Point(x: 5518270.098143509, y: 18497994.964059576),
      Point(x: 45, y: double.nan)),
  'EPSG:22522': ProjectAndUnProjectResult(
      Point(x: 5297804.18171822, y: 17936357.418269776),
      Point(x: 45, y: double.nan)),
  'EPSG:22523': ProjectAndUnProjectResult(
      Point(x: 5003650.804809125, y: 17430534.393152017),
      Point(x: 45, y: double.nan)),
  'EPSG:22524': ProjectAndUnProjectResult(
      Point(x: 4656132.2833975535, y: 16983053.88852372),
      Point(x: -27.537265045262, y: 55.09009063570185)),
  'EPSG:22525': ProjectAndUnProjectResult(
      Point(x: 4270741.2175406385, y: 16593418.05087208),
      Point(x: 9.85268310796776, y: 48.2212153256088)),
  'EPSG:22780': ProjectAndUnProjectResult(
      Point(x: -1634162.8158513, y: 1615233.2285455111),
      Point(x: 17.888058563233912, y: 46.8922640653223)),
  'EPSG:22832': ProjectAndUnProjectResult(
      Point(x: 1176883.2342238766, y: 5231709.450300603),
      Point(x: 17.888058435869073, y: 46.89226399035675)),
  'EPSG:22991': ProjectAndUnProjectResult(
      Point(x: -1002721.9861235754, y: 3119237.3518837616),
      Point(x: 17.88811889074069, y: 46.892265653208206)),
  'EPSG:22992': ProjectAndUnProjectResult(
      Point(x: -383773.28752670775, y: 2769276.276746139),
      Point(x: 17.88806346832421, y: 46.8922638588602)),
  'EPSG:22993': ProjectAndUnProjectResult(
      Point(x: 5632.832389040384, y: 2115600.1999049373),
      Point(x: 17.88805872086583, y: 46.89226402217269)),
  'EPSG:22994': ProjectAndUnProjectResult(
      Point(x: 5632.832389040384, y: 3115600.1999049373),
      Point(x: 17.88805872086583, y: 46.89226402217269)),
  'EPSG:23028': ProjectAndUnProjectResult(
      Point(x: 2989036.0291012935, y: 5744268.903886382),
      Point(x: 17.848183429301752, y: 46.89671229562624)),
  'EPSG:23029': ProjectAndUnProjectResult(
      Point(x: 2540848.8319991007, y: 5555923.946860903),
      Point(x: 17.88314537318177, y: 46.89269980865235)),
  'EPSG:23030': ProjectAndUnProjectResult(
      Point(x: 2088301.6915125165, y: 5409412.791601509),
      Point(x: 17.8876519647011, y: 46.89228754332868)),
  'EPSG:23031': ProjectAndUnProjectResult(
      Point(x: 1633287.4805096688, y: 5302074.8911036365),
      Point(x: 17.888042386957373, y: 46.892264001054905)),
  'EPSG:23032': ProjectAndUnProjectResult(
      Point(x: 1176979.0913513387, y: 5231872.204377498),
      Point(x: 17.888058440469365, y: 46.892264031997044)),
  'EPSG:23033': ProjectAndUnProjectResult(
      Point(x: 720074.6940560518, y: 5197435.292854542),
      Point(x: 17.888058565342646, y: 46.89226407172034)),
  'EPSG:23034': ProjectAndUnProjectResult(
      Point(x: 263004.3000256866, y: 5198082.725445255),
      Point(x: 17.888058565293235, y: 46.89226407169095)),
  'EPSG:23035': ProjectAndUnProjectResult(
      Point(x: -193886.77543162194, y: 5233827.369355681),
      Point(x: 17.888058723412243, y: 46.89226402624652)),
  'EPSG:23036': ProjectAndUnProjectResult(
      Point(x: -650161.9585444932, y: 5305376.291796589),
      Point(x: 17.888077165773627, y: 46.89226406012086)),
  'EPSG:23037': ProjectAndUnProjectResult(
      Point(x: -1105109.377250435, y: 5414124.14574574),
      Point(x: 17.888509008752166, y: 46.89229072693788)),
  'EPSG:23038': ProjectAndUnProjectResult(
      Point(x: -1557534.1428603171, y: 5562133.060950239),
      Point(x: 17.893398352663365, y: 46.892742746067256)),
  'EPSG:23090': ProjectAndUnProjectResult(
      Point(x: 1861015.8906361766, y: 5350989.865132068),
      Point(x: 17.887966662085727, y: 46.892267205330604)),
  'EPSG:23095': ProjectAndUnProjectResult(
      Point(x: 1481286.3531255915, y: 5274629.510778771),
      Point(x: 17.888054395605916, y: 46.892263866130484)),
  'EPSG:23239': ProjectAndUnProjectResult(
      Point(x: -2005740.1207187362, y: 5751623.402583185),
      Point(x: 17.93095518159483, y: 46.897081516266816)),
  'EPSG:23240': ProjectAndUnProjectResult(
      Point(x: -2446323.551491821, y: 5986747.704094112),
      Point(x: 18.163346739544664, y: 46.92856235164852)),
  'EPSG:23433': ProjectAndUnProjectResult(
      Point(x: 719998.6807399516, y: 5197277.867915581),
      Point(x: 17.888058560302763, y: 46.89226403059584)),
  'EPSG:23700': ProjectAndUnProjectResult(
      Point(x: 561651.7488729097, y: 172658.62134758622),
      Point(x: 17.88805856557484, y: 46.892264068351345)),
  'EPSG:23830': ProjectAndUnProjectResult(
      Point(x: -4865803.87353834, y: 10171445.892459726),
      Point(x: 86801.12439229246, y: 18902.901110545685)),
  'EPSG:23831': ProjectAndUnProjectResult(
      Point(x: -4924409.819516362, y: 10477709.171074785),
      Point(x: 612358.6101960705, y: 134106.8769964249)),
  'EPSG:23832': ProjectAndUnProjectResult(
      Point(x: -4951719.971071311, y: 10793740.870434482),
      Point(x: 8679839.573799483, y: 1909300.050652217)),
  'EPSG:23833': ProjectAndUnProjectResult(
      Point(x: -4943001.164361036, y: 11117282.460213631),
      Point(x: 631489570.7011461, y: 138679560.43961534)),
  'EPSG:23834': ProjectAndUnProjectResult(
      Point(x: -4892946.907632945, y: 11445452.767017543),
      Point(x: 447699232839297.1, y: 97370524608020.88)),
  'EPSG:23835': ProjectAndUnProjectResult(
      Point(x: -4795624.059735097, y: 11774647.774981525), Point(x: 0, y: 90)),
  'EPSG:23836': ProjectAndUnProjectResult(
      Point(x: -4644416.030963411, y: 12100429.457585078), Point(x: 0, y: 90)),
  'EPSG:23837': ProjectAndUnProjectResult(
      Point(x: -4431962.384381246, y: 12417402.863277849), Point(x: 0, y: 90)),
  'EPSG:23838': ProjectAndUnProjectResult(
      Point(x: -4150094.7157475958, y: 12719080.650741648), Point(x: 0, y: 90)),
  'EPSG:23839': ProjectAndUnProjectResult(
      Point(x: -3789768.690190188, y: 12997734.242840523), Point(x: 0, y: 90)),
  'EPSG:23840': ProjectAndUnProjectResult(
      Point(x: -3340992.1137596876, y: 13244230.741538242), Point(x: 0, y: 90)),
  'EPSG:26709': ProjectAndUnProjectResult(
      Point(x: -18062455.289428893, y: 2987007.6910101725),
      Point(x: 45, y: double.nan)),
  'EPSG:23841': ProjectAndUnProjectResult(
      Point(x: -2792748.9180013267, y: 13447854.719289873), Point(x: 0, y: 90)),
  'EPSG:23842': ProjectAndUnProjectResult(
      Point(x: -2132918.9356801813, y: 13596113.975641776), Point(x: 0, y: 90)),
  'EPSG:23843': ProjectAndUnProjectResult(
      Point(x: -1348193.3457963404, y: 13674528.321001673), Point(x: 0, y: 90)),
  'EPSG:23844': ProjectAndUnProjectResult(
      Point(x: -423985.6660262288, y: 13666400.4227679), Point(x: 0, y: 90)),
  'EPSG:23845': ProjectAndUnProjectResult(
      Point(x: 655661.8292735498, y: 13552567.722234422), Point(x: 0, y: 90)),
  'EPSG:23846': ProjectAndUnProjectResult(
      Point(x: -4524636.6356349345, y: 8519990.891861552),
      Point(x: 45, y: double.nan)),
  'EPSG:23847': ProjectAndUnProjectResult(
      Point(x: -4640766.186122507, y: 9131910.829808097),
      Point(x: 45, y: double.nan)),
  'EPSG:23848': ProjectAndUnProjectResult(
      Point(x: -4622011.790892367, y: 9778090.74777339),
      Point(x: 45, y: double.nan)),
  'EPSG:23849': ProjectAndUnProjectResult(
      Point(x: -4425773.759742471, y: 10435188.007617047),
      Point(x: -147.99461679149607, y: 89.9997466128142)),
  'EPSG:23850': ProjectAndUnProjectResult(
      Point(x: -3998953.349021855, y: 11067340.816629881),
      Point(x: -147.99461679149607, y: 89.9997466128142)),
  'EPSG:23851': ProjectAndUnProjectResult(
      Point(x: -3276018.1049374533, y: 11622220.068699103),
      Point(x: -147.99461679149607, y: 89.9997466128142)),
  'EPSG:23852': ProjectAndUnProjectResult(
      Point(x: -2176825.204869073, y: 12026250.547623398),
      Point(x: -147.99461679149607, y: 89.9997466128142)),
  'EPSG:23853': ProjectAndUnProjectResult(
      Point(x: -604187.2024158987, y: 12178891.736715838),
      Point(x: -147.99461679149607, y: 89.9997466128142)),
  'EPSG:23866': ProjectAndUnProjectResult(
      Point(x: -4524591.704387454, y: 8519978.27303488),
      Point(x: 38040.25674781569, y: 8289.769436337667)),
  'EPSG:23867': ProjectAndUnProjectResult(
      Point(x: -4640717.024347393, y: 9131890.972118106),
      Point(x: 2043698.7541324345, y: 448818.11751850427)),
  'EPSG:23868': ProjectAndUnProjectResult(
      Point(x: -4621959.250482938, y: 9778061.493749313),
      Point(x: 30362279592.18099, y: 6642887093.450607)),
  'EPSG:23869': ProjectAndUnProjectResult(
      Point(x: -4425719.24631206, y: 10435146.71756466), Point(x: 0, y: 90)),
  'EPSG:23870': ProjectAndUnProjectResult(
      Point(x: -3998899.0110859387, y: 11067284.300503207), Point(x: 0, y: 90)),
  'EPSG:23871': ProjectAndUnProjectResult(
      Point(x: -3275967.065357107, y: 11622144.5182464), Point(x: 0, y: 90)),
  'EPSG:23872': ProjectAndUnProjectResult(
      Point(x: -2176781.8404877554, y: 12026151.471419258), Point(x: 0, y: 90)),
  'EPSG:23877': ProjectAndUnProjectResult(
      Point(x: -4640717.024347393, y: 19131890.972118106),
      Point(x: 2043698.7541324345, y: 448818.11751850427)),
  'EPSG:23878': ProjectAndUnProjectResult(
      Point(x: -4621959.250482938, y: 19778061.493749313),
      Point(x: 30362279592.18099, y: 6642887093.450607)),
  'EPSG:23879': ProjectAndUnProjectResult(
      Point(x: -4425719.24631206, y: 20435146.717564657), Point(x: 0, y: 90)),
  'EPSG:23880': ProjectAndUnProjectResult(
      Point(x: -3998899.0110859387, y: 21067284.30050321), Point(x: 0, y: 90)),
  'EPSG:23881': ProjectAndUnProjectResult(
      Point(x: -3275967.065357107, y: 21622144.518246397), Point(x: 0, y: 90)),
  'EPSG:23882': ProjectAndUnProjectResult(
      Point(x: -2176781.8404877554, y: 22026151.47141926), Point(x: 0, y: 90)),
  'EPSG:23883': ProjectAndUnProjectResult(
      Point(x: -604157.4782189683, y: 22178763.901248254), Point(x: 0, y: 90)),
  'EPSG:23884': ProjectAndUnProjectResult(
      Point(x: 1558843.5535780834, y: 21945699.007653777), Point(x: 0, y: 90)),
  'EPSG:23886': ProjectAndUnProjectResult(
      Point(x: -4524636.6356349345, y: 18519990.89186155),
      Point(x: 45, y: double.nan)),
  'EPSG:23887': ProjectAndUnProjectResult(
      Point(x: -4640766.186122507, y: 19131910.829808097),
      Point(x: 45, y: double.nan)),
  'EPSG:23888': ProjectAndUnProjectResult(
      Point(x: -4622011.790892367, y: 19778090.74777339),
      Point(x: 45, y: double.nan)),
  'EPSG:23889': ProjectAndUnProjectResult(
      Point(x: -4425773.759742471, y: 20435188.00761705),
      Point(x: -147.99461679149607, y: 89.9997466128142)),
  'EPSG:23890': ProjectAndUnProjectResult(
      Point(x: -3998953.349021855, y: 21067340.81662988),
      Point(x: -147.99461679149607, y: 89.9997466128142)),
  'EPSG:23891': ProjectAndUnProjectResult(
      Point(x: -3276018.1049374533, y: 21622220.068699103),
      Point(x: -147.99461679149607, y: 89.9997466128142)),
  'EPSG:23892': ProjectAndUnProjectResult(
      Point(x: -2176825.204869073, y: 22026250.547623396),
      Point(x: -147.99461679149607, y: 89.9997466128142)),
  'EPSG:23893': ProjectAndUnProjectResult(
      Point(x: -604187.2024158987, y: 22178891.73671584),
      Point(x: -147.99461679149607, y: 89.9997466128142)),
  'EPSG:23894': ProjectAndUnProjectResult(
      Point(x: 1558835.4181019454, y: 21945861.62707421),
      Point(x: -147.99461679149607, y: 89.9997466128142)),
  'EPSG:23946': ProjectAndUnProjectResult(
      Point(x: -4524196.604994825, y: 8519860.997158756),
      Point(x: 45, y: double.nan)),
  'EPSG:23947': ProjectAndUnProjectResult(
      Point(x: -4640141.333508167, y: 9131753.866358994),
      Point(x: 45, y: double.nan)),
  'EPSG:23948': ProjectAndUnProjectResult(
      Point(x: -4621167.717970731, y: 9777874.640139135),
      Point(x: 45, y: double.nan)),
  'EPSG:24047': ProjectAndUnProjectResult(
      Point(x: -4640140.629454818, y: 9131744.990179865),
      Point(x: 45, y: double.nan)),
  'EPSG:24048': ProjectAndUnProjectResult(
      Point(x: -4621169.186341875, y: 9777865.43758633),
      Point(x: 45, y: double.nan)),
  'EPSG:24305': ProjectAndUnProjectResult(
      Point(x: -4307121.938350191, y: 7956237.7296176525),
      Point(x: 45, y: double.nan)),
  'EPSG:24306': ProjectAndUnProjectResult(
      Point(x: -4524171.039101552, y: 8519844.558329491),
      Point(x: 45, y: double.nan)),
  'EPSG:24311': ProjectAndUnProjectResult(
      Point(x: -2874873.747609587, y: 6270562.203473405),
      Point(x: 19.45784136916371, y: 47.12704504223477)),
  'EPSG:24312': ProjectAndUnProjectResult(
      Point(x: -3285594.5075450023, y: 6606727.134344226),
      Point(x: 26.474467903629826, y: 48.316905651860814)),
  'EPSG:24313': ProjectAndUnProjectResult(
      Point(x: -3669674.161219406, y: 6998502.807600593),
      Point(x: 66.56734830003317, y: 55.702462554542706)),
  'EPSG:24342': ProjectAndUnProjectResult(
      Point(x: -3285632.7871328234, y: 6606765.224516772),
      Point(x: 26.475957144671206, y: 48.317119288998164)),
  'EPSG:24343': ProjectAndUnProjectResult(
      Point(x: -3669708.6500316053, y: 6998546.529937879),
      Point(x: 66.57598456580142, y: 55.70392851020421)),
  'EPSG:24344': ProjectAndUnProjectResult(
      Point(x: -4015394.337202619, y: 7448219.765939226),
      Point(x: 45, y: double.nan)),
  'EPSG:24345': ProjectAndUnProjectResult(
      Point(x: -4307031.47238125, y: 7956188.705613162),
      Point(x: 45, y: double.nan)),
  'EPSG:24346': ProjectAndUnProjectResult(
      Point(x: -4524092.728048388, y: 8519778.165573332),
      Point(x: 45, y: double.nan)),
  'EPSG:24347': ProjectAndUnProjectResult(
      Point(x: -4640059.218651982, y: 9131647.566523755),
      Point(x: 45, y: double.nan)),
  'EPSG:26710': ProjectAndUnProjectResult(
      Point(x: -11916361.782284085, y: 7027010.125400178),
      Point(x: 45, y: double.nan)),
  'EPSG:24500': ProjectAndUnProjectResult(
      Point(x: -5685006.08355233, y: 9890075.024441343),
      Point(x: -135, y: double.nan)),
  'EPSG:24547': ProjectAndUnProjectResult(
      Point(x: -4640107.741178712, y: 9131933.76838303),
      Point(x: 45, y: double.nan)),
  'EPSG:24548': ProjectAndUnProjectResult(
      Point(x: -4621098.778535513, y: 9778046.606353736),
      Point(x: 45, y: double.nan)),
  'EPSG:24571': ProjectAndUnProjectResult(
      Point(x: -264292.2490371383, y: 346484.959807246),
      Point(x: 17.888059495884065, y: 46.89226406978048)),
  'EPSG:24718': ProjectAndUnProjectResult(
      Point(x: 5436885.139325045, y: 10410809.007274145),
      Point(x: 157.9822041331554, y: 89.99735862730533)),
  'EPSG:24719': ProjectAndUnProjectResult(
      Point(x: 5625558.509166949, y: 9753610.72619122),
      Point(x: 45, y: double.nan)),
  'EPSG:24720': ProjectAndUnProjectResult(
      Point(x: 5638534.630679461, y: 9108397.002921982),
      Point(x: 45, y: double.nan)),
  'EPSG:24817': ProjectAndUnProjectResult(
      Point(x: 5019905.369428784, y: 11044557.030001746),
      Point(x: 148.71550708554796, y: 89.99698272552143)),
  'EPSG:24818': ProjectAndUnProjectResult(
      Point(x: 5436903.4227025155, y: 10410705.277319416),
      Point(x: 148.71550708554796, y: 89.99698272552143)),
  'EPSG:24819': ProjectAndUnProjectResult(
      Point(x: 5625547.888235035, y: 9753513.490714712),
      Point(x: 45, y: double.nan)),
  'EPSG:24820': ProjectAndUnProjectResult(
      Point(x: 5638502.931969908, y: 9108308.780148672),
      Point(x: 45, y: double.nan)),
  'EPSG:24821': ProjectAndUnProjectResult(
      Point(x: 5518003.417526217, y: 8498032.425765613),
      Point(x: 45, y: double.nan)),
  'EPSG:24877': ProjectAndUnProjectResult(
      Point(x: 5019905.369428784, y: 21044557.030001745),
      Point(x: 148.71550708554796, y: 89.99698272552143)),
  'EPSG:24878': ProjectAndUnProjectResult(
      Point(x: 5436903.4227025155, y: 20410705.277319416),
      Point(x: 148.71550708554796, y: 89.99698272552143)),
  'EPSG:24879': ProjectAndUnProjectResult(
      Point(x: 5625547.888235035, y: 19753513.490714714),
      Point(x: 45, y: double.nan)),
  'EPSG:24880': ProjectAndUnProjectResult(
      Point(x: 5638502.931969908, y: 19108308.78014867),
      Point(x: 45, y: double.nan)),
  'EPSG:24881': ProjectAndUnProjectResult(
      Point(x: 5518003.417526217, y: 18498032.42576561),
      Point(x: 45, y: double.nan)),
  'EPSG:24882': ProjectAndUnProjectResult(
      Point(x: 5297554.6617255565, y: 17936434.87304199),
      Point(x: 45, y: double.nan)),
  'EPSG:24891': ProjectAndUnProjectResult(
      Point(x: 4787924.675622284, y: 13086492.30063288),
      Point(x: 148.71550708554796, y: 89.99698272552143)),
  'EPSG:24892': ProjectAndUnProjectResult(
      Point(x: 5603533.89865322, y: 12606134.272527143),
      Point(x: 148.71550708554796, y: 89.99698272552143)),
  'EPSG:24893': ProjectAndUnProjectResult(
      Point(x: 6420365.305869488, y: 12007287.501391007),
      Point(x: 45, y: double.nan)),
  'EPSG:25000': ProjectAndUnProjectResult(
      Point(x: 1711254.8533106793, y: 4853832.164245496),
      Point(x: 17.887904288371477, y: 46.89227066217537)),
  'EPSG:25231': ProjectAndUnProjectResult(
      Point(x: 1633171.3956683343, y: 5301906.425489723),
      Point(x: 17.888042398763314, y: 46.892263948063125)),
  'EPSG:25391': ProjectAndUnProjectResult(
      Point(x: -4000274.461956445, y: 11070971.376384165),
      Point(x: -149.93141717806435, y: 89.99862403720388)),
  'EPSG:26711': ProjectAndUnProjectResult(
      Point(x: -7081172.014082744, y: 9642022.170037206),
      Point(x: 45, y: double.nan)),
  'EPSG:25392': ProjectAndUnProjectResult(
      Point(x: -3795752.999044556, y: 11267702.004484212),
      Point(x: -149.93141717806435, y: 89.99862403720388)),
  'EPSG:25393': ProjectAndUnProjectResult(
      Point(x: -3555669.5627440363, y: 11453594.597417176),
      Point(x: -149.93141717806435, y: 89.99862403720388)),
  'EPSG:25394': ProjectAndUnProjectResult(
      Point(x: -3277065.0690270634, y: 11625946.3923946),
      Point(x: -149.93141717806435, y: 89.99862403720388)),
  'EPSG:25395': ProjectAndUnProjectResult(
      Point(x: -2956780.8305139486, y: 11781748.36960319),
      Point(x: -149.93141717806435, y: 89.99862403720388)),
  'EPSG:25700': ProjectAndUnProjectResult(
      Point(x: -6322890.078644928, y: 6774362.061687819),
      Point(x: 17.888059768494053, y: 46.8922646303815)),
  'EPSG:25828': ProjectAndUnProjectResult(
      Point(x: 2988896.0169453374, y: 5744023.033448553),
      Point(x: 17.848196835452992, y: 46.89671142260442)),
  'EPSG:25829': ProjectAndUnProjectResult(
      Point(x: 2540720.5313290567, y: 5555692.513083512),
      Point(x: 17.883147133968766, y: 46.89269979625903)),
  'EPSG:25830': ProjectAndUnProjectResult(
      Point(x: 2088186.225893158, y: 5409193.676598077),
      Point(x: 17.88765211923516, y: 46.89228755974916)),
  'EPSG:25831': ProjectAndUnProjectResult(
      Point(x: 1633185.6064171265, y: 5301866.087016829),
      Point(x: 17.88804238865636, y: 46.892264000337974)),
  'EPSG:25832': ProjectAndUnProjectResult(
      Point(x: 1176891.287219305, y: 5231671.834018296),
      Point(x: 17.88805843543735, y: 46.892264027445336)),
  'EPSG:25833': ProjectAndUnProjectResult(
      Point(x: 720001.2298400886, y: 5197241.60997254),
      Point(x: 17.888058560302017, y: 46.89226406695651)),
  'EPSG:25834': ProjectAndUnProjectResult(
      Point(x: 262945.2879608735, y: 5197894.102611037),
      Point(x: 17.888058560253082, y: 46.89226406692702)),
  'EPSG:25835': ProjectAndUnProjectResult(
      Point(x: -193931.3475621267, y: 5233642.279931091),
      Point(x: 17.88805871864152, y: 46.89226402167793)),
  'EPSG:25836': ProjectAndUnProjectResult(
      Point(x: -650192.2096700789, y: 5305193.291220044),
      Point(x: 17.888077173234436, y: 46.89226405998426)),
  'EPSG:25837': ProjectAndUnProjectResult(
      Point(x: -1105125.5282006196, y: 5413941.856367431),
      Point(x: 17.888509189327227, y: 46.89229076369037)),
  'EPSG:25838': ProjectAndUnProjectResult(
      Point(x: -1557536.5212347228, y: 5561950.163916144),
      Point(x: 17.89339993357438, y: 46.89274299727956)),
  'EPSG:25884': ProjectAndUnProjectResult(
      Point(x: 34461.49600235146, y: 5211353.267777357),
      Point(x: 17.888058563129825, y: 46.89226406242482)),
  'EPSG:25932': ProjectAndUnProjectResult(
      Point(x: 1176852.2620693797, y: 15231746.959374499),
      Point(x: 17.88805844125422, y: 46.89226402822769)),
  'EPSG:26237': ProjectAndUnProjectResult(
      Point(x: -1104998.7498205835, y: 5413863.875225357),
      Point(x: 17.88850979530133, y: 46.89229071661217)),
  'EPSG:26331': ProjectAndUnProjectResult(
      Point(x: 1633263.9678822146, y: 5301750.417784297),
      Point(x: 17.888042383568727, y: 46.8922639681257)),
  'EPSG:26332': ProjectAndUnProjectResult(
      Point(x: 1176962.5680643115, y: 5231548.33015757),
      Point(x: 17.888058427834185, y: 46.89226401031416)),
  'EPSG:26391': ProjectAndUnProjectResult(
      Point(x: 1250167.4852694669, y: 4839422.997969971),
      Point(x: 17.888052596272615, y: 46.89226383158263)),
  'EPSG:26392': ProjectAndUnProjectResult(
      Point(x: 1385679.056921932, y: 4794650.752904692),
      Point(x: 17.888058342330922, y: 46.89226399633404)),
  'EPSG:26393': ProjectAndUnProjectResult(
      Point(x: 1520911.3212225637, y: 4765801.71544796),
      Point(x: 17.888058551746635, y: 46.892264048414575)),
  'EPSG:26432': ProjectAndUnProjectResult(
      Point(x: 1176851.608351807, y: 15231745.273312211),
      Point(x: 17.888058440734177, y: 46.892264028204664)),
  'EPSG:26591': ProjectAndUnProjectResult(
      Point(x: 3122506.2710304367, y: 5418873.689729895),
      Point(x: 17.887558410722438, y: 46.89229438391552)),
  'EPSG:26592': ProjectAndUnProjectResult(
      Point(x: 3687615.1282133134, y: 5308666.568613886),
      Point(x: 17.88803712816748, y: 46.89226413230987)),
  'EPSG:26632': ProjectAndUnProjectResult(
      Point(x: 1176996.552226874, y: 5231611.835294146),
      Point(x: 17.888058411112784, y: 46.892263986574044)),
  'EPSG:26692': ProjectAndUnProjectResult(
      Point(x: 1176996.552226874, y: 15231611.835294146),
      Point(x: 17.888058411112784, y: 46.892263986574044)),
  'EPSG:26701': ProjectAndUnProjectResult(
      Point(x: 48728114.43820361, y: -23185484.035044745), Point(x: 0, y: -90)),
  'EPSG:26702': ProjectAndUnProjectResult(
      Point(x: 63329327.43296157, y: -38685852.13107096), Point(x: 0, y: -90)),
  'EPSG:26703': ProjectAndUnProjectResult(
      Point(x: 81063813.57050587, y: -59111104.534894094), Point(x: 0, y: -90)),
  'EPSG:26704': ProjectAndUnProjectResult(
      Point(x: -79339726.16672307, y: -58247338.45419032), Point(x: 0, y: -90)),
  'EPSG:26705': ProjectAndUnProjectResult(
      Point(x: -61731329.63108242, y: -38025676.41734354), Point(x: 0, y: -90)),
  'EPSG:26706': ProjectAndUnProjectResult(
      Point(x: -47237564.494601116, y: -22688935.572167736),
      Point(x: 0, y: -90)),
  'EPSG:26712': ProjectAndUnProjectResult(
      Point(x: -3329217.278616561, y: 11191684.000873044), Point(x: 0, y: 90)),
  'EPSG:26713': ProjectAndUnProjectResult(
      Point(x: -466294.67996249686, y: 11962133.742946252), Point(x: 0, y: 90)),
  'EPSG:26714': ProjectAndUnProjectResult(
      Point(x: 1672275.4033956635, y: 12178253.011026183), Point(x: 0, y: 90)),
  'EPSG:26715': ProjectAndUnProjectResult(
      Point(x: 3225256.943310816, y: 12014325.982827425), Point(x: 0, y: 90)),
  'EPSG:26716': ProjectAndUnProjectResult(
      Point(x: 4308786.566372169, y: 11603255.763893979), Point(x: 0, y: 90)),
  'EPSG:26717': ProjectAndUnProjectResult(
      Point(x: 5019358.128752175, y: 11044474.951493928), Point(x: 0, y: 90)),
  'EPSG:26718': ProjectAndUnProjectResult(
      Point(x: 5436519.152292094, y: 10410680.453106662), Point(x: 0, y: 90)),
  'EPSG:26719': ProjectAndUnProjectResult(
      Point(x: 5625294.712617322, y: 9753515.763326045),
      Point(x: 45, y: double.nan)),
  'EPSG:26720': ProjectAndUnProjectResult(
      Point(x: 5638354.370073671, y: 9108317.051244248),
      Point(x: 45, y: double.nan)),
  'EPSG:26721': ProjectAndUnProjectResult(
      Point(x: 5517937.734275888, y: 8498032.558622306),
      Point(x: 45, y: double.nan)),
  'EPSG:26722': ProjectAndUnProjectResult(
      Point(x: 5297554.253059556, y: 7936417.957394793),
      Point(x: 45, y: double.nan)),
  'EPSG:26729': ProjectAndUnProjectResult(
      Point(x: 13540952.672929252, y: 26681329.33086539), Point(x: 0, y: 90)),
  'EPSG:26730': ProjectAndUnProjectResult(
      Point(x: 12754550.102946658, y: 27324427.051889222), Point(x: 0, y: 90)),
  'EPSG:26731': ProjectAndUnProjectResult(
      Point(x: 21353858.81447156, y: 15477559.308342675),
      Point(x: 17.88805856028155, y: 46.892264047823055)),
  'EPSG:26732': ProjectAndUnProjectResult(
      Point(x: -123224440.72028051, y: -62069026.32863877),
      Point(x: 0, y: -90)),
  'EPSG:26733': ProjectAndUnProjectResult(
      Point(x: -149121590.5235042, y: -87033458.2572556), Point(x: 0, y: -90)),
  'EPSG:26734': ProjectAndUnProjectResult(
      Point(x: -178771771.0325936, y: -117473340.37625138),
      Point(x: 0, y: -90)),
  'EPSG:26735': ProjectAndUnProjectResult(
      Point(x: -212608925.42390218, y: -154281578.16211516),
      Point(x: 0, y: -90)),
  'EPSG:26736': ProjectAndUnProjectResult(
      Point(x: -251107054.57481885, y: -198465194.71742576),
      Point(x: 0, y: -90)),
  'EPSG:26737': ProjectAndUnProjectResult(
      Point(x: -294582993.2983449, y: -251156589.36744004),
      Point(x: 0, y: -90)),
  'EPSG:26738': ProjectAndUnProjectResult(
      Point(x: 254409816.49533752, y: -201178438.84498614),
      Point(x: 0, y: -90)),
  'EPSG:26739': ProjectAndUnProjectResult(
      Point(x: 215735947.83923522, y: -156549774.73228765),
      Point(x: 0, y: -90)),
  'EPSG:26740': ProjectAndUnProjectResult(
      Point(x: -10345546.751141088, y: 28741533.041960657),
      Point(x: 17.888058560281486, y: 46.89226404782306)),
  'EPSG:26741': ProjectAndUnProjectResult(
      Point(x: 24025334.166640844, y: 25357883.419753045),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:26742': ProjectAndUnProjectResult(
      Point(x: 24929171.82020233, y: 25589658.109205153),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:26743': ProjectAndUnProjectResult(
      Point(x: 25610553.106273796, y: 25333348.444989897),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:26744': ProjectAndUnProjectResult(
      Point(x: 26162073.078877464, y: 25113274.117989585),
      Point(x: 17.88805856028149, y: 46.89226404782307)),
  'EPSG:26745': ProjectAndUnProjectResult(
      Point(x: 27121351.011772502, y: 25060745.64628806),
      Point(x: 17.88805856028151, y: 46.89226404782307)),
  'EPSG:26746': ProjectAndUnProjectResult(
      Point(x: 27780098.62767097, y: 24738120.783684596),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:26747': ProjectAndUnProjectResult(
      Point(x: 29662768.91755508, y: 25173180.301893957),
      Point(x: 17.88805856028151, y: 46.89226404782307)),
  'EPSG:26748': ProjectAndUnProjectResult(
      Point(x: -10600614.407625115, y: 25959733.303937983), Point(x: 0, y: 90)),
  'EPSG:26749': ProjectAndUnProjectResult(
      Point(x: -13744481.745720092, y: 24883719.00400208), Point(x: 0, y: 90)),
  'EPSG:26750': ProjectAndUnProjectResult(
      Point(x: -17312717.880837597, y: 23513168.31691684), Point(x: 0, y: 90)),
  'EPSG:26751': ProjectAndUnProjectResult(
      Point(x: 24574867.249829542, y: 18694944.493995953),
      Point(x: 17.88805856028152, y: 46.89226404782306)),
  'EPSG:26752': ProjectAndUnProjectResult(
      Point(x: 25103048.634996, y: 18969527.16456138),
      Point(x: 17.88805856028151, y: 46.89226404782304)),
  'EPSG:26753': ProjectAndUnProjectResult(
      Point(x: 23966733.370935712, y: 21103998.25541827),
      Point(x: 17.888058560281515, y: 46.892264047823076)),
  'EPSG:26754': ProjectAndUnProjectResult(
      Point(x: 24415805.350481156, y: 21404594.503997188),
      Point(x: 17.88805856028151, y: 46.89226404782307)),
  'EPSG:26769': ProjectAndUnProjectResult(
      Point(x: -17822156.410733804, y: 19422759.784687657), Point(x: 0, y: 90)),
  'EPSG:26755': ProjectAndUnProjectResult(
      Point(x: 24926401.801483322, y: 21551344.940342914),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:26756': ProjectAndUnProjectResult(
      Point(x: 19413161.580503326, y: 13095650.267542124),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:26757': ProjectAndUnProjectResult(
      Point(x: 16633652.157782547, y: 20514407.293675017), Point(x: 0, y: 90)),
  'EPSG:26758': ProjectAndUnProjectResult(
      Point(x: 15332321.538734892, y: 27415787.3073374), Point(x: 0, y: 90)),
  'EPSG:26759': ProjectAndUnProjectResult(
      Point(x: 15016936.750985555, y: 27744028.933151823), Point(x: 0, y: 90)),
  'EPSG:26760': ProjectAndUnProjectResult(
      Point(x: 25342665.273250185, y: 17855814.011669874),
      Point(x: 17.88805856028151, y: 46.89226404782307)),
  'EPSG:26766': ProjectAndUnProjectResult(
      Point(x: 14961109.645174468, y: 25737114.764642395), Point(x: 0, y: 90)),
  'EPSG:26767': ProjectAndUnProjectResult(
      Point(x: 14236308.377273941, y: 26366745.538341008), Point(x: 0, y: 90)),
  'EPSG:26768': ProjectAndUnProjectResult(
      Point(x: -14214794.099803515, y: 20830100.56091816), Point(x: 0, y: 90)),
  'EPSG:26770': ProjectAndUnProjectResult(
      Point(x: -21545057.122096922, y: 17819736.752712287), Point(x: 0, y: 90)),
  'EPSG:26771': ProjectAndUnProjectResult(
      Point(x: 12326417.543693507, y: 25116703.597260717), Point(x: 0, y: 90)),
  'EPSG:26772': ProjectAndUnProjectResult(
      Point(x: 11294661.771853184, y: 25555041.15774765), Point(x: 0, y: 90)),
  'EPSG:26773': ProjectAndUnProjectResult(
      Point(x: 13614605.874607047, y: 24086130.607448142), Point(x: 0, y: 90)),
  'EPSG:26774': ProjectAndUnProjectResult(
      Point(x: 12960233.70569124, y: 24484113.391140167), Point(x: 0, y: 90)),
  'EPSG:26775': ProjectAndUnProjectResult(
      Point(x: 22518812.462925527, y: 17853127.638236355),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:26776': ProjectAndUnProjectResult(
      Point(x: 22943594.736897018, y: 18119165.906489335),
      Point(x: 17.8880585602815, y: 46.89226404782307)),
  'EPSG:26777': ProjectAndUnProjectResult(
      Point(x: 23889592.3283327, y: 19421907.780755736),
      Point(x: 17.88805856028152, y: 46.89226404782306)),
  'EPSG:26778': ProjectAndUnProjectResult(
      Point(x: 24393896.768239986, y: 19868941.672639795),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:26779': ProjectAndUnProjectResult(
      Point(x: 22848960.712111842, y: 16345831.798596852),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:26780': ProjectAndUnProjectResult(
      Point(x: 23326997.57570648, y: 16896378.328378435),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:26781': ProjectAndUnProjectResult(
      Point(x: 25927143.29020576, y: 19337807.27167928),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:26782': ProjectAndUnProjectResult(
      Point(x: 26477155.263753057, y: 19369312.24598139),
      Point(x: 17.888058560281515, y: 46.892264047823076)),
  'EPSG:26783': ProjectAndUnProjectResult(
      Point(x: 17343759.604607183, y: 15902894.703349115),
      Point(x: 45, y: double.nan)),
  'EPSG:26784': ProjectAndUnProjectResult(
      Point(x: 17250972.18395992, y: 16866957.72867519),
      Point(x: 45, y: double.nan)),
  'EPSG:26785': ProjectAndUnProjectResult(
      Point(x: 20678034.22257629, y: 14685735.761566138),
      Point(x: 17.88805856028152, y: 46.89226404782307)),
  'EPSG:26786': ProjectAndUnProjectResult(
      Point(x: 19140268.795507424, y: 12864448.03351053),
      Point(x: 17.88805856028151, y: 46.89226404782307)),
  'EPSG:26892': ProjectAndUnProjectResult(
      Point(x: 4825851.505324784, y: 11048016.28656974), Point(x: 0, y: 90)),
  'EPSG:26787': ProjectAndUnProjectResult(
      Point(x: 18750822.430482328, y: 12526546.955072846),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:26791': ProjectAndUnProjectResult(
      Point(x: 21151753.880825303, y: 16870587.167903997),
      Point(x: 17.88805856028152, y: 46.89226404782307)),
  'EPSG:26792': ProjectAndUnProjectResult(
      Point(x: 21565252.12495544, y: 17436384.053430807),
      Point(x: 17.88805856028151, y: 46.89226404782307)),
  'EPSG:26793': ProjectAndUnProjectResult(
      Point(x: 22038301.355570488, y: 17770351.21581601),
      Point(x: 17.888058560281486, y: 46.89226404782306)),
  'EPSG:26794': ProjectAndUnProjectResult(
      Point(x: 12057214.824388552, y: 27788400.802656632), Point(x: 0, y: 90)),
  'EPSG:26795': ProjectAndUnProjectResult(
      Point(x: 11194653.329841098, y: 27835975.2390737), Point(x: 0, y: 90)),
  'EPSG:26796': ProjectAndUnProjectResult(
      Point(x: 11093491.156971142, y: 25931923.377611335), Point(x: 0, y: 90)),
  'EPSG:26797': ProjectAndUnProjectResult(
      Point(x: 9794512.315005204, y: 26329833.847854935), Point(x: 0, y: 90)),
  'EPSG:26798': ProjectAndUnProjectResult(
      Point(x: 8328120.0415641805, y: 26520829.504573006), Point(x: 0, y: 90)),
  'EPSG:26799': ProjectAndUnProjectResult(
      Point(x: 29662768.91755508, y: 28917180.301893957),
      Point(x: 17.88805856028151, y: 46.89226404782307)),
  'EPSG:26801': ProjectAndUnProjectResult(
      Point(x: 14429616.480477974, y: 22028709.315239605), Point(x: 0, y: 90)),
  'EPSG:26802': ProjectAndUnProjectResult(
      Point(x: 13577678.151461594, y: 22652832.826277487), Point(x: 0, y: 90)),
  'EPSG:26803': ProjectAndUnProjectResult(
      Point(x: 12102529.07213264, y: 23460255.289536115), Point(x: 0, y: 90)),
  'EPSG:26811': ProjectAndUnProjectResult(
      Point(x: 21215023.027044676, y: 15731565.521262055),
      Point(x: 17.88805856028151, y: 46.892264129593656)),
  'EPSG:26812': ProjectAndUnProjectResult(
      Point(x: 21319915.08622336, y: 15395522.531160455),
      Point(x: 17.888058560281515, y: 46.892264129593634)),
  'EPSG:26813': ProjectAndUnProjectResult(
      Point(x: 21773902.390169054, y: 15701857.748695193),
      Point(x: 17.88805856028151, y: 46.892264129593656)),
  'EPSG:26814': ProjectAndUnProjectResult(
      Point(x: 5434242.727510438, y: 4865567.286727372),
      Point(x: -3577911303.5949883, y: 784422263.488511)),
  'EPSG:26815': ProjectAndUnProjectResult(
      Point(x: 6005972.529556511, y: 5140915.469168544),
      Point(x: -2514978608650.738, y: 548342325600.6209)),
  'EPSG:26819': ProjectAndUnProjectResult(
      Point(x: 6637522.089350602, y: 5241976.733272179),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26820': ProjectAndUnProjectResult(
      Point(x: 6763552.011152685, y: 5414428.169772497),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:26821': ProjectAndUnProjectResult(
      Point(x: 6907731.667209977, y: 5516216.609631911),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26822': ProjectAndUnProjectResult(
      Point(x: 6975000.373442961, y: 6039872.843451777),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:26823': ProjectAndUnProjectResult(
      Point(x: 8070078.612677592, y: 4608732.256874052),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26824': ProjectAndUnProjectResult(
      Point(x: 8228607.275988375, y: 4799756.489364472),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26825': ProjectAndUnProjectResult(
      Point(x: 5434242.727510438, y: 4865567.286727372),
      Point(x: -3577911303.5949883, y: 784422263.488511)),
  'EPSG:26893': ProjectAndUnProjectResult(
      Point(x: 4511768.526647326, y: 11340922.422261257), Point(x: 0, y: 90)),
  'EPSG:26826': ProjectAndUnProjectResult(
      Point(x: 6005972.529556511, y: 5140915.469168544),
      Point(x: -2514978608650.738, y: 548342325600.6209)),
  'EPSG:26830': ProjectAndUnProjectResult(
      Point(x: 6637522.089350602, y: 5241976.733272179),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26831': ProjectAndUnProjectResult(
      Point(x: 6763552.011152685, y: 5414428.169772497),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:26832': ProjectAndUnProjectResult(
      Point(x: 6907731.667209977, y: 5516216.609631911),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26833': ProjectAndUnProjectResult(
      Point(x: 6975000.373442961, y: 6039872.843451777),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:26834': ProjectAndUnProjectResult(
      Point(x: 8070078.612677592, y: 4608732.256874052),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26835': ProjectAndUnProjectResult(
      Point(x: 8228607.275988375, y: 4799756.489364472),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26836': ProjectAndUnProjectResult(
      Point(x: 5434242.727510438, y: 4865567.286727372),
      Point(x: -3577911303.5949883, y: 784422263.488511)),
  'EPSG:26837': ProjectAndUnProjectResult(
      Point(x: 6005972.529556511, y: 5140915.469168544),
      Point(x: -2514978608650.738, y: 548342325600.6209)),
  'EPSG:26841': ProjectAndUnProjectResult(
      Point(x: 6637522.089350602, y: 5241976.733272179),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26842': ProjectAndUnProjectResult(
      Point(x: 6763552.011152685, y: 5414428.169772497),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:26843': ProjectAndUnProjectResult(
      Point(x: 6907731.667209977, y: 5516216.609631911),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26844': ProjectAndUnProjectResult(
      Point(x: 6975000.373442961, y: 6039872.843451777),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:26845': ProjectAndUnProjectResult(
      Point(x: 8070078.612677592, y: 4608732.256874052),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26846': ProjectAndUnProjectResult(
      Point(x: 8228607.275988375, y: 4799756.489364472),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26847': ProjectAndUnProjectResult(
      Point(x: 17828844.681840498, y: 15963115.339871386),
      Point(x: -3577911303.5949883, y: 784422263.488511)),
  'EPSG:26848': ProjectAndUnProjectResult(
      Point(x: 19704594.87405332, y: 16866486.83509713),
      Point(x: -2514978608650.738, y: 548342325600.6209)),
  'EPSG:26849': ProjectAndUnProjectResult(
      Point(x: 21776603.721477766, y: 17198051.99907714),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26850': ProjectAndUnProjectResult(
      Point(x: 22190086.889923435, y: 17763836.420328602),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:26851': ProjectAndUnProjectResult(
      Point(x: 22663116.311504737, y: 18097787.326767363),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26852': ProjectAndUnProjectResult(
      Point(x: 22883813.725204114, y: 19815816.15389137),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:26853': ProjectAndUnProjectResult(
      Point(x: 21986762.4984264, y: 15120482.412760952),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26854': ProjectAndUnProjectResult(
      Point(x: 22506868.621305194, y: 15747201.08218994),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26855': ProjectAndUnProjectResult(
      Point(x: 17828844.681840498, y: 15963115.339871386),
      Point(x: -3577911303.5949883, y: 784422263.488511)),
  'EPSG:32613': ProjectAndUnProjectResult(
      Point(x: -465963.852572312, y: 11963247.506934201), Point(x: 0, y: 90)),
  'EPSG:26856': ProjectAndUnProjectResult(
      Point(x: 19704594.87405332, y: 16866486.83509713),
      Point(x: -2514978608650.738, y: 548342325600.6209)),
  'EPSG:26857': ProjectAndUnProjectResult(
      Point(x: 21776603.721477766, y: 17198051.99907714),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26858': ProjectAndUnProjectResult(
      Point(x: 22190086.889923435, y: 17763836.420328602),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:26859': ProjectAndUnProjectResult(
      Point(x: 22663116.311504737, y: 18097787.326767363),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26860': ProjectAndUnProjectResult(
      Point(x: 22883813.725204114, y: 19815816.15389137),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:26861': ProjectAndUnProjectResult(
      Point(x: 21986762.4984264, y: 15120482.412760952),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26862': ProjectAndUnProjectResult(
      Point(x: 22506868.621305194, y: 15747201.08218994),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26863': ProjectAndUnProjectResult(
      Point(x: 17828844.681840498, y: 15963115.339871386),
      Point(x: -3577911303.5949883, y: 784422263.488511)),
  'EPSG:26864': ProjectAndUnProjectResult(
      Point(x: 19704594.87405332, y: 16866486.83509713),
      Point(x: -2514978608650.738, y: 548342325600.6209)),
  'EPSG:26865': ProjectAndUnProjectResult(
      Point(x: 21776603.721477766, y: 17198051.99907714),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26866': ProjectAndUnProjectResult(
      Point(x: 22190086.889923435, y: 17763836.420328602),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:26867': ProjectAndUnProjectResult(
      Point(x: 22663116.311504737, y: 18097787.326767363),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26868': ProjectAndUnProjectResult(
      Point(x: 22883813.725204114, y: 19815816.15389137),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:26869': ProjectAndUnProjectResult(
      Point(x: 21986762.4984264, y: 15120482.412760952),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26870': ProjectAndUnProjectResult(
      Point(x: 22506868.621305194, y: 15747201.08218994),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26891': ProjectAndUnProjectResult(
      Point(x: 4678521.605919208, y: 11197258.627550166), Point(x: 0, y: 90)),
  'EPSG:26894': ProjectAndUnProjectResult(
      Point(x: 4115096.9499727935, y: 11607101.102096744), Point(x: 0, y: 90)),
  'EPSG:26895': ProjectAndUnProjectResult(
      Point(x: 3625418.58528727, y: 11836768.953508014), Point(x: 0, y: 90)),
  'EPSG:26896': ProjectAndUnProjectResult(
      Point(x: 3031257.7643432096, y: 12018479.462197395), Point(x: 0, y: 90)),
  'EPSG:26897': ProjectAndUnProjectResult(
      Point(x: 2319999.2891139016, y: 12138921.625162058), Point(x: 0, y: 90)),
  'EPSG:26898': ProjectAndUnProjectResult(
      Point(x: 5186788.657734889, y: 8120071.285067176),
      Point(x: -5022.218661072394, y: 1175.203638907414)),
  'EPSG:26899': ProjectAndUnProjectResult(
      Point(x: 5293828.222920929, y: 8403290.068502737),
      Point(x: -20392.421758802197, y: 4476.186579255094)),
  'EPSG:26901': ProjectAndUnProjectResult(
      Point(x: 48730994.20351042, y: -23178134.332903616), Point(x: 0, y: -90)),
  'EPSG:26902': ProjectAndUnProjectResult(
      Point(x: 63333518.09556754, y: -38676678.41783912), Point(x: 0, y: -90)),
  'EPSG:26903': ProjectAndUnProjectResult(
      Point(x: 81069695.4839798, y: -59099747.1391181), Point(x: 0, y: -90)),
  'EPSG:26904': ProjectAndUnProjectResult(
      Point(x: -79345537.23281473, y: -58236069.63248695), Point(x: 0, y: -90)),
  'EPSG:26905': ProjectAndUnProjectResult(
      Point(x: -61735465.01028672, y: -38016576.899930514),
      Point(x: 0, y: -90)),
  'EPSG:26906': ProjectAndUnProjectResult(
      Point(x: -47240401.76333124, y: -22681647.638609204),
      Point(x: 0, y: -90)),
  'EPSG:26907': ProjectAndUnProjectResult(
      Point(x: -35393329.62055659, y: -11254044.783678558),
      Point(x: 0, y: -90)),
  'EPSG:26908': ProjectAndUnProjectResult(
      Point(x: -25785988.545412734, y: -2920563.7794431755),
      Point(x: 72517.82979839807, y: -135482.78856909208)),
  'EPSG:26909': ProjectAndUnProjectResult(
      Point(x: -18063024.2834307, y: 2990541.0425813603),
      Point(x: 5728.679566272616, y: 8118.480468517206)),
  'EPSG:26910': ProjectAndUnProjectResult(
      Point(x: -11916549.256324729, y: 7029722.072663035),
      Point(x: 169423.46825792477, y: 95274.64648021963)),
  'EPSG:26911': ProjectAndUnProjectResult(
      Point(x: -7081100.809078519, y: 9644074.035715306),
      Point(x: 16894389367.285646, y: 5473429537.796183)),
  'EPSG:26912': ProjectAndUnProjectResult(
      Point(x: -3328981.2161364346, y: 11193210.773121612), Point(x: 0, y: 90)),
  'EPSG:26913': ProjectAndUnProjectResult(
      Point(x: -465963.8528201919, y: 11963247.506900493), Point(x: 0, y: 90)),
  'EPSG:26914': ProjectAndUnProjectResult(
      Point(x: 1672650.061907484, y: 12179046.047871836), Point(x: 0, y: 90)),
  'EPSG:26915': ProjectAndUnProjectResult(
      Point(x: 3225639.745211993, y: 12014873.557768293), Point(x: 0, y: 90)),
  'EPSG:26916': ProjectAndUnProjectResult(
      Point(x: 4309153.746567462, y: 11603618.623518256), Point(x: 0, y: 90)),
  'EPSG:26917': ProjectAndUnProjectResult(
      Point(x: 5019695.054228077, y: 11044701.550210133), Point(x: 0, y: 90)),
  'EPSG:26918': ProjectAndUnProjectResult(
      Point(x: 5436818.00586931, y: 10410808.927530395), Point(x: 0, y: 90)),
  'EPSG:26919': ProjectAndUnProjectResult(
      Point(x: 5625552.597278097, y: 9753575.672750814),
      Point(x: -14563147143.452982, y: 3188443837.820243)),
  'EPSG:26920': ProjectAndUnProjectResult(
      Point(x: 5638571.782971076, y: 9108330.901623307),
      Point(x: -1685042.2535846238, y: 369929.7983349917)),
  'EPSG:26921': ProjectAndUnProjectResult(
      Point(x: 5518117.362620078, y: 8498017.126823647),
      Point(x: -33811.09013364492, y: 7380.196889868285)),
  'EPSG:26922': ProjectAndUnProjectResult(
      Point(x: 5297700.047163907, y: 7936385.43186829),
      Point(x: -2039.797629755838, y: 544.0590624611513)),
  'EPSG:26923': ProjectAndUnProjectResult(
      Point(x: 5003589.298485577, y: 7430562.416711468),
      Point(x: 87.06844226328268, y: 103.32192587414212)),
  'EPSG:26929': ProjectAndUnProjectResult(
      Point(x: 4175252.6559100477, y: 8132636.419234506), Point(x: 0, y: 90)),
  'EPSG:26930': ProjectAndUnProjectResult(
      Point(x: 4335563.615183162, y: 8328698.3072116645), Point(x: 0, y: 90)),
  'EPSG:26931': ProjectAndUnProjectResult(
      Point(x: 6508725.5759530235, y: 4717646.787048834),
      Point(x: 17.88805856028155, y: 46.89226406700871)),
  'EPSG:26932': ProjectAndUnProjectResult(
      Point(x: -37213279.522647545, y: -18912875.961270504),
      Point(x: 0, y: -90)),
  'EPSG:26933': ProjectAndUnProjectResult(
      Point(x: -45107405.43757957, y: -26521048.301904406),
      Point(x: 0, y: -90)),
  'EPSG:26934': ProjectAndUnProjectResult(
      Point(x: -54145589.80520173, y: -35798007.60070698), Point(x: 0, y: -90)),
  'EPSG:26935': ProjectAndUnProjectResult(
      Point(x: -64460118.121024735, y: -47015897.944632985),
      Point(x: 0, y: -90)),
  'EPSG:26936': ProjectAndUnProjectResult(
      Point(x: -76195487.58152132, y: -60481645.41980923), Point(x: 0, y: -90)),
  'EPSG:26937': ProjectAndUnProjectResult(
      Point(x: -89509253.44187886, y: -76540389.67400539), Point(x: 0, y: -90)),
  'EPSG:26938': ProjectAndUnProjectResult(
      Point(x: 77897438.88146861, y: -61308557.825420626), Point(x: 0, y: -90)),
  'EPSG:26939': ProjectAndUnProjectResult(
      Point(x: 66078013.4794075, y: -47707169.16826724), Point(x: 0, y: -90)),
  'EPSG:26940': ProjectAndUnProjectResult(
      Point(x: -3067782.7230528235, y: 8760315.521445647),
      Point(x: 17.888058560281486, y: 46.89226406700873)),
  'EPSG:26941': ProjectAndUnProjectResult(
      Point(x: 8713369.04628296, y: 8228903.974584526),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26942': ProjectAndUnProjectResult(
      Point(x: 8988852.870882323, y: 8299543.835321399),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:26943': ProjectAndUnProjectResult(
      Point(x: 9196533.03998033, y: 8221416.367224062),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26944': ProjectAndUnProjectResult(
      Point(x: 9364631.99275643, y: 8154335.033546976),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:26945': ProjectAndUnProjectResult(
      Point(x: 9657012.346788008, y: 8138321.005032831),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26946': ProjectAndUnProjectResult(
      Point(x: 9857792.552179694, y: 8039982.800465539),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:26948': ProjectAndUnProjectResult(
      Point(x: -3169861.026850693, y: 7913822.186592112), Point(x: 0, y: 90)),
  'EPSG:26949': ProjectAndUnProjectResult(
      Point(x: -4128150.708307095, y: 7585988.433132556), Point(x: 0, y: 90)),
  'EPSG:26950': ProjectAndUnProjectResult(
      Point(x: -5215796.690656631, y: 7168396.858414973), Point(x: 0, y: 90)),
  'EPSG:26951': ProjectAndUnProjectResult(
      Point(x: 7280845.10476574, y: 5698018.880729793),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26952': ProjectAndUnProjectResult(
      Point(x: 7441828.743390062, y: 6181711.961229637),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26953': ProjectAndUnProjectResult(
      Point(x: 7609906.701740923, y: 6737108.930826646),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26954': ProjectAndUnProjectResult(
      Point(x: 7746779.736843174, y: 6828729.263310314),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26955': ProjectAndUnProjectResult(
      Point(x: 7902404.853652807, y: 6873456.4247696595),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26956': ProjectAndUnProjectResult(
      Point(x: 6039095.133709748, y: 4143749.064976011),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:26957': ProjectAndUnProjectResult(
      Point(x: 5117848.770438616, y: 6252732.387920412), Point(x: 0, y: 90)),
  'EPSG:26958': ProjectAndUnProjectResult(
      Point(x: 4721237.687280814, y: 8356420.754737286), Point(x: 0, y: 90)),
  'EPSG:26959': ProjectAndUnProjectResult(
      Point(x: 4625113.957471083, y: 8456488.815026179), Point(x: 0, y: 90)),
  'EPSG:26960': ProjectAndUnProjectResult(
      Point(x: 7714848.02247523, y: 5442253.479619011),
      Point(x: 17.8880585602815, y: 46.89226406700873)),
  'EPSG:26961': ProjectAndUnProjectResult(
      Point(x: -68690821.23140611, y: -47885351.84872058), Point(x: 0, y: -90)),
  'EPSG:26962': ProjectAndUnProjectResult(
      Point(x: -72121220.72359695, y: -51990013.836311065),
      Point(x: 0, y: -90)),
  'EPSG:26963': ProjectAndUnProjectResult(
      Point(x: -76202390.86573209, y: -56842739.61567939), Point(x: 0, y: -90)),
  'EPSG:26964': ProjectAndUnProjectResult(
      Point(x: -81001618.96536075, y: -62615395.648396604),
      Point(x: 0, y: -90)),
  'EPSG:26965': ProjectAndUnProjectResult(
      Point(x: -83208947.34861997, y: -65252448.177499056),
      Point(x: 0, y: -90)),
  'EPSG:26966': ProjectAndUnProjectResult(
      Point(x: 4608098.742447868, y: 7844758.075159398), Point(x: 0, y: 90)),
  'EPSG:26967': ProjectAndUnProjectResult(
      Point(x: 4887189.5243078265, y: 8036713.270922709), Point(x: 0, y: 90)),
  'EPSG:26968': ProjectAndUnProjectResult(
      Point(x: -4284867.971020522, y: 6350434.242753448), Point(x: 0, y: 90)),
  'EPSG:32614': ProjectAndUnProjectResult(
      Point(x: 1672650.0620793512, y: 12179046.047896666), Point(x: 0, y: 90)),
  'EPSG:26969': ProjectAndUnProjectResult(
      Point(x: -5084440.623114015, y: 5921630.496325042), Point(x: 0, y: 90)),
  'EPSG:26970': ProjectAndUnProjectResult(
      Point(x: -5919234.386603765, y: 5433186.325411458), Point(x: 0, y: 90)),
  'EPSG:26971': ProjectAndUnProjectResult(
      Point(x: 3905071.6147695784, y: 7655783.660641345), Point(x: 0, y: 90)),
  'EPSG:26972': ProjectAndUnProjectResult(
      Point(x: 3990597.385999085, y: 7789443.487367855), Point(x: 0, y: 90)),
  'EPSG:26973': ProjectAndUnProjectResult(
      Point(x: 4097701.446227201, y: 7591591.6682478), Point(x: 0, y: 90)),
  'EPSG:26974': ProjectAndUnProjectResult(
      Point(x: 4698254.479714725, y: 7712933.359383934), Point(x: 0, y: 90)),
  'EPSG:26975': ProjectAndUnProjectResult(
      Point(x: 7754185.385967116, y: 6441441.897699313),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:26976': ProjectAndUnProjectResult(
      Point(x: 6883654.037123509, y: 5522527.676852138),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26977': ProjectAndUnProjectResult(
      Point(x: 7071987.862697571, y: 5919601.754797991),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:26978': ProjectAndUnProjectResult(
      Point(x: 7225695.016863069, y: 6455856.986343259),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:26979': ProjectAndUnProjectResult(
      Point(x: 6895333.619676103, y: 4953881.754771346),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26980': ProjectAndUnProjectResult(
      Point(x: 7000500.0764196385, y: 5649813.9503045585),
      Point(x: 17.88805856028154, y: 46.89226406700873)),
  'EPSG:26981': ProjectAndUnProjectResult(
      Point(x: 8293004.335917232, y: 5912444.595764324),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:26982': ProjectAndUnProjectResult(
      Point(x: 8460640.04761491, y: 5922044.6080015665),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26983': ProjectAndUnProjectResult(
      Point(x: 5434242.727510438, y: 4865567.286727372),
      Point(x: -3577911303.5949883, y: 784422263.488511)),
  'EPSG:26984': ProjectAndUnProjectResult(
      Point(x: 6005972.529556511, y: 5140915.469168544),
      Point(x: -2514978608650.738, y: 548342325600.6209)),
  'EPSG:26985': ProjectAndUnProjectResult(
      Point(x: 6458859.816901178, y: 4494509.018460154),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:26986': ProjectAndUnProjectResult(
      Point(x: 5851118.614199274, y: 4670879.245324666),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:26987': ProjectAndUnProjectResult(
      Point(x: 6154332.406766824, y: 3817884.2153315847),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:26988': ProjectAndUnProjectResult(
      Point(x: 13856577.937746815, y: 4794610.454685856),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:26989': ProjectAndUnProjectResult(
      Point(x: 11889319.027601004, y: 4694603.857861964),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:26990': ProjectAndUnProjectResult(
      Point(x: 10027794.9275133, y: 4787933.322479354),
      Point(x: 17.8880585602815, y: 46.892264067008746)),
  'EPSG:26991': ProjectAndUnProjectResult(
      Point(x: 6637522.089340442, y: 5241976.733282339),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26992': ProjectAndUnProjectResult(
      Point(x: 6763552.011142525, y: 5414428.169782657),
      Point(x: 17.88805856028151, y: 46.89226406700874)),
  'EPSG:26993': ProjectAndUnProjectResult(
      Point(x: 6907731.6671998175, y: 5516216.609642071),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:26994': ProjectAndUnProjectResult(
      Point(x: 3822984.905080838, y: 8488545.1484227), Point(x: 0, y: 90)),
  'EPSG:26995': ProjectAndUnProjectResult(
      Point(x: 3960143.9403490187, y: 8595620.856387978), Point(x: 0, y: 90)),
  'EPSG:26996': ProjectAndUnProjectResult(
      Point(x: 3479281.287680031, y: 7904330.11893151), Point(x: 0, y: 90)),
  'EPSG:26997': ProjectAndUnProjectResult(
      Point(x: 3333355.4118026467, y: 8025679.559234873), Point(x: 0, y: 90)),
  'EPSG:26998': ProjectAndUnProjectResult(
      Point(x: 3236399.2997552953, y: 8083966.915915788), Point(x: 0, y: 90)),
  'EPSG:27037': ProjectAndUnProjectResult(
      Point(x: -1105163.3147502157, y: 5413501.26188523),
      Point(x: 17.88850887204102, y: 46.892290624931455)),
  'EPSG:27038': ProjectAndUnProjectResult(
      Point(x: -1557607.1933950623, y: 5561511.859134797),
      Point(x: 17.893397470701654, y: 46.89274230369994)),
  'EPSG:27039': ProjectAndUnProjectResult(
      Point(x: -2005604.9479094096, y: 5751467.316115433),
      Point(x: 17.930921212100404, y: 46.897078219371416)),
  'EPSG:27040': ProjectAndUnProjectResult(
      Point(x: -2446199.8302739533, y: 5986575.181009082),
      Point(x: 18.163146226492398, y: 46.92853958365331)),
  'EPSG:27120': ProjectAndUnProjectResult(
      Point(x: 5638670.724266193, y: 9108144.693498828),
      Point(x: 45, y: double.nan)),
  'EPSG:27200': ProjectAndUnProjectResult(
      Point(x: -458846823476502, y: 143249613978264.16),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27429': ProjectAndUnProjectResult(
      Point(x: 2540669.110000123, y: 5555682.856045014),
      Point(x: 17.88315140500048, y: 46.892699335407094)),
  'EPSG:27205': ProjectAndUnProjectResult(
      Point(x: 32752966.138749998, y: -3371109.7126332065),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27206': ProjectAndUnProjectResult(
      Point(x: 35661932.30867676, y: -5877891.2530352175),
      Point(x: 8.586443064075317, y: -89.99943361752067)),
  'EPSG:27207': ProjectAndUnProjectResult(
      Point(x: 38221517.530041166, y: -8140850.70342716),
      Point(x: 8.586443064075317, y: -89.99943361752067)),
  'EPSG:27208': ProjectAndUnProjectResult(
      Point(x: 36028211.530873895, y: -6002034.59526986),
      Point(x: 8.586443064075317, y: -89.99943361752067)),
  'EPSG:27209': ProjectAndUnProjectResult(
      Point(x: 31876098.954083707, y: -2348599.2591612106),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27210': ProjectAndUnProjectResult(
      Point(x: 34229614.12892453, y: -4389697.6416421635),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27211': ProjectAndUnProjectResult(
      Point(x: 33970697.79220577, y: -4076899.675460361),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27212': ProjectAndUnProjectResult(
      Point(x: 34242110.9571065, y: -4243992.639892085),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32615': ProjectAndUnProjectResult(
      Point(x: 3225639.745324246, y: 12014873.557791939), Point(x: 0, y: 90)),
  'EPSG:27213': ProjectAndUnProjectResult(
      Point(x: 32776566.036459737, y: -2898602.7486160733),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27214': ProjectAndUnProjectResult(
      Point(x: 29415876.30092016, y: -56216.4287707248),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27215': ProjectAndUnProjectResult(
      Point(x: 30391259.787342537, y: -825746.5887205349),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27216': ProjectAndUnProjectResult(
      Point(x: 28558918.972914487, y: 729838.2461928133),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27217': ProjectAndUnProjectResult(
      Point(x: 27771259.13318199, y: 1444248.6388693207),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27218': ProjectAndUnProjectResult(
      Point(x: 27724737.578027647, y: 1540888.4560405558),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27219': ProjectAndUnProjectResult(
      Point(x: 29938864.699345432, y: -281599.5912726079),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27220': ProjectAndUnProjectResult(
      Point(x: 31188985.865262844, y: -1483479.0449241777),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28348': ProjectAndUnProjectResult(
      Point(x: -4621959.250494171, y: 19778061.493694857),
      Point(x: 30362279619.504566, y: 6642887099.3340845)),
  'EPSG:27221': ProjectAndUnProjectResult(
      Point(x: 26892054.855501864, y: 2288201.747129887),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27222': ProjectAndUnProjectResult(
      Point(x: 25865522.98551159, y: 3147442.878888669),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27223': ProjectAndUnProjectResult(
      Point(x: 23603528.30360759, y: 5036671.048549576),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27224': ProjectAndUnProjectResult(
      Point(x: 29500751.12892391, y: 191270.50092785468),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27225': ProjectAndUnProjectResult(
      Point(x: 27446587.082927264, y: 1928111.7779986237),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27226': ProjectAndUnProjectResult(
      Point(x: 27003953.49389428, y: 2364923.664651798),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27227': ProjectAndUnProjectResult(
      Point(x: 24764052.09763393, y: 4209076.159203182),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27228': ProjectAndUnProjectResult(
      Point(x: 23329308.710230745, y: 5377925.025070474),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32616': ProjectAndUnProjectResult(
      Point(x: 4309153.746633765, y: 11603618.623545988), Point(x: 0, y: 90)),
  'EPSG:27229': ProjectAndUnProjectResult(
      Point(x: 22471791.834583294, y: 6085085.508028565),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27230': ProjectAndUnProjectResult(
      Point(x: 26387042.29765395, y: 3025828.555928605),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27231': ProjectAndUnProjectResult(
      Point(x: 25895033.691918638, y: 3428445.71100931),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27232': ProjectAndUnProjectResult(
      Point(x: 23256013.183239985, y: 5597734.430803449),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27258': ProjectAndUnProjectResult(
      Point(x: 19322413.243512526, y: 12806768.741632633),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27259': ProjectAndUnProjectResult(
      Point(x: 27110353.50515705, y: 6815589.614981266),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27260': ProjectAndUnProjectResult(
      Point(x: 36795154.37310264, y: -1620848.854066819),
      Point(x: 8.586443064075317, y: -89.99943361752067)),
  'EPSG:27291': ProjectAndUnProjectResult(
      Point(x: 37144909.98928231, y: -4994674.004096187),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28349': ProjectAndUnProjectResult(
      Point(x: -4425719.246305057, y: 20435146.71752043), Point(x: 0, y: 90)),
  'EPSG:27292': ProjectAndUnProjectResult(
      Point(x: 30411811.92702717, y: 1688561.978554066),
      Point(x: double.nan, y: double.nan)),
  'EPSG:27391': ProjectAndUnProjectResult(
      Point(x: 1715084.4585314705, y: -983306.4224261448),
      Point(x: 17.887199738748766, y: 46.89232235182057)),
  'EPSG:27392': ProjectAndUnProjectResult(
      Point(x: 1538547.7742745737, y: -1033810.8960379238),
      Point(x: 17.887760861003997, y: 46.892279958991026)),
  'EPSG:27393': ProjectAndUnProjectResult(
      Point(x: 1361669.6922984645, y: -1078435.125944821),
      Point(x: 17.887966506982153, y: 46.89226723653312)),
  'EPSG:27394': ProjectAndUnProjectResult(
      Point(x: 1171862.8996905428, y: -1119866.2517817772),
      Point(x: 17.888036431534832, y: 46.89226416935776)),
  'EPSG:27395': ProjectAndUnProjectResult(
      Point(x: 893077.1626558253, y: -1168969.405049719),
      Point(x: 17.88805684622832, y: 46.89226392338157)),
  'EPSG:27396': ProjectAndUnProjectResult(
      Point(x: 588585.2342967412, y: -1207084.3363192128),
      Point(x: 17.888058529996258, y: 46.892264059052046)),
  'EPSG:27397': ProjectAndUnProjectResult(
      Point(x: 283877.0762681974, y: -1229396.3191184194),
      Point(x: 17.88805856215833, y: 46.892264076722405)),
  'EPSG:27398': ProjectAndUnProjectResult(
      Point(x: -33625.73693174917, y: -1236043.9250323477),
      Point(x: 17.88805856210612, y: 46.89226407696183)),
  'EPSG:27492': ProjectAndUnProjectResult(
      Point(x: 1976377.7231515201, y: 1141502.2166061795),
      Point(x: 17.8845328124321, y: 46.89256349786412)),
  'EPSG:27493': ProjectAndUnProjectResult(
      Point(x: 1976377.7231515201, y: 1141502.2166061795),
      Point(x: 17.8845328124321, y: 46.89256349786412)),
  'EPSG:32617': ProjectAndUnProjectResult(
      Point(x: 5019695.054259717, y: 11044701.550245335), Point(x: 0, y: 90)),
  'EPSG:27700': ProjectAndUnProjectResult(
      Point(x: 1912625.1077145399, y: -138902.14835901326),
      Point(x: 17.887804967077802, y: 46.89227699578946)),
  'EPSG:28191': ProjectAndUnProjectResult(
      Point(x: -1139644.8678987788, y: 1957397.2449441436),
      Point(x: 17.90819181550383, y: 46.892518132305234)),
  'EPSG:28192': ProjectAndUnProjectResult(
      Point(x: -1148621.110313324, y: 2957398.297650235),
      Point(x: 17.88812625153329, y: 46.89226592347)),
  'EPSG:28193': ProjectAndUnProjectResult(
      Point(x: -1139644.8678987788, y: 2957397.2449441436),
      Point(x: 17.90819181550383, y: 46.892518132305234)),
  'EPSG:28232': ProjectAndUnProjectResult(
      Point(x: 1176777.1104446927, y: 15231806.045606805),
      Point(x: 17.888058507788223, y: 46.89226378714723)),
  'EPSG:32618': ProjectAndUnProjectResult(
      Point(x: 5436818.00587551, y: 10410808.927574996), Point(x: 0, y: 90)),
  'EPSG:28350': ProjectAndUnProjectResult(
      Point(x: -3998899.011053183, y: 21067284.300468326), Point(x: 0, y: 90)),
  'EPSG:28351': ProjectAndUnProjectResult(
      Point(x: -3275967.0652893055, y: 21622144.51821889), Point(x: 0, y: 90)),
  'EPSG:28352': ProjectAndUnProjectResult(
      Point(x: -2176781.840373538, y: 22026151.47139568), Point(x: 0, y: 90)),
  'EPSG:28353': ProjectAndUnProjectResult(
      Point(x: -604157.4780445739, y: 22178763.901223246), Point(x: 0, y: 90)),
  'EPSG:28354': ProjectAndUnProjectResult(
      Point(x: 1558843.5538291563, y: 21945699.007619552), Point(x: 0, y: 90)),
  'EPSG:28355': ProjectAndUnProjectResult(
      Point(x: 4451906.623195637, y: 21150975.810983855), Point(x: 0, y: 90)),
  'EPSG:28356': ProjectAndUnProjectResult(
      Point(x: 8240765.467341783, y: 19567647.747223884),
      Point(x: -4967267525.630645, y: 1643558557.1708994)),
  'EPSG:28357': ProjectAndUnProjectResult(
      Point(x: 13120822.691871341, y: 16907087.333848983),
      Point(x: -142413.85807935635, y: 81938.05169573172)),
  'EPSG:28358': ProjectAndUnProjectResult(
      Point(x: 19321105.829017498, y: 12806678.893239),
      Point(x: -5175.116548601758, y: 7749.823533021951)),
  'EPSG:28402': ProjectAndUnProjectResult(
      Point(x: 3177294.72790871, y: 5233919.735428686),
      Point(x: 17.888058445097446, y: 46.89226402884926)),
  'EPSG:28403': ProjectAndUnProjectResult(
      Point(x: 3720218.009910196, y: 5199465.397656718),
      Point(x: 17.888058570193113, y: 46.892264068397665)),
  'EPSG:28404': ProjectAndUnProjectResult(
      Point(x: 4262975.20337605, y: 5200108.455837973),
      Point(x: 17.88805857014421, y: 46.89226406836862)),
  'EPSG:28405': ProjectAndUnProjectResult(
      Point(x: 4805911.715875769, y: 5235861.690128276),
      Point(x: 17.88805872826832, y: 46.89226402317326)),
  'EPSG:28406': ProjectAndUnProjectResult(
      Point(x: 5349464.219565769, y: 5307432.332827369),
      Point(x: 17.88807716440437, y: 46.89226406138663)),
  'EPSG:28407': ProjectAndUnProjectResult(
      Point(x: 5894344.749181083, y: 5416215.45576819),
      Point(x: 17.888508865759512, y: 46.89229074905092)),
  'EPSG:28408': ProjectAndUnProjectResult(
      Point(x: 6441748.486232372, y: 5564273.862147296),
      Point(x: 17.893396730554738, y: 46.89274276585422)),
  'EPSG:28409': ProjectAndUnProjectResult(
      Point(x: 6993600.829069106, y: 5754290.647735119),
      Point(x: 17.930913287470414, y: 46.89707909919423)),
  'EPSG:28410': ProjectAndUnProjectResult(
      Point(x: 7552859.348469822, y: 5989473.74186563),
      Point(x: 18.163088321316437, y: 46.92853762419354)),
  'EPSG:28411': ProjectAndUnProjectResult(
      Point(x: 8123886.228420295, y: 6273384.884065807),
      Point(x: 19.45399395295535, y: 47.12655335465394)),
  'EPSG:28412': ProjectAndUnProjectResult(
      Point(x: 8712906.791740527, y: 6609658.637646196),
      Point(x: 26.45363795646325, y: 48.31390228746322)),
  'EPSG:28413': ProjectAndUnProjectResult(
      Point(x: 9328569.71022142, y: 7001570.187034681),
      Point(x: 66.44713781539414, y: 55.68176796175009)),
  'EPSG:28414': ProjectAndUnProjectResult(
      Point(x: 9982624.498931983, y: 7451403.811096456),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28415': ProjectAndUnProjectResult(
      Point(x: 10690731.894358002, y: 7959567.070144047),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28416': ProjectAndUnProjectResult(
      Point(x: 11473422.716032978, y: 8523388.889802082),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28417': ProjectAndUnProjectResult(
      Point(x: 12357220.811322264, y: 9135532.870352365),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28418': ProjectAndUnProjectResult(
      Point(x: 13375945.683021259, y: 9781950.295645684),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28419': ProjectAndUnProjectResult(
      Point(x: 14572210.399428502, y: 10439290.461127605),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:28420': ProjectAndUnProjectResult(
      Point(x: 15999130.386554603, y: 11071679.08598643),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:28421': ProjectAndUnProjectResult(
      Point(x: 17722258.702127807, y: 11626768.71989223),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:28422': ProjectAndUnProjectResult(
      Point(x: 19821763.391057152, y: 12030958.200256905),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:28423': ProjectAndUnProjectResult(
      Point(x: 22394862.522014026, y: 12183671.361405866),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:28424': ProjectAndUnProjectResult(
      Point(x: 25558532.504793, y: 11950578.342513002),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:28425': ProjectAndUnProjectResult(
      Point(x: 29452505.288112894, y: 11155635.986611271),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:28426': ProjectAndUnProjectResult(
      Point(x: 34242570.03751882, y: 9571816.968452249),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28427': ProjectAndUnProjectResult(
      Point(x: 40124194.89304626, y: 6910390.434448714),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28428': ProjectAndUnProjectResult(
      Point(x: 47326484.40630764, y: 2808610.083395421),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28429': ProjectAndUnProjectResult(
      Point(x: 56116488.25666316, y: -3184341.2378764953),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28430': ProjectAndUnProjectResult(
      Point(x: 66803876.84613541, y: -11623308.20429408),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:28431': ProjectAndUnProjectResult(
      Point(x: 79745999.37273005, y: -23185185.58270928),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:28432': ProjectAndUnProjectResult(
      Point(x: 95353339.98182249, y: -38689178.19189904),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:28462': ProjectAndUnProjectResult(
      Point(x: 1177294.7279087103, y: 5233919.735428686),
      Point(x: 17.88805844509745, y: 46.89226402884926)),
  'EPSG:28463': ProjectAndUnProjectResult(
      Point(x: 720218.0099101962, y: 5199465.397656718),
      Point(x: 17.888058570193113, y: 46.892264068397665)),
  'EPSG:28464': ProjectAndUnProjectResult(
      Point(x: 262975.2033760503, y: 5200108.455837973),
      Point(x: 17.88805857014421, y: 46.89226406836862)),
  'EPSG:28465': ProjectAndUnProjectResult(
      Point(x: -194088.28412423097, y: 5235861.690128276),
      Point(x: 17.88805872826832, y: 46.89226402317326)),
  'EPSG:28466': ProjectAndUnProjectResult(
      Point(x: -650535.7804342315, y: 5307432.332827369),
      Point(x: 17.88807716440437, y: 46.89226406138663)),
  'EPSG:28467': ProjectAndUnProjectResult(
      Point(x: -1105655.2508189164, y: 5416215.45576819),
      Point(x: 17.888508865759512, y: 46.89229074905092)),
  'EPSG:28468': ProjectAndUnProjectResult(
      Point(x: -1558251.513767628, y: 5564273.862147296),
      Point(x: 17.893396730554738, y: 46.89274276585422)),
  'EPSG:28469': ProjectAndUnProjectResult(
      Point(x: -2006399.1709308936, y: 5754290.647735119),
      Point(x: 17.930913287470418, y: 46.89707909919423)),
  'EPSG:28470': ProjectAndUnProjectResult(
      Point(x: -2447140.6515301783, y: 5989473.74186563),
      Point(x: 18.163088321316437, y: 46.92853762419354)),
  'EPSG:29635': ProjectAndUnProjectResult(
      Point(x: -193923.07944263262, y: 5233679.973506619),
      Point(x: 17.88805871813929, y: 46.89226398447223)),
  'EPSG:28471': ProjectAndUnProjectResult(
      Point(x: -2876113.771579705, y: 6273384.884065807),
      Point(x: 19.45399395295535, y: 47.12655335465394)),
  'EPSG:28472': ProjectAndUnProjectResult(
      Point(x: -3287093.208259472, y: 6609658.637646196),
      Point(x: 26.45363795646325, y: 48.31390228746322)),
  'EPSG:28473': ProjectAndUnProjectResult(
      Point(x: -3671430.2897785814, y: 7001570.187034681),
      Point(x: 66.4471378153942, y: 55.6817679617501)),
  'EPSG:28474': ProjectAndUnProjectResult(
      Point(x: -4017375.5010680165, y: 7451403.811096456),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28475': ProjectAndUnProjectResult(
      Point(x: -4309268.105641998, y: 7959567.070144047),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28476': ProjectAndUnProjectResult(
      Point(x: -4526577.283967023, y: 8523388.889802082),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28477': ProjectAndUnProjectResult(
      Point(x: -4642779.188677735, y: 9135532.870352365),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28478': ProjectAndUnProjectResult(
      Point(x: -4624054.316978742, y: 9781950.295645684),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28479': ProjectAndUnProjectResult(
      Point(x: -4427789.600571497, y: 10439290.461127605),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:29636': ProjectAndUnProjectResult(
      Point(x: -650177.7501622888, y: 5305233.757074221),
      Point(x: 17.888077162186278, y: 46.89226400623047)),
  'EPSG:28480': ProjectAndUnProjectResult(
      Point(x: -4000869.6134453984, y: 11071679.08598643),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:28481': ProjectAndUnProjectResult(
      Point(x: -3277741.2978721927, y: 11626768.71989223),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:28482': ProjectAndUnProjectResult(
      Point(x: -2178236.608942848, y: 12030958.200256905),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:28483': ProjectAndUnProjectResult(
      Point(x: -605137.4779859737, y: 12183671.361405866),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:28484': ProjectAndUnProjectResult(
      Point(x: 1558532.5047930002, y: 11950578.342513002),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:28485': ProjectAndUnProjectResult(
      Point(x: 4452505.288112892, y: 11155635.986611271),
      Point(x: -76.19717406300191, y: 89.99869760060176)),
  'EPSG:28486': ProjectAndUnProjectResult(
      Point(x: 8242570.037518824, y: 9571816.968452249),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28487': ProjectAndUnProjectResult(
      Point(x: 13124194.893046256, y: 6910390.434448714),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28488': ProjectAndUnProjectResult(
      Point(x: 19326484.40630764, y: 2808610.083395421),
      Point(x: double.nan, y: double.nan)),
  'EPSG:30800': ProjectAndUnProjectResult(
      Point(x: 1658477.7552794372, y: 5196775.451293881),
      Point(x: 17.88805856028566, y: 46.89226413303138)),
  'EPSG:28489': ProjectAndUnProjectResult(
      Point(x: 27116488.25666316, y: -3184341.2378764953),
      Point(x: double.nan, y: double.nan)),
  'EPSG:28490': ProjectAndUnProjectResult(
      Point(x: 36803876.84613541, y: -11623308.20429408),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:28491': ProjectAndUnProjectResult(
      Point(x: 48745999.37273005, y: -23185185.58270928),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:28492': ProjectAndUnProjectResult(
      Point(x: 63353339.98182248, y: -38689178.19189904),
      Point(x: -84.68868061818502, y: -89.99872978885845)),
  'EPSG:28600': ProjectAndUnProjectResult(
      Point(x: -2322475.0907781115, y: 3356636.270805078),
      Point(x: 17.934012753486293, y: 46.897461547594204)),
  'EPSG:28991': ProjectAndUnProjectResult(
      Point(x: 951786.3196606983, y: -506313.2441480634),
      Point(x: 17.88805857191546, y: 46.892264065831405)),
  'EPSG:28992': ProjectAndUnProjectResult(
      Point(x: 1106786.3196606983, y: -43313.244148063415),
      Point(x: 17.88805857191546, y: 46.892264065831405)),
  'EPSG:29100': ProjectAndUnProjectResult(
      Point(x: 9743883.837058652, y: 17533830.096176848),
      Point(x: 17.888058561957763, y: 46.892264067668435)),
  'EPSG:29101': ProjectAndUnProjectResult(
      Point(x: 9743887.956464902, y: 17533818.112649657),
      Point(x: 17.88805856271662, y: 46.89226406826736)),
  'EPSG:29118': ProjectAndUnProjectResult(
      Point(x: 5436862.661781785, y: 10410826.069211695),
      Point(x: 178.9949139947389, y: 89.99948959703168)),
  'EPSG:29119': ProjectAndUnProjectResult(
      Point(x: 5625590.059912893, y: 9753585.838909857),
      Point(x: 45, y: double.nan)),
  'EPSG:29120': ProjectAndUnProjectResult(
      Point(x: 5638602.6198999835, y: 9108336.288791547),
      Point(x: 45, y: double.nan)),
  'EPSG:29121': ProjectAndUnProjectResult(
      Point(x: 5518142.16454249, y: 8498019.398060095),
      Point(x: 45, y: double.nan)),
  'EPSG:29122': ProjectAndUnProjectResult(
      Point(x: 5297719.392910879, y: 7936385.824762984),
      Point(x: 45, y: double.nan)),
  'EPSG:29168': ProjectAndUnProjectResult(
      Point(x: 5436878.07843168, y: 10410821.987311121),
      Point(x: 176.26099850716986, y: 89.99940003205084)),
  'EPSG:29169': ProjectAndUnProjectResult(
      Point(x: 5625602.7735915575, y: 9753578.3986496),
      Point(x: 45, y: double.nan)),
  'EPSG:29170': ProjectAndUnProjectResult(
      Point(x: 5638612.784445887, y: 9108326.637992661),
      Point(x: 45, y: double.nan)),
  'EPSG:29171': ProjectAndUnProjectResult(
      Point(x: 5518149.988353284, y: 8498008.394750817),
      Point(x: 45, y: double.nan)),
  'EPSG:29172': ProjectAndUnProjectResult(
      Point(x: 5297725.110811591, y: 7936374.096940468),
      Point(x: 45, y: double.nan)),
  'EPSG:29177': ProjectAndUnProjectResult(
      Point(x: 5019747.399735136, y: 21044728.522473387),
      Point(x: 178.9949139947389, y: 89.99948959703168)),
  'EPSG:29178': ProjectAndUnProjectResult(
      Point(x: 5436862.661781785, y: 20410826.069211695),
      Point(x: 178.9949139947389, y: 89.99948959703168)),
  'EPSG:29179': ProjectAndUnProjectResult(
      Point(x: 5625590.059912893, y: 19753585.838909857),
      Point(x: 45, y: double.nan)),
  'EPSG:29180': ProjectAndUnProjectResult(
      Point(x: 5638602.6198999835, y: 19108336.288791545),
      Point(x: 45, y: double.nan)),
  'EPSG:29181': ProjectAndUnProjectResult(
      Point(x: 5518142.16454249, y: 18498019.398060095),
      Point(x: 45, y: double.nan)),
  'EPSG:29182': ProjectAndUnProjectResult(
      Point(x: 5297719.392910879, y: 17936385.824762985),
      Point(x: 45, y: double.nan)),
  'EPSG:29183': ProjectAndUnProjectResult(
      Point(x: 5003603.730874551, y: 17430561.835432645),
      Point(x: 45, y: double.nan)),
  'EPSG:29184': ProjectAndUnProjectResult(
      Point(x: 4656118.547009534, y: 16983076.952140633),
      Point(x: -27.571209297220765, y: 55.09580124018201)),
  'EPSG:29185': ProjectAndUnProjectResult(
      Point(x: 4270757.327980932, y: 16593434.409852609),
      Point(x: 9.846766648357692, y: 48.22207326925626)),
  'EPSG:29187': ProjectAndUnProjectResult(
      Point(x: 5019765.581687489, y: 21044729.306872435),
      Point(x: 176.26099850716986, y: 89.99940003205084)),
  'EPSG:29188': ProjectAndUnProjectResult(
      Point(x: 5436878.07843168, y: 20410821.98731112),
      Point(x: 176.26099850716986, y: 89.99940003205084)),
  'EPSG:29189': ProjectAndUnProjectResult(
      Point(x: 5625602.7735915575, y: 19753578.3986496),
      Point(x: 45, y: double.nan)),
  'EPSG:29190': ProjectAndUnProjectResult(
      Point(x: 5638612.784445887, y: 19108326.63799266),
      Point(x: 45, y: double.nan)),
  'EPSG:29191': ProjectAndUnProjectResult(
      Point(x: 5518149.988353284, y: 18498008.39475082),
      Point(x: 45, y: double.nan)),
  'EPSG:29192': ProjectAndUnProjectResult(
      Point(x: 5297725.110811591, y: 17936374.09694047),
      Point(x: 45, y: double.nan)),
  'EPSG:29193': ProjectAndUnProjectResult(
      Point(x: 5003607.583398238, y: 17430549.83129249),
      Point(x: 45, y: double.nan)),
  'EPSG:29194': ProjectAndUnProjectResult(
      Point(x: 4656120.765806515, y: 16983064.98178522),
      Point(x: -27.570076528623627, y: 55.095603921378036)),
  'EPSG:29195': ProjectAndUnProjectResult(
      Point(x: 4270758.126192646, y: 16593422.679462496),
      Point(x: 9.846963982307727, y: 48.222045331130154)),
  'EPSG:29220': ProjectAndUnProjectResult(
      Point(x: 5639053.361051439, y: 19108425.827306394),
      Point(x: 45, y: double.nan)),
  'EPSG:29221': ProjectAndUnProjectResult(
      Point(x: 5518549.228942968, y: 18498042.737019747),
      Point(x: 45, y: double.nan)),
  'EPSG:29333': ProjectAndUnProjectResult(
      Point(x: 720053.9317411971, y: 15197341.896036757),
      Point(x: 17.88805848463445, y: 46.89226376882078)),
  'EPSG:29700': ProjectAndUnProjectResult(
      Point(x: -1505040.3499380755, y: 9596011.052582644),
      Point(x: 17.888058546920686, y: 46.89226406872663)),
  'EPSG:29702': ProjectAndUnProjectResult(
      Point(x: -1505040.3499380755, y: 9596011.052582644),
      Point(x: 17.888058546920686, y: 46.89226406872663)),
  'EPSG:29738': ProjectAndUnProjectResult(
      Point(x: -1557475.5429367274, y: 15561972.255476626),
      Point(x: 17.893395461014528, y: 46.892742527465494)),
  'EPSG:29739': ProjectAndUnProjectResult(
      Point(x: -2005465.8392391484, y: 15751915.90345429),
      Point(x: 17.930905409738763, y: 46.89707787937025)),
  'EPSG:29849': ProjectAndUnProjectResult(
      Point(x: -4425198.324567948, y: 10435344.163964434),
      Point(x: 135.42503507789226, y: 89.99146497553242)),
  'EPSG:29850': ProjectAndUnProjectResult(
      Point(x: -3997945.9474681597, y: 11067547.359855784),
      Point(x: 135.42503507789226, y: 89.99146497553242)),
  'EPSG:29871': ProjectAndUnProjectResult(
      Point(x: -997991.9222828604, y: 389395.9273149495),
      Point(x: 17.88806042992995, y: 46.89226478534281)),
  'EPSG:29872': ProjectAndUnProjectResult(
      Point(x: -65867466.86646878, y: 25700131.207586665),
      Point(x: 17.88806042992995, y: 46.892264785342796)),
  'EPSG:29873': ProjectAndUnProjectResult(
      Point(x: -20076369.09523415, y: 7833386.405989658),
      Point(x: 17.88806042992995, y: 46.89226478534281)),
  'EPSG:29900': ProjectAndUnProjectResult(
      Point(x: 2166448.8570793048, y: -149633.20393718773),
      Point(x: 17.884700999554877, y: 46.892547370826165)),
  'EPSG:29901': ProjectAndUnProjectResult(
      Point(x: 2166448.5965697616, y: -149632.46895074664),
      Point(x: 17.8847011233, y: 46.89254732122343)),
  'EPSG:29902': ProjectAndUnProjectResult(
      Point(x: 2166448.8570793048, y: -149633.20393718773),
      Point(x: 17.884700999554877, y: 46.892547370826165)),
  'EPSG:29903': ProjectAndUnProjectResult(
      Point(x: 2166448.8570793048, y: -149633.20393718773),
      Point(x: 17.884700999554877, y: 46.892547370826165)),
  'EPSG:30161': ProjectAndUnProjectResult(
      Point(x: -2564574.876886624, y: 8402036.864471586),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30162': ProjectAndUnProjectResult(
      Point(x: -2209529.1820660145, y: 8462836.915930206),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30163': ProjectAndUnProjectResult(
      Point(x: -1911487.56671277, y: 8165001.851996742),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30164': ProjectAndUnProjectResult(
      Point(x: -1546225.9547115215, y: 8522977.245382551),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30165': ProjectAndUnProjectResult(
      Point(x: -1304035.1793757156, y: 8197467.6810126435),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30166': ProjectAndUnProjectResult(
      Point(x: -786044.5629422882, y: 8190334.924182352),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30167': ProjectAndUnProjectResult(
      Point(x: -395585.3717530748, y: 8166784.9024444),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30168': ProjectAndUnProjectResult(
      Point(x: 80183.44709944718, y: 8119402.726176735),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30169': ProjectAndUnProjectResult(
      Point(x: 588911.3218167224, y: 8048358.382186379),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30170': ProjectAndUnProjectResult(
      Point(x: 993036.1774968327, y: 7534441.8407014785),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30171': ProjectAndUnProjectResult(
      Point(x: 754896.439147769, y: 7132893.637473271),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30172': ProjectAndUnProjectResult(
      Point(x: 1600153.6071265498, y: 6964564.178844889),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30173': ProjectAndUnProjectResult(
      Point(x: 2529954.6104562245, y: 6729491.282519216),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30174': ProjectAndUnProjectResult(
      Point(x: 1489992.367876257, y: 8985673.145076329),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30175': ProjectAndUnProjectResult(
      Point(x: -2991476.077988473, y: 9071896.590616958),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30176': ProjectAndUnProjectResult(
      Point(x: -3621430.9921972794, y: 8829762.17910194),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30177': ProjectAndUnProjectResult(
      Point(x: -2209529.1820660145, y: 9238592.756167458),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30178': ProjectAndUnProjectResult(
      Point(x: -786044.5629422882, y: 9963152.127752924),
      Point(x: 106.09777940057985, y: 89.99527243122452)),
  'EPSG:30179': ProjectAndUnProjectResult(
      Point(x: 8481592.38552262, y: 6335225.710314),
      Point(x: 45, y: double.nan)),
  'EPSG:30200': ProjectAndUnProjectResult(
      Point(x: 26911496.47759386, y: 39926609.556083165),
      Point(x: 45, y: double.nan)),
  'EPSG:30339': ProjectAndUnProjectResult(
      Point(x: -2005525.8199949968, y: 5751957.866688647),
      Point(x: 17.930935648444212, y: 46.897081145807086)),
  'EPSG:30340': ProjectAndUnProjectResult(
      Point(x: -2446090.5057064057, y: 5987059.267526575),
      Point(x: 18.163219481115515, y: 46.92855173187133)),
  'EPSG:31028': ProjectAndUnProjectResult(
      Point(x: 2988686.97697698, y: 5743953.323279653),
      Point(x: 17.848226773091078, y: 46.89670697012952)),
  'EPSG:30729': ProjectAndUnProjectResult(
      Point(x: 2540844.526002939, y: 5555418.648402401),
      Point(x: 17.883146807815894, y: 46.89269931000284)),
  'EPSG:30730': ProjectAndUnProjectResult(
      Point(x: 2088289.4880900453, y: 5408909.4338668985),
      Point(x: 17.887652142055444, y: 46.89228743642868)),
  'EPSG:30731': ProjectAndUnProjectResult(
      Point(x: 1633268.055736832, y: 5301573.907465437),
      Point(x: 17.88804239129495, y: 46.892263977467344)),
  'EPSG:30732': ProjectAndUnProjectResult(
      Point(x: 1176952.9782639088, y: 5231373.806754128),
      Point(x: 17.888058430560996, y: 46.89226401974158)),
  'EPSG:31121': ProjectAndUnProjectResult(
      Point(x: 5518037.318817771, y: 8498105.375988903),
      Point(x: 45, y: double.nan)),
  'EPSG:31154': ProjectAndUnProjectResult(
      Point(x: 5418516.920074178, y: 8210643.090555323),
      Point(x: 45, y: double.nan)),
  'EPSG:31170': ProjectAndUnProjectResult(
      Point(x: 5477206.619390129, y: 8370359.830228165),
      Point(x: 45, y: double.nan)),
  'EPSG:31171': ProjectAndUnProjectResult(
      Point(x: 5478700.378879742, y: 8372871.94302235),
      Point(x: 45, y: double.nan)),
  'EPSG:31251': ProjectAndUnProjectResult(
      Point(x: -770143.4610311553, y: 244634.98861274403),
      Point(x: 17.888058996302867, y: 46.892263993829815)),
  'EPSG:31252': ProjectAndUnProjectResult(
      Point(x: -998383.287654631, y: 278881.4049306372),
      Point(x: 17.888063466437135, y: 46.892263864885436)),
  'EPSG:31253': ProjectAndUnProjectResult(
      Point(x: -1226367.5066303054, y: 322283.9319782425),
      Point(x: 17.888092618607605, y: 46.89226456327372)),
  'EPSG:31254': ProjectAndUnProjectResult(
      Point(x: 575650.2442142396, y: 222564.25950992014),
      Point(x: 17.888058545273374, y: 46.89226405618069)),
  'EPSG:31255': ProjectAndUnProjectResult(
      Point(x: 347141.32095861033, y: 204860.82432084158),
      Point(x: 17.888058571082826, y: 46.89226407115187)),
  'EPSG:31256': ProjectAndUnProjectResult(
      Point(x: 118567.11251134053, y: 195949.6262858007),
      Point(x: 17.888058571080563, y: 46.89226407194811)),
  'EPSG:31257': ProjectAndUnProjectResult(
      Point(x: 725650.2442142396, y: 222564.25950992014),
      Point(x: 17.888058545273374, y: 46.89226405618069)),
  'EPSG:31258': ProjectAndUnProjectResult(
      Point(x: 797141.3209586104, y: 204860.82432084158),
      Point(x: 17.888058571082826, y: 46.89226407115187)),
  'EPSG:31259': ProjectAndUnProjectResult(
      Point(x: 868567.1125113405, y: 195949.6262858007),
      Point(x: 17.888058571080563, y: 46.89226407194811)),
  'EPSG:31265': ProjectAndUnProjectResult(
      Point(x: 5720160.7700375235, y: 5198828.536209519),
      Point(x: 17.888058571100014, y: 46.892264071897145)),
  'EPSG:31266': ProjectAndUnProjectResult(
      Point(x: 6491569.585511923, y: 5194779.999855914),
      Point(x: 17.888058571079608, y: 46.89226407194938)),
  'EPSG:31267': ProjectAndUnProjectResult(
      Point(x: 7262979.909526434, y: 5199473.602980715),
      Point(x: 17.888058571051438, y: 46.8922640718681)),
  'EPSG:31268': ProjectAndUnProjectResult(
      Point(x: 8034433.652031638, y: 5212932.686449068),
      Point(x: 17.888058573930003, y: 46.89226406738588)),
  'EPSG:31275': ProjectAndUnProjectResult(
      Point(x: 5720138.75396052, y: 5198308.653355898),
      Point(x: 17.888058571100018, y: 46.89226407189716)),
  'EPSG:31466': ProjectAndUnProjectResult(
      Point(x: 3405557.9712320073, y: 5263903.117962763),
      Point(x: 17.888056614893635, y: 46.89226390657308)),
  'EPSG:31276': ProjectAndUnProjectResult(
      Point(x: 6491570.428553372, y: 5194260.521855929),
      Point(x: 17.888058571079608, y: 46.8922640719494)),
  'EPSG:31277': ProjectAndUnProjectResult(
      Point(x: 7263003.611535481, y: 5198953.655620417),
      Point(x: 17.88805857105144, y: 46.89226407186809)),
  'EPSG:31278': ProjectAndUnProjectResult(
      Point(x: 7263003.611535481, y: 5198953.655620417),
      Point(x: 17.88805857105144, y: 46.89226407186809)),
  'EPSG:31279': ProjectAndUnProjectResult(
      Point(x: 8034480.2086664345, y: 5212411.393180423),
      Point(x: 17.888058573929996, y: 46.89226406738588)),
  'EPSG:31281': ProjectAndUnProjectResult(
      Point(x: -769840.3778662828, y: 5244596.905554466),
      Point(x: 17.88805902269938, y: 46.8922639912962)),
  'EPSG:31282': ProjectAndUnProjectResult(
      Point(x: -998080.4302837119, y: 5278831.295032713),
      Point(x: 17.888063480472194, y: 46.89226386230003)),
  'EPSG:31283': ProjectAndUnProjectResult(
      Point(x: -1226064.9991461555, y: 5322221.544276805),
      Point(x: 17.88809256707494, y: 46.892264557986)),
  'EPSG:31284': ProjectAndUnProjectResult(
      Point(x: 725650.2442142396, y: 5222564.25950992),
      Point(x: 17.888058545273374, y: 46.89226405618069)),
  'EPSG:31285': ProjectAndUnProjectResult(
      Point(x: 797141.3209586104, y: 5204860.824320842),
      Point(x: 17.888058571082826, y: 46.89226407115187)),
  'EPSG:31286': ProjectAndUnProjectResult(
      Point(x: 868567.1125113405, y: 5195949.626285801),
      Point(x: 17.888058571080563, y: 46.89226407194811)),
  'EPSG:31287': ProjectAndUnProjectResult(
      Point(x: 746867.6942995265, y: 342669.0052540684),
      Point(x: 17.888058571079615, y: 46.89226407194935)),
  'EPSG:31288': ProjectAndUnProjectResult(
      Point(x: -619840.3778662828, y: 5244596.905554466),
      Point(x: 17.88805902269938, y: 46.8922639912962)),
  'EPSG:31289': ProjectAndUnProjectResult(
      Point(x: -548080.4302837119, y: 5278831.295032713),
      Point(x: 17.888063480472194, y: 46.89226386230003)),
  'EPSG:31290': ProjectAndUnProjectResult(
      Point(x: -476064.99914615555, y: 5322221.544276805),
      Point(x: 17.88809256707494, y: 46.892264557986)),
  'EPSG:31291': ProjectAndUnProjectResult(
      Point(x: -769840.3778662828, y: 5244596.905554466),
      Point(x: 17.88805902269938, y: 46.8922639912962)),
  'EPSG:31292': ProjectAndUnProjectResult(
      Point(x: -998080.4302837119, y: 5278831.295032713),
      Point(x: 17.888063480472194, y: 46.89226386230003)),
  'EPSG:31293': ProjectAndUnProjectResult(
      Point(x: -1226064.9991461555, y: 5322221.544276805),
      Point(x: 17.88809256707494, y: 46.892264557986)),
  'EPSG:31294': ProjectAndUnProjectResult(
      Point(x: 725650.2442142396, y: 5222564.25950992),
      Point(x: 17.888058545273374, y: 46.89226405618069)),
  'EPSG:31295': ProjectAndUnProjectResult(
      Point(x: 797141.3209586104, y: 5204860.824320842),
      Point(x: 17.888058571082826, y: 46.89226407115187)),
  'EPSG:31296': ProjectAndUnProjectResult(
      Point(x: 868567.1125113405, y: 5195949.626285801),
      Point(x: 17.888058571080563, y: 46.89226407194811)),
  'EPSG:31297': ProjectAndUnProjectResult(
      Point(x: 746867.6942995265, y: 342669.0052540684),
      Point(x: 17.888058571079615, y: 46.89226407194935)),
  'EPSG:31370': ProjectAndUnProjectResult(
      Point(x: 1176759.146106716, y: -175517.24382414203),
      Point(x: 17.888058620014764, y: 46.8922641048904)),
  'EPSG:31461': ProjectAndUnProjectResult(
      Point(x: 2633655.753655738, y: 5303558.113725107),
      Point(x: 17.88804237619113, y: 46.89226400489469)),
  'EPSG:31462': ProjectAndUnProjectResult(
      Point(x: 3405557.9712320073, y: 5263903.117962763),
      Point(x: 17.888056614893635, y: 46.89226390657308)),
  'EPSG:31463': ProjectAndUnProjectResult(
      Point(x: 4177240.9231268167, y: 5233330.939970062),
      Point(x: 17.88805844618341, y: 46.89226402887191)),
  'EPSG:31464': ProjectAndUnProjectResult(
      Point(x: 4948778.943728735, y: 5211691.55403255),
      Point(x: 17.888058569521185, y: 46.892264064681335)),
  'EPSG:31465': ProjectAndUnProjectResult(
      Point(x: 5720229.782756959, y: 5198878.037007652),
      Point(x: 17.888058571421293, y: 46.8922640683026)),
  'EPSG:31467': ProjectAndUnProjectResult(
      Point(x: 4177240.9231268167, y: 5233330.939970062),
      Point(x: 17.88805844618341, y: 46.89226402887191)),
  'EPSG:31468': ProjectAndUnProjectResult(
      Point(x: 4948778.943728735, y: 5211691.55403255),
      Point(x: 17.888058569521185, y: 46.892264064681335)),
  'EPSG:31469': ProjectAndUnProjectResult(
      Point(x: 5720229.782756959, y: 5198878.037007652),
      Point(x: 17.888058571421293, y: 46.8922640683026)),
  'EPSG:31528': ProjectAndUnProjectResult(
      Point(x: 2988585.002277317, y: 5744009.102065168),
      Point(x: 17.84823657652429, y: 46.89670599128666)),
  'EPSG:31529': ProjectAndUnProjectResult(
      Point(x: 2540422.4229976125, y: 5555697.086638527),
      Point(x: 17.883153226896248, y: 46.892698810059336)),
  'EPSG:31600': ProjectAndUnProjectResult(
      Point(x: -71151.77160184516, y: 637738.5854183696),
      Point(x: 17.888058566597667, y: 46.892264078966164)),
  'EPSG:31700': ProjectAndUnProjectResult(
      Point(x: -41370.698526213644, y: 623582.1646694599),
      Point(x: 17.888058571980313, y: 46.892264069754845)),
  'EPSG:31838': ProjectAndUnProjectResult(
      Point(x: -1557534.139698831, y: 5561943.191512571),
      Point(x: 17.89339981090131, y: 46.89274298807137)),
  'EPSG:31839': ProjectAndUnProjectResult(
      Point(x: -2005498.599653469, y: 5751893.119745549),
      Point(x: 17.930934817008954, y: 46.89708105411353)),
  'EPSG:31900': ProjectAndUnProjectResult(
      Point(x: -1782253.4051442007, y: 5651486.6987863025),
      Point(x: 17.903751822530126, y: 46.893857776361884)),
  'EPSG:31901': ProjectAndUnProjectResult(
      Point(x: -1783166.671812926, y: 5653748.198065529),
      Point(x: 17.903751822530126, y: 46.893857776361884)),
  'EPSG:31965': ProjectAndUnProjectResult(
      Point(x: -7081100.809078519, y: 9644074.035715306),
      Point(x: 16894389367.285646, y: 5473429537.796183)),
  'EPSG:31966': ProjectAndUnProjectResult(
      Point(x: -3328981.2161364346, y: 11193210.773121612), Point(x: 0, y: 90)),
  'EPSG:31967': ProjectAndUnProjectResult(
      Point(x: -465963.8528201919, y: 11963247.506900493), Point(x: 0, y: 90)),
  'EPSG:31968': ProjectAndUnProjectResult(
      Point(x: 1672650.061907484, y: 12179046.047871836), Point(x: 0, y: 90)),
  'EPSG:31969': ProjectAndUnProjectResult(
      Point(x: 3225639.745211993, y: 12014873.557768293), Point(x: 0, y: 90)),
  'EPSG:31970': ProjectAndUnProjectResult(
      Point(x: 4309153.746567462, y: 11603618.623518256), Point(x: 0, y: 90)),
  'EPSG:31971': ProjectAndUnProjectResult(
      Point(x: 5019695.054228077, y: 11044701.550210133), Point(x: 0, y: 90)),
  'EPSG:31972': ProjectAndUnProjectResult(
      Point(x: 5436818.00586931, y: 10410808.927530395), Point(x: 0, y: 90)),
  'EPSG:31973': ProjectAndUnProjectResult(
      Point(x: 5625552.597278097, y: 9753575.672750814),
      Point(x: -14563147143.452982, y: 3188443837.820243)),
  'EPSG:31974': ProjectAndUnProjectResult(
      Point(x: 5638571.782971076, y: 9108330.901623307),
      Point(x: -1685042.2535846238, y: 369929.7983349917)),
  'EPSG:31975': ProjectAndUnProjectResult(
      Point(x: 5518117.362620078, y: 8498017.126823647),
      Point(x: -33811.09013364492, y: 7380.196889868285)),
  'EPSG:31976': ProjectAndUnProjectResult(
      Point(x: 5297700.047163907, y: 7936385.43186829),
      Point(x: -2039.797629755838, y: 544.0590624611513)),
  'EPSG:31977': ProjectAndUnProjectResult(
      Point(x: 5019695.054228077, y: 21044701.550210133), Point(x: 0, y: 90)),
  'EPSG:31978': ProjectAndUnProjectResult(
      Point(x: 5436818.00586931, y: 20410808.927530393), Point(x: 0, y: 90)),
  'EPSG:31979': ProjectAndUnProjectResult(
      Point(x: 5625552.597278097, y: 19753575.672750816),
      Point(x: -14563147143.453583, y: 3188443837.820372)),
  'EPSG:31980': ProjectAndUnProjectResult(
      Point(x: 5638571.782971076, y: 19108330.90162331),
      Point(x: -1685042.253584662, y: 369929.7983350001)),
  'EPSG:31981': ProjectAndUnProjectResult(
      Point(x: 5518117.362620078, y: 18498017.12682365),
      Point(x: -33811.09013364537, y: 7380.196889868381)),
  'EPSG:31982': ProjectAndUnProjectResult(
      Point(x: 5297700.047163907, y: 17936385.43186829),
      Point(x: -2039.7976297558266, y: 544.0590624611489)),
  'EPSG:31983': ProjectAndUnProjectResult(
      Point(x: 5003589.298485577, y: 17430562.41671147),
      Point(x: 87.06844226328268, y: 103.32192587414212)),
  'EPSG:31984': ProjectAndUnProjectResult(
      Point(x: 4656108.536534103, y: 16983077.859512635),
      Point(x: -27.57400009510662, y: 55.09636167021363)),
  'EPSG:31985': ProjectAndUnProjectResult(
      Point(x: 4270751.307769986, y: 16593435.187347272),
      Point(x: 9.84627979268085, y: 48.22214374762894)),
  'EPSG:31986': ProjectAndUnProjectResult(
      Point(x: 5019695.054228077, y: 11044701.550210133), Point(x: 0, y: 90)),
  'EPSG:31987': ProjectAndUnProjectResult(
      Point(x: 5436818.00586931, y: 10410808.927530395), Point(x: 0, y: 90)),
  'EPSG:31988': ProjectAndUnProjectResult(
      Point(x: 5625552.597278097, y: 9753575.672750814),
      Point(x: -14563147143.452982, y: 3188443837.820243)),
  'EPSG:31989': ProjectAndUnProjectResult(
      Point(x: 5638571.782971076, y: 9108330.901623307),
      Point(x: -1685042.2535846238, y: 369929.7983349917)),
  'EPSG:31990': ProjectAndUnProjectResult(
      Point(x: 5518117.362620078, y: 8498017.126823647),
      Point(x: -33811.09013364492, y: 7380.196889868285)),
  'EPSG:31991': ProjectAndUnProjectResult(
      Point(x: 5297700.047163907, y: 7936385.43186829),
      Point(x: -2039.797629755838, y: 544.0590624611513)),
  'EPSG:31992': ProjectAndUnProjectResult(
      Point(x: 5019695.054228077, y: 21044701.550210133), Point(x: 0, y: 90)),
  'EPSG:31993': ProjectAndUnProjectResult(
      Point(x: 5436818.00586931, y: 20410808.927530393), Point(x: 0, y: 90)),
  'EPSG:31994': ProjectAndUnProjectResult(
      Point(x: 5625552.597278097, y: 19753575.672750816),
      Point(x: -14563147143.453583, y: 3188443837.820372)),
  'EPSG:31995': ProjectAndUnProjectResult(
      Point(x: 5638571.782971076, y: 19108330.90162331),
      Point(x: -1685042.253584662, y: 369929.7983350001)),
  'EPSG:31996': ProjectAndUnProjectResult(
      Point(x: 5518117.362620078, y: 18498017.12682365),
      Point(x: -33811.09013364537, y: 7380.196889868381)),
  'EPSG:31997': ProjectAndUnProjectResult(
      Point(x: 5297700.047163907, y: 17936385.43186829),
      Point(x: -2039.7976297558266, y: 544.0590624611489)),
  'EPSG:31998': ProjectAndUnProjectResult(
      Point(x: 5003589.298485577, y: 17430562.41671147),
      Point(x: 87.06844226328268, y: 103.32192587414212)),
  'EPSG:31999': ProjectAndUnProjectResult(
      Point(x: 4656108.536534103, y: 16983077.859512635),
      Point(x: -27.57400009510662, y: 55.09636167021363)),
  'EPSG:32000': ProjectAndUnProjectResult(
      Point(x: 4270751.307769986, y: 16593435.187347272),
      Point(x: 9.84627979268085, y: 48.22214374762894)),
  'EPSG:32001': ProjectAndUnProjectResult(
      Point(x: 21120726.36571095, y: 20860669.89716128),
      Point(x: 17.88805856028151, y: 46.89226404782307)),
  'EPSG:32002': ProjectAndUnProjectResult(
      Point(x: 21498035.44225285, y: 21085210.99828248),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:32003': ProjectAndUnProjectResult(
      Point(x: 22037916.96880421, y: 21471031.300674338),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:32005': ProjectAndUnProjectResult(
      Point(x: 22975266.765149537, y: 19440458.373038888),
      Point(x: 17.88805856028152, y: 46.89226404782307)),
  'EPSG:32006': ProjectAndUnProjectResult(
      Point(x: 23391319.515180737, y: 19658315.34436853),
      Point(x: 17.88805856028152, y: 46.89226404782307)),
  'EPSG:32007': ProjectAndUnProjectResult(
      Point(x: -21177526.018185206, y: 20501927.4816624), Point(x: 0, y: 90)),
  'EPSG:32008': ProjectAndUnProjectResult(
      Point(x: -23609045.758414574, y: 19388960.106355526),
      Point(x: 45, y: double.nan)),
  'EPSG:32009': ProjectAndUnProjectResult(
      Point(x: -28193677.824868068, y: 17142919.333487462),
      Point(x: 45, y: double.nan)),
  'EPSG:32010': ProjectAndUnProjectResult(
      Point(x: 17126656.70441657, y: 17528723.109378744), Point(x: 0, y: 90)),
  'EPSG:32011': ProjectAndUnProjectResult(
      Point(x: 18254292.75654244, y: 19942868.435700156), Point(x: 0, y: 90)),
  'EPSG:32012': ProjectAndUnProjectResult(
      Point(x: -1783032.3863598064, y: 28159943.4746598), Point(x: 0, y: 90)),
  'EPSG:32013': ProjectAndUnProjectResult(
      Point(x: -4415970.897491426, y: 27647904.178247053), Point(x: 0, y: 90)),
  'EPSG:32014': ProjectAndUnProjectResult(
      Point(x: -6780967.248084832, y: 27076842.380646724), Point(x: 0, y: 90)),
  'EPSG:32015': ProjectAndUnProjectResult(
      Point(x: 16804206.672251586, y: 19398470.491679206), Point(x: 0, y: 90)),
  'EPSG:32016': ProjectAndUnProjectResult(
      Point(x: 16420833.602465529, y: 20198519.38342503), Point(x: 0, y: 90)),
  'EPSG:32017': ProjectAndUnProjectResult(
      Point(x: 15986536.034394884, y: 20897266.672446184), Point(x: 0, y: 90)),
  'EPSG:32018': ProjectAndUnProjectResult(
      Point(x: 20096015.858215142, y: 13382884.173489098),
      Point(x: 17.88805856028152, y: 46.89226404782306)),
  'EPSG:32019': ProjectAndUnProjectResult(
      Point(x: 23008993.2574473, y: 15970656.907594701),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:32020': ProjectAndUnProjectResult(
      Point(x: 21243411.594244584, y: 18575972.35477679),
      Point(x: 17.88805856028151, y: 46.89226404782307)),
  'EPSG:32021': ProjectAndUnProjectResult(
      Point(x: 21599407.863485917, y: 18836779.99137151),
      Point(x: 17.88805856028151, y: 46.89226404782307)),
  'EPSG:32022': ProjectAndUnProjectResult(
      Point(x: 22018110.590105932, y: 15625567.51446421),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:32023': ProjectAndUnProjectResult(
      Point(x: 22419583.739901267, y: 15934279.431293298),
      Point(x: 17.88805856028151, y: 46.89226404782307)),
  'EPSG:32024': ProjectAndUnProjectResult(
      Point(x: 24987830.65661771, y: 19977127.8593985),
      Point(x: 17.888058560281554, y: 46.89226404782306)),
  'EPSG:32025': ProjectAndUnProjectResult(
      Point(x: 25585470.348203015, y: 20228402.719816066),
      Point(x: 17.88805856028152, y: 46.89226404782307)),
  'EPSG:32026': ProjectAndUnProjectResult(
      Point(x: 22003195.035465173, y: 24246002.74858822),
      Point(x: 17.88805856028151, y: 46.89226404782307)),
  'EPSG:32027': ProjectAndUnProjectResult(
      Point(x: 22912147.23796541, y: 24599811.452602085),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:32028': ProjectAndUnProjectResult(
      Point(x: 21430529.780994296, y: 14425070.89328698),
      Point(x: 17.888058560281497, y: 46.89226404782306)),
  'EPSG:32029': ProjectAndUnProjectResult(
      Point(x: 21649500.871525753, y: 14554426.568311429),
      Point(x: 17.88805856028151, y: 46.89226404782304)),
  'EPSG:32619': ProjectAndUnProjectResult(
      Point(x: 5625552.597266308, y: 9753575.672805658),
      Point(x: -14563147131.785316, y: 3188443835.3107486)),
  'EPSG:32030': ProjectAndUnProjectResult(
      Point(x: 17142866.636789955, y: 17985364.970315754), Point(x: 0, y: 90)),
  'EPSG:32031': ProjectAndUnProjectResult(
      Point(x: 23533120.872628823, y: 16505942.014075654),
      Point(x: 17.88805856028151, y: 46.89226404782307)),
  'EPSG:32033': ProjectAndUnProjectResult(
      Point(x: 23916672.881076984, y: 16671254.134924103),
      Point(x: 17.88805856028151, y: 46.89226404782304)),
  'EPSG:32034': ProjectAndUnProjectResult(
      Point(x: 22117640.419236757, y: 19051061.1748284),
      Point(x: 17.88805856028152, y: 46.89226404782306)),
  'EPSG:32035': ProjectAndUnProjectResult(
      Point(x: 22573036.10776595, y: 19407558.12575994),
      Point(x: 17.88805856028155, y: 46.89226404782307)),
  'EPSG:32036': ProjectAndUnProjectResult(
      Point(x: 21887400.955928694, y: 17268660.079644486),
      Point(x: 17.888058560281515, y: 46.89226404782303)),
  'EPSG:32037': ProjectAndUnProjectResult(
      Point(x: 25599449.69288968, y: 21003497.02276749),
      Point(x: 17.88805856028151, y: 46.89226404782307)),
  'EPSG:32038': ProjectAndUnProjectResult(
      Point(x: 26126278.68173603, y: 20362613.735682715),
      Point(x: 17.88805856028152, y: 46.89226404782306)),
  'EPSG:32620': ProjectAndUnProjectResult(
      Point(x: 5638571.782947235, y: 9108330.90168845),
      Point(x: -1685042.2533001453, y: 369929.7982766386)),
  'EPSG:32039': ProjectAndUnProjectResult(
      Point(x: 27323905.74450787, y: 21236793.58681359),
      Point(x: 17.88805856028152, y: 46.89226404782307)),
  'EPSG:32040': ProjectAndUnProjectResult(
      Point(x: 27875090.842656855, y: 21173557.92961591),
      Point(x: 17.88805856028154, y: 46.89226404782306)),
  'EPSG:32041': ProjectAndUnProjectResult(
      Point(x: 28851233.547113057, y: 21225817.291045375),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:32042': ProjectAndUnProjectResult(
      Point(x: 23761186.634705875, y: 22444881.298876897),
      Point(x: 17.88805856028152, y: 46.89226404782306)),
  'EPSG:32043': ProjectAndUnProjectResult(
      Point(x: 24363974.027586855, y: 22871882.968079094),
      Point(x: 17.88805856028152, y: 46.89226404782306)),
  'EPSG:32044': ProjectAndUnProjectResult(
      Point(x: 25277634.74152593, y: 23023696.143152285),
      Point(x: 17.88805856028152, y: 46.89226404782307)),
  'EPSG:32045': ProjectAndUnProjectResult(
      Point(x: 17040276.60568774, y: 17828872.62160684), Point(x: 0, y: 90)),
  'EPSG:32046': ProjectAndUnProjectResult(
      Point(x: 22126142.048386, y: 15030264.520956792),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:32621': ProjectAndUnProjectResult(
      Point(x: 5518117.36258884, y: 8498017.126898602),
      Point(x: -33811.09013091508, y: 7380.196889341078)),
  'EPSG:32047': ProjectAndUnProjectResult(
      Point(x: 22417899.924455542, y: 15299357.381634258),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:32048': ProjectAndUnProjectResult(
      Point(x: 20729703.721203472, y: 23626784.679438435),
      Point(x: 17.88805856028151, y: 46.89226404782307)),
  'EPSG:32049': ProjectAndUnProjectResult(
      Point(x: 21388101.90207301, y: 23891068.922298305),
      Point(x: 17.88805856028154, y: 46.89226404782306)),
  'EPSG:32050': ProjectAndUnProjectResult(
      Point(x: 22018177.383287385, y: 15121178.171458086),
      Point(x: 17.88805856028152, y: 46.89226404782307)),
  'EPSG:32051': ProjectAndUnProjectResult(
      Point(x: 22538300.096521433, y: 15747898.252498945),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:32052': ProjectAndUnProjectResult(
      Point(x: 21412634.426541068, y: 16301698.486752158),
      Point(x: 17.88805856028152, y: 46.89226404782306)),
  'EPSG:32053': ProjectAndUnProjectResult(
      Point(x: 21721760.990491796, y: 16558779.166711608),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:32054': ProjectAndUnProjectResult(
      Point(x: 22090977.920215692, y: 16960529.552739237),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:32622': ProjectAndUnProjectResult(
      Point(x: 5297700.047128848, y: 7936385.431952221),
      Point(x: -2039.797629640532, y: 544.0590624398507)),
  'EPSG:32055': ProjectAndUnProjectResult(
      Point(x: -2897936.675358525, y: 24442639.97157788), Point(x: 0, y: 90)),
  'EPSG:32056': ProjectAndUnProjectResult(
      Point(x: -6015110.786894472, y: 23754726.0210987), Point(x: 0, y: 90)),
  'EPSG:32057': ProjectAndUnProjectResult(
      Point(x: -8232910.5806097975, y: 23160989.44597798), Point(x: 0, y: 90)),
  'EPSG:32058': ProjectAndUnProjectResult(
      Point(x: -10457474.71770262, y: 22488066.022809565), Point(x: 0, y: 90)),
  'EPSG:32064': ProjectAndUnProjectResult(
      Point(x: 5486456.889307273, y: 39954818.42034174), Point(x: 0, y: 90)),
  'EPSG:32065': ProjectAndUnProjectResult(
      Point(x: 10581530.491512235, y: 39417001.16199298), Point(x: 0, y: 90)),
  'EPSG:32066': ProjectAndUnProjectResult(
      Point(x: 14136410.596506024, y: 38068348.2853755), Point(x: 0, y: 90)),
  'EPSG:32067': ProjectAndUnProjectResult(
      Point(x: 16467677.464081096, y: 36235081.57002633), Point(x: 0, y: 90)),
  'EPSG:32074': ProjectAndUnProjectResult(
      Point(x: 5486456.889307273, y: 39954818.42034174), Point(x: 0, y: 90)),
  'EPSG:32075': ProjectAndUnProjectResult(
      Point(x: 10581530.491512235, y: 39417001.16199298), Point(x: 0, y: 90)),
  'EPSG:32076': ProjectAndUnProjectResult(
      Point(x: 14136410.596506024, y: 38068348.2853755), Point(x: 0, y: 90)),
  'EPSG:32077': ProjectAndUnProjectResult(
      Point(x: 16467677.464081096, y: 36235081.57002633), Point(x: 0, y: 90)),
  'EPSG:32081': ProjectAndUnProjectResult(
      Point(x: 5186632.024676061, y: 8120099.233874696),
      Point(x: 45, y: double.nan)),
  'EPSG:32082': ProjectAndUnProjectResult(
      Point(x: 5293654.478662069, y: 8403309.09255457),
      Point(x: 45, y: double.nan)),
  'EPSG:32083': ProjectAndUnProjectResult(
      Point(x: 5364906.447262949, y: 8649042.253562601),
      Point(x: 45, y: double.nan)),
  'EPSG:32084': ProjectAndUnProjectResult(
      Point(x: 5425654.034598166, y: 8954486.70998534),
      Point(x: 45, y: double.nan)),
  'EPSG:32085': ProjectAndUnProjectResult(
      Point(x: 5455436.685654514, y: 9269841.860248554),
      Point(x: 45, y: double.nan)),
  'EPSG:32086': ProjectAndUnProjectResult(
      Point(x: 5449562.187313349, y: 9592891.270385174),
      Point(x: 45, y: double.nan)),
  'EPSG:32098': ProjectAndUnProjectResult(
      Point(x: 5088215.637832019, y: 3830123.3104004664),
      Point(x: 17.88805856028151, y: 46.89226404782306)),
  'EPSG:32099': ProjectAndUnProjectResult(
      Point(x: 27652879.64726924, y: 19734613.33762063),
      Point(x: 17.8880585602815, y: 46.89226404782307)),
  'EPSG:32100': ProjectAndUnProjectResult(
      Point(x: 6556297.784221025, y: 6590553.712986213),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:32104': ProjectAndUnProjectResult(
      Point(x: 6975000.373432801, y: 6039872.843451777),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:32107': ProjectAndUnProjectResult(
      Point(x: -6407205.481935473, y: 14250720.322452161), Point(x: 0, y: 90)),
  'EPSG:32108': ProjectAndUnProjectResult(
      Point(x: -6848369.235542074, y: 11911589.980849914),
      Point(x: 189531435637.07315, y: 59487357072.499916)),
  'EPSG:32109': ProjectAndUnProjectResult(
      Point(x: -7945837.346430153, y: 9227187.99242025),
      Point(x: 53494776.36427391, y: 20053499.392547227)),
  'EPSG:32110': ProjectAndUnProjectResult(
      Point(x: 5368091.402649273, y: 5342638.370730873), Point(x: 0, y: 90)),
  'EPSG:32111': ProjectAndUnProjectResult(
      Point(x: 5111955.253111458, y: 6059884.249141174), Point(x: 0, y: 90)),
  'EPSG:32112': ProjectAndUnProjectResult(
      Point(x: -530531.6564737859, y: 8584058.195630815), Point(x: 0, y: 90)),
  'EPSG:32113': ProjectAndUnProjectResult(
      Point(x: -998074.9727628597, y: 8428106.011472125), Point(x: 0, y: 90)),
  'EPSG:32114': ProjectAndUnProjectResult(
      Point(x: -1388949.665557478, y: 8254150.647986836), Point(x: 0, y: 90)),
  'EPSG:32115': ProjectAndUnProjectResult(
      Point(x: 5111955.253111458, y: 6059884.249141174), Point(x: 0, y: 90)),
  'EPSG:32116': ProjectAndUnProjectResult(
      Point(x: 5102989.244976103, y: 6156462.138120647), Point(x: 0, y: 90)),
  'EPSG:32117': ProjectAndUnProjectResult(
      Point(x: 5070627.948794095, y: 6369472.582025805), Point(x: 0, y: 90)),
  'EPSG:32118': ProjectAndUnProjectResult(
      Point(x: 6120506.5914582675, y: 4115911.994870667),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:32119': ProjectAndUnProjectResult(
      Point(x: 7013164.842371999, y: 4867653.736840957),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:32120': ProjectAndUnProjectResult(
      Point(x: 6465460.630965634, y: 5661785.323388806),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:32121': ProjectAndUnProjectResult(
      Point(x: 6573964.729929726, y: 5741275.293893124),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:32122': ProjectAndUnProjectResult(
      Point(x: 6701563.894453452, y: 4762473.447759279),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:32123': ProjectAndUnProjectResult(
      Point(x: 6823927.076346041, y: 4856567.2808180135),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:32124': ProjectAndUnProjectResult(
      Point(x: 7606719.341866343, y: 6088830.052103923),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:32125': ProjectAndUnProjectResult(
      Point(x: 7788873.682746351, y: 6165418.092119623),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:32126': ProjectAndUnProjectResult(
      Point(x: 8597033.820587108, y: 7390016.602283895),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:32127': ProjectAndUnProjectResult(
      Point(x: 7874076.89548586, y: 7497850.224338042),
      Point(x: 17.88805856028154, y: 46.892264067008725)),
  'EPSG:32128': ProjectAndUnProjectResult(
      Point(x: 6522469.313095474, y: 4396559.711847568),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:32129': ProjectAndUnProjectResult(
      Point(x: 6583746.193120701, y: 4440183.096793512),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:32130': ProjectAndUnProjectResult(
      Point(x: 5173030.8098551845, y: 5481823.207905864), Point(x: 0, y: 90)),
  'EPSG:32133': ProjectAndUnProjectResult(
      Point(x: 7231101.448544078, y: 5119305.1873058975),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:32134': ProjectAndUnProjectResult(
      Point(x: 6731916.633515107, y: 5806582.369900572),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:32135': ProjectAndUnProjectResult(
      Point(x: 6870716.757738419, y: 5915239.061073107),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:32136': ProjectAndUnProjectResult(
      Point(x: 7240825.507643389, y: 5300270.815013457),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:32137': ProjectAndUnProjectResult(
      Point(x: 7393138.261094371, y: 7401668.656500031),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:32138': ProjectAndUnProjectResult(
      Point(x: 7989143.282984504, y: 8276494.464586326),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:32156': ProjectAndUnProjectResult(
      Point(x: -1585501.348464507, y: 7359986.274514455), Point(x: 0, y: 90)),
  'EPSG:32139': ProjectAndUnProjectResult(
      Point(x: 8418734.087582087, y: 9472776.726556078),
      Point(x: 17.88805856028155, y: 46.892264067008746)),
  'EPSG:32140': ProjectAndUnProjectResult(
      Point(x: 8486728.051005203, y: 10453504.590111742),
      Point(x: 17.88805856028154, y: 46.89226406700874)),
  'EPSG:32141': ProjectAndUnProjectResult(
      Point(x: 8484246.042842139, y: 11469435.827622361),
      Point(x: 17.88805856028151, y: 46.892264067008746)),
  'EPSG:32142': ProjectAndUnProjectResult(
      Point(x: 7132858.074758168, y: 7841015.069017461),
      Point(x: 17.888058560281525, y: 46.892264067008746)),
  'EPSG:32143': ProjectAndUnProjectResult(
      Point(x: 7316582.822330039, y: 8971163.047072299),
      Point(x: 17.888058560281525, y: 46.892264067008725)),
  'EPSG:32144': ProjectAndUnProjectResult(
      Point(x: 7595059.15054545, y: 10017430.541012172),
      Point(x: 17.888058560281525, y: 46.89226406700874)),
  'EPSG:32145': ProjectAndUnProjectResult(
      Point(x: 5541768.404689928, y: 5434133.661562179), Point(x: 0, y: 90)),
  'EPSG:32146': ProjectAndUnProjectResult(
      Point(x: 9634482.513941199, y: 6581020.355130133),
      Point(x: 17.888058560281525, y: 46.89226406700873)),
  'EPSG:32157': ProjectAndUnProjectResult(
      Point(x: -2061507.894929119, y: 7079113.201731387), Point(x: 0, y: 90)),
  'EPSG:32147': ProjectAndUnProjectResult(
      Point(x: 9723405.910334777, y: 5663039.725072842),
      Point(x: 17.888058560281486, y: 46.892264067008746)),
  'EPSG:32148': ProjectAndUnProjectResult(
      Point(x: 6208880.764422776, y: 7201291.121268816),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:32149': ProjectAndUnProjectResult(
      Point(x: 6409557.023981855, y: 7281838.145229915),
      Point(x: 17.88805856028154, y: 46.892264067008746)),
  'EPSG:32150': ProjectAndUnProjectResult(
      Point(x: 6701578.612677592, y: 4608732.256874052),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:32151': ProjectAndUnProjectResult(
      Point(x: 6860107.275988375, y: 4799756.489364472),
      Point(x: 17.88805856028151, y: 46.89226406700873)),
  'EPSG:32152': ProjectAndUnProjectResult(
      Point(x: 6517033.000426102, y: 4968571.836722961),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:32153': ProjectAndUnProjectResult(
      Point(x: 6611250.719513921, y: 5046926.8438626565),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:32154': ProjectAndUnProjectResult(
      Point(x: 6723783.25810189, y: 5169377.719135766),
      Point(x: 17.88805856028151, y: 46.89226406700871)),
  'EPSG:32155': ProjectAndUnProjectResult(
      Point(x: -835360.288822798, y: 7469523.565254046), Point(x: 0, y: 90)),
  'EPSG:32158': ProjectAndUnProjectResult(
      Point(x: -2539578.0552160507, y: 6974103.5782705145), Point(x: 0, y: 90)),
  'EPSG:32161': ProjectAndUnProjectResult(
      Point(x: 7328037.617013937, y: 5241769.00316173),
      Point(x: 17.88805856028151, y: 46.89226406700872)),
  'EPSG:32164': ProjectAndUnProjectResult(
      Point(x: 5487686.08144147, y: 39957420.242059514), Point(x: 0, y: 90)),
  'EPSG:32165': ProjectAndUnProjectResult(
      Point(x: 10582786.400749682, y: 39418797.66411147), Point(x: 0, y: 90)),
  'EPSG:32166': ProjectAndUnProjectResult(
      Point(x: 14137615.253530078, y: 38069538.76732615), Point(x: 0, y: 90)),
  'EPSG:32167': ProjectAndUnProjectResult(
      Point(x: 16468782.860413283, y: 36235825.00264775), Point(x: 0, y: 90)),
  'EPSG:32180': ProjectAndUnProjectResult(
      Point(x: 5277537.244089515, y: 8355177.8227729015),
      Point(x: -15979.524499782834, y: 3524.3478798098868)),
  'EPSG:32181': ProjectAndUnProjectResult(
      Point(x: 5186788.657734889, y: 8120071.285067176),
      Point(x: -5022.218661072394, y: 1175.203638907414)),
  'EPSG:32182': ProjectAndUnProjectResult(
      Point(x: 5293828.222920929, y: 8403290.068502737),
      Point(x: -20392.421758802197, y: 4476.186579255094)),
  'EPSG:32183': ProjectAndUnProjectResult(
      Point(x: 5365095.243901447, y: 8649032.835441044),
      Point(x: -76314.668724916, y: 16624.267920019753)),
  'EPSG:32184': ProjectAndUnProjectResult(
      Point(x: 5425861.74852327, y: 8954491.865918288),
      Point(x: -519603.48216074344, y: 113747.10753176517)),
  'EPSG:32185': ProjectAndUnProjectResult(
      Point(x: 5455664.100526009, y: 9269865.456694849),
      Point(x: -6859630.010890731, y: 1508686.9880534173)),
  'EPSG:32186': ProjectAndUnProjectResult(
      Point(x: 5449809.877896608, y: 9592937.814035818),
      Point(x: -411243275.37217355, y: 90346346.30780989)),
  'EPSG:32187': ProjectAndUnProjectResult(
      Point(x: 5403037.173898023, y: 9920877.559935424),
      Point(x: -34661211008946.938, y: 7546306826338.474)),
  'EPSG:32188': ProjectAndUnProjectResult(
      Point(x: 5309461.530223562, y: 10250138.320860693), Point(x: 0, y: 90)),
  'EPSG:32189': ProjectAndUnProjectResult(
      Point(x: 5162519.4015817605, y: 10576348.404652024), Point(x: 0, y: 90)),
  'EPSG:32190': ProjectAndUnProjectResult(
      Point(x: 4954908.029848009, y: 10894188.79017561), Point(x: 0, y: 90)),
  'EPSG:32191': ProjectAndUnProjectResult(
      Point(x: 4678521.605919208, y: 11197258.627550166), Point(x: 0, y: 90)),
  'EPSG:32192': ProjectAndUnProjectResult(
      Point(x: 4825851.505324784, y: 11048016.28656974), Point(x: 0, y: 90)),
  'EPSG:32193': ProjectAndUnProjectResult(
      Point(x: 4511768.526647326, y: 11340922.422261257), Point(x: 0, y: 90)),
  'EPSG:32194': ProjectAndUnProjectResult(
      Point(x: 4115096.9499727935, y: 11607101.102096744), Point(x: 0, y: 90)),
  'EPSG:32195': ProjectAndUnProjectResult(
      Point(x: 3625418.58528727, y: 11836768.953508014), Point(x: 0, y: 90)),
  'EPSG:32196': ProjectAndUnProjectResult(
      Point(x: 3031257.7643432096, y: 12018479.462197395), Point(x: 0, y: 90)),
  'EPSG:32197': ProjectAndUnProjectResult(
      Point(x: 2319999.2891139016, y: 12138921.625162058), Point(x: 0, y: 90)),
  'EPSG:32198': ProjectAndUnProjectResult(
      Point(x: 5088281.174172236, y: 3829932.5590575594),
      Point(x: 17.88805856028151, y: 46.892264067008725)),
  'EPSG:32199': ProjectAndUnProjectResult(
      Point(x: 8818988.21541754, y: 6033384.689384041),
      Point(x: 17.8880585602815, y: 46.89226406700874)),
  'EPSG:32201': ProjectAndUnProjectResult(
      Point(x: 48731410.72626476, y: -23178392.418334335), Point(x: 0, y: -90)),
  'EPSG:32202': ProjectAndUnProjectResult(
      Point(x: 63334035.067999355, y: -38677029.43785351), Point(x: 0, y: -90)),
  'EPSG:32203': ProjectAndUnProjectResult(
      Point(x: 81070332.36641054, y: -59100215.08082769), Point(x: 0, y: -90)),
  'EPSG:32204': ProjectAndUnProjectResult(
      Point(x: -79345177.22661728, y: -58235351.19662066), Point(x: 0, y: -90)),
  'EPSG:32205': ProjectAndUnProjectResult(
      Point(x: -61735158.723653734, y: -38016021.26287999),
      Point(x: 0, y: -90)),
  'EPSG:32206': ProjectAndUnProjectResult(
      Point(x: -47240142.981019855, y: -22681223.86921373),
      Point(x: 0, y: -90)),
  'EPSG:32207': ProjectAndUnProjectResult(
      Point(x: -35393112.60908028, y: -11253726.915576361),
      Point(x: 0, y: -90)),
  'EPSG:32208': ProjectAndUnProjectResult(
      Point(x: -25785808.04882854, y: -2920330.1559317196),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32209': ProjectAndUnProjectResult(
      Point(x: -18062875.513917856, y: 2990708.3566343454),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32210': ProjectAndUnProjectResult(
      Point(x: -11916427.880320996, y: 7029837.816605472),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32211': ProjectAndUnProjectResult(
      Point(x: -7081002.929697016, y: 9644150.221167244),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32212': ProjectAndUnProjectResult(
      Point(x: -3328903.352541949, y: 11193257.0987016), Point(x: 0, y: 90)),
  'EPSG:32213': ProjectAndUnProjectResult(
      Point(x: -465902.9171997283, y: 11963271.723847203), Point(x: 0, y: 90)),
  'EPSG:32214': ProjectAndUnProjectResult(
      Point(x: 1672696.7891896109, y: 12179054.280612223), Point(x: 0, y: 90)),
  'EPSG:32215': ProjectAndUnProjectResult(
      Point(x: 3225674.641727498, y: 12014870.583308987), Point(x: 0, y: 90)),
  'EPSG:32216': ProjectAndUnProjectResult(
      Point(x: 4309178.874703627, y: 11603608.113362944), Point(x: 0, y: 90)),
  'EPSG:32217': ProjectAndUnProjectResult(
      Point(x: 5019712.18837494, y: 11044686.27833102), Point(x: 0, y: 90)),
  'EPSG:32218': ProjectAndUnProjectResult(
      Point(x: 5436828.659500112, y: 10410790.947747512), Point(x: 0, y: 90)),
  'EPSG:32219': ProjectAndUnProjectResult(
      Point(x: 5625558.049552639, y: 9753556.468698364),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32220': ProjectAndUnProjectResult(
      Point(x: 5638573.104535756, y: 9108311.51230768),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32221': ProjectAndUnProjectResult(
      Point(x: 5518115.440322356, y: 8497998.25060304),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32222': ProjectAndUnProjectResult(
      Point(x: 5297695.607443098, y: 7936367.511509169),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32223': ProjectAndUnProjectResult(
      Point(x: 5003582.929245858, y: 7430545.708002313),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32224': ProjectAndUnProjectResult(
      Point(x: 4656100.707349753, y: 6983062.48574052),
      Point(x: -27.571871337591244, y: 55.09596297762314)),
  'EPSG:32225': ProjectAndUnProjectResult(
      Point(x: 4270742.388316864, y: 6593421.181767962),
      Point(x: 9.846641343406638, y: 48.22208112109944)),
  'EPSG:32226': ProjectAndUnProjectResult(
      Point(x: 3859124.2854649015, y: 6259287.335174173),
      Point(x: 16.41818788029525, y: 47.11122779934422)),
  'EPSG:32227': ProjectAndUnProjectResult(
      Point(x: 3429790.449743939, y: 5977363.63887209),
      Point(x: 17.630657910451667, y: 46.9260312841645)),
  'EPSG:32228': ProjectAndUnProjectResult(
      Point(x: 2988885.283600432, y: 5744012.86994149),
      Point(x: 17.84819888840142, y: 46.89671117445793)),
  'EPSG:32229': ProjectAndUnProjectResult(
      Point(x: 2540709.4917516983, y: 5555683.484267417),
      Point(x: 17.88314742431884, y: 46.892699767519574)),
  'EPSG:32230': ProjectAndUnProjectResult(
      Point(x: 2088174.962794024, y: 5409185.70948595),
      Point(x: 17.887652148692474, y: 46.892287557496395)),
  'EPSG:32231': ProjectAndUnProjectResult(
      Point(x: 1633174.1755676097, y: 5301859.1185325645),
      Point(x: 17.888042390247612, y: 46.89226400009126)),
  'EPSG:32232': ProjectAndUnProjectResult(
      Point(x: 1176879.7242015037, y: 5231665.814371233),
      Point(x: 17.88805843545806, y: 46.892264027229594)),
  'EPSG:32233': ProjectAndUnProjectResult(
      Point(x: 719989.5557617337, y: 5197236.5047652),
      Point(x: 17.88805856030201, y: 46.89226406673655)),
  'EPSG:32234': ProjectAndUnProjectResult(
      Point(x: 262933.5144257985, y: 5197889.894233299),
      Point(x: 17.88805856025308, y: 46.89226406670703)),
  'EPSG:32235': ProjectAndUnProjectResult(
      Point(x: -193943.2138932828, y: 5233638.96861848),
      Point(x: 17.888058718667033, y: 46.89226402145434)),
  'EPSG:32236': ProjectAndUnProjectResult(
      Point(x: -650204.1625501956, y: 5305190.895978126),
      Point(x: 17.888077175000547, y: 46.892264059820604)),
  'EPSG:32237': ProjectAndUnProjectResult(
      Point(x: -1105137.5568746324, y: 5413940.415788585),
      Point(x: 17.88850922060228, y: 46.892290765847825)),
  'EPSG:32238': ProjectAndUnProjectResult(
      Point(x: -1557548.6046595068, y: 5561949.7367391605),
      Point(x: 17.893400234014216, y: 46.89274302793883)),
  'EPSG:32239': ProjectAndUnProjectResult(
      Point(x: -2005512.510506879, y: 5751901.111673743),
      Point(x: 17.930937769548677, y: 46.897081394412254)),
  'EPSG:32240': ProjectAndUnProjectResult(
      Point(x: -2446072.620108424, y: 5987001.406521066),
      Point(x: 18.163232024826048, y: 46.928553483313195)),
  'EPSG:32241': ProjectAndUnProjectResult(
      Point(x: -2874868.1005372596, y: 6270811.128337448),
      Point(x: 19.454776353098683, y: 47.126651981940796)),
  'EPSG:32242': ProjectAndUnProjectResult(
      Point(x: -3285675.5626279428, y: 6606963.52586876),
      Point(x: 26.45790233371214, y: 48.314505781248236)),
  'EPSG:32243': ProjectAndUnProjectResult(
      Point(x: -3669849.03152146, y: 6998732.524321191),
      Point(x: 66.47194228891445, y: 55.685778043267476)),
  'EPSG:32244': ProjectAndUnProjectResult(
      Point(x: -4015642.671452025, y: 7448401.404313255),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32245': ProjectAndUnProjectResult(
      Point(x: -4307400.670852506, y: 7956377.283264385),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32246': ProjectAndUnProjectResult(
      Point(x: -4524598.693855303, y: 8519989.605758224),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32247': ProjectAndUnProjectResult(
      Point(x: -4640721.304265481, y: 9131903.997701699),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32248': ProjectAndUnProjectResult(
      Point(x: -4621959.768082979, y: 9778075.98738374),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32249': ProjectAndUnProjectResult(
      Point(x: -4425714.640650734, y: 10435162.244820414), Point(x: 0, y: 90)),
  'EPSG:32250': ProjectAndUnProjectResult(
      Point(x: -3998887.5445055086, y: 11067300.139056066), Point(x: 0, y: 90)),
  'EPSG:32251': ProjectAndUnProjectResult(
      Point(x: -3275946.5440082555, y: 11622159.561372977), Point(x: 0, y: 90)),
  'EPSG:32252': ProjectAndUnProjectResult(
      Point(x: -2176749.522830837, y: 12026164.110644836), Point(x: 0, y: 90)),
  'EPSG:32253': ProjectAndUnProjectResult(
      Point(x: -604109.9703759034, y: 12178771.885352278), Point(x: 0, y: 90)),
  'EPSG:32254': ProjectAndUnProjectResult(
      Point(x: 1558910.4167932295, y: 11945699.275061477), Point(x: 0, y: 90)),
  'EPSG:32255': ProjectAndUnProjectResult(
      Point(x: 4451997.912435863, y: 11150964.292449776), Point(x: 0, y: 90)),
  'EPSG:32256': ProjectAndUnProjectResult(
      Point(x: 8240887.310953688, y: 9567619.135245115),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32257': ProjectAndUnProjectResult(
      Point(x: 13120982.444470005, y: 6907034.815728881),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32258': ProjectAndUnProjectResult(
      Point(x: 19321312.260591634, y: 2806593.8437347473),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32259': ProjectAndUnProjectResult(
      Point(x: 27108838.054777067, y: -3184359.902641289),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32260': ProjectAndUnProjectResult(
      Point(x: 36793127.45123316, y: -11620471.836121114), Point(x: 0, y: -90)),
  'EPSG:32301': ProjectAndUnProjectResult(
      Point(x: 48731410.72626476, y: -13178392.418334335), Point(x: 0, y: -90)),
  'EPSG:32302': ProjectAndUnProjectResult(
      Point(x: 63334035.067999355, y: -28677029.437853508),
      Point(x: 0, y: -90)),
  'EPSG:32303': ProjectAndUnProjectResult(
      Point(x: 81070332.36641054, y: -49100215.08082769), Point(x: 0, y: -90)),
  'EPSG:32304': ProjectAndUnProjectResult(
      Point(x: -79345177.22661728, y: -48235351.19662066), Point(x: 0, y: -90)),
  'EPSG:32305': ProjectAndUnProjectResult(
      Point(x: -61735158.723653734, y: -28016021.26287999),
      Point(x: 0, y: -90)),
  'EPSG:32306': ProjectAndUnProjectResult(
      Point(x: -47240142.981019855, y: -12681223.86921373),
      Point(x: 0, y: -90)),
  'EPSG:32307': ProjectAndUnProjectResult(
      Point(x: -35393112.60908028, y: -1253726.9155763611),
      Point(x: 0, y: -90)),
  'EPSG:32308': ProjectAndUnProjectResult(
      Point(x: -25785808.04882854, y: 7079669.84406828),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32309': ProjectAndUnProjectResult(
      Point(x: -18062875.513917856, y: 12990708.356634345),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32310': ProjectAndUnProjectResult(
      Point(x: -11916427.880320996, y: 17029837.81660547),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32311': ProjectAndUnProjectResult(
      Point(x: -7081002.929697016, y: 19644150.221167244),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32312': ProjectAndUnProjectResult(
      Point(x: -3328903.352541949, y: 21193257.0987016), Point(x: 0, y: 90)),
  'EPSG:32313': ProjectAndUnProjectResult(
      Point(x: -465902.9171997283, y: 21963271.723847203), Point(x: 0, y: 90)),
  'EPSG:32314': ProjectAndUnProjectResult(
      Point(x: 1672696.7891896109, y: 22179054.280612223), Point(x: 0, y: 90)),
  'EPSG:32315': ProjectAndUnProjectResult(
      Point(x: 3225674.641727498, y: 22014870.583308987), Point(x: 0, y: 90)),
  'EPSG:32316': ProjectAndUnProjectResult(
      Point(x: 4309178.874703627, y: 21603608.113362946), Point(x: 0, y: 90)),
  'EPSG:32317': ProjectAndUnProjectResult(
      Point(x: 5019712.18837494, y: 21044686.27833102), Point(x: 0, y: 90)),
  'EPSG:32318': ProjectAndUnProjectResult(
      Point(x: 5436828.659500112, y: 20410790.947747514), Point(x: 0, y: 90)),
  'EPSG:32319': ProjectAndUnProjectResult(
      Point(x: 5625558.049552639, y: 19753556.468698364),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32320': ProjectAndUnProjectResult(
      Point(x: 5638573.104535756, y: 19108311.51230768),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32321': ProjectAndUnProjectResult(
      Point(x: 5518115.440322356, y: 18497998.250603043),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32322': ProjectAndUnProjectResult(
      Point(x: 5297695.607443098, y: 17936367.51150917),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32323': ProjectAndUnProjectResult(
      Point(x: 5003582.929245858, y: 17430545.708002314),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32324': ProjectAndUnProjectResult(
      Point(x: 4656100.707349753, y: 16983062.48574052),
      Point(x: -27.571871337591244, y: 55.09596297762314)),
  'EPSG:32325': ProjectAndUnProjectResult(
      Point(x: 4270742.388316864, y: 16593421.181767963),
      Point(x: 9.846641343406638, y: 48.22208112109944)),
  'EPSG:32326': ProjectAndUnProjectResult(
      Point(x: 3859124.2854649015, y: 16259287.335174173),
      Point(x: 16.41818788029525, y: 47.11122779934422)),
  'EPSG:32327': ProjectAndUnProjectResult(
      Point(x: 3429790.449743939, y: 15977363.63887209),
      Point(x: 17.63065791045167, y: 46.926031284164516)),
  'EPSG:32328': ProjectAndUnProjectResult(
      Point(x: 2988885.283600432, y: 15744012.86994149),
      Point(x: 17.84819888840142, y: 46.89671117445793)),
  'EPSG:32329': ProjectAndUnProjectResult(
      Point(x: 2540709.4917516983, y: 15555683.484267417),
      Point(x: 17.88314742431884, y: 46.892699767519574)),
  'EPSG:32330': ProjectAndUnProjectResult(
      Point(x: 2088174.962794024, y: 15409185.70948595),
      Point(x: 17.887652148692474, y: 46.892287557496395)),
  'EPSG:32331': ProjectAndUnProjectResult(
      Point(x: 1633174.1755676097, y: 15301859.118532564),
      Point(x: 17.888042390247612, y: 46.89226400009126)),
  'EPSG:32332': ProjectAndUnProjectResult(
      Point(x: 1176879.7242015037, y: 15231665.814371232),
      Point(x: 17.88805843545806, y: 46.892264027229594)),
  'EPSG:32333': ProjectAndUnProjectResult(
      Point(x: 719989.5557617337, y: 15197236.504765201),
      Point(x: 17.888058560302017, y: 46.89226406673656)),
  'EPSG:32334': ProjectAndUnProjectResult(
      Point(x: 262933.5144257985, y: 15197889.8942333),
      Point(x: 17.88805856025308, y: 46.89226406670703)),
  'EPSG:32335': ProjectAndUnProjectResult(
      Point(x: -193943.2138932828, y: 15233638.968618479),
      Point(x: 17.888058718667033, y: 46.892264021454324)),
  'EPSG:32336': ProjectAndUnProjectResult(
      Point(x: -650204.1625501956, y: 15305190.895978127),
      Point(x: 17.888077175000543, y: 46.89226405982061)),
  'EPSG:32337': ProjectAndUnProjectResult(
      Point(x: -1105137.5568746324, y: 15413940.415788585),
      Point(x: 17.88850922060228, y: 46.892290765847825)),
  'EPSG:32338': ProjectAndUnProjectResult(
      Point(x: -1557548.6046595068, y: 15561949.73673916),
      Point(x: 17.893400234014216, y: 46.89274302793883)),
  'EPSG:32339': ProjectAndUnProjectResult(
      Point(x: -2005512.510506879, y: 15751901.111673743),
      Point(x: 17.93093776954868, y: 46.89708139441223)),
  'EPSG:32340': ProjectAndUnProjectResult(
      Point(x: -2446072.620108424, y: 15987001.406521067),
      Point(x: 18.163232024826033, y: 46.928553483313195)),
  'EPSG:32341': ProjectAndUnProjectResult(
      Point(x: -2874868.1005372596, y: 16270811.128337448),
      Point(x: 19.454776353098683, y: 47.126651981940796)),
  'EPSG:32342': ProjectAndUnProjectResult(
      Point(x: -3285675.5626279428, y: 16606963.52586876),
      Point(x: 26.45790233371214, y: 48.314505781248236)),
  'EPSG:32343': ProjectAndUnProjectResult(
      Point(x: -3669849.03152146, y: 16998732.52432119),
      Point(x: 66.47194228891445, y: 55.685778043267476)),
  'EPSG:32344': ProjectAndUnProjectResult(
      Point(x: -4015642.671452025, y: 17448401.404313255),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32345': ProjectAndUnProjectResult(
      Point(x: -4307400.670852506, y: 17956377.283264384),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32346': ProjectAndUnProjectResult(
      Point(x: -4524598.693855303, y: 18519989.605758224),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32347': ProjectAndUnProjectResult(
      Point(x: -4640721.304265481, y: 19131903.997701697),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32348': ProjectAndUnProjectResult(
      Point(x: -4621959.768082979, y: 19778075.98738374),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32349': ProjectAndUnProjectResult(
      Point(x: -4425714.640650734, y: 20435162.244820416), Point(x: 0, y: 90)),
  'EPSG:32350': ProjectAndUnProjectResult(
      Point(x: -3998887.5445055086, y: 21067300.139056064), Point(x: 0, y: 90)),
  'EPSG:32351': ProjectAndUnProjectResult(
      Point(x: -3275946.5440082555, y: 21622159.561372977), Point(x: 0, y: 90)),
  'EPSG:32352': ProjectAndUnProjectResult(
      Point(x: -2176749.522830837, y: 22026164.110644836), Point(x: 0, y: 90)),
  'EPSG:32353': ProjectAndUnProjectResult(
      Point(x: -604109.9703759034, y: 22178771.885352276), Point(x: 0, y: 90)),
  'EPSG:32354': ProjectAndUnProjectResult(
      Point(x: 1558910.4167932295, y: 21945699.275061477), Point(x: 0, y: 90)),
  'EPSG:32355': ProjectAndUnProjectResult(
      Point(x: 4451997.912435863, y: 21150964.292449776), Point(x: 0, y: 90)),
  'EPSG:32356': ProjectAndUnProjectResult(
      Point(x: 8240887.310953688, y: 19567619.135245115),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32357': ProjectAndUnProjectResult(
      Point(x: 13120982.444470005, y: 16907034.81572888),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32358': ProjectAndUnProjectResult(
      Point(x: 19321312.260591634, y: 12806593.843734747),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32359': ProjectAndUnProjectResult(
      Point(x: 27108838.054777067, y: 6815640.097358711),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32360': ProjectAndUnProjectResult(
      Point(x: 36793127.45123316, y: -1620471.836121114), Point(x: 0, y: -90)),
  'EPSG:32401': ProjectAndUnProjectResult(
      Point(x: 48731517.81213103, y: -23178594.644360166), Point(x: 0, y: -90)),
  'EPSG:32402': ProjectAndUnProjectResult(
      Point(x: 63334159.8937896, y: -38677292.54704166), Point(x: 0, y: -90)),
  'EPSG:32403': ProjectAndUnProjectResult(
      Point(x: 81070476.80571313, y: -59100553.021996945), Point(x: 0, y: -90)),
  'EPSG:32404': ProjectAndUnProjectResult(
      Point(x: -79344855.32791239, y: -58235131.556991085),
      Point(x: 0, y: -90)),
  'EPSG:32405': ProjectAndUnProjectResult(
      Point(x: -61734898.40327702, y: -38015858.17358152), Point(x: 0, y: -90)),
  'EPSG:32406': ProjectAndUnProjectResult(
      Point(x: -47239934.11086311, y: -22681105.494763702),
      Point(x: 0, y: -90)),
  'EPSG:32407': ProjectAndUnProjectResult(
      Point(x: -35392946.48653899, y: -11253643.479347916),
      Point(x: 0, y: -90)),
  'EPSG:32408': ProjectAndUnProjectResult(
      Point(x: -25785677.231619343, y: -2920273.6470246506),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32409': ProjectAndUnProjectResult(
      Point(x: -18062773.66962608, y: 2990744.443970755),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32410': ProjectAndUnProjectResult(
      Point(x: -11916349.64978897, y: 7029858.7135606585),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32411': ProjectAndUnProjectResult(
      Point(x: -7080943.803390667, y: 9644160.08741643),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32412': ProjectAndUnProjectResult(
      Point(x: -3328859.559059032, y: 11193259.200246263), Point(x: 0, y: 90)),
  'EPSG:32413': ProjectAndUnProjectResult(
      Point(x: -465871.3231095788, y: 11963268.587870788), Point(x: 0, y: 90)),
  'EPSG:32414': ProjectAndUnProjectResult(
      Point(x: 1672718.7689579055, y: 12179047.829461386), Point(x: 0, y: 90)),
  'EPSG:32415': ProjectAndUnProjectResult(
      Point(x: 3225689.1237056614, y: 12014862.249600887), Point(x: 0, y: 90)),
  'EPSG:32416': ProjectAndUnProjectResult(
      Point(x: 4309187.577643858, y: 11603598.938110195), Point(x: 0, y: 90)),
  'EPSG:32417': ProjectAndUnProjectResult(
      Point(x: 5019716.49565262, y: 11044676.993868379), Point(x: 0, y: 90)),
  'EPSG:32418': ProjectAndUnProjectResult(
      Point(x: 5436829.6738369465, y: 10410782.047138054), Point(x: 0, y: 90)),
  'EPSG:32419': ProjectAndUnProjectResult(
      Point(x: 5625556.640711239, y: 9753548.263191989),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32420': ProjectAndUnProjectResult(
      Point(x: 5638569.950610054, y: 9108304.17832085),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32421': ProjectAndUnProjectResult(
      Point(x: 5518111.063221807, y: 8497991.867586268),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32422': ProjectAndUnProjectResult(
      Point(x: 5297690.403142097, y: 7936362.09196743),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32423': ProjectAndUnProjectResult(
      Point(x: 5003577.193343334, y: 7430541.220833549),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32424': ProjectAndUnProjectResult(
      Point(x: 4656094.656457355, y: 6983058.873958703),
      Point(x: -27.57092920387882, y: 55.09578399056394)),
  'EPSG:32425': ProjectAndUnProjectResult(
      Point(x: 4270736.1777677275, y: 6593418.37557956),
      Point(x: 9.846800694644998, y: 48.22205304180354)),
  'EPSG:32426': ProjectAndUnProjectResult(
      Point(x: 3859118.0238083755, y: 6259285.261280761),
      Point(x: 16.41821709762818, y: 47.11122310960708)),
  'EPSG:32427': ProjectAndUnProjectResult(
      Point(x: 3429784.2104652897, y: 5977362.22677672),
      Point(x: 17.630663275443172, y: 46.92603051675081)),
  'EPSG:32428': ProjectAndUnProjectResult(
      Point(x: 2988879.1144779213, y: 5744012.055942789),
      Point(x: 17.848199800120362, y: 46.8967110616659)),
  'EPSG:32429': ProjectAndUnProjectResult(
      Point(x: 2540703.4222370097, y: 5555683.213732827),
      Point(x: 17.883147554185353, y: 46.89269975417453)),
  'EPSG:32430': ProjectAndUnProjectResult(
      Point(x: 2088169.0097754837, y: 5409185.937904331),
      Point(x: 17.88765216198478, y: 46.89228755630947)),
  'EPSG:32431': ProjectAndUnProjectResult(
      Point(x: 1633168.3478491474, y: 5301859.811756402),
      Point(x: 17.888042390973137, y: 46.89226399985367)),
  'EPSG:32432': ProjectAndUnProjectResult(
      Point(x: 1176874.0260038166, y: 5231666.948369947),
      Point(x: 17.888058435467624, y: 46.892264027010974)),
  'EPSG:32433': ProjectAndUnProjectResult(
      Point(x: 719983.9895255994, y: 5197238.0651236),
      Point(x: 17.888058560302014, y: 46.89226406651619)),
  'EPSG:32434': ProjectAndUnProjectResult(
      Point(x: 262928.083171, y: 5197891.875543011),
      Point(x: 17.88805856025308, y: 46.89226406648665)),
  'EPSG:32435': ProjectAndUnProjectResult(
      Point(x: -193948.50442646828, y: 5233641.373825211),
      Point(x: 17.888058718679194, y: 46.89226402123199)),
  'EPSG:32436': ProjectAndUnProjectResult(
      Point(x: -650209.3017764816, y: 5305193.735663939),
      Point(x: 17.888077175853876, y: 46.89226405962163)),
  'EPSG:32437': ProjectAndUnProjectResult(
      Point(x: -1105142.5270822244, y: 5413943.707285861),
      Point(x: 17.888509235870348, y: 46.89229076673143)),
  'EPSG:32438': ProjectAndUnProjectResult(
      Point(x: -1557553.378424156, y: 5561953.502891805),
      Point(x: 17.89340038197337, y: 46.89274304250409)),
  'EPSG:32439': ProjectAndUnProjectResult(
      Point(x: -2005517.0476805307, y: 5751905.378981176),
      Point(x: 17.93093880612568, y: 46.89708152044742)),
  'EPSG:32440': ProjectAndUnProjectResult(
      Point(x: -2446076.8642879915, y: 5987006.20232189),
      Point(x: 18.163238126838824, y: 46.928554342884645)),
  'EPSG:32441': ProjectAndUnProjectResult(
      Point(x: -2874871.97494556, y: 6270816.47661225),
      Point(x: 19.45480962053619, y: 47.1266572417216)),
  'EPSG:32442': ProjectAndUnProjectResult(
      Point(x: -3285678.96536533, y: 6606969.441165312),
      Point(x: 26.458083919647496, y: 48.31453732222703)),
  'EPSG:32443': ProjectAndUnProjectResult(
      Point(x: -3669851.830173186, y: 6998739.003230398),
      Point(x: 66.47301573426668, y: 55.68597954889782)),
  'EPSG:32444': ProjectAndUnProjectResult(
      Point(x: -4015644.697062861, y: 7448408.413850539),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32445': ProjectAndUnProjectResult(
      Point(x: -4307401.711306657, y: 7956384.7454387555),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32446': ProjectAndUnProjectResult(
      Point(x: -4524598.486726128, y: 8519997.37754015),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32447': ProjectAndUnProjectResult(
      Point(x: -4640719.529226061, y: 9131911.845530968),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32448': ProjectAndUnProjectResult(
      Point(x: -4621956.038995068, y: 9778083.555289863),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32449': ProjectAndUnProjectResult(
      Point(x: -4425708.497476092, y: 10435169.015160706), Point(x: 0, y: 90)),
  'EPSG:32450': ProjectAndUnProjectResult(
      Point(x: -3998878.4452101476, y: 11067305.384810433), Point(x: 0, y: 90)),
  'EPSG:32451': ProjectAndUnProjectResult(
      Point(x: -3275933.8566566375, y: 11622162.288869504), Point(x: 0, y: 90)),
  'EPSG:32452': ProjectAndUnProjectResult(
      Point(x: -2176732.518093519, y: 12026162.991526676), Point(x: 0, y: 90)),
  'EPSG:32453': ProjectAndUnProjectResult(
      Point(x: -604087.8147006773, y: 12178765.176533924), Point(x: 0, y: 90)),
  'EPSG:32454': ProjectAndUnProjectResult(
      Point(x: 1558938.6670702074, y: 11945684.725361427), Point(x: 0, y: 90)),
  'EPSG:32455': ProjectAndUnProjectResult(
      Point(x: 4452033.315735971, y: 11150939.034526685), Point(x: 0, y: 90)),
  'EPSG:32456': ProjectAndUnProjectResult(
      Point(x: 8240931.043529119, y: 9567579.561405916),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32457': ProjectAndUnProjectResult(
      Point(x: 13121035.801548582, y: 6906976.436120027),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32458': ProjectAndUnProjectResult(
      Point(x: 19321376.655210562, y: 2806511.125371611),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32459': ProjectAndUnProjectResult(
      Point(x: 27108915.01389651, y: -3184473.7176067317),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32460': ProjectAndUnProjectResult(
      Point(x: 36793218.60869456, y: -11620624.934547767), Point(x: 0, y: -90)),
  'EPSG:32501': ProjectAndUnProjectResult(
      Point(x: 48731517.81213103, y: -13178594.644360166), Point(x: 0, y: -90)),
  'EPSG:32502': ProjectAndUnProjectResult(
      Point(x: 63334159.8937896, y: -28677292.547041662), Point(x: 0, y: -90)),
  'EPSG:32503': ProjectAndUnProjectResult(
      Point(x: 81070476.80571313, y: -49100553.021996945), Point(x: 0, y: -90)),
  'EPSG:32504': ProjectAndUnProjectResult(
      Point(x: -79344855.32791239, y: -48235131.556991085),
      Point(x: 0, y: -90)),
  'EPSG:32505': ProjectAndUnProjectResult(
      Point(x: -61734898.40327702, y: -28015858.17358152), Point(x: 0, y: -90)),
  'EPSG:32506': ProjectAndUnProjectResult(
      Point(x: -47239934.11086311, y: -12681105.494763702),
      Point(x: 0, y: -90)),
  'EPSG:32507': ProjectAndUnProjectResult(
      Point(x: -35392946.48653899, y: -1253643.4793479163),
      Point(x: 0, y: -90)),
  'EPSG:32508': ProjectAndUnProjectResult(
      Point(x: -25785677.231619343, y: 7079726.35297535),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32509': ProjectAndUnProjectResult(
      Point(x: -18062773.66962608, y: 12990744.443970755),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32510': ProjectAndUnProjectResult(
      Point(x: -11916349.64978897, y: 17029858.71356066),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32511': ProjectAndUnProjectResult(
      Point(x: -7080943.803390667, y: 19644160.08741643),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32512': ProjectAndUnProjectResult(
      Point(x: -3328859.559059032, y: 21193259.200246263), Point(x: 0, y: 90)),
  'EPSG:32513': ProjectAndUnProjectResult(
      Point(x: -465871.3231095788, y: 21963268.587870788), Point(x: 0, y: 90)),
  'EPSG:32514': ProjectAndUnProjectResult(
      Point(x: 1672718.7689579055, y: 22179047.82946139), Point(x: 0, y: 90)),
  'EPSG:32515': ProjectAndUnProjectResult(
      Point(x: 3225689.1237056614, y: 22014862.249600887), Point(x: 0, y: 90)),
  'EPSG:32516': ProjectAndUnProjectResult(
      Point(x: 4309187.577643858, y: 21603598.938110195), Point(x: 0, y: 90)),
  'EPSG:32517': ProjectAndUnProjectResult(
      Point(x: 5019716.49565262, y: 21044676.99386838), Point(x: 0, y: 90)),
  'EPSG:32518': ProjectAndUnProjectResult(
      Point(x: 5436829.6738369465, y: 20410782.047138054), Point(x: 0, y: 90)),
  'EPSG:32519': ProjectAndUnProjectResult(
      Point(x: 5625556.640711239, y: 19753548.26319199),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32520': ProjectAndUnProjectResult(
      Point(x: 5638569.950610054, y: 19108304.178320847),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32521': ProjectAndUnProjectResult(
      Point(x: 5518111.063221807, y: 18497991.86758627),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32522': ProjectAndUnProjectResult(
      Point(x: 5297690.403142097, y: 17936362.09196743),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32523': ProjectAndUnProjectResult(
      Point(x: 5003577.193343334, y: 17430541.220833547),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32524': ProjectAndUnProjectResult(
      Point(x: 4656094.656457355, y: 16983058.873958703),
      Point(x: -27.57092920387882, y: 55.09578399056394)),
  'EPSG:32525': ProjectAndUnProjectResult(
      Point(x: 4270736.1777677275, y: 16593418.37557956),
      Point(x: 9.846800694644998, y: 48.22205304180354)),
  'EPSG:32526': ProjectAndUnProjectResult(
      Point(x: 3859118.0238083755, y: 16259285.26128076),
      Point(x: 16.41821709762818, y: 47.11122310960708)),
  'EPSG:32527': ProjectAndUnProjectResult(
      Point(x: 3429784.2104652897, y: 15977362.22677672),
      Point(x: 17.630663275443172, y: 46.92603051675081)),
  'EPSG:32528': ProjectAndUnProjectResult(
      Point(x: 2988879.1144779213, y: 15744012.055942789),
      Point(x: 17.848199800120362, y: 46.8967110616659)),
  'EPSG:32529': ProjectAndUnProjectResult(
      Point(x: 2540703.4222370097, y: 15555683.213732827),
      Point(x: 17.883147554185353, y: 46.89269975417453)),
  'EPSG:32530': ProjectAndUnProjectResult(
      Point(x: 2088169.0097754837, y: 15409185.937904332),
      Point(x: 17.887652161984786, y: 46.89228755630948)),
  'EPSG:32531': ProjectAndUnProjectResult(
      Point(x: 1633168.3478491474, y: 15301859.811756402),
      Point(x: 17.888042390973137, y: 46.89226399985367)),
  'EPSG:32532': ProjectAndUnProjectResult(
      Point(x: 1176874.0260038166, y: 15231666.948369946),
      Point(x: 17.888058435467624, y: 46.892264027010974)),
  'EPSG:32533': ProjectAndUnProjectResult(
      Point(x: 719983.9895255994, y: 15197238.065123599),
      Point(x: 17.888058560302014, y: 46.892264066516184)),
  'EPSG:32534': ProjectAndUnProjectResult(
      Point(x: 262928.083171, y: 15197891.875543011),
      Point(x: 17.88805856025308, y: 46.89226406648665)),
  'EPSG:32535': ProjectAndUnProjectResult(
      Point(x: -193948.50442646828, y: 15233641.373825211),
      Point(x: 17.888058718679194, y: 46.89226402123199)),
  'EPSG:32536': ProjectAndUnProjectResult(
      Point(x: -650209.3017764816, y: 15305193.73566394),
      Point(x: 17.888077175853876, y: 46.89226405962163)),
  'EPSG:32537': ProjectAndUnProjectResult(
      Point(x: -1105142.5270822244, y: 15413943.70728586),
      Point(x: 17.888509235870348, y: 46.89229076673143)),
  'EPSG:32538': ProjectAndUnProjectResult(
      Point(x: -1557553.378424156, y: 15561953.502891805),
      Point(x: 17.89340038197337, y: 46.89274304250409)),
  'EPSG:32539': ProjectAndUnProjectResult(
      Point(x: -2005517.0476805307, y: 15751905.378981177),
      Point(x: 17.930938806125692, y: 46.897081520447436)),
  'EPSG:32540': ProjectAndUnProjectResult(
      Point(x: -2446076.8642879915, y: 15987006.20232189),
      Point(x: 18.163238126838824, y: 46.928554342884645)),
  'EPSG:32541': ProjectAndUnProjectResult(
      Point(x: -2874871.97494556, y: 16270816.476612251),
      Point(x: 19.45480962053619, y: 47.12665724172161)),
  'EPSG:32542': ProjectAndUnProjectResult(
      Point(x: -3285678.96536533, y: 16606969.441165313),
      Point(x: 26.458083919647517, y: 48.31453732222704)),
  'EPSG:32543': ProjectAndUnProjectResult(
      Point(x: -3669851.830173186, y: 16998739.003230397),
      Point(x: 66.47301573426653, y: 55.685979548897784)),
  'EPSG:32544': ProjectAndUnProjectResult(
      Point(x: -4015644.697062861, y: 17448408.41385054),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32545': ProjectAndUnProjectResult(
      Point(x: -4307401.711306657, y: 17956384.745438755),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32546': ProjectAndUnProjectResult(
      Point(x: -4524598.486726128, y: 18519997.37754015),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32547': ProjectAndUnProjectResult(
      Point(x: -4640719.529226061, y: 19131911.84553097),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32548': ProjectAndUnProjectResult(
      Point(x: -4621956.038995068, y: 19778083.555289865),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32549': ProjectAndUnProjectResult(
      Point(x: -4425708.497476092, y: 20435169.015160706), Point(x: 0, y: 90)),
  'EPSG:32550': ProjectAndUnProjectResult(
      Point(x: -3998878.4452101476, y: 21067305.384810433), Point(x: 0, y: 90)),
  'EPSG:32551': ProjectAndUnProjectResult(
      Point(x: -3275933.8566566375, y: 21622162.288869504), Point(x: 0, y: 90)),
  'EPSG:32552': ProjectAndUnProjectResult(
      Point(x: -2176732.518093519, y: 22026162.99152668), Point(x: 0, y: 90)),
  'EPSG:32553': ProjectAndUnProjectResult(
      Point(x: -604087.8147006773, y: 22178765.176533923), Point(x: 0, y: 90)),
  'EPSG:32554': ProjectAndUnProjectResult(
      Point(x: 1558938.6670702074, y: 21945684.72536143), Point(x: 0, y: 90)),
  'EPSG:32555': ProjectAndUnProjectResult(
      Point(x: 4452033.315735971, y: 21150939.034526683), Point(x: 0, y: 90)),
  'EPSG:32556': ProjectAndUnProjectResult(
      Point(x: 8240931.043529119, y: 19567579.561405916),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32557': ProjectAndUnProjectResult(
      Point(x: 13121035.801548582, y: 16906976.436120026),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32558': ProjectAndUnProjectResult(
      Point(x: 19321376.655210562, y: 12806511.12537161),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32559': ProjectAndUnProjectResult(
      Point(x: 27108915.01389651, y: 6815526.282393268),
      Point(x: double.nan, y: double.nan)),
  'EPSG:32560': ProjectAndUnProjectResult(
      Point(x: 36793218.60869456, y: -1620624.934547767), Point(x: 0, y: -90)),
  'EPSG:32601': ProjectAndUnProjectResult(
      Point(x: 48730994.201937996, y: -23178134.33221813), Point(x: 0, y: -90)),
  'EPSG:32602': ProjectAndUnProjectResult(
      Point(x: 63333518.09363211, y: -38676678.41689138), Point(x: 0, y: -90)),
  'EPSG:32603': ProjectAndUnProjectResult(
      Point(x: 81069695.48161745, y: -59099747.137833305), Point(x: 0, y: -90)),
  'EPSG:32604': ProjectAndUnProjectResult(
      Point(x: -79345537.23046954, y: -58236069.63121628), Point(x: 0, y: -90)),
  'EPSG:32623': ProjectAndUnProjectResult(
      Point(x: 5003589.29844938, y: 7430562.4168033395),
      Point(x: 87.06844227254395, y: 103.32192587245024)),
  'EPSG:32624': ProjectAndUnProjectResult(
      Point(x: 4656108.536498728, y: 6983077.85961133),
      Point(x: -27.574000094098345, y: 55.096361670026944)),
  'EPSG:32625': ProjectAndUnProjectResult(
      Point(x: 4270751.307736807, y: 6593435.187451664),
      Point(x: 9.84627979280035, y: 48.22214374760744)),
  'EPSG:32626': ProjectAndUnProjectResult(
      Point(x: 3859134.008783412, y: 6259299.997026029),
      Point(x: 16.418121572280526, y: 47.11123824637677)),
  'EPSG:32627': ProjectAndUnProjectResult(
      Point(x: 3429800.7591484087, y: 5977375.014710562),
      Point(x: 17.630645767875883, y: 46.926032986590954)),
  'EPSG:32628': ProjectAndUnProjectResult(
      Point(x: 2988896.0169229344, y: 5744023.03356412),
      Point(x: 17.848196835452416, y: 46.89671142260486)),
  'EPSG:32629': ProjectAndUnProjectResult(
      Point(x: 2540720.5313107786, y: 5555692.513201211),
      Point(x: 17.883147133968592, y: 46.89269979625918)),
  'EPSG:32630': ProjectAndUnProjectResult(
      Point(x: 2088186.225879029, y: 5409193.676717313),
      Point(x: 17.887652119235128, y: 46.8922875597492)),
  'EPSG:32631': ProjectAndUnProjectResult(
      Point(x: 1633185.6064071131, y: 5301866.087137116),
      Point(x: 17.888042388656356, y: 46.89226400033798)),
  'EPSG:32632': ProjectAndUnProjectResult(
      Point(x: 1176891.2872133553, y: 5231671.834139232),
      Point(x: 17.88805843543735, y: 46.89226402744535)),
  'EPSG:32633': ProjectAndUnProjectResult(
      Point(x: 720001.2298381603, y: 5197241.610093783),
      Point(x: 17.888058560302017, y: 46.89226406695652)),
  'EPSG:32634': ProjectAndUnProjectResult(
      Point(x: 262945.2879629513, y: 5197894.102732273),
      Point(x: 17.88805856025308, y: 46.89226406692703)),
  'EPSG:32635': ProjectAndUnProjectResult(
      Point(x: -193931.3475560262, y: 5233642.280052007),
      Point(x: 17.88805871864152, y: 46.89226402167793)),
  'EPSG:32636': ProjectAndUnProjectResult(
      Point(x: -650192.2096599129, y: 5305193.291340299),
      Point(x: 17.88807717323444, y: 46.892264059984264)),
  'EPSG:32637': ProjectAndUnProjectResult(
      Point(x: -1105125.5281863362, y: 5413941.8564866185),
      Point(x: 17.888509189327262, y: 46.89229076369042)),
  'EPSG:32638': ProjectAndUnProjectResult(
      Point(x: -1557536.5212162894, y: 5561950.164033774),
      Point(x: 17.893399933574567, y: 46.89274299727972)),
  'EPSG:32639': ProjectAndUnProjectResult(
      Point(x: -2005500.4107896662, y: 5751900.446702114),
      Point(x: 17.93093567947049, y: 46.89708113439577)),
  'EPSG:32640': ProjectAndUnProjectResult(
      Point(x: -2446060.569110333, y: 5986999.55140372),
      Point(x: 18.16321978290508, y: 46.92855172420238)),
  'EPSG:32641': ProjectAndUnProjectResult(
      Point(x: -2874856.2013616185, y: 6270807.969046427),
      Point(x: 19.454709786875302, y: 47.12664126126442)),
  'EPSG:32642': ProjectAndUnProjectResult(
      Point(x: -3285663.971253113, y: 6606958.9377104975),
      Point(x: 26.457538859857106, y: 48.31444156546475)),
  'EPSG:32643': ProjectAndUnProjectResult(
      Point(x: -3669837.9754196387, y: 6998726.381063664),
      Point(x: 66.46978443192005, y: 55.68536724668764)),
  'EPSG:32644': ProjectAndUnProjectResult(
      Point(x: -4015632.4727932913, y: 7448393.592163174),
      Point(x: -29.20355224616991, y: 107.75568997892748)),
  'EPSG:32645': ProjectAndUnProjectResult(
      Point(x: -4307391.775069423, y: 7956367.721076452),
      Point(x: 2295.099359406656, y: 590.2186927982785)),
  'EPSG:32646': ProjectAndUnProjectResult(
      Point(x: -4524591.704387454, y: 8519978.27303488),
      Point(x: 38040.25674781569, y: 8289.769436337667)),
  'EPSG:32647': ProjectAndUnProjectResult(
      Point(x: -4640717.024347393, y: 9131890.972118106),
      Point(x: 2043698.7541324345, y: 448818.11751850427)),
  'EPSG:32648': ProjectAndUnProjectResult(
      Point(x: -4621959.250482938, y: 9778061.493749313),
      Point(x: 30362279592.18099, y: 6642887093.450607)),
  'EPSG:32649': ProjectAndUnProjectResult(
      Point(x: -4425719.24631206, y: 10435146.71756466), Point(x: 0, y: 90)),
  'EPSG:32650': ProjectAndUnProjectResult(
      Point(x: -3998899.0110859387, y: 11067284.300503207), Point(x: 0, y: 90)),
  'EPSG:32651': ProjectAndUnProjectResult(
      Point(x: -3275967.065357107, y: 11622144.5182464), Point(x: 0, y: 90)),
  'EPSG:32652': ProjectAndUnProjectResult(
      Point(x: -2176781.8404877554, y: 12026151.471419258), Point(x: 0, y: 90)),
  'EPSG:32653': ProjectAndUnProjectResult(
      Point(x: -604157.4782189683, y: 12178763.901248254), Point(x: 0, y: 90)),
  'EPSG:32654': ProjectAndUnProjectResult(
      Point(x: 1558843.5535780834, y: 11945699.007653777), Point(x: 0, y: 90)),
  'EPSG:32655': ProjectAndUnProjectResult(
      Point(x: 4451906.622848249, y: 11150975.81103817), Point(x: 0, y: 90)),
  'EPSG:32656': ProjectAndUnProjectResult(
      Point(x: 8240765.466874875, y: 9567647.74731296),
      Point(x: -4967267524.084756, y: 1643558556.5869083)),
  'EPSG:32657': ProjectAndUnProjectResult(
      Point(x: 13120822.691257693, y: 6907087.3339921795),
      Point(x: -142413.85804992775, y: 81938.05167517894)),
  'EPSG:32658': ProjectAndUnProjectResult(
      Point(x: 19321105.82822534, y: 2806678.8934613597),
      Point(x: -5175.116547763912, y: 7749.823531212802)),
  'EPSG:32659': ProjectAndUnProjectResult(
      Point(x: 27108574.548161704, y: -3184231.5321853566),
      Point(x: -103767.21813583322, y: -188871.77571889045)),
  'EPSG:32660': ProjectAndUnProjectResult(
      Point(x: 36792794.61822483, y: -11620286.792064108), Point(x: 0, y: -90)),
  'EPSG:32661': ProjectAndUnProjectResult(
      Point(x: 3540763.4661860038, y: -2773696.963262149),
      Point(x: 17.888058560281515, y: 46.89226406700877)),
  'EPSG:32662': ProjectAndUnProjectResult(
      Point(x: 1991289.5702107965, y: 5220022.958083138),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:32663': ProjectAndUnProjectResult(
      Point(x: 1991289.5702107965, y: 5220022.958083138),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:32664': ProjectAndUnProjectResult(
      Point(x: 5487686.082005338, y: 39957420.24214098), Point(x: 0, y: 90)),
  'EPSG:32665': ProjectAndUnProjectResult(
      Point(x: 10582786.401117966, y: 39418797.664189056), Point(x: 0, y: 90)),
  'EPSG:32666': ProjectAndUnProjectResult(
      Point(x: 14137615.253747612, y: 38069538.76741713), Point(x: 0, y: 90)),
  'EPSG:32667': ProjectAndUnProjectResult(
      Point(x: 16468782.86051709, y: 36235825.00276324), Point(x: 0, y: 90)),
  'EPSG:32701': ProjectAndUnProjectResult(
      Point(x: 48730994.201937996, y: -13178134.33221813), Point(x: 0, y: -90)),
  'EPSG:32702': ProjectAndUnProjectResult(
      Point(x: 63333518.09363211, y: -28676678.41689138), Point(x: 0, y: -90)),
  'EPSG:32703': ProjectAndUnProjectResult(
      Point(x: 81069695.48161745, y: -49099747.137833305), Point(x: 0, y: -90)),
  'EPSG:32704': ProjectAndUnProjectResult(
      Point(x: -79345537.23046954, y: -48236069.63121628), Point(x: 0, y: -90)),
  'EPSG:32705': ProjectAndUnProjectResult(
      Point(x: -61735465.00836595, y: -28016576.898993805),
      Point(x: 0, y: -90)),
  'EPSG:32706': ProjectAndUnProjectResult(
      Point(x: -47240401.76177123, y: -12681647.637932241),
      Point(x: 0, y: -90)),
  'EPSG:32707': ProjectAndUnProjectResult(
      Point(x: -35393329.619301565, y: -1254044.783200482),
      Point(x: 0, y: -90)),
  'EPSG:32708': ProjectAndUnProjectResult(
      Point(x: -25785988.54441397, y: 7079436.220885424),
      Point(x: 72517.82974998129, y: -135482.78847814907)),
  'EPSG:32709': ProjectAndUnProjectResult(
      Point(x: -18063024.28264584, y: 12990541.042800236),
      Point(x: 5728.679565344177, y: 8118.48046660466)),
  'EPSG:32710': ProjectAndUnProjectResult(
      Point(x: -11916549.255717097, y: 17029722.0728038),
      Point(x: 169423.46822256624, y: 95274.64645617674)),
  'EPSG:32711': ProjectAndUnProjectResult(
      Point(x: -7081100.808616535, y: 19644074.03580277),
      Point(x: 16894389361.82516, y: 5473429535.782776)),
  'EPSG:32712': ProjectAndUnProjectResult(
      Point(x: -3328981.215793029, y: 21193210.77317494), Point(x: 0, y: 90)),
  'EPSG:32713': ProjectAndUnProjectResult(
      Point(x: -465963.852572312, y: 21963247.506934203), Point(x: 0, y: 90)),
  'EPSG:32714': ProjectAndUnProjectResult(
      Point(x: 1672650.0620793512, y: 22179046.04789667), Point(x: 0, y: 90)),
  'EPSG:32715': ProjectAndUnProjectResult(
      Point(x: 3225639.745324246, y: 22014873.55779194), Point(x: 0, y: 90)),
  'EPSG:32716': ProjectAndUnProjectResult(
      Point(x: 4309153.746633765, y: 21603618.62354599), Point(x: 0, y: 90)),
  'EPSG:32717': ProjectAndUnProjectResult(
      Point(x: 5019695.054259717, y: 21044701.550245337), Point(x: 0, y: 90)),
  'EPSG:32718': ProjectAndUnProjectResult(
      Point(x: 5436818.00587551, y: 20410808.927574996), Point(x: 0, y: 90)),
  'EPSG:32719': ProjectAndUnProjectResult(
      Point(x: 5625552.597266308, y: 19753575.67280566),
      Point(x: -14563147131.785913, y: 3188443835.3108788)),
  'EPSG:32720': ProjectAndUnProjectResult(
      Point(x: 5638571.782947235, y: 19108330.90168845),
      Point(x: -1685042.2533001453, y: 369929.7982766386)),
  'EPSG:32721': ProjectAndUnProjectResult(
      Point(x: 5518117.36258884, y: 18498017.1268986),
      Point(x: -33811.09013091508, y: 7380.196889341078)),
  'EPSG:32722': ProjectAndUnProjectResult(
      Point(x: 5297700.047128848, y: 17936385.431952223),
      Point(x: -2039.7976296405445, y: 544.0590624398534)),
  'EPSG:32723': ProjectAndUnProjectResult(
      Point(x: 5003589.29844938, y: 17430562.416803338),
      Point(x: 87.06844227254507, y: 103.32192587245001)),
  'EPSG:32724': ProjectAndUnProjectResult(
      Point(x: 4656108.536498728, y: 16983077.85961133),
      Point(x: -27.57400009409816, y: 55.0963616700269)),
  'EPSG:32725': ProjectAndUnProjectResult(
      Point(x: 4270751.307736807, y: 16593435.187451664),
      Point(x: 9.84627979280035, y: 48.22214374760744)),
  'EPSG:32726': ProjectAndUnProjectResult(
      Point(x: 3859134.008783412, y: 16259299.99702603),
      Point(x: 16.418121572280523, y: 47.11123824637677)),
  'EPSG:32727': ProjectAndUnProjectResult(
      Point(x: 3429800.7591484087, y: 15977375.014710562),
      Point(x: 17.630645767875883, y: 46.926032986590954)),
  'EPSG:32728': ProjectAndUnProjectResult(
      Point(x: 2988896.0169229344, y: 15744023.03356412),
      Point(x: 17.848196835452416, y: 46.89671142260487)),
  'EPSG:32729': ProjectAndUnProjectResult(
      Point(x: 2540720.5313107786, y: 15555692.51320121),
      Point(x: 17.883147133968592, y: 46.89269979625918)),
  'EPSG:32730': ProjectAndUnProjectResult(
      Point(x: 2088186.225879029, y: 15409193.676717313),
      Point(x: 17.887652119235128, y: 46.8922875597492)),
  'EPSG:32731': ProjectAndUnProjectResult(
      Point(x: 1633185.6064071131, y: 15301866.087137116),
      Point(x: 17.888042388656356, y: 46.89226400033798)),
  'EPSG:32732': ProjectAndUnProjectResult(
      Point(x: 1176891.2872133553, y: 15231671.834139232),
      Point(x: 17.88805843543735, y: 46.89226402744535)),
  'EPSG:32733': ProjectAndUnProjectResult(
      Point(x: 720001.2298381603, y: 15197241.610093784),
      Point(x: 17.888058560302017, y: 46.89226406695653)),
  'EPSG:32734': ProjectAndUnProjectResult(
      Point(x: 262945.2879629513, y: 15197894.102732273),
      Point(x: 17.88805856025308, y: 46.89226406692703)),
  'EPSG:32735': ProjectAndUnProjectResult(
      Point(x: -193931.3475560262, y: 15233642.280052006),
      Point(x: 17.888058718641524, y: 46.892264021677924)),
  'EPSG:32736': ProjectAndUnProjectResult(
      Point(x: -650192.2096599129, y: 15305193.291340299),
      Point(x: 17.88807717323444, y: 46.892264059984264)),
  'EPSG:32737': ProjectAndUnProjectResult(
      Point(x: -1105125.5281863362, y: 15413941.856486619),
      Point(x: 17.888509189327262, y: 46.89229076369042)),
  'EPSG:32738': ProjectAndUnProjectResult(
      Point(x: -1557536.5212162894, y: 15561950.164033774),
      Point(x: 17.893399933574567, y: 46.89274299727972)),
  'EPSG:32739': ProjectAndUnProjectResult(
      Point(x: -2005500.4107896662, y: 15751900.446702115),
      Point(x: 17.930935679470483, y: 46.897081134395776)),
  'EPSG:32740': ProjectAndUnProjectResult(
      Point(x: -2446060.569110333, y: 15986999.55140372),
      Point(x: 18.16321978290508, y: 46.92855172420238)),
  'EPSG:32741': ProjectAndUnProjectResult(
      Point(x: -2874856.2013616185, y: 16270807.969046427),
      Point(x: 19.454709786875302, y: 47.12664126126442)),
  'EPSG:32742': ProjectAndUnProjectResult(
      Point(x: -3285663.971253113, y: 16606958.937710498),
      Point(x: 26.457538859857106, y: 48.31444156546475)),
  'EPSG:32743': ProjectAndUnProjectResult(
      Point(x: -3669837.9754196387, y: 16998726.381063662),
      Point(x: 66.46978443191988, y: 55.6853672466876)),
  'EPSG:32744': ProjectAndUnProjectResult(
      Point(x: -4015632.4727932913, y: 17448393.592163175),
      Point(x: -29.20355224616991, y: 107.75568997892748)),
  'EPSG:32745': ProjectAndUnProjectResult(
      Point(x: -4307391.775069423, y: 17956367.72107645),
      Point(x: 2295.099359406642, y: 590.2186927982755)),
  'EPSG:32746': ProjectAndUnProjectResult(
      Point(x: -4524591.704387454, y: 18519978.273034878),
      Point(x: 38040.256747815445, y: 8289.769436337614)),
  'EPSG:32747': ProjectAndUnProjectResult(
      Point(x: -4640717.024347393, y: 19131890.972118106),
      Point(x: 2043698.7541324345, y: 448818.11751850427)),
  'EPSG:32748': ProjectAndUnProjectResult(
      Point(x: -4621959.250482938, y: 19778061.493749313),
      Point(x: 30362279592.18099, y: 6642887093.450607)),
  'EPSG:32749': ProjectAndUnProjectResult(
      Point(x: -4425719.24631206, y: 20435146.717564657), Point(x: 0, y: 90)),
  'EPSG:32750': ProjectAndUnProjectResult(
      Point(x: -3998899.0110859387, y: 21067284.30050321), Point(x: 0, y: 90)),
  'EPSG:32751': ProjectAndUnProjectResult(
      Point(x: -3275967.065357107, y: 21622144.518246397), Point(x: 0, y: 90)),
  'EPSG:32752': ProjectAndUnProjectResult(
      Point(x: -2176781.8404877554, y: 22026151.47141926), Point(x: 0, y: 90)),
  'EPSG:32753': ProjectAndUnProjectResult(
      Point(x: -604157.4782189683, y: 22178763.901248254), Point(x: 0, y: 90)),
  'EPSG:32754': ProjectAndUnProjectResult(
      Point(x: 1558843.5535780834, y: 21945699.007653777), Point(x: 0, y: 90)),
  'EPSG:32755': ProjectAndUnProjectResult(
      Point(x: 4451906.622848249, y: 21150975.81103817), Point(x: 0, y: 90)),
  'EPSG:32756': ProjectAndUnProjectResult(
      Point(x: 8240765.466874875, y: 19567647.74731296),
      Point(x: -4967267524.084756, y: 1643558556.5869083)),
  'EPSG:32757': ProjectAndUnProjectResult(
      Point(x: 13120822.691257693, y: 16907087.33399218),
      Point(x: -142413.85804992775, y: 81938.05167517894)),
  'EPSG:32758': ProjectAndUnProjectResult(
      Point(x: 19321105.82822534, y: 12806678.89346136),
      Point(x: -5175.116547763912, y: 7749.823531212802)),
  'EPSG:32759': ProjectAndUnProjectResult(
      Point(x: 27108574.548161704, y: 6815768.467814643),
      Point(x: -103767.21813583322, y: -188871.77571889054)),
  'EPSG:32760': ProjectAndUnProjectResult(
      Point(x: 36792794.61822483, y: -1620286.792064108), Point(x: 0, y: -90)),
  'EPSG:32766': ProjectAndUnProjectResult(
      Point(x: -877885.5006516529, y: 15354804.257526185),
      Point(x: 17.888161981005894, y: 46.89226782538485)),
  'EPSG:8999': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:9000': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:9003': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8860': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8900': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8902': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8907': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8988': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8989': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8990': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8991': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8992': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8993': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8994': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8995': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8996': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8997': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8998': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'spatialreferencing.org:900913': ProjectAndUnProjectResult(
      Point(x: 1991289.5702107965, y: 5893278.543519946),
      Point(x: 17.888058560281515, y: 46.89192236199592)),
  'EPSG:8351': ProjectAndUnProjectResult(
      Point(x: 17.88934004484768, y: 46.89256388598383),
      Point(x: 17.88805852862393, y: 46.892264110072865)),
  'EPSG:8427': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8428': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89308433805259),
      Point(x: 17.888058560281515, y: 46.89226409307021)),
  'EPSG:8431': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8449': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8545': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8685': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:8818': ProjectAndUnProjectResult(
      Point(x: 17.888058560281515, y: 46.89226406700879),
      Point(x: 17.888058560281515, y: 46.89226406700879)),
  'EPSG:5896': ProjectAndUnProjectResult(
      Point(x: -4652275.287064603, y: 9454768.882961797),
      Point(x: double.nan, y: double.nan)),
  'EPSG:5897': ProjectAndUnProjectResult(
      Point(x: -4623587.388099429, y: 9781039.67478536),
      Point(x: double.nan, y: double.nan)),
  'EPSG:5898': ProjectAndUnProjectResult(
      Point(x: -4550677.6545024095, y: 10110235.462374557),
      Point(x: -168.37939778999916, y: 89.99824032468668)),
  'EPSG:5899': ProjectAndUnProjectResult(
      Point(x: -4558590.894691086, y: 10082782.95357802),
      Point(x: -168.37939778999916, y: 89.99824032468668)),
  'EPSG:8352': ProjectAndUnProjectResult(
      Point(x: -528543.9649871907, y: -1425017.3661174867),
      Point(x: 17.88805852862392, y: 46.89226411006948)),
  'EPSG:8353': ProjectAndUnProjectResult(
      Point(x: -528543.9649871907, y: -1425017.3661174867),
      Point(x: 17.88805852862392, y: 46.89226411006948)),
  'EPSG:8379': ProjectAndUnProjectResult(
      Point(x: -6101658.922161825, y: 6464136.30032029), Point(x: 0, y: 90)),
  'EPSG:8380': ProjectAndUnProjectResult(
      Point(x: -20018525.9804926, y: 21207753.845334165), Point(x: 0, y: 90)),
  'EPSG:8381': ProjectAndUnProjectResult(
      Point(x: -5901875.958520465, y: 6664355.523168516), Point(x: 0, y: 90)),
  'EPSG:8382': ProjectAndUnProjectResult(
      Point(x: -19363071.37391257, y: 21864639.745562054), Point(x: 0, y: 90)),
  'EPSG:8383': ProjectAndUnProjectResult(
      Point(x: -6101658.922161825, y: 6464136.30032029), Point(x: 0, y: 90)),
  'EPSG:8384': ProjectAndUnProjectResult(
      Point(x: -20018525.9804926, y: 21207753.845334165), Point(x: 0, y: 90)),
  'EPSG:8385': ProjectAndUnProjectResult(
      Point(x: -5901875.958520465, y: 6664355.523168516), Point(x: 0, y: 90)),
  'EPSG:8387': ProjectAndUnProjectResult(
      Point(x: -19363071.37391257, y: 21864639.745562054), Point(x: 0, y: 90)),
  'EPSG:8391': ProjectAndUnProjectResult(
      Point(x: 1359192.0527579375, y: 13949630.71527612), Point(x: 0, y: 90)),
  'EPSG:8395': ProjectAndUnProjectResult(
      Point(x: 1177162.152080137, y: 5233765.340154357),
      Point(x: 17.88805843543735, y: 46.892264027445336)),
  'EPSG:8433': ProjectAndUnProjectResult(
      Point(x: -4758861.0031654285, y: 8275272.920901373), Point(x: 0, y: 90)),
  'EPSG:8455': ProjectAndUnProjectResult(
      Point(x: -604157.4780445739, y: 22178763.901223246), Point(x: 0, y: 90)),
  'EPSG:8456': ProjectAndUnProjectResult(
      Point(x: 1558843.5538291563, y: 21945699.007619552), Point(x: 0, y: 90)),
  'EPSG:8518': ProjectAndUnProjectResult(
      Point(x: 2568192.1867609676, y: 26231785.49699532), Point(x: 0, y: 90)),
  'EPSG:8519': ProjectAndUnProjectResult(
      Point(x: 4299088.837258916, y: 26286193.93867544), Point(x: 0, y: 90)),
  'EPSG:8520': ProjectAndUnProjectResult(
      Point(x: 5952317.323946266, y: 26321824.754202325), Point(x: 0, y: 90)),
  'EPSG:8521': ProjectAndUnProjectResult(
      Point(x: 7894508.763283352, y: 26349908.7582918), Point(x: 0, y: 90)),
  'EPSG:8522': ProjectAndUnProjectResult(
      Point(x: 9678901.615483083, y: 26351636.208173048), Point(x: 0, y: 90)),
  'EPSG:8523': ProjectAndUnProjectResult(
      Point(x: 11178511.569606742, y: 26341238.571121696), Point(x: 0, y: 90)),
  'EPSG:8524': ProjectAndUnProjectResult(
      Point(x: 12940183.515098223, y: 26307191.59882053), Point(x: 0, y: 90)),
  'EPSG:8529': ProjectAndUnProjectResult(
      Point(x: 13776808.246564932, y: 26521702.797595344), Point(x: 0, y: 90)),
  'EPSG:8531': ProjectAndUnProjectResult(
      Point(x: 15898636.447117478, y: 26592265.251529764), Point(x: 0, y: 90)),
  'EPSG:8533': ProjectAndUnProjectResult(
      Point(x: 17671771.18706724, y: 26619118.53267276), Point(x: 0, y: 90)),
  'EPSG:8534': ProjectAndUnProjectResult(
      Point(x: 19148432.40305358, y: 26626034.48773308), Point(x: 0, y: 90)),
  'EPSG:8535': ProjectAndUnProjectResult(
      Point(x: 20792906.346516766, y: 26622981.894110717), Point(x: 0, y: 90)),
  'EPSG:8539': ProjectAndUnProjectResult(
      Point(x: 26140622.956820395, y: 26478605.71820706), Point(x: 0, y: 90)),
  'EPSG:8540': ProjectAndUnProjectResult(
      Point(x: 27868917.51798148, y: 26385093.896493554), Point(x: 0, y: 90)),
  'EPSG:8677': ProjectAndUnProjectResult(
      Point(x: 5720441.9003260825, y: 5198321.17970864),
      Point(x: 17.888058599075265, y: 46.89226406920315)),
  'EPSG:8678': ProjectAndUnProjectResult(
      Point(x: 6491873.651574707, y: 5194261.4486098),
      Point(x: 17.888058599054723, y: 46.89226406925582)),
  'EPSG:8679': ProjectAndUnProjectResult(
      Point(x: 8034783.418643825, y: 5212389.0560713485),
      Point(x: 17.888058601884644, y: 46.89226406470986)),
  'EPSG:8682': ProjectAndUnProjectResult(
      Point(x: 262945.2879608735, y: 5197894.102611037),
      Point(x: 17.888058560253082, y: 46.89226406692702)),
  'EPSG:8686': ProjectAndUnProjectResult(
      Point(x: 720433.4260679072, y: 5198320.70633447),
      Point(x: 17.888058568987322, y: 46.892263983233086)),
  'EPSG:8687': ProjectAndUnProjectResult(
      Point(x: 720001.2298400886, y: 5197241.60997254),
      Point(x: 17.888058560302017, y: 46.89226406695651)),
  'EPSG:8692': ProjectAndUnProjectResult(
      Point(x: 1558843.5538291563, y: 11945699.00761955), Point(x: 0, y: 90)),
  'EPSG:8693': ProjectAndUnProjectResult(
      Point(x: 4451906.623195637, y: 11150975.810983855), Point(x: 0, y: 90)),
  'EPSG:8826': ProjectAndUnProjectResult(
      Point(x: -3082500.665039772, y: 7082564.862886984), Point(x: 0, y: 90)),
  'EPSG:8836': ProjectAndUnProjectResult(
      Point(x: -650192.2096700789, y: 5305193.291220044),
      Point(x: 17.888077173234436, y: 46.89226405998426)),
  'EPSG:8837': ProjectAndUnProjectResult(
      Point(x: -1105125.5282006196, y: 5413941.856367431),
      Point(x: 17.888509189327227, y: 46.89229076369037)),
  'EPSG:8838': ProjectAndUnProjectResult(
      Point(x: -1557536.5212347228, y: 5561950.163916144),
      Point(x: 17.89339993357438, y: 46.89274299727956)),
  'EPSG:8839': ProjectAndUnProjectResult(
      Point(x: -2005500.4108122215, y: 5751900.446586641),
      Point(x: 17.930935679469886, y: 46.897081134395314)),
  'EPSG:8840': ProjectAndUnProjectResult(
      Point(x: -2446060.569136869, y: 5986999.55129112),
      Point(x: 18.16321978290487, y: 46.92855172420158)),
  'EPSG:8903': ProjectAndUnProjectResult(
      Point(x: 48730994.20351042, y: -13178134.332903616), Point(x: 0, y: -90)),
  'EPSG:8908': ProjectAndUnProjectResult(
      Point(x: 4706968.526647326, y: 11340922.422261257), Point(x: 0, y: 90)),
  'EPSG:8909': ProjectAndUnProjectResult(
      Point(x: 4309153.746567462, y: 11603618.623518256), Point(x: 0, y: 90)),
  'EPSG:8910': ProjectAndUnProjectResult(
      Point(x: 5019695.054228077, y: 11044701.550210133), Point(x: 0, y: 90)),
};
