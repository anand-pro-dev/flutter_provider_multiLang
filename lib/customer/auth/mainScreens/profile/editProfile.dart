import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mshora/widgets/button.dart';
import 'package:mshora/widgets/common_widget.dart';
import 'package:mshora/widgets/text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final newH = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: SingleChildScrollView(
            child: Column(
              children: [
                height(10),
                backAppButton(context, title: "Account"),
                heightMq(context, 0.03),
                roundedContainerInk(
                  height: newH * 0.14,
                  width: newH * 0.14,
                  borderRadius: 100,
                  child: Stack(
                    children: [
                      Hero(
                          tag: 'Image',
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                  "assets/images/Rectangle 1093.png"))),
                      Positioned(
                          bottom: 10,
                          right: 1,
                          child: roundedContainerInk(
                              onTap: () {},
                              borderRadius: 100,
                              padding: EdgeInsets.all(6),
                              color: Colors.red,
                              child: Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                                size: 16,
                              )))
                    ],
                  ),
                ),
                height(10),
                text("nmae my ", fontWeight: FontWeight.bold, fontSize: 16),
                height(2),
                text("anand@example.com", fontWeight: FontWeight.w400),
                heightMq(context, 0.08),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: textField(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      wantBoader: false,
                      hintText: "first name "),
                ),
                heightMq(context, 0.03),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: textField(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      wantBoader: false,
                      hintText: "last name"),
                ),
                heightMq(context, 0.03),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: textField(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      wantBoader: false,
                      hintText: "email address"),
                ),
                heightMq(context, 0.03),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: textField(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      wantBoader: false,
                      hintText: "mobile number"),
                ),
                heightMq(context, 0.05),
                // Spacer(),
                AppButton(
                  height: 55,
                  text: "SAVE",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
