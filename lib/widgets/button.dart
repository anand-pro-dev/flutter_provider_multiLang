import 'package:flutter/material.dart';
import 'package:mshora/utils/constants.dart';
import 'package:mshora/widgets/common_widget.dart';
import 'package:provider/provider.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final bool boxShadow;
  final double? borderRadius;
  final double? height;
  final bool loading;
  final VoidCallback onTap;
  final FontWeight? fontWeight;
  final Color? color;

  const AppButton({
    Key? key,
    required this.text,
    this.loading = false,
    required this.onTap,
    this.borderRadius,
    this.color,
    this.textColor,
    this.height,
    this.boxShadow = false,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColors.black,
        borderRadius: BorderRadius.circular(borderRadius ?? 1),
        boxShadow: boxShadow
            ? [
                const BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 20,
                  color: Color.fromARGB(230, 204, 176, 190),
                ),
              ]
            : null,
      ),
      child: Center(
        child: loading
            ? InkWell(
                borderRadius: BorderRadius.circular(borderRadius ?? 5),
                onTap: null, // Disable tap when loading
                child: Ink(
                  height: height ?? 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: color ?? AppColors.black,
                    borderRadius: BorderRadius.circular(borderRadius ?? 5),
                  ),
                  child: Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: textColor ?? AppColors.whiteColor,
                    ),
                  ),
                ),
              )
            : Material(
                color: Colors.transparent, // Ensure the material is transparent
                borderRadius: BorderRadius.circular(borderRadius ?? 5),
                child: InkWell(
                  borderRadius: BorderRadius.circular(borderRadius ?? 5),
                  onTap: onTap, // Enable tap when not loading
                  splashColor:
                      Colors.white.withOpacity(0.2), // Visible splash color
                  child: Ink(
                    height: height ?? 50,
                    width: double.infinity,
                    // decoration: BoxDecoration(
                    //   color: color ?? AppColors.primaryColor,
                    //   borderRadius: BorderRadius.circular(borderRadius ?? 5),
                    //   boxShadow: boxShadow
                    //       ? [
                    //           const BoxShadow(
                    //             offset: Offset(0, 20),
                    //             blurRadius: 20,
                    //             color: Color.fromARGB(230, 204, 176, 190),
                    //           ),
                    //         ]
                    //       : null,
                    // ),
                    child: Center(
                      child: Text(
                        text ?? "",
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor ?? AppColors.whiteColor,
                          fontWeight: fontWeight ?? FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class AppButtonS extends StatelessWidget {
  final String text;
  final Color? textColor;
  final bool boxShadow;
  final double? borderRadius;
  final double? height;
  final bool loading;
  final VoidCallback onTap;
  final Color? color;

  const AppButtonS({
    Key? key,
    required this.text,
    this.loading = false,
    required this.onTap,
    this.borderRadius,
    this.color,
    this.textColor,
    this.height,
    this.boxShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? InkWell(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            onTap: loading == true ? null : onTap,
            child: Container(
              height: height ?? 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(borderRadius ?? 5),
              ),
              child: const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              )),
            ),
          )
        : Material(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            child: InkWell(
              borderRadius: BorderRadius.circular(borderRadius ?? 5),
              onTap: loading == true ? null : onTap,
              child: Container(
                  height: height ?? 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(borderRadius ?? 5),
                      boxShadow: boxShadow
                          ? [
                              const BoxShadow(
                                  offset: Offset(0, 20),
                                  blurRadius: 20,
                                  // spreadRadius: 10,
                                  color: Color.fromARGB(230, 204, 176, 190)),
                            ]
                          : null),
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor ?? Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )),
            ),
          );
  }
}

class AppButtonInk extends StatelessWidget {
  final String text;

  final Color? textColor;
  final double? borderRadius;
  final double? height;
  final bool loading;
  final VoidCallback onTap;
  final Color? color;

  const AppButtonInk({
    Key? key,
    required this.text,
    this.loading = false,
    required this.onTap,
    this.borderRadius,
    this.color,
    this.textColor,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? const Center(
            child: CircularProgressIndicator(
            color: AppColors.redColor,
          ))
        : Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              onTap: loading == true ? null : onTap,
              child: Ink(
                  height: height ?? 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius ?? 10),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.red,
                        Colors.pink,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor ?? Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )),
            ),
          );
  }
}

Widget backAppButton(context, {String? title, Color? fontColor}) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        roundedContainer(
            color: AppColors.bgLight,
            padding: const EdgeInsets.all(5),
            borderRadius: 100,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Center(
              child: Icon(
                Icons.chevron_left,
                size: 35,
              ),
            )),
        textR(
            text: title ?? "",
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: fontColor ?? Colors.black),
        // Spacer(),
        const SizedBox(width: 40)
      ],
    ),
  );
}

Widget backHeading(context, {String? title, Color? fontColor}) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(),
        textR(
            text: title ?? "",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: fontColor ?? Colors.black),
        const Spacer(),
      ],
    ),
  );
}
