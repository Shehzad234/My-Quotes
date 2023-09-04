import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/utils/utils.dart';
import 'package:quotes_app/view_model/favorites_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesRepo {
  static const String favoriteQuotesKey = 'favoriteQuotes';

  static Future<List<String>> getFavoriteQuotes() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? favoriteQuotes =
        sharedPreferences.getStringList(favoriteQuotesKey);
    return favoriteQuotes ?? [];
  }

  static Future<void> setInitialFavorite(context) async {
    List<String> favoriteQuotes = await getFavoriteQuotes();
    final favModel = Provider.of<FavoritesViewModel>(context, listen: false);
    favModel.setFavorites(favoriteQuotes);
  }

  static Future<void> addRemoveFavoriteSharedPreferences(
      {required BuildContext context, required String imageUrl}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> favoriteQuotes = await getFavoriteQuotes();

    // ignore: use_build_context_synchronously
    final favModel = Provider.of<FavoritesViewModel>(context, listen: false);

    if (favoriteQuotes.contains(imageUrl)) {
      favoriteQuotes.remove(imageUrl);
      favModel.setFavorites(favoriteQuotes);

      await sharedPreferences
          .setStringList(favoriteQuotesKey, favoriteQuotes)
          .then((value) =>
              Utils.flushBarMessage(context, 'Removed from Favorites'));
    } else {
      favoriteQuotes.add(imageUrl);
      favModel.setFavorites(favoriteQuotes);
      await sharedPreferences
          .setStringList(favoriteQuotesKey, favoriteQuotes)
          .then(
              (value) => Utils.flushBarMessage(context, 'Added to Favorites'));
    }
  }
}
