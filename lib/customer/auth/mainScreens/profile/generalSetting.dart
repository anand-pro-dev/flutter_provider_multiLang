import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mshora/customer/auth/mainScreens/profile/termsCondition/termsCondition.dart';

import 'package:mshora/widgets/button.dart';
import 'package:mshora/widgets/common_widget.dart';
import 'package:mshora/widgets/text_field.dart';
import 'package:provider/provider.dart';

class GeneralSetting extends StatefulWidget {
  const GeneralSetting({super.key});

  @override
  State<GeneralSetting> createState() => _GeneralSettingState();
}

class _GeneralSettingState extends State<GeneralSetting> {
  //

  @override
  void initState() {
    super.initState();
  }
  //

  //
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
                backAppButton(context, title: "General Settings"),

                height(40),

                Row(
                  children: [
                    text(
                      "Language",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          text(
                            color: Colors.grey,
                            "English",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                heightMq(context, 0.05),
                Row(
                  children: [
                    text(
                      "Notifications",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    Spacer(),
                    text(
                      "Language",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),

                heightMq(context, 0.05),
                InkWell(
                  onTap: () {
                    gotoScreen(context, TermsAndCondition());
                  },
                  child: Row(
                    children: [
                      text(
                        "Terms and Conditions",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      Spacer(),
                      Icon(Icons.chevron_right_outlined)
                    ],
                  ),
                ),
                heightMq(context, 0.03),

                // Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
