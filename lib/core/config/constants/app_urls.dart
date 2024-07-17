class AppUrls {
  static const String coverFirestorage =
      "https://firebasestorage.googleapis.com/v0/b/spotify-clone-d2bfd.appspot.com/o/covers%2F";
  static const String songFirestorage =
      "https://firebasestorage.googleapis.com/v0/b/spotify-clone-d2bfd.appspot.com/o/songs%2F";

  static const String mediaAlt = "alt=media";
}

List<String> coverPhotoList = [
  "${AppUrls.coverFirestorage}photo-1.webp?${AppUrls.mediaAlt}",
  "${AppUrls.coverFirestorage}photo-2.webp?${AppUrls.mediaAlt}",
  "${AppUrls.coverFirestorage}photo-3.webp?${AppUrls.mediaAlt}",
  "${AppUrls.coverFirestorage}photo-4.webp?${AppUrls.mediaAlt}",
  "${AppUrls.coverFirestorage}photo-5.webp?${AppUrls.mediaAlt}",
  "${AppUrls.coverFirestorage}photo-6.webp?${AppUrls.mediaAlt}",
];

List<String> songUrlList = [
  "${AppUrls.songFirestorage}flow-211881.mp3?${AppUrls.mediaAlt}",
  "${AppUrls.songFirestorage}	for-her-chill-upbeat-summel-travel-vlog-and-ig-music-royalty-free-use-202298.mp3?${AppUrls.mediaAlt}",
  "${AppUrls.songFirestorage}in-slow-motion-inspiring-ambient-lounge-219592.mp3?${AppUrls.mediaAlt}",
  "${AppUrls.songFirestorage}inspiring-cinematic-ambient-116199.mp3?${AppUrls.mediaAlt}",
  "${AppUrls.songFirestorage}lotus-sky-dreams-216049.mp3?${AppUrls.mediaAlt}",
  "${AppUrls.songFirestorage}sweet-serenade-222444.mp3?${AppUrls.mediaAlt}",
];
