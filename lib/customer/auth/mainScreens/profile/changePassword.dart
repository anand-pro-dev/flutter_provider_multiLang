import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:mshora/widgets/button.dart';
import 'package:mshora/widgets/common_widget.dart';
import 'package:mshora/widgets/text_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
                height(15),
                backAppButton(context, title: "Change Password"),

                height(40),

                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: textField(
                      prefixIcon: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          roundedContainer(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Image.asset(
                              "assets/images/Lock.png",
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      wantBoader: false,
                      hintText: "Old password"),
                ),
                heightMq(context, 0.03),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: textField(
                      prefixIcon: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          roundedContainer(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Image.asset(
                              "assets/images/Lock.png",
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      wantBoader: false,
                      hintText: "New password"),
                ),
                heightMq(context, 0.03),
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: textField(
                      prefixIcon: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          roundedContainer(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Image.asset(
                              "assets/images/Lock.png",
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      wantBoader: false,
                      hintText: "Confirm password"),
                ),
                heightMq(context, 0.07),
                // Spacer(),
                AppButton(
                  height: 55,
                  text: "SAVE",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
