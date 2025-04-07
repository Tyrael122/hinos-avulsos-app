import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hinos_avulsos_app/models/songs.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String baseUrl = dotenv.get('API_BASE_URL', fallback: 'http://localhost:8080/api');

  static Future<List<Song>> getSongs() async {
    final response = await http.get(Uri.parse('$baseUrl/songs'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Song.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load songs');
    }
  }

  static Future<List<Song>> searchSongs(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/songs/search?q=$query'),
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Song.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search songs');
    }
  }
}
