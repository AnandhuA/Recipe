import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe/models/recipe_model.dart';

class ApiService {
  final String _baseUrl =
      'https://fls8oe8xp7.execute-api.ap-south-1.amazonaws.com/dev/nosh-assignment';

  Future<List<RecipeModel>> fetchRecipes() async {
    try {
      final http.Response response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((recipe) => RecipeModel.fromJson(recipe)).toList();
      } else {
        throw Exception('Failed to load dishes');
      }
    } catch (e) {
      throw Exception('Failed to load dishes: $e');
    }
  }
}
