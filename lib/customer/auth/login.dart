import 'dart:convert';
import 'dart:developer';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animate_do/animate_do.dart';
import 'package:mshora/customer/auth/DashBoardUser/dashBoardUserScreen.dart';
import 'package:mshora/customer/auth/auth_components/auth_components.dart';
import 'package:mshora/customer/auth/auth_components/langCheck.dart';
import 'package:mshora/customer/auth/enterOtpScreen.dart';
import 'package:mshora/customer/auth/sign_up.dart';
import 'package:http/http.dart' as http;
import 'package:mshora/customer/auth/splash.dart';

import 'package:mshora/utils/loading.dart';
import 'package:mshora/widgets/button.dart';
import 'package:mshora/widgets/common_widget.dart';
import 'package:mshora/widgets/text_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  //
  final _formKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();

  bool loading = false;

  //
  String countryCode = 'IN';
  bool loadingCountryCode = true;

  @override
  void initState() {
    callInit();
    super.initState();
  }
//

  callInit() async {
    try {
      var response = await http.get(Uri.parse('http://ip-api.com/json'));
      if (response.statusCode == 200) {
        final dataJson = jsonDecode(response.body);
        log(dataJson.toString());
        setState(() {
          loadingCountryCode = false;
          countryCode =
              '${dataJson['countryCode']}'; // Ensure it has the "+" prefix
        });
      } else {
        log("Failed to fetch country code: ${response.statusCode}");
      }
    } catch (e) {
      setState(() {
        loadingCountryCode = false;
      });
      log("Error fetching country code: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      // child: Scaffold(
      //   body: SafeArea(
      //     child: SingleChildScrollView(
      child: Scaffold(
        body: SafeArea(
          child: loadingCountryCode
              ? Center(
                  child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: loadingContinerWidget(),
                ))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22, right: 22),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                hightWidthMq(
                                  context,
                                  height: 0.2,
                                  width: 0.2,
                                  child: Image.asset(
                                      "assets/images/B34873D5-A882-4A91-9C51-C83E72A0576A 4.png"),
                                ),
                                height(40),
                                Row(
                                  children: [
                                    text(
                                      "Mobile number",
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                height(5),
                                textField(
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  boderColors: Colors.transparent,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(),
                                  controller: mobileController,
                                  prefixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CountryCodePicker(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        onChanged: (value) {
                                          countryCode = value.dialCode
                                              .toString()
                                              .replaceAll(
                                                  "+", "${value.dialCode}");
                                          log("current code $value");
                                        },
                                        onInit: (value) {
                                          countryCode = value!.dialCode!;
                                          log("current code $value");
                                        },
                                        initialSelection: countryCode,
                                        showCountryOnly: false,
                                        showOnlyCountryWhenClosed: false,
                                        alignLeft: false,
                                        textStyle: const TextStyle(
                                            color: Colors
                                                .black), // Text style in input
                                        dialogTextStyle: const TextStyle(
                                            color: Colors
                                                .white), // Text in dropdown list
                                        backgroundColor: Colors
                                            .black, // Dropdown background color
                                        boxDecoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),

                                        searchStyle: const TextStyle(
                                            color: Colors
                                                .white), // Text style for search input
                                        searchDecoration: const InputDecoration(
                                          hintText: "Search country",
                                          hintStyle: TextStyle(
                                              color: Colors
                                                  .grey), // Hint text color
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors
                                                    .white), // Search input underline color
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      customDivider(width: 1, height: 25),
                                      width(10)
                                    ],
                                  ),
                                  hintText: "Mobile no",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter a value mobile no";
                                    } else if (value.length < 10) {
                                      return "Mobile no must be at least 10 characters";
                                    }
                                    return null;
                                  },
                                ),
                                customDivider(),
                                const SizedBox(height: 20),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                    ),
                                    children: [
                                      TextSpan(
                                          text:
                                              "By signing in, you agree with our "),
                                      TextSpan(
                                        text: "Terms & Conditions",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                          text:
                                              ". Learn how we process your data in our "),
                                      TextSpan(
                                        text: "Privacy Policy",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(text: "."),
                                    ],
                                  ),
                                ),
                                height(20),
                                AppButton(
                                    text: "Sign In",
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        gotoScreen(
                                            context,
                                            EnterOtpScreen(
                                                mobileNo: mobileController.text,
                                                countryDialCode: countryCode));
                                      }
                                      // gotoScreen(context, DashBoardUserScreen());
                                    }),
                                height(10),
                                heightMq(context, 0.1),
                                text("Sign in with",
                                    fontSize: 14, fontWeight: FontWeight.w600),
                                height(30),
                                signUpOptionButtons(
                                    google: () {
                                      log("Google ");
                                    },
                                    faceBook: () {},
                                    apple: () {}),
                                heightMq(context, 0.08),
                                roundedOutlineContianerInk(
                                    onTap: () {
                                      gotoScreen(context, LangCheckScreen());
                                    },
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    child:
                                        text("Login as a  Service Provider")),
                                height(2),
                                FadeInUp(
                                  duration: const Duration(milliseconds: 2000),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      text(
                                        "Create a New Account?",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textButton(context,
                                          text: "Sign up",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.orange, onPressed: () {
                                        gotoScreen(
                                            context, const SignUpScreen());
                                      }),
                                      height(50),
                                    ],
                                  ),
                                ),
                                height(10),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
