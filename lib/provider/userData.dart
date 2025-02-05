import 'dart:developer';

import 'package:flutter/material.dart';

import '../services/api_calls.dart';

class UserDetailsProvider with ChangeNotifier {
  bool loading = false;
  Map<String, dynamic> user = {};

  Future<void> fetchData() async {
    loading = true;
    notifyListeners();

    try {
      final data = await ApiServices().userDetials();
      // Assuming this method exists in your ApiServices class
      user = data['data'];
      log("Response provider  : $user");
      // await PrefStorage.saveCity(user["city_id"]);
      // int? getCityID = await PrefStorage.getCity();

      // log("City :" + getCityID.toString());
    } catch (error) {
      log("Error fetching user details: $error");
      // Handle error: For example, you could set user to an empty map
      user = {};
    }

    loading = false;
    notifyListeners();
  }
}
