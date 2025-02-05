import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mshora/customer/auth/DashBoardUser/dashBoardUserScreen.dart';
import 'package:mshora/customer/auth/auth_components/auth_components.dart';
import 'package:mshora/customer/auth/login.dart';
import 'package:mshora/functions/localStorage.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:mshora/services/api_calls.dart';
import 'package:mshora/utils/constants.dart';
import 'package:mshora/utils/utils.dart';
import 'package:mshora/widgets/button.dart';
import 'package:mshora/widgets/common_widget.dart';
import 'package:mshora/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //
  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  TextEditingController mobileController = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pswd = TextEditingController();
  final TextEditingController _conPswd = TextEditingController();
  final TextEditingController _firstName = TextEditingController();

  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  List<FirstNameTitile> countries = [
    FirstNameTitile(name: "Mr."),
    FirstNameTitile(name: "Mrs."),
  ];

  late FirstNameTitile selectedFirstNameTitile;

  @override
  void initState() {
    super.initState();

    selectedFirstNameTitile = countries[0];
  }

  //
  String countryCode = 'IN';
  bool loadingCountryCode = true;

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              height(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      backAppButton(context),
                      Row(
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
                        ],
                      ),
                      height(40),
                      text("First Name", color: Colors.grey),
                      textField(
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 0),
                        boderColors: Colors.transparent,

                        prefixIcon: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              width(10),
                              DropdownButton<FirstNameTitile>(
                                value: selectedFirstNameTitile,
                                isDense: true,
                                icon: const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.black,
                                  ),
                                ), // Hides the dropdown icon
                                onChanged: (FirstNameTitile? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      selectedFirstNameTitile = newValue;
                                    });
                                  }

                                  setState(() {});
                                },
                                items: countries
                                    .map<DropdownMenuItem<FirstNameTitile>>(
                                        (FirstNameTitile firstNameTitile) {
                                  return DropdownMenuItem<FirstNameTitile>(
                                    value: firstNameTitile,
                                    child: Row(
                                      children: [
                                        Text(
                                          firstNameTitile.name,
                                          selectionColor: Colors.black,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                underline: const SizedBox
                                    .shrink(), // Removes the underline6
                              ),
                              width(10),
                              customDivider(
                                  height: 20, width: 1.5, color: Colors.black),
                              width(10),
                            ],
                          ),
                        ),

                        // prefixIconColor: Colors.black,
                        hintText: "First name",
                        controller: _firstName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter first name";
                          }
                          return null;
                        },
                      ),
                      customDivider(),
                      height(30),
                      text("Last Name", color: Colors.grey),
                      textField(
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 0),
                        boderColors: Colors.transparent,

                        // prefixIconColor: Colors.black,
                        hintText: "last name",
                        controller: _firstName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter last name";
                          }
                          return null;
                        },
                      ),
                      customDivider(),
                      height(30),
                      text("Mobile number", color: Colors.grey),
                      textField(
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 0),
                        boderColors: Colors.transparent,
                        keyboardType: const TextInputType.numberWithOptions(),
                        controller: mobileController,
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CountryCodePicker(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              onChanged: (value) {
                                countryCode = value.dialCode
                                    .toString()
                                    .replaceAll("+", "${value.dialCode}");
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
                                  color: Colors.black), // Text style in input
                              dialogTextStyle: const TextStyle(
                                  color: Colors.white), // Text in dropdown list
                              backgroundColor:
                                  Colors.black, // Dropdown background color
                              boxDecoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(25),
                              ),

                              searchStyle: const TextStyle(
                                  color: Colors
                                      .white), // Text style for search input
                              searchDecoration: const InputDecoration(
                                hintText: "Search country",
                                hintStyle: TextStyle(
                                    color: Colors.grey), // Hint text color
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors
                                          .white), // Search input underline color
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
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
                      const SizedBox(height: 20),
                      customDivider(),
                      height(30),
                      text("Email", color: Colors.grey),
                      textField(
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 0),
                        boderColors: Colors.transparent,
                        controller: _email,
                        hintText: "Email",
                        validator: (value) {
                          // Regular expression for validating an email address
                          String emailPattern =
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                          RegExp regExp = RegExp(emailPattern);

                          if (value == null || value.isEmpty) {
                            return "Please Enter a valid email address";
                          } else if (!regExp.hasMatch(value)) {
                            return "Please Enter a valid email address";
                          }
                          return null;
                        },
                      ),
                      customDivider(),
                      height(20),
                      AppButton(
                        loading: loading,
                        text: 'Sign up',
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          // if (_formKey.currentState!.validate()) {
                          //   _formKey.currentState!.save();

                          // }

                          gotoScreenUntil(context, DashBoardUserScreen());
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          height(40),
                          text("Sign up with",
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
                              onTap: () {},
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              child: text("Become a  Service Provider")),
                          height(10),
                          FadeInUp(
                            duration: const Duration(milliseconds: 2000),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                text(
                                  "Already have an Account?",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                textButton(context,
                                    text: "Sign in",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.orange, onPressed: () {
                                  gotoScreen(context, const LogInScreen());
                                }),
                              ],
                            ),
                          ),
                          height(50),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstNameTitile {
  final String name;

  FirstNameTitile({required this.name});
}
