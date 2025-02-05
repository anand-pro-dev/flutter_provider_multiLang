import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/common_widget.dart';
import '../../widgets/text_field.dart';

Widget searchBar({required VoidCallback onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: roundedOutlineContianerInk(
      onTap: onTap,
      borderRadius: 10,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.white,
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: textField(
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                boderColors: Colors.white,
                fillColor: Colors.white,
                hintText: "Search what you need..."),
          ),
          width(10),
          roundedContainer(
            padding: EdgeInsets.all(7),
            color: Colors.black,
            child: SvgPicture.asset(
              "assets/images/search.svg",
              height: 22,
              width: 2,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
