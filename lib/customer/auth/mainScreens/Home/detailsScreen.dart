// import 'dart:developer';

// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mshora/utils/constants.dart';
// import 'package:mshora/widgets/button.dart';
// import 'package:mshora/widgets/common_widget.dart';

// import '../../../other/components.dart';

// class DetailsScreen extends StatefulWidget {
//   const DetailsScreen({super.key});

//   @override
//   State<DetailsScreen> createState() => _DetailsScreenState();
// }

// class _DetailsScreenState extends State<DetailsScreen> {
//   List emtList = ['All', 'Houses', 'Apartment', 'Flat'];
//   List images = [
//     'assets/images/Image111.png',
//     'assets/images/Image.png',
//     'assets/images/Image111.png',
//     'assets/images/Image1123.png',
//     'assets/images/Imagedfdf.png',
//     'assets/images/Image111.png',
//     'assets/images/Image.png',
//     'assets/images/ab9585bc40beb92d650ba622c505db77.png',
//     'assets/images/Image1123.png',
//     'assets/images/Imagedfdf.png',
//     'assets/images/Image111.png',
//     'assets/images/ab9585bc40beb92d650ba622c505db77.png',
//   ];

// //
//   bool showAll = false;
//   var selectedImage;

//   @override
//   void initState() {
//     selectedImage = images[0];
//     super.initState();
//   }

