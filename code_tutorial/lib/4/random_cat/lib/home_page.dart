import 'package:code_tutoorial/4/random_cat/lib/favorite_page.dart';
import 'package:code_tutoorial/4/random_cat/lib/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CatService>(builder: (context, catService, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            'Random Cat',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoritePage()));
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ))
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: const EdgeInsets.all(8),
          children: List.generate(catService.catImages.length, (index) {
            String catImages = catService.catImages[index];
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
      );
    });
  }
}
