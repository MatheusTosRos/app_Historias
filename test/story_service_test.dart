import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_app/services/story_service.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late StoryService storyService;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    storyService = StoryService();
  });

test('getStories returns list of stories on success', () async {

  when(mockHttpClient.get(any)).thenAnswer((_) async => http.Response(
      '[{"id": 1, "title": "Test Story", "content": "Test Content", "category": "Folklore", "imageUrl": "test.jpg", "region": "Northeast"}]',
      200));

  final stories = await storyService.getStories();
  expect(stories.length, 1);
  expect(stories[0].title, 'Test Story');
});

  test('Story model creates correct instance from JSON', () {
    final json = {
      'id': 1,
      'title': 'Test Story',
      'content': 'Test Content',
      'category': 'Folklore',
      'imageUrl': 'test.jpg',
      'region': 'Northeast'
    };

    final story = Story.fromJson(json);
    expect(story.id, 1);
    expect(story.title, 'Test Story');
    expect(story.content, 'Test Content');
  });
}