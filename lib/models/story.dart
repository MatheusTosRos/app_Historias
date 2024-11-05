class Story {
  final int id;
  final String title;
  final String content;
  final String category;
  final String imageUrl;
  final String region;

  Story({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.imageUrl,
    required this.region,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      region: json['region'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'category': category,
      'imageUrl': imageUrl,
      'region': region,
    };
  }
}