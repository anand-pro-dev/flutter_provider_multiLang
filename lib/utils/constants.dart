import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  //
  static const primaryColor = Colors.black;
  // static const primaryColor = Color(0xFFF04924);
  static const tabColor = Color(0xFF042F40);
  static const fontColor = Color(0xFF550063);
  static const fillBuleColor = Color(0xFF02D5E0);
  static const whiteColor = Colors.white;
  final blueColor = Colors.blue[700];
  static const kblueColor = Colors.blue;
  static const kAmberColor = Colors.amber;
  static const greeyColor = Colors.grey;
  // static const redColor = Color(0xffb74093);   background: #F0F1F3;
  static const redColor = Color(0xFFEF4A23);

  // static const scfBgColor = Color.fromARGB(255, 248, 250, 252);
  static const scfBgColor = Color(0xffF0F1F3);
  static const backButtonColor = Color(0xffd2d2d4);
  static const black = Colors.black;

  // admin

  static const bgLight = Color(0xFFF4F4F4);
  static const bgSecondayLight = Color(0xFFFCFCFC);
  static const titleLight = Color(0xFF272B30);
  static const textLight = Color(0xFF6F767E);
  static const textGrey = Color(0xFF9A9FA5);
  static const iconLight = Color(0xFF272B30);
  static const iconBlack = Color(0xFF1A1D1F);
  static const iconGrey = Color(0xFF9A9FA5);
  static const highlightLight = Color(0xFFEFEFEF);

  static const primary = Color(0xFF2A85FF);
  static const primaryPurple = Color(0xFF8E59FF);
  static const success = Color(0xFF83BF6E);
  static const error = Color(0xFFFF6A55);

  static const secondaryMistyrose = Color(0xFFFFE7E4);
  static const secondaryPeach = Color(0xFFFFBC99);
  static const secondaryLavender = Color(0xFFCABDFF);
  static const secondaryBabyBlue = Color(0xFFB1E5FC);
  static const secondaryMintGreen = Color(0xFFB5E4CA);
  static const secondaryPaleYellow = Color(0xFFFFD88D);
  static const darkblue = Color(0xFFF2027CC);
  static final textField = const Color.fromARGB(255, 215, 214, 214);
  static const appbuttonShadow = Color.fromARGB(255, 228, 182, 202);
}

class AppUrl {
  //
  static const String _baseUrl =
      "http://103.15.67.180/dev_2/travel_planner/public/api/";

  // static const String imageUrl = "https://dev.waleedoptics.com/public/";
  // static const String imageUrl = "https://www.dahablenses.com/demo/public/";
  static String baseUrl = _baseUrl;
  static Auth auth = Auth();
  static Home home = Home();
}

class Auth {
  static const String _auth = AppUrl._baseUrl;

  String login = "${_auth}user-login-otp";

  String verifyOtp = "${_auth}user-verify-otp";
  String resendOtp = "${_auth}user-resend-otp";

  String getProfile = "${AppUrl._baseUrl}user-profile";
}

//

class Home {
  String allProducts = 'https://fakestoreapi.com/products';
}

//

final statesBarTheme =
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  statusBarColor: Colors.white38,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.light,
));

extension ToColorFilter on Color {
  ColorFilter? get toColorFilter {
    return ColorFilter.mode(this, BlendMode.srcIn);
  }
}

// Function to convert color name string to Color object
Color stringToColor(String colorName) {
  switch (colorName.toLowerCase()) {
    case 'red':
      return Colors.red;
    case 'green':
      return Colors.green;
    case 'blue':
      return Colors.blue;
    case 'amber':
      return Colors.amber;
    case 'black':
      return Colors.black;
    case 'white':
      return Colors.white;
    // Add more colors as needed
    default:
      return Colors.grey; // Default color if no match found
  }
}
