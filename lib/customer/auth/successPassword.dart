import 'package:flutter/material.dart';
import 'package:mshora/customer/auth/DashBoardUser/dashBoardUserScreen.dart';
import 'package:mshora/customer/auth/login.dart';
import 'package:mshora/utils/constants.dart';
import 'package:mshora/widgets/button.dart';
import 'package:mshora/widgets/common_widget.dart';

class SuccessPasswordChanged extends StatelessWidget {
  const SuccessPasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.redColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              height(10),
              backAppButton(context),
              height(100),
              roundedContainer(
                height: 240,
                child: Center(
                    child: Hero(
                        tag: 'forget_image',
                        child: Image.asset(
                            'assets/images/young man with tablet celebrating success.png'))),
              ),
              height(20),
              textNewFont(context, "Password changed Successfully",
                  fontSize: 28,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600),
              height(20),
              text(
                  "your password has been successfully changed. please login again ",
                  fontSize: 18,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500),
              height(35),
              AppButton(
                  textColor: Colors.black,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,

                  // boxShadow: true,
                  text: "GO TO HOME",
                  onTap: () {
                    gotoScreen(context, DashBoardUserScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
