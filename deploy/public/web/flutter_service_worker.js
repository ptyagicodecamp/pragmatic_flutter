'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "236bdd747d9b53ff20e857adb47b547e",
"index.html": "f9e3fbd16c96e54a26e1f9be962104fa",
"/": "f9e3fbd16c96e54a26e1f9be962104fa",
"main.dart.js": "9993c1b3ddfafd90cd66eec77020364f",
"favicon.png": "bda7b2e31479e2e803310a3dfb31722a",
"sql-wasm.js": "bc2421756a16dc81506a009c738cf36e",
"icons/Icon-192.png": "3d6b76eea78d20161d97319500dcb1be",
"icons/Icon-512.png": "b3a80c8f11556a55073d7b266682c01f",
"manifest.json": "958e103655be72906a553c342b72fec2",
"assets/AssetManifest.json": "8ca2a93397aaa63032ea5687965cdcc4",
"assets/NOTICES": "2909240de070584418507a4d5bc598e6",
"assets/FontManifest.json": "07cba9f9892ef32969fe5a27bc9e5f10",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "2aa350bd2aeab88b601a593f793734c0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "2bca5ec802e40d3f4b60343e346cedde",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "5a37ae808cf9f652198acde612b5328d",
"assets/lib/chapter08/layouts/fitted_box.dart": "436daf7ba53cf7e18ff3912d6c727f44",
"assets/lib/chapter08/layouts/layoutbuilder.dart": "77873715c13062e1ebfe88875da89a82",
"assets/lib/chapter08/layouts/wrap.dart": "34fc037385e5d462b073874c4fc4c160",
"assets/lib/chapter08/layouts/expanded.dart": "64c3dc26bcbc39952f551cdb0094caf6",
"assets/lib/chapter08/layouts/flexible.dart": "d2e58862fa9f6bbb35ac51a2a5333ce4",
"assets/lib/chapter08/layouts/fractionally_sized_box.dart": "6778a6ba948905fcbdee89029fbcbc56",
"assets/lib/chapter06/widgets/reusable_widgets.dart": "6f93d889bc9e2fd65a8fe83395b8bfc3",
"assets/lib/chapter06/widgets/textfield.dart": "eeeb25c06cc933ef7a3245c0bc03f6b3",
"assets/lib/chapter06/widgets/web.dart": "3e87e49361a720ccab16a2c44f9c2983",
"assets/lib/chapter06/widgets/togglebuttons_widget.dart": "b6465e985f66c391d136f06a6b10b9a5",
"assets/lib/chapter06/widgets/alert_dialog.dart": "7a2c4f7c1ba0baf8ac6899db0d5927ea",
"assets/lib/chapter06/widgets/image_widget.dart": "ea4842059f0ce32264083927a367019e",
"assets/lib/chapter06/widgets/placeholder_widget.dart": "63b4d51e741aca254958f9073f5c5ec1",
"assets/lib/chapter06/widgets/mobile.dart": "3a76f55174d4f9b52845901a7c174da6",
"assets/lib/chapter06/widgets/shared.dart": "7aa20594748e0d5c0b75ef0b1173d1bb",
"assets/lib/chapter06/widgets/unsupported.dart": "d7510fe4128e856208a0a873e29862ea",
"assets/lib/chapter06/widgets/futurebuilder_widget.dart": "ddfd47f271cc7c73573b759f6fca7b34",
"assets/lib/chapter06/widgets/streambuilder_widget.dart": "02410f9d1b00c976199ce8b3ddc96962",
"assets/lib/chapter07/layouts/multi/listview.dart": "82580b269589996a1c909dc2c9a76c1c",
"assets/lib/chapter07/layouts/multi/table.dart": "92e731b251f0c9ad9720c397481fb61b",
"assets/lib/chapter07/layouts/multi/row.dart": "602332937fd659acd0be5cb461be5d56",
"assets/lib/chapter07/layouts/multi/indexed_stack.dart": "62de9d00b73c7ec46a4589c954c162e1",
"assets/lib/chapter07/layouts/multi/grid_view.dart": "455b8189c7bfbd06d56a3c4a92290a11",
"assets/lib/chapter07/layouts/multi/column.dart": "a8f931649e893faa2eaece57cfb39493",
"assets/lib/chapter07/layouts/multi/stack.dart": "18ecf073ff3fca9d587e850bce4247e5",
"assets/lib/chapter07/layouts/single/container.dart": "1501da8d4bb8433216100c32883cfe89",
"assets/lib/chapter07/layouts/single/intrinsic_height.dart": "7ef055efad61a25f0661555bd0166ddb",
"assets/lib/chapter07/layouts/single/padding.dart": "f76937eaf1fe15b9fc70506da4296480",
"assets/lib/chapter07/layouts/single/sized_box.dart": "9a26ee23af65a62b90a8c6a3669399fb",
"assets/lib/chapter07/layouts/single/intrinsic_width.dart": "3b453ceee186020ed0ac8b15d4d9d80a",
"assets/lib/chapter07/layouts/single/constrained_box.dart": "c0cfb09a77070159d273fc55d3d6c6da",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/assets/flutter_icon.png": "1fe10ec78b694fa4409bb38b15e3dbb3",
"assets/assets/book_cover.png": "db4dbfb6a4ed97d31a5972e5e8bf009b",
"assets/assets/fonts/Pangolin-Regular.ttf": "7810feee2a587264c0d6058d52b60ae4",
"sql-wasm.wasm": "b01552bc79c0b957d4228839bb9b74bf"
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
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
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
  for (var resourceKey in Object.keys(RESOURCES)) {
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
