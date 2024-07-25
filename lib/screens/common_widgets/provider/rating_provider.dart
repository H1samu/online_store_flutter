import 'package:flutter/material.dart';

class RatingProvider with ChangeNotifier {
  final Map<int, double> _ratings = {};

  double getRating(int productId) {
    return _ratings[productId] ?? 0.0;
  }

  void updateRating(int productId, double rating) {
    _ratings[productId] = rating;
    notifyListeners();
  }
}
