'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"/manifest.json": "ff669d62bdc6c805a2cce2099b1544c2",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/assets/AssetManifest.json": "83f7fbb4654390b518841b0fde358413",
"/assets/LICENSE": "c77012b170588acaba8acfa8ab6d686c",
"/assets/assets/rohan.wav": "bda33f5f7725bf16a65f870f3b60c465",
"/assets/assets/4.png": "ba2256acf074f991c06d1f7cf30b2519",
"/assets/assets/6.png": "e6fa00d0142582e15427caec183efd35",
"/assets/assets/rahul.flac": "a2fd7d73a3e241b8779b7d0811da370e",
"/assets/assets/3.png": "780bdb616c172fe27494cd64e46dbcc7",
"/assets/assets/5.png": "02db3e732fb5db2a747b52540cd86d0c",
"/assets/assets/images/owen1.png": "de3e31ee4dcfa51b932e281a3cd378de",
"/assets/assets/images/owen5.png": "7d0855ab2f4ede3ada218c1b16120e9f",
"/assets/assets/images/owen2.png": "329d585ce488601a030c91b37a559ff4",
"/assets/assets/images/owen6.png": "a1ff27e9b9d8a1908f0576f0ed30f724",
"/assets/assets/images/owen4.png": "0127a76f2da2542fd94713992f9c3fd5",
"/assets/assets/images/owen3.png": "019615cbbfdfdd6f7cb9a1ecd31fbdbe",
"/assets/assets/1.png": "229a64dccce79ce7747475091644440a",
"/assets/assets/sounds/wow7.mp3": "7661e1e4792d7484177e1d9ba3dae91c",
"/assets/assets/sounds/wow9.mp3": "c88298949275431c081ea9fa111fa084",
"/assets/assets/sounds/wow5.mp3": "034b71f8a66a6f7e138b88fd6a152870",
"/assets/assets/sounds/wow12.mp3": "01141c3940d858989d19129c67995f2b",
"/assets/assets/sounds/wow3.mp3": "14d28a2304db1e3b5c74a569edbbd1b3",
"/assets/assets/sounds/wow4.mp3": "8f06e1471c5a1ac7f3dcfbeb39a1eb73",
"/assets/assets/sounds/wow1.mp3": "c6ea41b95db40dfbb180f7289c3a9083",
"/assets/assets/sounds/wow6.mp3": "4a364f152ce18b78241278e2e1ffea8f",
"/assets/assets/sounds/wow2.mp3": "2b50e77040887dd5b1e37c868e687048",
"/assets/assets/sounds/wow8.mp3": "94c8267f43b127eb9b43ecef7dd99bd5",
"/assets/assets/sounds/wow11.mp3": "ae83dcc6b12257594f39c9346f708063",
"/assets/assets/sounds/wow10.mp3": "fd0b833243d990f2dcd3d5d78c33be66",
"/assets/assets/2.png": "c24de0609c2bd8a56d7686981b351eb3",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"/main.dart.js": "ed31fe87243229668988c10f265db4b6",
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
