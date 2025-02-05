import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mshora/customer/auth/DashBoardUser/dashBoardUserScreen.dart';

import 'package:mshora/utils/constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../widgets/button.dart';
import '../../widgets/common_widget.dart';
import 'package:dotted_line/dotted_line.dart';

class EnterOtpScreen extends StatefulWidget {
  final String mobileNo;
  final String countryDialCode;

  const EnterOtpScreen(
      {Key? key, required this.mobileNo, required this.countryDialCode})
      : super(key: key);

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height(10),
                  backAppButton(context),
                  height(80),
                  text("Mobile number verification",
                      fontSize: 24, fontWeight: FontWeight.w600),
                  height(7),
                  text(
                    "Please enter the code we sent to your mobile phone (${widget.countryDialCode}${widget.mobileNo}).",
                    fontSize: 14,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 40, width: double.infinity),

                  // PinCodeTextField with Validator
                  PinCodeTextField(
                    appContext: context,
                    controller: otpController,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 70,
                      fieldWidth: 70,
                      activeFillColor: AppColors.whiteColor,
                      selectedFillColor: AppColors.whiteColor,
                      inactiveFillColor: AppColors.textField,
                      activeColor: AppColors.black,
                      selectedColor: AppColors.black,
                      inactiveColor: AppColors.whiteColor,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the OTP";
                      }
                      if (value.length != 4) {
                        return "OTP must be 4 digits";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      // Optional: Handle changes here if needed
                    },
                  ),

                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text("Didn’t get an SMS?"),
                      textButton(
                        context,
                        onPressed: () {},
                        text: " Resend. ",
                        fontWeight: FontWeight.w700,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text("Wrong mobile number?"),
                      textButton(
                        context,
                        onPressed: () {},
                        text: " Edit. ",
                        fontWeight: FontWeight.w700,
                      )
                    ],
                  ),
                  const SizedBox(height: 60),

                  AppButton(
                    loading: loading,
                    text: 'SUBMIT',
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Navigate to ResetPasswordScreen
                        gotoScreen(context, DashBoardUserScreen());
                        // gotoScreen(context, ResetPasswordScreen());
                      }
                    },
                  ),
                  height(30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
