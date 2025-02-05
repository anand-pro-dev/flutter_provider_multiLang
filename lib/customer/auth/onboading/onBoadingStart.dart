// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:animate_do/animate_do.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mshora/auth/onboading/onBoadingSecond.dart';
// import 'package:mshora/widgets/button.dart';

// import 'package:mshora/widgets/common_widget.dart';

// class OnBoadingStart extends StatefulWidget {
//   const OnBoadingStart({Key? key}) : super(key: key);

//   @override
//   State<OnBoadingStart> createState() => _OnBoadingStartState();
// }

// class _OnBoadingStartState extends State<OnBoadingStart> {
//   //
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController email = TextEditingController();
//   TextEditingController pswd = TextEditingController();
//   TextEditingController phoneController = TextEditingController();

//   final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
//   String codeOfCountry = '+91';
//   bool loading = false;
//   bool checkBox = false;
//   //

//   // LocalStoreService localStoreService = LocalStoreService();

//   //
//   @override
//   Widget build(BuildContext context) {
//     final heightMq = MediaQuery.of(context).size.height;
//     final widthMq = MediaQuery.of(context).size.width;

//     return WillPopScope(
//       onWillPop: () async {
//         SystemNavigator.pop();
//         return true;
//       },
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         // assetPath: 'assets/screens/login.png', // path to your asset image
//         // scale: 2, // scale value (optional)
//         // initBottom: 20, //  default bottom distance (optional)
//         // offset: Offset.zero, // default image offset (optional)
//         // initOpacity: 0.4, // init opacity value (optional),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         color: Colors.transparent,
//                         height: 550,
//                         width: double.infinity,
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               top: 140,
//                               left: 100,
//                               right: 100,
//                               child: FadeIn(
//                                 duration: const Duration(milliseconds: 1800),
//                                 child: Image.asset(
//                                   "assets/images/2150761206.png",
//                                   height: 280,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       FadeInUp(
//                           duration: const Duration(milliseconds: 2200),
//                           child: Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 100),
//                             child: AppButton(
//                               boxShadow: true,
//                               onTap: () {
//                                 gotoScreen(context, OnBoadingSecond());
//                               },
//                               text: "GET STARTED",
//                             ),
//                           )),
//                       height(10),
//                     ],
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
