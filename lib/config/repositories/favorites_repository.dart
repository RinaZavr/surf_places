import 'dart:convert';

import 'package:places_api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesRepository {
  FavoritesRepository({required this.prefs});

  final SharedPreferences prefs;

  final String favoritesKey = 'favorites';

  List<Place> favorites = [];

  bool isFavorite(Place place) =>
      favorites.where((e) => e.id == place.id).isNotEmpty;

  Future<void> updateFavorites({
    required Place place,
    bool isDelete = false,
  }) async {
    if (isDelete) {
      favorites.removeWhere((e) => e.id == place.id);
      await prefs.setStringList(
        favoritesKey,
        favorites.map((e) => jsonEncode(e.toJson())).toList(),
      );
    } else if (!isFavorite(place)) {
      favorites.add(place);
      await prefs.setStringList(
        favoritesKey,
        favorites.map((e) => jsonEncode(e.toJson())).toList(),
      );
    }
  }

  List<Place> getFavorites() {
    final currentFavorites = prefs.getStringList(favoritesKey) ?? [];
    if (currentFavorites.isNotEmpty) {
      favorites = currentFavorites
          .map((e) => Place.fromJson(jsonDecode(e) as Map<String, dynamic>))
          .toList();
    } else {
      favorites = [];
    }
    return favorites;
  }

  Future<void> deleteFavorites() async {
    await prefs.remove(favoritesKey);
  }
}
