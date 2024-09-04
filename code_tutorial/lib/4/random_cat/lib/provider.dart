import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatService extends ChangeNotifier {
  List<String> catImages = [];
  List<String> favoriteImages = [];
  SharedPreferences prefs;

  CatService(this.prefs) {
    getRandomCatImages();
    favoriteImages = prefs.getStringList("favorite") ?? [];
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
    prefs.setStringList("favorite", favoriteImages);
    notifyListeners();
}
}