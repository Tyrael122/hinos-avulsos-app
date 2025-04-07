import 'package:flutter/material.dart';
import 'package:hinos_avulsos_app/models/songs.dart';

class LyricsScreen extends StatefulWidget {
  final Song song;

  const LyricsScreen({super.key, required this.song});

  @override
  State<LyricsScreen> createState() => _LyricsScreenState();
}

class _LyricsScreenState extends State<LyricsScreen> {
  bool showChords = true;

  @override
  Widget build(BuildContext context) {
    final song = widget.song;

    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
        actions: [
          TextButton.icon(
            icon: Icon(
              showChords ? Icons.music_off : Icons.music_note,
            ),
            label: Text(
              showChords ? 'Somente letra' : 'Com cifra',
            ),
            onPressed: () {
              setState(() {
                showChords = !showChords;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.song.artist,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 24),
              showChords
                  ? ChordLyrics(text: song.lyricsWithChords)
                  : Text(
                    song.lyrics,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChordLyrics extends StatelessWidget {
  final String text;

  const ChordLyrics({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final lines = text.split('\n');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          lines.map((line) {
            final isChordLine = _isChordLine(line);
            return RichText(
              text: TextSpan(
                text: line,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  fontFamily: 'monospace',
                  color: isChordLine ? Colors.teal : Colors.black,
                  fontWeight: isChordLine ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            );
          }).toList(),
    );
  }

  bool _isChordLine(String line) {
    // Heuristic: if the line has mostly chord tokens and few normal words
    final tokens = line.trim().split(RegExp(r'\s+'));

    int chordLike = 0;
    for (final token in tokens) {
      if (_looksLikeChord(token)) chordLike++;
    }

    if (tokens.isEmpty) return false;

    return chordLike / tokens.length > 0.6;
  }

  bool _looksLikeChord(String token) {
    // Basic chord pattern match: A-G, optional #/b, optional minor/major/sus/etc.
    return RegExp(
      r'^[A-G](#|b)?(m|maj|min|sus|dim|aug|add)?\d*$',
    ).hasMatch(token);
  }
}
