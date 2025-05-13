class MenuItem {
  final String title;
  final String key;
  final String imageUrl;

  MenuItem({
    required this.title,
    required this.key,
    required this.imageUrl,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      key: json['key'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
 
  Map<String, dynamic> toJson() {
    return {'key': key, 'title': title, 'image_url': imageUrl};
  }
}
