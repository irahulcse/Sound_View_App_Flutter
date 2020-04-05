'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"/manifest.json": "ff669d62bdc6c805a2cce2099b1544c2",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/assets/AssetManifest.json": "33ec4f3564a5b29dabbe5b2895b1cd34",
"/assets/LICENSE": "c77012b170588acaba8acfa8ab6d686c",
"/assets/assets/rohan.wav": "bda33f5f7725bf16a65f870f3b60c465",
"/assets/assets/4.png": "ba2256acf074f991c06d1f7cf30b2519",
"/assets/assets/6.png": "e6fa00d0142582e15427caec183efd35",
"/assets/assets/rahul.flac": "a2fd7d73a3e241b8779b7d0811da370e",
"/assets/assets/3.png": "780bdb616c172fe27494cd64e46dbcc7",
"/assets/assets/papa.wav": "39915e2c3bd7e50823a3a99f6325a04c",
"/assets/assets/5.png": "02db3e732fb5db2a747b52540cd86d0c",
"/assets/assets/1.png": "229a64dccce79ce7747475091644440a",
"/assets/assets/2.png": "c24de0609c2bd8a56d7686981b351eb3",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"/main.dart.js": "5f83ebeb44239c6c40a2f8ec4861368a",
"/index.html": "9e8ee05a4b38d3a0e52d18ac95f9c82a"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
