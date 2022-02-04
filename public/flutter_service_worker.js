'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "ae56372b22a2b4c0bf915692893749b6",
"index.html": "035cdd0a23519bb9d1429fc2970b1347",
"/": "035cdd0a23519bb9d1429fc2970b1347",
"CNAME": "be1efa8c544a5bfbbcde1085904b25b0",
"loader.css": "3ed0540af717cd56f01a37a08f714759",
"main.dart.js": "656d23370f68d35d165ef85c7fc93d75",
"README.md": "a7f801b4c2190dfe4ec4b0a55e45cb1e",
"favicon.png": "6c3a2a8bab9155811014ca68143566a7",
"_config.yml": "932865e374757d33e321eeb2d5e88b6b",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "f72b1fb8e2ea7901f25ad4e33e0f71f2",
".git/ORIG_HEAD": "7f491211c79606da4f58b9d9ab7c0657",
".git/config": "642d2d80a77e462707f6dcf4dc64d2eb",
".git/objects/50/ef380e89c18faa5f9ea87aacdb9ddc11c9bc21": "fcc972dd16c440f6afa7464bf0d4a682",
".git/objects/9e/99123ea2555962c4e9b43f430d06a4b21a7353": "ec7ba2bb08a6c5da42e52f516afae4b3",
".git/objects/32/f2b0963922a7aac8de6ab67c68abb156197957": "eaed151c074a52d29fe3919c9fe311e5",
".git/objects/67/479ff9b856d43c14f75b921782cac3dfae46f5": "3ecb3d1a4cbc733ef6ef98a07c0f37a4",
".git/objects/0b/cc49409e4560fe647ecc4b94204eeb7c68e8a7": "dd7722d35daa8164c5b9471b1431fa36",
".git/objects/02/132743584d85fbd4874757aa95fa8dcce2196f": "a3a48d54d1a6fb783744476509807fcf",
".git/objects/ad/c6914889f48ca9fbcb4bf3aa9e23c1c7280b5b": "5a43f18f4d274f3b52c278c1477fa17d",
".git/objects/be/93021d70a115354f5f015d064c4663acca305e": "96a6dd7afa27429fb862f178afd00e0d",
".git/objects/a2/cefa522151c2b0b4e2efc848dd3620f7a42c07": "9d87ba395931ea1d2f26b83f265f8e08",
".git/objects/d1/8da418844d4181bad4b1fb2ab7bde55356fa75": "ddd287aa99e9db9d0eaf03e1fa8c079d",
".git/objects/bc/6075fe98ecee193c9790d4c50041157b971ce2": "7ae79019eb2f8c70af31fa65dab529ab",
".git/objects/e5/ab31cf394c70af7fd0f1198686647b836dedb2": "6f830f0e2f80989c0c2343f4c5ad7385",
".git/objects/eb/2a2fe796cb6f5106a5f29ce8bf141691ddabd5": "2f312a8d4133c4ec72b9e85e5e6cfb1a",
".git/objects/20/a4637218027ef1246aff08e502ab7ded8b8bdc": "5b430c740a2347ab14010ae797cf3cba",
".git/objects/pack/pack-d2c16ce853ae494e0f371f89bdad5ec13083b7af.pack": "42ac5a29d714612fc7b95762f806cdc3",
".git/objects/pack/pack-d2c16ce853ae494e0f371f89bdad5ec13083b7af.idx": "f9e647c725ebe13ef61627ff3f21cbd5",
".git/objects/42/3ad5234f52fd15b9c92926bc1cdba8c93dd7ca": "24e617e9944691b71894eeb6940edb05",
".git/objects/28/a840f68cd9aaa43da6dc68e91a08fec7fdf43c": "d382e647936045bf47dfbd754e6dd01d",
".git/objects/17/f60f6ac0dc188c21e0627bcfccd26f65a9a006": "14986b856e320f7ab573f7e6c9cab661",
".git/objects/7b/6806d705bf26d6b97bda73fca253b818d1b980": "da26c3f749051da3119cfe841269aa4a",
".git/objects/4c/55740b762a562ab2dab8c84f84fa6954f537b7": "fcf762fc77f2cccdd3e89dc2c6d12fdd",
".git/objects/21/c4572ed6874d5d0e48878cea32b9f6344f5506": "cfb3050ea5647e4db248f8c3555848c9",
".git/objects/4d/49a8a1eb40c976a1d65977282d3685e444e2bd": "ec532229dc72092cd97f18cc1d8b0d12",
".git/objects/43/6053b9da2c77fc503ccee0a072b2c427fd6486": "558638b24ed38727e560dd16ec47fc24",
".git/objects/9f/920c3a269db487e3977c4b7538da178921379f": "7f758a5d1af4e748245053361aaf6f69",
".git/objects/6b/f1f2cc7ceffa2fe61945eb76c1b07e8616ac78": "408d0a7712c73de7886e851ebf084871",
".git/objects/07/9ba3e50d113f75505148f9c86676c23df174b5": "004b5ea06a5188d69268c341bc920ea2",
".git/objects/53/6e96603f9ac6670e049db7754224eee3b38938": "7bf9830f17f3a181be5ab57253d752a5",
".git/objects/5b/26f0e1149f62d36701fe4cf6e7c4c991b150fc": "ae8e5570951bfeaddfdbc660bcd44598",
".git/objects/52/87fbd65f50f0c0213c4882f8313a9f074c15e7": "b71071f24b3a3661211e34e24a801839",
".git/objects/a7/fa3a9b55ee9dac9c6524738b41616cd290e28d": "7dee9b1a2ca32b035c7775f403d6f51a",
".git/objects/dc/ecfc2929aa7cdcf72a8dcdf3975aca8bcd24d9": "42dfa5c70f45c5284c91584b203e72ab",
".git/objects/b6/6ed2ac727d82ddb5c3fe1f322c778fb29675be": "0a190d768d39307dad20b5a0e1f14477",
".git/objects/b7/2867b37681284deba4158f6d439cbff829c34f": "5462e7f9e4f270f6bf882d6c396cdf3a",
".git/objects/ef/89f6b9c42908a33b54a545bac384064ad8b211": "cc23795c4a2a247e917c2f9d8f2fa0f0",
".git/objects/c4/e6f9df87fc20fac5e603071afa6a65e67db50a": "49652762dd1c32b2ec9f83d197008114",
".git/objects/cd/5c7da19ebdf09b2f91d1c3ec4f561d54e58aa1": "5dc05a7919c6085e78b5370c04dbd931",
".git/objects/cd/5665054c78ea12acc7188455da1ebb00be7643": "9b7d791695945fc34bf1e3b96f3fa330",
".git/objects/f6/d09d19784e658e824e00bab0c1224d65af3d46": "92c42e0f9b5dc9930480a657f19601ab",
".git/objects/cb/1ebae0ed2e8afc136ab448ed2f4459f04c5985": "252f7e1af24de4c100edbc3a8b8a7a80",
".git/objects/79/42047e3a32d6027dde9b0faca7a7157c232375": "af88adf75260f7437d1b663f248e0e01",
".git/objects/77/8144c7f8261a2495656a3c9857c5481856cc4d": "2edefbe93cf23abf4858ea8a0dadce93",
".git/objects/84/515c3904d043dc7dbbc2b1fb277e37c559922d": "aa44f9c5eb4f185ba53c2383a01ae493",
".git/objects/4a/a5773c1f6152c42fc6dabfbe5c6ddd5fb765dd": "1f40372dad0883f3070d4fa3eb466254",
".git/objects/24/7e01c76d21b722688595b828cfa2750c57aeed": "9a3fe13e20d8c6b2c476d4b6aec813d5",
".git/objects/71/a3b3e2e56b6969e51318c71f4fefe41e008dcc": "4c059ff18eb01c26a4921e105922a64b",
".git/objects/71/6c50832cbe656c0f458a25c195767648d650cc": "f9b0c18604ba1d8da037302b024d605e",
".git/objects/8b/40bf51c3d159e38cf715bd47b820a30e72a125": "45258b86d49c7540ee0769524f9dd873",
".git/objects/22/43cd8aee018839a5fd176e6f0bbd5f0a85c60c": "1f52dcfc9e267f52e856ac0fc44ffbc1",
".git/objects/22/2a15a36aaa3bc369b34ca5b102536c442285a2": "423cf305d13a5ced0cd1b7c7f34e1e51",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "750c612985e6a42b6ef88212bfbb57a0",
".git/logs/refs/heads/main": "750c612985e6a42b6ef88212bfbb57a0",
".git/logs/refs/remotes/origin/HEAD": "0a7967f842e7cc2af1ebe522997adf89",
".git/logs/refs/remotes/origin/main": "e00c7ae207a9c74f6820d5f8f7366921",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "7f491211c79606da4f58b9d9ab7c0657",
".git/refs/remotes/origin/HEAD": "98b16e0b650190870f1b40bc8f4aec4e",
".git/refs/remotes/origin/main": "7f491211c79606da4f58b9d9ab7c0657",
".git/index": "af559f79b3289a2fbc0912d5c7fd920a",
".git/packed-refs": "e322c4cc250dbe23663a03c300303795",
".git/COMMIT_EDITMSG": "46a8bb51d4520c54cad6bd31f6d22e07",
".git/FETCH_HEAD": "41a2e9692861db20d25e41bfb6c7664b",
"assets/AssetManifest.json": "9fff552766538d7229ecbf20edc21ba0",
"assets/NOTICES": "127195888ac8f0e265c54e5fe257c563",
"assets/FontManifest.json": "07488861e82cd8684be0da1a38dbb65e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flutter_icons/fonts/Octicons.ttf": "73b8cff012825060b308d2162f31dbb2",
"assets/packages/flutter_icons/fonts/Feather.ttf": "6beba7e6834963f7f171d3bdd075c915",
"assets/packages/flutter_icons/fonts/Entypo.ttf": "744ce60078c17d86006dd0edabcd59a7",
"assets/packages/flutter_icons/fonts/FontAwesome5_Brands.ttf": "c39278f7abfc798a241551194f55e29f",
"assets/packages/flutter_icons/fonts/MaterialCommunityIcons.ttf": "3c851d60ad5ef3f2fe43ebd263490d78",
"assets/packages/flutter_icons/fonts/AntDesign.ttf": "3a2ba31570920eeb9b1d217cabe58315",
"assets/packages/flutter_icons/fonts/Foundation.ttf": "e20945d7c929279ef7a6f1db184a4470",
"assets/packages/flutter_icons/fonts/weathericons.ttf": "4618f0de2a818e7ad3fe880e0b74d04a",
"assets/packages/flutter_icons/fonts/Ionicons.ttf": "b2e0fc821c6886fb3940f85a3320003e",
"assets/packages/flutter_icons/fonts/FontAwesome5_Solid.ttf": "b70cea0339374107969eb53e5b1f603f",
"assets/packages/flutter_icons/fonts/FontAwesome5_Regular.ttf": "f6c6f6c8cb7784254ad00056f6fbd74e",
"assets/packages/flutter_icons/fonts/FontAwesome.ttf": "b06871f281fee6b241d60582ae9369b9",
"assets/packages/flutter_icons/fonts/Zocial.ttf": "5cdf883b18a5651a29a4d1ef276d2457",
"assets/packages/flutter_icons/fonts/EvilIcons.ttf": "140c53a7643ea949007aa9a282153849",
"assets/packages/flutter_icons/fonts/SimpleLineIcons.ttf": "d2285965fe34b05465047401b8595dd0",
"assets/packages/flutter_icons/fonts/MaterialIcons.ttf": "a37b0c01c0baf1888ca812cc0508f6e2",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "ffed6899ceb84c60a1efa51c809a57e4",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "eaed33dc9678381a55cb5c13edaf241d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "3241d1d9c15448a4da96df05f3292ffe",
"assets/fonts/Lato-Bold.ttf": "85d339d916479f729938d2911b85bf1f",
"assets/fonts/Oswald-Bold.ttf": "e991dea9f65ce799dd72095ab7ad6e88",
"assets/fonts/Lato-Regular.ttf": "2d36b1a925432bae7f3c53a340868c6e",
"assets/fonts/Oswald-Regular.ttf": "e1996192b98a516646ff9a8c0c0ca90c",
"assets/fonts/Lato-Light.ttf": "2fe27d9d10cdfccb1baef28a45d5ba90",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/fonts/Oswald-Light.ttf": "4be970a1b24aa834afff4b16842c8981",
"assets/assets/rashid.png": "da298c3627d34607f7403ef53e1b2e62",
"assets/assets/brand3.png": "c0915a84744f3481a2105c5aea6727e0",
"assets/assets/anim/splash_anim.json": "497c27dfd7bae0375decc1aee9428735",
"assets/assets/design.png": "6aaec412d8837ac9a83f03f453877606",
"assets/assets/brand2.png": "91c6d8820e35e10e39757e0de6ac4345",
"assets/assets/brand1.png": "f3a3a0de79048e1f14aac62ec76609b8",
"assets/assets/brand5.png": "fc57e9a9ff95830ea207e2452ffd4bd6",
"assets/assets/brand4.png": "e9441e9a5d26e508f592aa31b9febff6",
"assets/assets/mainbg.jpg": "00e6c4f16e6286ed69c99859d2ac8d65",
"assets/assets/keyless/4.png": "02338493e361faf8de9130f457a6ed3c",
"assets/assets/keyless/2.png": "531b03d09ab463426839eae897fd44a1",
"assets/assets/keyless/3.png": "63e5af39a94a0b8ee9df8574f2f1e5ee",
"assets/assets/keyless/1.png": "1e9a5209c2d4842511f9bf84fb3f4241",
"assets/assets/keyless/0.png": "7b4375ab3ed31460957d975c64c718f7",
"assets/assets/lgn/4.png": "99a1393b9d189836cbf42d288043a4f9",
"assets/assets/lgn/2.png": "2853167b68c45f5c5f84157bcef9169c",
"assets/assets/lgn/3.png": "4643232572a9e6278d481ed802ccd14b",
"assets/assets/lgn/1.png": "b6f9f39a18ba5304425b5a1b96092b31",
"assets/assets/lgn/0.png": "84ce46717a94bc837f2c58695c6138c4",
"assets/assets/pk.jpeg": "e810db6cec572f6de10b5654ffc7a8fe",
"assets/assets/promote.png": "2bd8adcad79a4ebb80888d1a0583b3c4",
"assets/assets/develop.png": "471c2c94d5d04112086eba9fd78c6809",
"assets/assets/laptop.png": "fb49e3c0c36437239db5f8c114b03062",
"assets/assets/skills.jpeg": "b765afa8d09333b5da19492f392378f7",
"assets/assets/reapet/4.png": "7b068d58730b6524e47325ea01f33cfe",
"assets/assets/reapet/2.png": "f11d1c20f6bfb8d22b165df830515fc5",
"assets/assets/reapet/3.png": "68c0c1f4b292e277732eb4daa2b976a9",
"assets/assets/reapet/1.png": "0aae0cef2e2a06bd33b7ff0a35cf4011",
"assets/assets/reapet/0.png": "37a153bfa1b0ef473565873c5025522f",
"assets/assets/labouronline/4.png": "08371a2c95f6ed7a46a9f7d4c497fa07",
"assets/assets/labouronline/2.png": "59826a8b9b5e1bf82cb67a57751d0240",
"assets/assets/labouronline/3.png": "189da8ea1404496a1b5ad7c44811d5a8",
"assets/assets/labouronline/1.png": "3b024ea8055e615da7e3d2e0be311175",
"assets/assets/labouronline/0.png": "8b8945e82b368e6c7bc607b8075a093b",
"assets/assets/camera_lens.png": "f23224ee9f0b3f8b602dda9fdb98db99",
"assets/assets/chatapp/4.png": "49bf3380c54eaf649448e0c8c082f54f",
"assets/assets/chatapp/2.png": "af38bb3513701d1da9886b674a41cffc",
"assets/assets/chatapp/3.png": "9708113b4abf15c3838c4a4f17919295",
"assets/assets/chatapp/1.png": "12ee484488947a963575c4ed58083e7c",
"assets/assets/chatapp/0.png": "c238711e3b11d3a4b8a247dc18f7a879",
"assets/assets/write.png": "dc4f0d3df06d5fc9b13b9168b88e2560",
"assets/assets/rashid2.png": "e2d9199fa9dc67d30ec8bc6c822f367f",
"canvaskit/canvaskit.js": "62b9906717d7215a6ff4cc24efbd1b5c",
"canvaskit/profiling/canvaskit.js": "3783918f48ef691e230156c251169480",
"canvaskit/profiling/canvaskit.wasm": "6d1b0fc1ec88c3110db88caa3393c580",
"canvaskit/canvaskit.wasm": "b179ba02b7a9f61ebc108f82c5a1ecdb"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
