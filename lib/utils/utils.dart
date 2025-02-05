import 'package:flutter/material.dart';
import 'package:image_gradient/image_gradient.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  ///
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static snackBar(String message, BuildContext context, {Color? color}) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: color ?? Colors.red, content: Text(message)));
  }

  void showSnackBarFun(
      {required BuildContext context, required String message, Color? color}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
      backgroundColor: color ?? Colors.red,
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // More rounded corners
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
    );

    // Remove any current SnackBar before showing the new one
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
