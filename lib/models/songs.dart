class Song {
  final String id;
  final String title;
  final String artist;
  final String lyrics;

  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.lyrics,
  });

  // Factory method to parse JSON from API
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'] ?? '', // Handle null values if needed
      title: json['title'] ?? '',
      artist: json['artist'] ?? '',
      lyrics: json['lyrics'] ?? '',
    );
  }
}