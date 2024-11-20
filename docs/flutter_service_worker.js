'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "bedf62b46b0e528947d7ba6fc00d1f16",
"assets/AssetManifest.bin.json": "da4e2109fed879f5adf1280e3d6416e2",
"assets/AssetManifest.json": "87ec908dc4e386d46e98ce1c893214de",
"assets/assets/activity_data/activity1/c1a1_terms.json": "d02e55dc1531648e6d1257812fbd398d",
"assets/assets/activity_data/activity1/c6a1_terms.json": "0518eecb462b41fd2ebd6e90a86e7632",
"assets/assets/activity_data/activity1/test_terms.json": "c36d9acf5c178902c9d1bdb2bad4e780",
"assets/assets/img/a1c1-extract.png": "556c75a0b29c719313b9dd9226f28e5e",
"assets/assets/img/australia.png": "39d9f0508d74257a01caaba8a5beb283",
"assets/assets/img/badges/badge-buddy.png": "c7939d048a9b44adb7d874e7f9f29626",
"assets/assets/img/badges/badge-c1.png": "9499350ceedcd79bb351d6eafa029c88",
"assets/assets/img/badges/badge-c10.png": "3a601e0125461aa2a0b6275d7116ea93",
"assets/assets/img/badges/badge-c11.png": "ef6e899da2e505be2edd9c1a87a0825e",
"assets/assets/img/badges/badge-c12.png": "42b820c1b704a548c7334f65a66faf1d",
"assets/assets/img/badges/badge-c13.png": "a5f2d16b8a7075d583da7fb3ee5f4a58",
"assets/assets/img/badges/badge-c2.png": "e1c7837e357593395d46d63b11966de8",
"assets/assets/img/badges/badge-c3.png": "13092dc14eba18140c1bb1ce09846178",
"assets/assets/img/badges/badge-c4.png": "fa74d4f83d926d1eb505b65526ba9377",
"assets/assets/img/badges/badge-c5.png": "7f4bf5d7df5cde5bb7ad3d9ae6ea2729",
"assets/assets/img/badges/badge-c6.png": "8c7925a14c2b20145abed051ace9a645",
"assets/assets/img/badges/badge-c7.png": "0b280de0f753a7da47023e1c90d284ba",
"assets/assets/img/badges/badge-c8.png": "37365c92b8ae8139150175d18abf77fd",
"assets/assets/img/badges/badge-c9.png": "b8a6adadb985ea25472dae17deb4f082",
"assets/assets/img/badges/badge-glossary.png": "2f3c1ab62cf606ab5d3cd58c8eabbaf3",
"assets/assets/img/badges/badge-tutorial.png": "97e54610db2b91cc0caf1eae56199369",
"assets/assets/img/badges/greyscale/badge-buddy.png": "22af782690bbeb1838d6125f9cb1a0de",
"assets/assets/img/badges/greyscale/badge-c1.png": "482284bfb006bb341808ca79619664dd",
"assets/assets/img/badges/greyscale/badge-c10.png": "5a04b158d623e85d1f5d4685d5d0399b",
"assets/assets/img/badges/greyscale/badge-c11.png": "2b8f1386b9210be06f3ae39520474e12",
"assets/assets/img/badges/greyscale/badge-c12.png": "502d28f32887e3b651c4463e528cfe79",
"assets/assets/img/badges/greyscale/badge-c13.png": "03b692cbed629802caff3133680496e7",
"assets/assets/img/badges/greyscale/badge-c2.png": "3742261ea2a482cf243209496d839bbb",
"assets/assets/img/badges/greyscale/badge-c3.png": "1b4581e0f10c2bd66a9403809ed946bb",
"assets/assets/img/badges/greyscale/badge-c4.png": "241bddf35f2404352fc422f0bf98426b",
"assets/assets/img/badges/greyscale/badge-c5.png": "1995b873bd690d7464df21b7574f996e",
"assets/assets/img/badges/greyscale/badge-c6.png": "cafe8214010356a83c30cd970bf13de4",
"assets/assets/img/badges/greyscale/badge-c7.png": "4c2ed110461db9db0bc0597dd243555d",
"assets/assets/img/badges/greyscale/badge-c8.png": "64f8161849209fc5fe827e12097fc49f",
"assets/assets/img/badges/greyscale/badge-c9.png": "1f56122b5f0316064c58e558755c7324",
"assets/assets/img/badges/greyscale/badge-glossary.png": "404c717d38741752c2685015a5452018",
"assets/assets/img/badges/greyscale/badge-tutorial.png": "627c8cc9aee757faff86802b0de0e065",
"assets/assets/img/bauman_onion.png": "2306fae1090665e20e0f72cd8d03b33d",
"assets/assets/img/diagram_answers.jpg": "54668720a5357904c4465ffc946e9032",
"assets/assets/img/diagram_noanswers.jpg": "fd89ff100c69cb4e25f8c7abd283bdb7",
"assets/assets/img/england.png": "b06fa61443f893ad27191d2c1a31f880",
"assets/assets/img/ephyli_icon.png": "fe797dce636865a2208a5fbf4aa0b762",
"assets/assets/img/ephyli_logo.png": "d0c533704822014377b1a90268938686",
"assets/assets/img/ephyli_logo_bw.png": "2c4a5fb4eb07f5e37507e003861ef092",
"assets/assets/img/france.png": "78e9f99bc3c993c9c83615d0f3d028c4",
"assets/assets/img/greece.png": "de9a6eb5bccdc9853c383b96a3c0725e",
"assets/assets/img/ipla-ireland-canada.png": "406b287d7357eb45c8775762f88ec395",
"assets/assets/img/italy.png": "cc79b1867397b8aec17dccce31e6fbef",
"assets/assets/img/luxembourg.png": "ec99c104567b4ccf973bfe9dfe217a8e",
"assets/assets/img/republic-of-poland.png": "e1b3ac4b1dcf7590954f80f84a905ae6",
"assets/assets/img/united-kingdom.png": "6f382b2ddfdd4ea349ac9ca989da123a",
"assets/assets/img/united-states-of-america.png": "e499f1fbaeb06cf2b9f6ddfd4de672b5",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "c25e02981abe6a188c3833b41973eb9c",
"assets/NOTICES": "03c9dcb1a76e4ef81edd5a6068ac26d9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "8521152765ac463fb43cc71bb7a89163",
"assets/packages/fluttermoji/attributeicons/accessories.svg": "0b8839e003a89232edec0e09cb12fa2b",
"assets/packages/fluttermoji/attributeicons/beard.svg": "908ac523ce1c704be65e254aa4a04e31",
"assets/packages/fluttermoji/attributeicons/beardcolor.svg": "8fa1ec767cfa14371ca15a47126049ba",
"assets/packages/fluttermoji/attributeicons/eyebrow.svg": "cf66096dacdfb6af807cd745fc724e9a",
"assets/packages/fluttermoji/attributeicons/eyes.svg": "cfbbbeb9cc3b40c6a561166ad07fc56c",
"assets/packages/fluttermoji/attributeicons/hair.svg": "0044380b1c40c321c8a65da5b8e77a0c",
"assets/packages/fluttermoji/attributeicons/haircolor.svg": "5756eb4c957d15ea7fcc37c1835488ac",
"assets/packages/fluttermoji/attributeicons/mouth.svg": "af3193d2a407e09fa1156f0f3c30ea86",
"assets/packages/fluttermoji/attributeicons/outfit.svg": "f36789fda25e7b3746835daf0ec7c0dc",
"assets/packages/fluttermoji/attributeicons/outfitcolor.svg": "e8f931206db9c6ab01a6b4c22c23bf4d",
"assets/packages/fluttermoji/attributeicons/skin.svg": "5f58e197768b8da582fbe8219daf164d",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "f5363b59cb7a7472b856ee870e7257af",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "9cfd94727b5bdf21facc2f35464908b1",
"icons/Icon-192.png": "36875bc29356677b59876060c0e1d185",
"icons/Icon-512.png": "25d77f6da10748caa641422110aba973",
"icons/Icon-maskable-192.png": "36875bc29356677b59876060c0e1d185",
"icons/Icon-maskable-512.png": "25d77f6da10748caa641422110aba973",
"index.html": "b5d154b92bc8661f09d441d967390689",
"/": "b5d154b92bc8661f09d441d967390689",
"main.dart.js": "b2c30f208e4bb49fa36307a5e511c286",
"manifest.json": "0013e933521dd9082da52273c69c1561",
"version.json": "e9edf7b3cbba2c68dad71a8108e7897d"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
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
