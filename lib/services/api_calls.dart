import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mshora/services/api_constants.dart';
import 'package:mshora/services/api_methods.dart';

class ApiServices {
  ApiServiceRepo apiRepo = ApiServiceRepo();

  getdata() {
    final data = apiRepo.get(baseUrl: "");
    return data;
  }

  postdata({required body}) {
    final data = apiRepo.post(baseUrl: " ", body: body);
    return data;
  }

  login({required body}) {
    final data = apiRepo.post(baseUrl: "${ApiConst.logIn}", body: body);
    return data;
  }

  signUp({required body}) {
    final data = apiRepo.post(baseUrl: "${ApiConst.register}", body: body);
    return data;
  }

  forgetPassword({required body}) {
    final data = apiRepo.post(baseUrl: ApiConst.forgetPassword, body: body);
    return data;
  }

  verifyOtp({required body}) {
    final data = apiRepo.post(baseUrl: ApiConst.verifyOtp, body: body);
    return data;
  }

  resetPass({required body}) {
    final data = apiRepo.postToken(baseUrl: ApiConst.restPassword, body: body);
    return data;
  }

  userDetials() {
    final data = apiRepo.getWithToken(
      baseUrl: "${ApiConst.getUser}",
    );
    return data;
  }

  updateUser({required body}) {
    final data =
        apiRepo.postToken(baseUrl: "${ApiConst.userProfileUpdate}", body: body);
    return data;
  }

  getCities() {
    final data = apiRepo.getWithToken(
      baseUrl: "${ApiConst.cityList}",
    );
    return data;
  }
}
