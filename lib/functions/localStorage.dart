import 'package:shared_preferences/shared_preferences.dart';

class LocalStoreService {
  static const String _keyRememberMe =
      'remember_me'; // Key to store "Remember Me" state
  static const String _keyAuthToken = 'auth_token'; // Key to store login token

  // Save "Remember Me" state in SharedPreferences
  static Future<void> setRememberMe(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyRememberMe, value);
  }

  // Get "Remember Me" state from SharedPreferences
  static Future<bool> getRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyRememberMe) ?? false; // Default is false
  }

  // Store the login token
  static Future<void> setAuthToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAuthToken, token);
  }

  // Retrieve the login token
  static Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyAuthToken);
  }

  // Remove the login token (useful for logout)
  static Future<void> clearAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyAuthToken);
  }

  // Only for the Notifications

  // Method to check if animation has been shown and update the state
  static Future<bool> checkAndUpdateAnimationStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasShownAnimation = prefs.getBool('hasShownAnimation') ?? false;

    if (!hasShownAnimation) {
      // If it's the first time, mark it as shown
      await prefs.setBool('hasShownAnimation', true);
    }

    // Return whether the animation should be shown (true = show animation)
    return !hasShownAnimation;
  }

  // Optional method to reset the animation state (for testing purposes)
  static Future<bool> resetAnimationStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasShownAnimation', true);
    return true;
  }
}
