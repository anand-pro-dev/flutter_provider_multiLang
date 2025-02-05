import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mshora/customer/auth/login.dart';
import 'package:mshora/functions/splash_services.dart';
import 'package:mshora/widgets/button.dart';
import 'package:mshora/widgets/common_widget.dart';

class OnBoadingScreen extends StatefulWidget {
  OnBoadingScreen({Key? key}) : super(key: key);

  @override
  _OnBoadingScreenState createState() => _OnBoadingScreenState();
}

class _OnBoadingScreenState extends State<OnBoadingScreen> {
  SplashServices splashServices = SplashServices();

  String codeOfCountry = '+93';

  callInit() async {
    var data = await http.get(Uri.parse('http://ip-api.com/json'));
    Map dataJson = jsonDecode(data.body);
    codeOfCountry = dataJson['countryCode'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 18, 15, 170),
              Color.fromARGB(255, 136, 175, 208),
              Color.fromARGB(255, 241, 242, 243),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Illustration.png",
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
              ),
              // height(60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Image.asset(
                    "assets/images/student-with-school-bus-front-school 1.png"),
              ),
              // height(60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: text("Keep your childern",
                    textAlign: TextAlign.center,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: text("Safe With Us!",
                    textAlign: TextAlign.center,
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.w700),
              ),
              height(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: text(
                    "Compare and track your buses on the go. Loved by passengers alike.",
                    textAlign: TextAlign.center,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              height(30),
              SizedBox(
                width: 180,
                child: AppButton(
                    height: 60,
                    text: "Get Started",
                    onTap: () {
                      gotoScreen(context, LogInScreen());
                    }),
              ),
              heightMq(context, 0.09)
            ],
          ),
        ),
      ),
    );
  }
}
