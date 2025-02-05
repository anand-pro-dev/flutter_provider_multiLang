import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget textField({
  Color? boderColors,
  String? hintText,
  bool? obscureText,
  EdgeInsetsGeometry? contentPadding,
  bool? wantBoader,
  Widget? suffixIcon,
  VoidCallback? onTap,
  TextInputType? keyboardType,
  bool? showSuffixIcon,
  bool? filled,
  Color? fillColor,
  Widget? prefixIcon,
  Color? prefixIconColor,
  TextEditingController? controller,
  String? Function(String?)? validator,
  bool? readOnly,
  bool limitToTenDigits =
      false, // Added this parameter to enable 10 digit limit
}) {
  return TextFormField(
    onTap: onTap,
    keyboardType: keyboardType ?? TextInputType.name,
    inputFormatters: <TextInputFormatter>[
      if (keyboardType == TextInputType.number || limitToTenDigits)
        FilteringTextInputFormatter.digitsOnly, // Allow digits only
      if (limitToTenDigits)
        LengthLimitingTextInputFormatter(10), // Limit to 10 digits
    ],
    readOnly: readOnly ?? false,
    controller: controller,
    obscureText: obscureText ?? false,
    decoration: InputDecoration(
      // prefix: Icon(
      //   Icons.abc,
      //   color: Colors.red,
      // ),
      filled: true,
      fillColor: fillColor ?? Colors.grey.shade100,
      prefixIcon: prefixIcon ?? null,

      prefixIconColor: prefixIconColor ?? Colors.grey.shade500,
      // prefixIcon: Icon(Icons.abc),
      suffixIconColor: Colors.grey.shade500,
      suffixIcon: showSuffixIcon == true
          ? InkWell(
              onTap: onTap,
              child: suffixIcon,
            )
          : null,
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      hintText: hintText ?? "Hint",
      hintStyle: const TextStyle(fontSize: 14),
      border: wantBoader == false
          ? InputBorder.none
          : OutlineInputBorder(
              borderSide: BorderSide(color: boderColors ?? Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
      enabledBorder: wantBoader == false
          ? InputBorder.none
          : OutlineInputBorder(
              borderSide: BorderSide(
                  color: boderColors ?? Colors.grey.shade400, width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
      focusedBorder: wantBoader == false
          ? InputBorder.none
          : OutlineInputBorder(
              borderSide: BorderSide(
                  color: boderColors ?? Colors.grey.shade500, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
    ),
    validator: validator,
  );
}

Widget closeKeyboard(context, Widget child) {
  return GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
    child: child,
  );
}
