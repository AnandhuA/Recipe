// lib/views/dish_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/viewmodels/recipe_view_model.dart';
import 'package:recipe/views/widgets/banner_widget.dart';
import 'package:recipe/views/widgets/card_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(recipeViewModelProvider);

    return Scaffold(
        appBar: AppBar(title: const Text('Recipes')),
        body: recipes.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  const BannerWidget(),
                  const Text(
                    "Discover regional delights",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        return CardWidget(
                          recipe: recipes[index],
                        );
                      },
                    ),
                  )
                ],
              ));
  }
}
