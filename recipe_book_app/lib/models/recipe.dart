class Recipe {
  final String title;
  final String description;
  final String image;
  final String category;
  final String howToMake;

  Recipe({
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.howToMake,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
      howToMake: json['howToMake'] ?? '', // in case it's missing
    );
  }
}