//   List facilities = [
//     '2 Bedroom',
//     '1 bath room',
//     '24 x 7 water ',
//   ];
//   List facilitiesImage = [
//     'assets/images/mdi_bed-empty (1).png',
//     'assets/images/Union.png',
//     'assets/images/Vector (1).png',
//   ];
// //
//   @override
//   Widget build(BuildContext context) {
//     final heightH = MediaQuery.of(context).size.height;
//     final widthW = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               roundedContainer(
//                 width: double.infinity,
//                 child: Stack(
//                   children: [
//                     roundedContainer(
//                       width: double.infinity,
//                       child: ClipRRect(
//                         borderRadius: BorderRadiusDirectional.circular(10),
//                         child: Image.asset(
//                           selectedImage,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     detailsCardImage(images[0], 180, ontap: () {
//                       selectedImage = images[0];
//                       setState(() {});
//                     }),
//                     detailsCardImage(images[1], 100, ontap: () {
//                       selectedImage = images[1];
//                       setState(() {});
//                     }),
//                     detailsCardImageText(
//                       images[1],
//                       20,
//                     ),
//                     Positioned(
//                       top: 20,
//                       left: 20,
//                       child: backAppButton(context),
//                     ),
//                   ],
//                 ),
//               ),
//               height(15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                       child: text("Wings Tower ",
//                           fontSize: 24, fontWeight: FontWeight.w700)),
//                   width(20),
//                   // text("\$ 220", fontSize: 24, fontWeight: FontWeight.w600),
//                   SvgPicture.asset(
//                     "assets/images/Component 14.svg",
//                     height: 20,
//                     width: 20,
//                   ),
//                 ],
//               ),
//               height(10),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   text("Jenny Wilson",
//                       fontSize: 14,
//                       color: Colors.orangeAccent,
//                       fontWeight: FontWeight.w500),
//                   width(20),
//                   SvgPicture.asset(
//                     "assets/images/Vector (4).svg",
//                     height: 12,
//                     width: 12,
//                   ),
//                   width(5),
//                   text("4.5", fontSize: 12, color: Colors.grey),
//                   width(10),
//                   customDivider(height: 12, width: 1, color: Colors.grey),
//                   width(10),
//                   text("4779 Reviews",
//                       fontSize: 14,
//                       color: Colors.grey,
//                       fontWeight: FontWeight.w500),
//                 ],
//               ),
//               height(10),
//               Row(
//                 children: [
//                   roundedContainer(
//                       borderRadius: 80,
//                       padding:
//                           EdgeInsets.symmetric(vertical: 4, horizontal: 10),
//                       color: Colors.orangeAccent.withOpacity(0.4),
//                       child: text("Apartment",
//                           fontSize: 10, color: Colors.orange)),
//                   width(10),
//                   SvgPicture.asset(
//                     "assets/images/Location.svg",
//                     color: Colors.orangeAccent,
//                   ),
//                   width(7),
//                   Expanded(
//                     child: text("Jakarta, Indonesia",
//                         fontSize: 14, fontWeight: FontWeight.w500),
//                   ),
//                 ],
//               ),
//               height(15),
//               customDivider(color: Colors.black45),
//               SizedBox(
//                 height: 70,
//                 width: double.infinity,
//                 child: listViewBuilder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: facilities.length,
//                   itemBuilder: (context, index) {
//                     return roundedShadeContianer(
//                       borderRadius: 50,
//                       margin: EdgeInsets.all(10),
//                       padding: const EdgeInsets.symmetric(horizontal: 20),
//                       child: Row(
//                         children: [
//                           Image.asset(facilitiesImage[index],
//                               height: 20, width: 20),
//                           width(7),
//                           text(
//                             "${facilities[index]}", // Use index dynamically
//                             fontSize: 14,
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               height(15),
//               Row(
//                 children: [
//                   roundedContainer(
//                       child: SizedBox(),
//                       height: 20,
//                       width: 4,
//                       color: Colors.orangeAccent),
//                   width(7),
//                   text("Description",
//                       fontSize: 16, fontWeight: FontWeight.bold),
//                   const Spacer(),
//                 ],
//               ),
//               height(10),
//               text(
//                   maxLines: 5,
//                   "Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum."),
//               height(20),
//               Row(
//                 children: [
//                   width(5),
//                   roundedContainer(
//                       borderRadius: 100,
//                       child: SizedBox(),
//                       height: 5,
//                       width: 5,
//                       color: Colors.black),
//                   width(5),
//                   text(" Ac service with Equipment Changes."),
//                 ],
//               ),
//               height(5),
//               Row(
//                 children: [
//                   width(5),
//                   roundedContainer(
//                       borderRadius: 100,
//                       child: SizedBox(),
//                       height: 5,
//                       width: 5,
//                       color: Colors.black),
//                   width(5),
//                   text(" Fixing Problem With Modern Equipment."),
//                 ],
//               ),
//               Row(
//                 children: [
//                   width(5),
//                   roundedContainer(
//                       borderRadius: 100,
//                       child: SizedBox(),
//                       height: 5,
//                       width: 5,
//                       color: Colors.black),
//                   width(5),
//                   text(" Extra Equipments Will be charged."),
//                 ],
//               ),
//               height(20),
//               text(
//                   maxLines: 2,
//                   "Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt"),
//               height(5),
//               height(20),
//               roundedContainer(
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset("assets/images/Layout.png")),
//               ),
//               height(40),
//               Row(
//                 children: [
//                   text("Photos & Videos",
//                       fontSize: 17, fontWeight: FontWeight.w600),
//                   const Spacer(),
//                   roundedOutlineContianerInk(
//                       onTap: () {},
//                       borderRadius: 50,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                       child: Row(
//                         children: [
//                           text("See All ", color: Colors.grey),
//                           Icon(
//                             Icons.arrow_forward_ios,
//                             size: 12,
//                             color: Colors.grey,
//                           )
//                         ],
//                       ))
//                 ],
//               ),
//               height(20),
//               MasonryGridView.count(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 crossAxisCount: 2,
//                 itemCount: images.length,
//                 mainAxisSpacing: 15,
//                 crossAxisSpacing: 15,
//                 itemBuilder: (context, index) {
//                   return ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.asset(images[index]));
//                 },
//               ),
//               height(25),
//               text("Reviews", fontSize: 20, fontWeight: FontWeight.w800),
//               height(12),
//               // Container(
//               //   height: heightH * 0.21,
//               //   width: double.infinity,
//               //   child: listViewBuilder(
//               //     scrollPhysics: BouncingScrollPhysics(),
//               //     scrollDirection: Axis.horizontal,
//               //     itemCount: emtList.length,
//               //     itemBuilder: (context, index) {
//               //       return cardExploreDetails(
//               //           onTap: () {},
//               //           index: index,
//               //           emtList: emtList,
//               //           heightH: heightH,
//               //           widthW: widthW);
//               //     },
//               //   ),
//               // ),
//               height(10),
//               roundedShadeContianer(
//                   borderRadius: 20,
//                   color: Color.fromARGB(255, 248, 144, 88),
//                   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//                   child: Row(
//                     children: [
//                       width(10),
//                       Image.asset(
//                         "assets/images/starIconDetails.png",
//                         height: 50,
//                         width: 50,
//                       ),
//                       width(5),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Image.asset(
//                                   "assets/images/starlight.png",
//                                   height: 14,
//                                   width: 14,
//                                 ),
//                                 width(5),
//                                 Image.asset(
//                                   "assets/images/starlight.png",
//                                   height: 14,
//                                   width: 14,
//                                 ),
//                                 width(5),
//                                 Image.asset(
//                                   "assets/images/starlight.png",
//                                   height: 14,
//                                   width: 14,
//                                 ),
//                                 width(5),
//                                 Image.asset(
//                                   "assets/images/starlight.png",
//                                   height: 14,
//                                   width: 14,
//                                 ),
//                                 width(5),
//                                 Image.asset(
//                                   "assets/images/starlight.png",
//                                   height: 14,
//                                   width: 14,
//                                 ),
//                                 width(5),
//                                 text("5",
//                                     fontSize: 20,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 text("FromFrom",
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400),
//                                 text("112",
//                                     fontSize: 16,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w700),
//                                 text("reviewers",
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       width(10),
//                     ],
//                   )),
//               height(10),
//               Row(children: [
//                 Expanded(
//                   child: AppButton(
//                     color: Colors.grey.shade300,
//                     textColor: Colors.black,
//                     text: 'Message',
//                     onTap: () async {
//                       FocusScope.of(context).unfocus();
//                       // if (_formKey.currentState!.validate()) {
//                       //   _formKey.currentState!.save();
//                       // }
//                     },
//                   ),
//                 ),
//                 width(10),
//                 Expanded(
//                   child: AppButton(
//                     color: Colors.black,
//                     text: '\$ 45.00 ',
//                     textColor: Colors.white,
//                     onTap: () async {
//                       FocusScope.of(context).unfocus();
//                       // if (_formKey.currentState!.validate()) {
//                       //   _formKey.currentState!.save();
//                       // }
//                     },
//                   ),
//                 ),
//               ]),
//               height(20),
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
