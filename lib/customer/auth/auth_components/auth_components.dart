import 'package:flutter/material.dart';
import 'package:mshora/widgets/common_widget.dart';

Widget signUpOptionButtons(
    {VoidCallback? google, VoidCallback? faceBook, VoidCallback? apple}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      roundedContainer(
          onTap: google,
          padding: EdgeInsets.all(0),
          child: Image.asset(
            "assets/images/Google.png",
            height: 50,
            width: 50,
          )),
      roundedContainer(
          onTap: faceBook,
          padding: EdgeInsets.all(0),
          child: Image.asset(
            "assets/images/facebook.png",
            height: 50,
            width: 50,
          )),
      roundedContainer(
          onTap: apple,
          padding: EdgeInsets.all(0),
          child: Image.asset(
            "assets/images/Apple.png",
            height: 50,
            width: 50,
          )),
    ],
  );
}
