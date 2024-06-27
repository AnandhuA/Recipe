
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/models/recipe_model.dart';
import 'package:recipe/services/api_services.dart';


class RecipeViewModel extends StateNotifier<List<RecipeModel>> {
  final ApiService _apiService;

  RecipeViewModel(this._apiService) : super([]) {
    fetchrecipes();
  }

  Future<void> fetchrecipes() async {
    try {
      final recipes = await _apiService.fetchRecipes();
      state = recipes;
    } catch (e) {
      // Handle errors
    }
  }
}

final recipeViewModelProvider =
    StateNotifierProvider<RecipeViewModel, List<RecipeModel>>((ref) {
  return RecipeViewModel(ApiService());
});
