import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.1.8:3000'; // your local server

  static Future<List<Recipe>> fetchRecipesByCategory(String category) async {
    final url = Uri.parse('$baseUrl/recipes?category=$category');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Recipe.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
