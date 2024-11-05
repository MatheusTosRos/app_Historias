import 'package:flutter/material.dart';
import '../models/story.dart';
import '../services/story_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StoryService _storyService = StoryService();
  List<Story> _stories = [];
  List<Story> _filteredStories = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadStories();
  }

  Future<void> _loadStories() async {
    try {
      final stories = await _storyService.getStories();
      setState(() {
        _stories = stories;
        _filteredStories = stories;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading stories')),
      );
    }
  }

  void _filterStories(String query) {
    setState(() {
      _filteredStories = _stories
          .where((story) =>
              story.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórias Brasileiras'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Pesquisar histórias',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _filterStories,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredStories.length,
              itemBuilder: (context, index) {
                final story = _filteredStories[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      story.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      story.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(story.imageUrl),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          color: Color(0xFF1B5E20), // Verde escuro
                          onPressed: () {
                            // Navegar para tela de edição
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          color: Color(0xFF0D47A1), // Azul escuro
                          onPressed: () async {
                            try {
                              await _storyService.deleteStory(story.id);
                              _loadStories();
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error deleting story'),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          // Navegar para tela de criação
        },
      ),
    );
  }
}