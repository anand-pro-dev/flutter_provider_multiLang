import 'package:flutter/foundation.dart';

class BottomNavVisibilityProvider with ChangeNotifier {
  bool _isVisible = true;

  bool get isVisible => _isVisible;

  void showNav() {
    _isVisible = true;
    notifyListeners();
  }

  void hideNav() {
    _isVisible = false;
    notifyListeners();
  }
}
