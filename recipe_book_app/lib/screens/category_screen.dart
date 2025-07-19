import 'package:flutter/material.dart';
import 'recipe_list_screen.dart';

class CategoryScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Currys', 'image': 'assets/images/curry.jpg'},
    {'name': 'Rice', 'image': 'assets/images/rice.jpg'},
    {'name': 'Cakes', 'image': 'assets/images/cake.jpg'},
    {'name': 'Biscuits', 'image': 'assets/images/biscuit.jpg'},
    {'name': 'Fruit Juices', 'image': 'assets/images/juice.jpg'},
    {'name': 'Desserts', 'image': 'assets/images/dessert.jpg'},
    {'name': 'Soups', 'image': 'assets/images/soup.jpg'},
    {'name': 'Salads', 'image': 'assets/images/salad.jpg'},
  ];

  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 220, 223),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: AppBar(
            title: const Text(
              'Recipe Categories',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(210, 1, 1, 1),
            elevation: 0,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 15,
          childAspectRatio: 9 / 10,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final name = category['name'] ?? 'Unknown';
          final imagePath = category['image'] ?? '';

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeListScreen(category: name),
                ),
              );
            },
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  imagePath.isNotEmpty
                      ? Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(child: Icon(Icons.broken_image)),
                        )
                      : const Center(child: Icon(Icons.image_not_supported)),
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    alignment: Alignment.center,
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
