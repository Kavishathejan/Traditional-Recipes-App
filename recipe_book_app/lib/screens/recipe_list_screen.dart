import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../services/api_service.dart';
import 'recipe_detail_screen.dart';
import '../main_scaffold.dart';

class RecipeListScreen extends StatefulWidget {
  final String category;
  const RecipeListScreen({super.key, required this.category});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  // ignore: unused_field
  int _selectedIndex = -1; // No tab is selected by default

  void _onItemTapped(int index) {
    // Navigate back to MainScaffold with selected index
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => MainScaffold(currentIndex: index)),
      (Route<dynamic> route) => false, // Removes all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.category} Recipes',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(210, 1, 1, 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 220, 220, 223),
      body: FutureBuilder<List<Recipe>>(
        future: ApiService.fetchRecipesByCategory(widget.category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading recipes'));
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No recipes found in ${widget.category}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          final recipes = snapshot.data!;
          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return Card(
                margin: const EdgeInsets.all(10),
                color: Colors.grey[900],
                child: ListTile(
                  leading: recipe.image.isNotEmpty
                      ? Image.network(
                          recipe.image,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        )
                      : null,
                  title: Text(
                    recipe.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    recipe.description,
                    style: const TextStyle(color: Colors.white60),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RecipeDetailScreen(recipe: recipe),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),

        child: BottomNavigationBar(
          currentIndex: 0, // Always highlight Home
          onTap: _onItemTapped,
          backgroundColor: const Color.fromARGB(210, 1, 1, 1),

          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Categories',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
        ),
      ),
    );
  }
}
