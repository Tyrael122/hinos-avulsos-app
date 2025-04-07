class Song {
  final String id;
  final String title;
  final String artist;
  final String lyrics;
  final String lyricsWithChords;

  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.lyrics,
    required this.lyricsWithChords,
  });

  // Factory method to parse JSON from API
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'] ?? '', // Handle null values if needed
      title: json['title'] ?? '',
      artist: json['artist'] ?? '',
      lyrics: json['lyrics'] ?? '',
      lyricsWithChords: json['lyricsWithChords'] ?? '',
    );
  }
}