import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/story.dart';

class StoryService {
  final String baseUrl = 'http://localhost:3000/stories';

  Future<List<Story>> getStories() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((story) => Story.fromJson(story)).toList();
    } else {
      throw Exception('Failed to load stories');
    }
  }

  Future<Story> getStory(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return Story.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load story');
    }
  }

  Future<Story> createStory(Story story) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(story.toJson()),
    );
    if (response.statusCode == 201) {
      return Story.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create story');
    }
  }

  Future<Story> updateStory(Story story) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${story.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(story.toJson()),
    );
    if (response.statusCode == 200) {
      return Story.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update story');
    }
  }

  Future<void> deleteStory(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete story');
    }
  }
}
