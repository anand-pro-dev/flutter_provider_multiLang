import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mshora/utils/constants.dart';
import 'package:provider/provider.dart';

Widget roundedContainer({
  required Widget child,
  Color? color,
  Alignment? alignment,
  Color? splashColor,
  double? height,
  double? width,
  double? borderRadius,
  EdgeInsets? margin,
  Color? borderColor,
  double? borderWidth,
  VoidCallback? onTap,
  EdgeInsets? padding,
  Gradient? gradient,
}) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent, // Ensures it captures gestures
    onTap: onTap,
    child: Container(
      alignment: alignment,
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        gradient: gradient, // Apply gradient if provided
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0,
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 7),
        color: gradient == null ? color : null, // Use color if no gradient
      ),
      child: child,
    ),
  );
}

Widget roundedContainerInk({
  required Widget child,
  Color? color,
  Color? splashColor,
  double? height,
  double? width,
  double? borderRadius,
  EdgeInsets? margin,
  Color? boderColor,
  double? boderWith,
  VoidCallback? onTap,
  EdgeInsets? padding,
}) {
  return Material(
    color: Colors.transparent, // Ensure the Material background is transparent
    borderRadius: BorderRadius.circular(borderRadius ?? 7),
    child: Container(
      margin: margin,
      child: InkWell(
        splashColor: splashColor ?? Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(borderRadius ?? 7),
        onTap: onTap,
        child: Ink(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color ?? Colors.white, // Set default color
            borderRadius: BorderRadius.circular(borderRadius ?? 7),
            border: Border.all(
              color: boderColor ?? Colors.transparent,
              width: boderWith ?? 0,
            ),
          ),
          padding: padding,
          child: child,
        ),
      ),
    ),
  );
}

Widget roundedShadeContianer(
    {required child,
    Color? color,
    Color? shadeColor,
    double? borderRadius,
    double? height,
    double? width,
    EdgeInsets? margin,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    EdgeInsets? padding}) {
  return InkWell(
    borderRadius: BorderRadius.circular(borderRadius ?? 10),
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 3),
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          color: color ?? Colors.white,
          boxShadow: [
            BoxShadow(
              color: shadeColor ?? Colors.grey.shade200,
              blurRadius: 5.0,
              spreadRadius: 1, //New
            )
          ]),
      child: child,
    ),
  );
}

Widget roundedLightShadeContianer(
    {required child,
    Color? color,
    Color? shadeColor,
    double? borderRadius,
    double? height,
    double? width,
    EdgeInsets? margin,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    EdgeInsets? padding}) {
  return InkWell(
    borderRadius: BorderRadius.circular(borderRadius ?? 10),
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 3),
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          color: color ?? Colors.white,
          boxShadow: [
            BoxShadow(
              color: shadeColor ?? Colors.grey.shade100,
              blurRadius: 5.0,
              spreadRadius: 1, //New
            )
          ]),
      child: child,
    ),
  );
}

Widget roundedShadeSearchContianer(
    {required child,
    Color? color,
    Color? shadeColor,
    double? borderRadius,
    double? height,
    double? width,
    EdgeInsets? margin,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    EdgeInsets? padding}) {
  return InkWell(
    borderRadius: BorderRadius.circular(borderRadius ?? 10),
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        color: color ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: shadeColor ?? Colors.grey.shade300,
            blurRadius: 10,
            spreadRadius: 0.5,
            offset: const Offset(
              0,
              -10,
            ),
          ),
          BoxShadow(
            color: shadeColor ?? Colors.grey.shade300,
            blurRadius: 10,
            spreadRadius: 0.5,
            offset: const Offset(
              15,
              10,
            ),
          ),
          BoxShadow(
            color: shadeColor ?? Colors.grey.shade300,
            blurRadius: 10,
            spreadRadius: 0.5,
            offset: const Offset(
              -15,
              10,
            ),
          ),
        ],
      ),
      child: child,
    ),
  );
}

Widget roundedOutlineContianer(
    {required child,
    Color? color,
    Color? boderColor,
    double? borderRadius,
    double? height,
    double? width,
    AlignmentGeometry? alignment,
    double? boderWidth,
    EdgeInsets? margin,
    BorderRadiusGeometry? borderRadiusCusotm,
    VoidCallback? onTap,
    EdgeInsets? padding}) {
  return Material(
    borderRadius: BorderRadius.circular(borderRadius ?? 10),
    child: InkWell(
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      onTap: onTap,
      child: Container(
        alignment: alignment ?? null,
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(
            color: boderColor ?? Colors.grey.shade300,
            width: boderWidth ?? 1,
          ),
          borderRadius:
              borderRadiusCusotm ?? BorderRadius.circular(borderRadius ?? 10),
          color: color ?? Colors.white,
        ),
        child: child,
      ),
    ),
  );
}

