class MenuItem {
  final String title;
  final String key;
  final String imageUrl;
  final List<String> productIds;

  MenuItem({
    required this.title,
    required this.key,
    required this.imageUrl,
    required this.productIds,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      key: json['key'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      productIds: List<String>.from(json['product_ids']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'key': key, 'title': title, 'image_url': imageUrl};
  }
}
