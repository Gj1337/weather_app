'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"splash/img/light-2x.png": "b06cf7ac4e5c679df817379151b94884",
"splash/img/light-4x.png": "80fb1c6795bf16ab15faa114e548264d",
"splash/img/light-3x.png": "e9c7d0cd83d1ae9dd4abc9ae028ef36e",
"splash/img/dark-2x.png": "b06cf7ac4e5c679df817379151b94884",
"splash/img/dark-3x.png": "e9c7d0cd83d1ae9dd4abc9ae028ef36e",
"splash/img/dark-4x.png": "80fb1c6795bf16ab15faa114e548264d",
"splash/img/dark-1x.png": "c17099f62b4fe573c8ecd6093c5df82e",
"splash/img/light-1x.png": "c17099f62b4fe573c8ecd6093c5df82e",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"manifest.json": "e8c95478b1e82db2548133efa5031fd5",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"index.html": "ab29f7d8e7cf1bbc49f4929df9a296da",
"/": "ab29f7d8e7cf1bbc49f4929df9a296da",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin": "2e328a077863e5facf1d1f8924b5708e",
"assets/assets/image/flags/mh.png": "65dc5be9a2964fb8ec8d101a6357bf8f",
"assets/assets/image/flags/ck.png": "0b643928bc8012c742b9afe441c1b3df",
"assets/assets/image/flags/fm.png": "9334c7023c795f089107bd5a06010e97",
"assets/assets/image/flags/cx.png": "c9969e9c8e53d904da0ed0fead34bde1",
"assets/assets/image/flags/tv.png": "ee6056bfb4c62b1990f548764f83276a",
"assets/assets/image/flags/dk.png": "4291afcf929624d87f707fb678705e81",
"assets/assets/image/flags/jm.png": "06beadf30fe1f4c6845b2c8d2039f135",
"assets/assets/image/flags/bz.png": "9c846aacd334ade305f644cb8be3d689",
"assets/assets/image/flags/mp.png": "6a7fbb6166a7117d42359ae1cf7f265f",
"assets/assets/image/flags/hu.png": "e7c128fc9a109cef4a3cfc00bc73d48c",
"assets/assets/image/flags/dm.png": "b735a2247a58fc6a6b0aaee679fb8598",
"assets/assets/image/flags/mf.png": "accf64fcddcddf2c7c7fb6a7fda2c5e8",
"assets/assets/image/flags/dz.png": "9a62da42fd566e5b46748e3ac5f92966",
"assets/assets/image/flags/ca.png": "bea9b401ba5711633699875cf0182c30",
"assets/assets/image/flags/gt.png": "2791b68757cd31e89af8817817e589f0",
"assets/assets/image/flags/at.png": "3d36c83a3d671b11f755c891bd8de687",
"assets/assets/image/flags/rs.png": "cb28ac9e60d17980d4e7640030dcc8c3",
"assets/assets/image/flags/si.png": "412b06ea880a643ba2973506aa4e54a6",
"assets/assets/image/flags/pa.png": "87bbde4404cd8d8703e530ad4c34fed3",
"assets/assets/image/flags/ml.png": "b41e6a6048b2bf4337cbfd6fb29664fb",
"assets/assets/image/flags/ai.png": "419288c7cae107634116209db5925614",
"assets/assets/image/flags/ng.png": "369d6bb22a645db12a1fd52c867cc6d9",
"assets/assets/image/flags/gb-nir.png": "0d838cfb0a420d3c2c72546d817b5563",
"assets/assets/image/flags/lr.png": "93285735c63a2d047760adf08acf6642",
"assets/assets/image/flags/uz.png": "ac1ef675ba9c9483611188fee5f4876c",
"assets/assets/image/flags/gb-sct.png": "cb432bee284eeb4d76246dd35c30b50e",
"assets/assets/image/flags/mm.png": "e292a2745a8a9cd838ee6c32d2b462a5",
"assets/assets/image/flags/bm.png": "48326f8ac9ed436e9f818dd1dbb42cc2",
"assets/assets/image/flags/cl.png": "6735e0e2d88c119e9ed1533be5249ef1",
"assets/assets/image/flags/lt.png": "ab515ec4ccdb894c136b21d1fc9a0e8c",
"assets/assets/image/flags/so.png": "e7a203447fef96c4f76e3ffe9e5981a1",
"assets/assets/image/flags/rw.png": "9a4daaf27658424cb87daf6b1a4004fa",
"assets/assets/image/flags/sm.png": "c688632033c106cc618e4e79dd4f92cc",
"assets/assets/image/flags/sr.png": "46fa17fb522c62e07f228a97a32b91f5",
"assets/assets/image/flags/cm.png": "82f412327b5fec819399d696aa21fd1c",
"assets/assets/image/flags/gf.png": "accf64fcddcddf2c7c7fb6a7fda2c5e8",
"assets/assets/image/flags/dj.png": "d7997edbf7bb0996edc86edb0c1d8adb",
"assets/assets/image/flags/pe.png": "8584703c96d30b6248773caa10684404",
"assets/assets/image/flags/hm.png": "e46bb4764ae0eb4cad4973411b4df9dd",
"assets/assets/image/flags/az.png": "a80b3b7f42446b36ba6a1f99dea0b620",
"assets/assets/image/flags/qa.png": "21bf2c323c454338dc1fd64447f2ed65",
"assets/assets/image/flags/sc.png": "bbc7799711418e356e5e6bfce74469ab",
"assets/assets/image/flags/mo.png": "6098299bc3ec4a26a09977c441d640e2",
"assets/assets/image/flags/im.png": "0059f99feff878494aeebdc3b0c29a2d",
"assets/assets/image/flags/kr.png": "4a0963917c8c1b71374445fdb00e6bfc",
"assets/assets/image/flags/ht.png": "4cb2caaa0cee46df6cd063b7f53dc6ff",
"assets/assets/image/flags/md.png": "d0ec49b47e3eaaaacf3b80735a33d9ac",
"assets/assets/image/flags/bs.png": "64a79a562bfbcdd9f06c5529ffd278ac",
"assets/assets/image/flags/as.png": "b23fa0fdb28e8565849c6b0515adb43f",
"assets/assets/image/flags/lv.png": "99712c75e89fa90652b83c41fac343db",
"assets/assets/image/flags/ke.png": "c2cde3da0640aef861375cd69591408d",
"assets/assets/image/flags/pr.png": "6d55565166e2795c1d6219040ce55ce4",
"assets/assets/image/flags/tm.png": "b322a57cd0da5825637c77ab7ada4def",
"assets/assets/image/flags/mr.png": "ea4fa7c0834cf1e6815dd014730549df",
"assets/assets/image/flags/is.png": "2768fa1d3b117a60cc964016b2a864ff",
"assets/assets/image/flags/ls.png": "2bca756f9313957347404557acb532b0",
"assets/assets/image/flags/af.png": "90d5349c8b429afcc13ae513d764de20",
"assets/assets/image/flags/sy.png": "9fd4edf45b5efff7c1cd48f465174b53",
"assets/assets/image/flags/au.png": "e46bb4764ae0eb4cad4973411b4df9dd",
"assets/assets/image/flags/mn.png": "35405e55d374337bcf0ac9c01a63f627",
"assets/assets/image/flags/mu.png": "ae0a8b0a77204041e0247496aab764e0",
"assets/assets/image/flags/ve.png": "c177b253feaa781aae0368ae9d55d702",
"assets/assets/image/flags/mz.png": "3bce789f6780525f09212b677239f2d5",
"assets/assets/image/flags/hr.png": "31b0594886b695526fd60bc537c42359",
"assets/assets/image/flags/jo.png": "f34dfa6f05e9647b9f0c9c4adbec9e1e",
"assets/assets/image/flags/ne.png": "89c2cbd76d15ae5c43f814b5ef5010dd",
"assets/assets/image/flags/uy.png": "2552122ca3ba462f6285f3f527359ba5",
"assets/assets/image/flags/cd.png": "99206255930c039496af16501909a309",
"assets/assets/image/flags/bn.png": "1f1c5a29f9a6fd77963f7bb3de5946c2",
"assets/assets/image/flags/mc.png": "5d0f9ddd7e088fc677001249286e4bbb",
"assets/assets/image/flags/sb.png": "119c7d2ffcb27b2636fa60e09f7727fb",
"assets/assets/image/flags/tz.png": "ef66adccf10030a025c37a2cf74eeced",
"assets/assets/image/flags/nz.png": "d904af16e77442dfa8d2fd0712134c31",
"assets/assets/image/flags/bf.png": "5746b4e7bb2c86e7a2dc5077226b9952",
"assets/assets/image/flags/gr.png": "4eb54995bc8b06d1af6c98e333c1ec90",
"assets/assets/image/flags/bw.png": "906dfdf826a164ac501f724317f636cc",
"assets/assets/image/flags/sl.png": "818767b618348eb8d0d8ccf45c13b00a",
"assets/assets/image/flags/nf.png": "23da9af1115f2dab51240ff0a435cdc0",
"assets/assets/image/flags/mg.png": "0ef6271ad284ebc0069ff0aeb5a3ad1e",
"assets/assets/image/flags/vg.png": "063a6e328bc8e917f9b1d7b92f4ea627",
"assets/assets/image/flags/gb-wls.png": "74e73d030683c21d2183d92025d11be9",
"assets/assets/image/flags/za.png": "8dd295059cc3df6c5720fc6b6c623cf9",
"assets/assets/image/flags/cf.png": "5d4e0a3a525a53cbdc8d6905d179615f",
"assets/assets/image/flags/bh.png": "930d0965a99d4f5489c9606811dc2d4e",
"assets/assets/image/flags/iq.png": "5dd76347a97649c4081c00c41cb314d3",
"assets/assets/image/flags/nl.png": "3649c177693bfee9c2fcc63c191a51f1",
"assets/assets/image/flags/cv.png": "37a9a92fa41977378ace90166790ff37",
"assets/assets/image/flags/hk.png": "c478b39a99611da13ceee6a77c1117c7",
"assets/assets/image/flags/mt.png": "db5af1dc3822efe320ba1756c582e701",
"assets/assets/image/flags/ga.png": "e87b93f71bbbb8963b8c047b6f38f02c",
"assets/assets/image/flags/ws.png": "ea4415c0b34d2d5692f966576f0ac614",
"assets/assets/image/flags/gq.png": "44c4cf55c991c91d2f4f6c569ad1dce8",
"assets/assets/image/flags/cy.png": "a4eaff7268e4f1de43295537ec21d999",
"assets/assets/image/flags/co.png": "8fed4036e5811bbcd18d595c838cfa93",
"assets/assets/image/flags/lu.png": "8b99909deeda83503e463f9e93df944d",
"assets/assets/image/flags/re.png": "accf64fcddcddf2c7c7fb6a7fda2c5e8",
"assets/assets/image/flags/km.png": "e8b3ccfae2d1ac301bc49b2aad07f3d9",
"assets/assets/image/flags/cw.png": "a3fac0bd092f06969d7256871a19d71c",
"assets/assets/image/flags/pt.png": "d4dcc107bc7d5b9f37bdc6a71c156e3d",
"assets/assets/image/flags/tn.png": "615c582adaa12cf8701c5aad4b5ecef8",
"assets/assets/image/flags/to.png": "1cdd716b5b5502f85d6161dac6ee6c5b",
"assets/assets/image/flags/ee.png": "579ef3e454ff07b0dff9d7b298061d86",
"assets/assets/image/flags/kw.png": "199a24a8c6a146250e5f1f676e54a2f0",
"assets/assets/image/flags/mk.png": "c461698a5938f6a246a5a0e9f9dd8403",
"assets/assets/image/flags/cn.png": "86525400733e5d3e9698837d065557d2",
"assets/assets/image/flags/me.png": "a2ca2c8d5567775b6f00634bcdb7a6f9",
"assets/assets/image/flags/cu.png": "e34c17e60a3bcb5964bd15c34b314318",
"assets/assets/image/flags/br.png": "4d47e5b273c0043e76bfd6ac76c3e035",
"assets/assets/image/flags/pk.png": "ef6f00b47fc227c180fc37c3df163525",
"assets/assets/image/flags/na.png": "310025b1efe7a7b57396b11f665fab71",
"assets/assets/image/flags/nu.png": "afb6d4aaaf7fc28129272ac14f3f3e53",
"assets/assets/image/flags/pm.png": "accf64fcddcddf2c7c7fb6a7fda2c5e8",
"assets/assets/image/flags/ph.png": "158bd50b6f2d18f398e8600f6663b488",
"assets/assets/image/flags/va.png": "e84a6f9dc08930a11d1e4b9d25b6234f",
"assets/assets/image/flags/ni.png": "9b574592e1768bf558991952ae43273d",
"assets/assets/image/flags/lb.png": "9021e62c8c511b1fc124f388f95c36b1",
"assets/assets/image/flags/ci.png": "df604d75c798c28612187d40f3d7191f",
"assets/assets/image/flags/ki.png": "3023c9ceb54245062e942fd3f0cbcb84",
"assets/assets/image/flags/gi.png": "987d065705257febe56bdbe05a294749",
"assets/assets/image/flags/td.png": "6d35e9d972e29a722bec54452b3cd990",
"assets/assets/image/flags/gh.png": "b35464dca793fa33e51bf890b5f3d92b",
"assets/assets/image/flags/sa.png": "f90a8a84a896c35db4c42a5cdf0a9c32",
"assets/assets/image/flags/tw.png": "4680853ec4e4e3da638f2ece8b49e1c8",
"assets/assets/image/flags/li.png": "c456c7e17a72b3f7cae9df3048d289a8",
"assets/assets/image/flags/bb.png": "bf8783d30871a93fdd8b06087acbdb05",
"assets/assets/image/flags/th.png": "1ccc1093350d12d9c2658a750c40f41d",
"assets/assets/image/flags/tf.png": "dd909c36e42f8bd27066cc99b2ac4aea",
"assets/assets/image/flags/ua.png": "97226016ba61372993dc6a937f43f97d",
"assets/assets/image/flags/ie.png": "7861ac704bc87a0a177e9656857eeb15",
"assets/assets/image/flags/sj.png": "acac90b02e3f6a9339ffac751866d6fc",
"assets/assets/image/flags/yt.png": "accf64fcddcddf2c7c7fb6a7fda2c5e8",
"assets/assets/image/flags/aw.png": "e40b57f8bb68c11b0a297e31adfea974",
"assets/assets/image/flags/bg.png": "a4b79408ef18e8f219b1fa82ec41b5aa",
"assets/assets/image/flags/tt.png": "2633904bd4718afeecfa0503057a7f65",
"assets/assets/image/flags/tg.png": "c6b4ba918b81bfa86f705fe5261bcf98",
"assets/assets/image/flags/kg.png": "5a32354643cd12cb559164e76f5c2216",
"assets/assets/image/flags/ba.png": "954893d3a2f1df100e7b617616b3c00f",
"assets/assets/image/flags/sv.png": "773e72c8f80200ad485b3409abc5ce5c",
"assets/assets/image/flags/ps.png": "720022f91d18dba61aad878a11210c96",
"assets/assets/image/flags/bv.png": "acac90b02e3f6a9339ffac751866d6fc",
"assets/assets/image/flags/vu.png": "47ba92e2fe9961be0991dc76520dade9",
"assets/assets/image/flags/be.png": "e7c07c11bd7b8b4cefa531de20b35820",
"assets/assets/image/flags/ar.png": "a023a19ed16261d084053c662b7583d5",
"assets/assets/image/flags/eh.png": "20c3f5c1ba098b471be3d0dda6dc4782",
"assets/assets/image/flags/vc.png": "f281a7db6798c5fbea7b642c02928dc8",
"assets/assets/image/flags/vn.png": "4713de4d33aa3209ca368be0e4240dd5",
"assets/assets/image/flags/do.png": "84ddff50de381667abda11e6a9a3e96e",
"assets/assets/image/flags/bt.png": "43e973113f8c57a5cd303a49b5f371da",
"assets/assets/image/flags/pn.png": "4691a2048733fcd8efc7883a2709b61f",
"assets/assets/image/flags/fk.png": "f273ca58c60a9bb06d845b18540d343f",
"assets/assets/image/flags/je.png": "127d5034de0b360b6946808d0a6cfb78",
"assets/assets/image/flags/my.png": "f1219a709e46ce19aa8c2a6460993ecf",
"assets/assets/image/flags/sh.png": "0d838cfb0a420d3c2c72546d817b5563",
"assets/assets/image/flags/cg.png": "8848102bfd65f9c19b480cfd7023e867",
"assets/assets/image/flags/sz.png": "a06f0fa489d9c9faf0690673242005d2",
"assets/assets/image/flags/ma.png": "f18f84b18ae1e2bc57264451677446b9",
"assets/assets/image/flags/vi.png": "bfe5691810c27983346bf52eb5149bb4",
"assets/assets/image/flags/by.png": "bb65dcc70dc1b39a8f02f590d9a9a713",
"assets/assets/image/flags/se.png": "9702b9682030447f0b23e501f8455307",
"assets/assets/image/flags/nr.png": "51b1b0004f267958a69cccea88a38e3b",
"assets/assets/image/flags/io.png": "bfa5eb009295fec8db1c86b4aebbecee",
"assets/assets/image/flags/gd.png": "710a83a9d4c823cdcfe42829a7286fe4",
"assets/assets/image/flags/ug.png": "a2545ea154f7ce8d52613d14e6a3f026",
"assets/assets/image/flags/bj.png": "ef44fdd3e263062f74271d82bf27cda2",
"assets/assets/image/flags/gb.png": "0d838cfb0a420d3c2c72546d817b5563",
"assets/assets/image/flags/il.png": "0d13e3e8430de102173d1de2dca5f1c8",
"assets/assets/image/flags/fo.png": "33e79ae2bbf27069f6a3f945e12cb501",
"assets/assets/image/flags/ae.png": "d5a858d8c365c7cee489f2078e684c71",
"assets/assets/image/flags/eg.png": "ae462348e88a10fcc58dc84ae5543256",
"assets/assets/image/flags/np.png": "c841a9fbd6fcc1d063f0e393b8361a76",
"assets/assets/image/flags/la.png": "67888ef3df0b762a605546faef5bdecb",
"assets/assets/image/flags/zw.png": "f34ccfdd5a326106e49e97a75da9905b",
"assets/assets/image/flags/cz.png": "380630d5d4f6462271d8c11e361a6c7e",
"assets/assets/image/flags/lc.png": "8418e22654d6b1ef4c8321ca975741bf",
"assets/assets/image/flags/ly.png": "086ed51f8122598d00dbf02bfdafacdb",
"assets/assets/image/flags/ao.png": "bdfe9685644440d9a11fcb031be9fa77",
"assets/assets/image/flags/pl.png": "e8714e9460929665055f1c93dce1bf61",
"assets/assets/image/flags/tk.png": "306d03f4e450b6a8254f6bfce48966ba",
"assets/assets/image/flags/pg.png": "b8e28e3762dbece53a4fa0a6527cd9c6",
"assets/assets/image/flags/ms.png": "3a727faef324e91639469f8c228e4130",
"assets/assets/image/flags/gw.png": "806f63c256bddd4f1680529f054f4043",
"assets/assets/image/flags/de.png": "a40ac3e92518ee8210c660713330ee3d",
"assets/assets/image/flags/no.png": "acac90b02e3f6a9339ffac751866d6fc",
"assets/assets/image/flags/us.png": "dd9d36e6adda9d0b64076592905b10f4",
"assets/assets/image/flags/ax.png": "48e3d10da408d18b6b79d6faf72428ff",
"assets/assets/image/flags/ad.png": "4f8c517e5b1c823d736b14181b680209",
"assets/assets/image/flags/hn.png": "8888d391f9d8f6cddb7bd1e3fdc7f9e2",
"assets/assets/image/flags/ye.png": "4cf73209d90e9f02ead1565c8fdf59e5",
"assets/assets/image/flags/sg.png": "2ef1cd522e5886931337f105bd2dc033",
"assets/assets/image/flags/pw.png": "369237af8368ea0dbf8c478db3ee11db",
"assets/assets/image/flags/ec.png": "746ed5202fb98b28f7031393c2b479da",
"assets/assets/image/flags/fr.png": "accf64fcddcddf2c7c7fb6a7fda2c5e8",
"assets/assets/image/flags/kh.png": "25e4099457402866cc1fabcd4506c6cc",
"assets/assets/image/flags/eu.png": "7f168ec2854468e7c44785553ab4693c",
"assets/assets/image/flags/tj.png": "ac65b1ad602bb9ca768b81e256054dbc",
"assets/assets/image/flags/tr.png": "01a309f9a3ea9e2175af68ebb203ee48",
"assets/assets/image/flags/bd.png": "1d1568f5a71ceb8a0703f27fee16f59c",
"assets/assets/image/flags/om.png": "5c2e5b2ae246dbb664e78ae571b5f742",
"assets/assets/image/flags/am.png": "738afb7048c8232afd4b0e8212c6f9cc",
"assets/assets/image/flags/bo.png": "fcf865ead2f2e44cfa25c94becbb6584",
"assets/assets/image/flags/zm.png": "be896cb9c049a9c5fb29bc9cd62ba41f",
"assets/assets/image/flags/ch.png": "3b6d165c5bead01882ff0cc592586360",
"assets/assets/image/flags/gn.png": "8db504404d1ccc97c594ea57dec992d4",
"assets/assets/image/flags/sk.png": "f5a71b07d339236c9f7735e692246d4e",
"assets/assets/image/flags/mq.png": "accf64fcddcddf2c7c7fb6a7fda2c5e8",
"assets/assets/image/flags/kz.png": "caba66830ed539d3f86431ddf4006e72",
"assets/assets/image/flags/gm.png": "cbbfc73a22cdc63eaf6761466a340155",
"assets/assets/image/flags/fi.png": "613b5a4f06b2f63bb7cd8636ae26c4b5",
"assets/assets/image/flags/al.png": "7b5094bf648773c8a510d2da187a4d4a",
"assets/assets/image/flags/er.png": "a8c8514c85feb073ddaffdd4517fb1d4",
"assets/assets/image/flags/gg.png": "075cc82bc64ceaac0371bc0dda10f213",
"assets/assets/image/flags/fj.png": "25f2be928a4dc09b6c0d00c6cc5dcfe6",
"assets/assets/image/flags/gs.png": "0b54c89dd1312a1ccbf5f3e48830dd6b",
"assets/assets/image/flags/ag.png": "cc55244058f9e333a5a6c72e83d2f940",
"assets/assets/image/flags/sx.png": "aee87f6ff085fccd57c234f10a6d6052",
"assets/assets/image/flags/jp.png": "8d773c60227ebd2466f1bc6e37d476d0",
"assets/assets/image/flags/tl.png": "cdd97872fe36bd636c8234347cf0499b",
"assets/assets/image/flags/gu.png": "914c3ab28615b02853514b341cef6253",
"assets/assets/image/flags/wf.png": "650f3530ea76a335178fc48392749d8b",
"assets/assets/image/flags/gl.png": "11949775cf7794d152e119f19af7dffa",
"assets/assets/image/flags/st.png": "77bb1cefd8bbe32e4c7abce5a89ddf9a",
"assets/assets/image/flags/gp.png": "accf64fcddcddf2c7c7fb6a7fda2c5e8",
"assets/assets/image/flags/gb-eng.png": "0d9f2a6775fd52b79e1d78eb1dda10cf",
"assets/assets/image/flags/sn.png": "e0f998e1ebf1b140a73f1a7e2f149a7d",
"assets/assets/image/flags/it.png": "186bb69f52a419f6650b314282dfaa1e",
"assets/assets/image/flags/ir.png": "5d8864e2235f7acb3063a9f32684c80e",
"assets/assets/image/flags/kn.png": "858548a22269e317558a907c8f6d39e4",
"assets/assets/image/flags/et.png": "5bb738be0d46b67772807c5ef91c03d2",
"assets/assets/image/flags/ky.png": "19e9668487160321e1b63dbbbdf42756",
"assets/assets/image/flags/ss.png": "2a3e1b6438c3f4002fc5f41c00426a48",
"assets/assets/image/flags/ro.png": "6095072052912a4fb6957a3836ccd61f",
"assets/assets/image/flags/mv.png": "072f4f6c96e362f2c776107dcc2330bb",
"assets/assets/image/flags/es.png": "c8ec1e8491026039a3e8c40276a7b419",
"assets/assets/image/flags/aq.png": "896ae6c04fa2580dc4e1ad4316457f42",
"assets/assets/image/flags/bq.png": "3649c177693bfee9c2fcc63c191a51f1",
"assets/assets/image/flags/bl.png": "accf64fcddcddf2c7c7fb6a7fda2c5e8",
"assets/assets/image/flags/nc.png": "accf64fcddcddf2c7c7fb6a7fda2c5e8",
"assets/assets/image/flags/pf.png": "e670473a80bec31faf88fdfcc13d06c8",
"assets/assets/image/flags/in.png": "2af1f5714c422424775ad66036994094",
"assets/assets/image/flags/kp.png": "0dc86decc31913b000738d6709dd468b",
"assets/assets/image/flags/cr.png": "2538e109dd55c6106f28db5daae20285",
"assets/assets/image/flags/xk.png": "f07b456c2c5c4262c3b77c6841131189",
"assets/assets/image/flags/ge.png": "34b32f9b919c05c414f5a46b91187088",
"assets/assets/image/flags/cc.png": "526d44b1330556c7eb70e3065c08659c",
"assets/assets/image/flags/bi.png": "5a7c473a07802b351b9d9e2b348a1499",
"assets/assets/image/flags/id.png": "e521d35f905dc3f0d3aaeab731d20277",
"assets/assets/image/flags/mx.png": "e730873265af3a4537181ef504f78c2d",
"assets/assets/image/flags/mw.png": "b1326a41f6fb1454dc9bb3a9fd1df74b",
"assets/assets/image/flags/um.png": "8e32475de12469592292e0f40b462a50",
"assets/assets/image/flags/gy.png": "df69631aaf9013aa701bdd75ccb72442",
"assets/assets/image/flags/sd.png": "cf214a420379713c8c5588f26a2492d3",
"assets/assets/image/flags/lk.png": "b4ca88daa2e0e566780e0c17c2089cba",
"assets/assets/image/flags/ru.png": "05ac31f8336dd647424bf2995cad3a3a",
"assets/assets/image/flags/py.png": "c7f62936fc96690023bd477c3a71ad11",
"assets/assets/image/flags/tc.png": "e2222622f0770c8076aa4da2e00edcdb",
"assets/assets/translations/en.json": "7016f8e6f3c962df8a3f3fdd750de4ed",
"assets/AssetManifest.bin.json": "00052d2b450f9237b8d92246ce1863f2",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "51aa5ab4c3b7a384b51fc04023d520e0",
"assets/fonts/MaterialIcons-Regular.otf": "bee9f0208a42b9c510f0c1d3ff38e501",
"assets/AssetManifest.json": "c665eb2a6cc15798917ede4ba87d5e4d",
"main.dart.js": "70d1437161190b1a83ff347b1c815264",
"favicon.png": "c07cd91fb93b3aeae960e9ce1808cb64",
"version.json": "edaee64b1470fe7a70ff9972bf2535d1",
"icons/Icon-maskable-192.png": "93d1e90d5d83f4ed3d98f2b607561363",
"icons/Icon-192.png": "93d1e90d5d83f4ed3d98f2b607561363",
"icons/Icon-512.png": "fd1b6ae9b7acbff6c51e262126f2b86c",
"icons/Icon-maskable-512.png": "fd1b6ae9b7acbff6c51e262126f2b86c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
