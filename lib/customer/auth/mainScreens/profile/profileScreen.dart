import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mshora/customer/auth/sign_up.dart';
import 'package:mshora/customer/auth/splash.dart';
import 'package:mshora/customer/auth/mainScreens/profile/changePassword.dart';
import 'package:mshora/customer/auth/mainScreens/profile/editProfile.dart';
import 'package:mshora/customer/auth/mainScreens/profile/generalSetting.dart';
import 'package:mshora/customer/auth/mainScreens/profile/walletScreen.dart';

import 'package:mshora/widgets/common_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final newH = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            heightMq(context, 0.03),
            roundedContainerInk(
              height: newH * 0.14,
              width: newH * 0.14,
              borderRadius: 100,
              child: Hero(
                  tag: 'Image',
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/images/Rectangle 1093.png"))),
            ),
            height(10),
            text("nmae my ", fontWeight: FontWeight.bold, fontSize: 16),
            height(2),
            text("anand@example.com", fontWeight: FontWeight.w400),
            heightMq(context, 0.02),
            customDivider(
              color: Colors.grey.shade300,
            ),
            heightMq(context, 0.02),
            roundedContainerInk(
                onTap: () {
                  gotoScreen(context, EditProfile());
                },
                color: Colors.transparent,
                child: Row(
                  children: [
                    roundedContainer(
                        borderRadius: 10,
                        padding: EdgeInsets.all(14),
                        color: Colors.grey.shade100,
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/images/profile.svg",
                            height: 20,
                          ),
                        )),
                    width(15),
                    text("Account Info",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    Spacer(),
                    Icon(Icons.chevron_right_rounded),
                    heightMq(context, 0.02),
                  ],
                )),
            heightMq(context, 0.02),
            customDivider(
              color: Colors.grey.shade300,
            ),
            heightMq(context, 0.02),
            roundedContainerInk(
                onTap: () {
                  gotoScreen(context, GeneralSetting());
                },
                color: Colors.transparent,
                child: Row(
                  children: [
                    roundedContainer(
                        borderRadius: 10,
                        padding: EdgeInsets.all(14),
                        color: Colors.grey.shade100,
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/images/Vector (1).svg",
                            height: 20,
                          ),
                        )),
                    width(15),
                    text("General Setting",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    Spacer(),
                    Icon(Icons.chevron_right_rounded),
                    heightMq(context, 0.02),
                  ],
                )),
            heightMq(context, 0.02),
            customDivider(
              color: Colors.grey.shade300,
            ),
            heightMq(context, 0.02),
            roundedContainerInk(
                onTap: () {
                  gotoScreen(context, WalletScreen());
                },
                color: Colors.transparent,
                child: Row(
                  children: [
                    roundedContainer(
                        borderRadius: 10,
                        padding: EdgeInsets.all(14),
                        color: Colors.grey.shade100,
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/images/wallet.svg",
                            height: 20,
                          ),
                        )),
                    width(15),
                    text("Wallet",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    Spacer(),
                    Icon(Icons.chevron_right_rounded),
                    heightMq(context, 0.02),
                  ],
                )),
            heightMq(context, 0.02),
            customDivider(
              color: Colors.grey.shade300,
            ),
            heightMq(context, 0.02),
            roundedContainerInk(
                onTap: () {
                  gotoScreen(context, ChangePassword());
                },
                color: Colors.transparent,
                child: Row(
                  children: [
                    roundedContainer(
                        borderRadius: 10,
                        padding: EdgeInsets.all(14),
                        color: Colors.grey.shade100,
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/images/Vector (2).svg",
                            height: 20,
                          ),
                        )),
                    width(15),
                    text("Change Password",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    Spacer(),
                    Icon(Icons.chevron_right_rounded),
                    heightMq(context, 0.02),
                  ],
                )),
            heightMq(context, 0.02),
            customDivider(
              color: Colors.grey.shade300,
            ),
            heightMq(context, 0.02),
            roundedContainerInk(
                onTap: () {
                  gotoScreenUntil(context, SplashScreen());
                },
                color: Colors.transparent,
                child: Row(
                  children: [
                    roundedContainer(
                        borderRadius: 10,
                        padding: EdgeInsets.all(10),
                        color: Colors.grey.shade100,
                        child: Center(
                          child: Image.asset(
                            "assets/images/majesticons_logout.png",
                            height: 25,
                          ),
                        )),
                    width(15),
                    text("Log Out",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    Spacer(),
                    Icon(Icons.chevron_right_rounded),
                    heightMq(context, 0.02),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