Widget roundedOutlineContianerInk({
  required Widget child,
  Color? color,
  Color? boderColor,
  double? borderRadius,
  double? height,
  double? width,
  double? boderWidth,
  EdgeInsets? margin,
  BorderRadiusGeometry? borderRadiusCusotm,
  VoidCallback? onTap,
  EdgeInsets? padding,
}) {
  return Material(
    color: Colors.transparent, // Ensure the splash effect is visible
    child: InkWell(
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      onTap: onTap,
      child: Ink(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(
            color: boderColor ?? Colors.grey.shade300,
            width: boderWidth ?? 1,
          ),
          borderRadius:
              borderRadiusCusotm ?? BorderRadius.circular(borderRadius ?? 10),
          color: color ?? Colors.white,
        ),
        child: child,
      ),
    ),
  );
}

void gotoScreen(BuildContext context, Widget screen) {
  log("   $screen");
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

void gotoScreenUntil(BuildContext context, Widget screen) {
  log("   $screen");
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen), (Route route) => false);
}

Widget height(double height) {
  return SizedBox(height: height);
}

Widget width(double width) {
  return SizedBox(width: width);
}

Widget heightMq(context, height) {
  final newH = MediaQuery.of(context).size.height;
  return SizedBox(height: newH * height);
}

Widget hightWidthMq(context, {height, width, child}) {
  final newH = MediaQuery.of(context).size.height;
  final newW = MediaQuery.of(context).size.width;
  return SizedBox(
    height: newH * height,
    width: newW * width,
    child: child,
  );
}

Widget column(List<Widget> children) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: children, // Pass the provided list of widgets here
  );
}

Widget text(
  String? text, {
  Color? color,
  int? maxLines,
  int? minLines,
  double? fontSize,
  double? horizontal,
  Color? decorationColor,
  double? vertical,
  TextAlign? textAlign,
  TextDecoration? decoration,
  FontWeight? fontWeight,
}) {
  // Check if text is null
  if (text == null || text.isEmpty || text == "null") {
    return SizedBox(); // Return an empty Container if text is null or empty
  }
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: horizontal ?? 0,
      vertical: vertical ?? 0,
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
        decorationColor: decorationColor,
        decoration: decoration,
      ),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 2,
    ),
  );
}

Widget textR({
  String? text,
  Color? color,
  int? maxLines,
  int? minLines,
  double? fontSize,
  double? horizontal,
  double? vertical,
  TextAlign? textAlign,
  TextDecoration? decoration,
  FontWeight? fontWeight,
}) {
  // Check if text is null
  if (text == null || text.isEmpty || text == "null") {
    return Container(); // Return an empty Container if text is null or empty
  }

  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: horizontal ?? 0,
      vertical: vertical ?? 0,
    ),
    child: Text(
      text,
      style: GoogleFonts.raleway(
        // Apply Raleway font
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color ?? Colors.black,
          decoration: decoration,
        ),
      ),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 2,
    ),
  );
}

Widget horizontalListView({
  required int itemCount,
  required Widget Function(int index) itemBuilder,
  ScrollPhysics? scrollPhysics,
  ScrollController? controller,
  EdgeInsets? padding,
}) {
  return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    padding: padding,
    controller: controller,
    physics: scrollPhysics,
    itemCount: itemCount,
    itemBuilder: (context, index) {
      return itemBuilder(index);
    },
  );
}

Widget listViewBuilder({
  required int itemCount,
  required IndexedWidgetBuilder itemBuilder, // Use IndexedWidgetBuilder
  ScrollPhysics? scrollPhysics,
  ScrollController? controller,
  EdgeInsets? padding,
  Axis? scrollDirection,
}) {
  return ListView.builder(
    shrinkWrap: true,
    padding: padding,
    scrollDirection: scrollDirection ?? Axis.vertical,
    controller: controller,
    physics: scrollPhysics,
    itemCount: itemCount,
    itemBuilder: itemBuilder, // Pass the index to the itemBuilder
  );
}

