import 'package:code_tutoorial/4/random_cat/lib/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CatService>(
      builder: (context, catService, child) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),

          title: const Text("Favorites", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.amber,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: const EdgeInsets.all(8),
          children: List.generate(catService.favoriteImages.length, (index) {
            String catImages = catService.favoriteImages[index];
            return GestureDetector(
                onTap: () {
                  catService.toggleFavoriteImage(catImages);
                },
                child: Stack(children: [
                  Positioned.fill(
                    child: Image.network(
                      catImages,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Icon(Icons.favorite,
                        color: catService.favoriteImages.contains(catImages)
                            ? Colors.amber
                            : Colors.white),
                  )
                ]));
          }),
        ),
      );}
    );
  }
}