import 'dart:async';

import 'package:mshora/customer/auth/DashBoardUser/dashBoardUserScreen.dart';
import 'package:mshora/customer/auth/onboading/onBoadingSecond.dart';
import 'package:mshora/customer/auth/onboading/onBoadingStart.dart';

import 'package:mshora/functions/localStorage.dart';
import 'package:mshora/widgets/common_widget.dart';

class SplashServices {
  void isLogin(context) async {
    String? token = await LocalStoreService.getAuthToken();
    await Future.delayed(const Duration(seconds: 1));

    if (token != null && token.isNotEmpty) {
      gotoScreenUntil(context, const DashBoardUserScreen());
    } else {
      gotoScreenUntil(context, const OnBoadingSecond());
    }
  }
}
