import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CatService extends ChangeNotifier {
  List<String> catImages = [];
  List<String> favoriteImages = [];

  CatService() {
    getRandomCatImages();
  }

  void getRandomCatImages() async {
    Response resuilt = await Dio().get(
        "https://api.thecatapi.com/v1/images/search?limit=10&mime_type=jpeg");

    for (int i = 0; i < resuilt.data.length; i++) {
      var map = resuilt.data[i];
      catImages.add(map['url']);
      notifyListeners();
    }
  }

  void toggleFavoriteImage(String catImage) async {
    if (favoriteImages.contains(catImage)){
      favoriteImages.remove(catImage);
    } else {
      favoriteImages.add(catImage);
    }
    notifyListeners();
}
}