Widget listGrid(
    {EdgeInsets? padding,
    required int itemCount,
    required Widget Function(int index) itemBuilder,
    int? crossAxisCount,
    double? crossAxisSpacing,
    double? mainAxisSpacing,
    double? childAspectRatio,
    ScrollPhysics? physics}) {
  return GridView.builder(
    padding: padding,

    shrinkWrap: true,
    physics: physics,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: childAspectRatio ?? 1.0,
      crossAxisCount: crossAxisCount ?? 1, // Number of columns
      crossAxisSpacing: crossAxisSpacing ?? 8.0, // Spacing between columns
      mainAxisSpacing: mainAxisSpacing ?? 8.0, // Spacing between rows
    ),
    itemCount: itemCount, // Number of items in the grid
    itemBuilder: (context, index) {
      // Builder function that returns a widget for each item
      return itemBuilder(index);
    },
  );
}

Widget textButton(BuildContext context,
    {required String? text,
    Color? color,
    required VoidCallback onPressed,
    double? fontSize,
    double? horizontal,
    double? vertical,
    FontWeight? fontWeight}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 5, vertical: vertical ?? 5),
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, // Remove the default padding
        minimumSize: Size(horizontal ?? 2,
            vertical ?? 2), // Set minimum size to zero if needed
        tapTargetSize:
            MaterialTapTargetSize.shrinkWrap, // Shrink the tap target
      ),
      child: Text(
        text ?? "",
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color ?? Colors.black,
        ),
      ),
    ),
  );
}

Widget textButtonGradient({
  required String text,
  required VoidCallback onPressed,
  double? fontSize,
  double? horizontal,
  double? vertical,
  FontWeight? fontWeight,
  Gradient? gradient, // Gradient parameter for text
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: horizontal ?? 0,
      vertical: vertical ?? 0,
    ),
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          // padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          ),
      child: ShaderMask(
        shaderCallback: (bounds) {
          return (gradient ??
                  const LinearGradient(
                    colors: [Colors.red, Colors.purple, Colors.blue],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ))
              .createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          );
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? 16,
            fontWeight: fontWeight ?? FontWeight.normal,
            color: Colors.white, // Still needed to define color for ShaderMask
          ),
        ),
      ),
    ),
  );
}

Widget paddingWidget(
    {required double horizontal,
    required double vertical,
    required Widget child}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    child: child,
  );
}

Widget heaingText({required String text1, String? text2, Color? color2}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      text(
        text1!,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      Expanded(
          child: text(text2 ?? "",
              color: color2,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.right)),
    ],
  );
}

Widget heaingTextExp(
    {required String text1,
    required String text2,
    required,
    double? fs,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? textAlign}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      text(text1, fontSize: fs ?? 14, fontWeight: FontWeight.w700),
      Expanded(
          child: text(text2,
              color: color,
              fontSize: fs ?? 14,
              fontWeight: fontWeight ?? FontWeight.w500,
              textAlign: textAlign ?? TextAlign.right)),
    ],
  );
}

String convertTimeFormat(String timeString) {
  DateTime time = DateTime.parse("2023-11-16 $timeString");
  String period = time.hour >= 12 ? 'PM' : 'AM';
  int hour = time.hour > 12 ? time.hour - 12 : time.hour;
  String formattedTime =
      "$hour:${time.minute.toString().padLeft(2, '0')} $period";
  return formattedTime;
}

Future<void> showLoadingIndicator(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // Prevent user from dismissing dialog
    builder: (BuildContext context) {
      bool isLoading = true; // Loading state

      // StatefulBuilder to manage loading state inside AlertDialog content
      return AlertDialog(
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(), // Loading indicator
                SizedBox(height: 16),
                Text('Loading...'),
              ],
            );
          },
        ),
      );
    },
  );
}

Widget customDivider({Color? color, double? height, double? width}) {
  return roundedContainer(
      width: width ?? double.infinity,
      height: height ?? 0.5,
      color: color ?? Colors.black,
      child: SizedBox());
}

Widget textSelected(String string) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    textDirection: TextDirection.ltr,
    textBaseline: TextBaseline.alphabetic,
    children: [
      text(string,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.fontColor),
      width(10),
      // ignore: prefer_const_constructors
      Icon(
        FontAwesomeIcons.starOfLife,
        color: AppColors.fontColor,
        size: 8,
      ),
    ],
  );
}

Widget textNewFont(
  BuildContext context,
  String? text, {
  Color? color,
  int? maxLines,
  int? minLines,
  double? fontSize,
  double? horizontal,
  double? vertical,
  TextAlign? textAlign,
  TextDecoration? decoration,
  FontWeight? fontWeight,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: horizontal ?? 0,
      vertical: vertical ?? 0,
    ),
    child: Text(
      text ?? "",
      style: GoogleFonts.courgette(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
        decoration: decoration,
      ),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 2,
    ),
  );
}
