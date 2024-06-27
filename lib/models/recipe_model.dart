
class RecipeModel {
  final String dishName;
  final String dishId;
  final String imageUrl;

  RecipeModel({required this.dishName, required this.dishId, required this.imageUrl});

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      dishName: json['dishName'],
      dishId: json['dishId'],
      imageUrl: json['imageUrl'],
    );
  }
}
