import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  Locale _appLocale = const Locale('en'); // Default locale

  Locale get appLocal => _appLocale;

  Future<void> fetchLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('language_code');

    if (languageCode == null) {
      _appLocale = const Locale('en'); // Set default locale
    } else {
      log("Loaded Language: $languageCode");
      _appLocale = Locale(languageCode);
    }
    
    notifyListeners(); // Ensure UI updates
  }

  Future<void> changeLanguage(Locale type) async {
    final prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) return;

    log("Changing Language to: ${type.languageCode}");
    
    _appLocale = type;
    await prefs.setString('language_code', type.languageCode);

    // Set country code if needed
    if (type.languageCode == "ne") {
      await prefs.setString('countryCode', 'NE');
    } else {
      await prefs.setString('countryCode', 'US');
    }

    notifyListeners();
  }
}
