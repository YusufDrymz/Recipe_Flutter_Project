import 'package:flutter/material.dart';
import 'package:recipe_app/src/core/models/helper_model.dart';
import 'package:recipe_app/src/ui/widgets/helper_widget.dart';

class UserRecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<RecipeModel> recipes = [
      RecipeModel(
        author: 'Ahmet Kaplan',
        title: 'Cupcake',
        category: 'Yiyecek',
        duration: '>60 mins',
        favorite: false,
        imgAuthor:
            'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f',
        imgCover:
            'https://images.unsplash.com/photo-1535141192574-5d4897c12636',
      ),
      RecipeModel(
        author: 'Yusuf Erkan Darıyemez',
        title: 'Pancake',
        category: 'Yiyecek',
        duration: '>60 mins',
        favorite: true,
        imgAuthor:
            'https://avatars.githubusercontent.com/u/77965724?v=4',
        imgCover:
            'https://images.unsplash.com/photo-1488477304112-4944851de03d',
      ),
      RecipeModel(
        author: 'Murat Boz',
        title: 'Gingerbread',
        category: 'Yiyecek',
        duration: '>60 mins',
        favorite: false,
        imgAuthor: 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c',
        imgCover:
            'https://images.unsplash.com/photo-1576618148400-f54bed99fcfd',
      ),
      RecipeModel(
        author: 'Müslüm Gürses',
        title: 'Quince Tart',
        category: 'Yiyecek',
        duration: '>60 mins',
        favorite: false,
        imgAuthor:
            'https://images.unsplash.com/photo-1520341280432-4749d4d7bcf9',
        imgCover:
            'https://images.unsplash.com/photo-1607478900766-efe13248b125',
      ),
    ];
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisExtent: 220,
        childAspectRatio: 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 30,
      ),
      itemCount: recipes.length,
      itemBuilder: (BuildContext ctx, index) {
        return UserRecipe(data: recipes[index]);
      },
    );
  }
}
