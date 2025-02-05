const baseUrl = "https://www.kiro.hanti-dhawr.com/api";

class ApiConst {
  static const logIn = "$baseUrl/login";
  static const logOut = "$baseUrl/logout";
  static const register = "$baseUrl/register";
  static const getUser = "$baseUrl/get-user";
  static const cityList = "$baseUrl/city-list";
  static const changePassword = "$baseUrl/change-password";
  static const forgetPassword = "$baseUrl/forget-password";
  static const propertyByCity = "$baseUrl/property-by-city?city_id=3728";
  static const propertyDetails = "$baseUrl/property-detail?id=11";
  static const userProfileUpdate = "$baseUrl/user-profile-update";

  static const verifyOtp = "$baseUrl/verify-otp";
  static const restPassword = "$baseUrl/reset-password";
  static const restOtp = "$baseUrl/resend-otp";
}
