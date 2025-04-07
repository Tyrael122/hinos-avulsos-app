import 'package:flutter/material.dart';
import 'package:hinos_avulsos_app/models/songs.dart';

class LyricsScreen extends StatelessWidget {
  final Song song; // Pass the selected song from HomeScreen

  const LyricsScreen({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              song.artist,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 24),
            Text(
              song.lyrics,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            // (Phase 2: Add chords here)
          ],
        ),
      ),
    );
  }
}