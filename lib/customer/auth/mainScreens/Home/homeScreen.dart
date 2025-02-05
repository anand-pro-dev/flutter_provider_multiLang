import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mshora/customer/auth/mainScreens/Home/detailsScreen.dart';
import 'package:mshora/customer/other/notitficationScreen.dart';

import 'package:mshora/utils/constants.dart';
import 'package:mshora/widgets/autoSlider.dart';
import 'package:mshora/widgets/button.dart';
import 'package:mshora/widgets/common_widget.dart';
import 'package:mshora/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../other/components.dart';
import '../../../other/searchBar.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback hideNavigation;
  final VoidCallback showNavigation;
  const HomeScreen(
      {super.key, required this.hideNavigation, required this.showNavigation});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List emtList = ['All', 'Houses', 'Apartment', 'Flat'];
  int selectedIndex = 0; // Store the selected index

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      widget.hideNavigation();
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      widget.showNavigation();
    }
  }

  // List banarImage = [
  //   'assets/images/Frame 34315.png',
  //   'assets/images/Frame 34315.png',
  //   'assets/images/Frame 34315.png',
  //   'assets/images/Frame 34315.png',
  //   'assets/images/Frame 34315.png',
  // ];

  @override
  Widget build(BuildContext context) {
    final heightH = MediaQuery.of(context).size.height;
    final widthW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController, // Attach the controller here
          child: Column(
            children: [
              height(15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    // Image.asset(
                    //   "assets/images/Vector.png",
                    //   height: 20,
                    //   width: 20,
                    // ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        gotoScreen(context, NotificationScreen());
                      },
                      child: Image.asset(
                        "assets/images/noto.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
              height(10),
              Row(
                children: [
                  width(15),
                  text("Hello Ashfak 👋"),
                ],
              ),
              height(10),
              searchBar(onTap: () {}),
              height(15),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: listViewBuilder(
                  scrollDirection: Axis.horizontal,
                  itemCount: emtList.length,
                  itemBuilder: (context, index) {
                    return topLocatonCard(
                        onTap: () {}, index: index, emtList: emtList);
                  },
                ),
              ),

              AutoSlideCarousel(),

              // SizedBox(
              //   height: 40,
              //   width: double.infinity,
              //   child: listViewBuilder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: emtList.length,
              //     itemBuilder: (context, index) {
              //       return roundedContainerInk(
              //         onTap: () {
              //           setState(() {
              //             selectedIndex = index; // Update the selected index
              //           });
              //         },
              //         height: 40,
              //         borderRadius: 50,
              //         color: selectedIndex == index
              //             ? AppColors.redColor
              //             : Colors.grey.shade200,
              //         margin: EdgeInsets.only(
              //             left: 20,
              //             right: index == emtList.length - 1 ? 10 : 0),
              //         padding: const EdgeInsets.symmetric(horizontal: 20),
              //         child: Center(
              //           child: text(
              //             "${emtList[index]}", // Use index dynamically
              //             fontSize: 14,
              //             color: selectedIndex == index
              //                 ? AppColors.whiteColor
              //                 : Colors.black,
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // height(10),
              // headingHome(title: 'Top Apratment', ontap: () {}),
              // height(10),
              // SizedBox(
              //   height: 230,
              //   width: double.infinity,
              //   child: listViewBuilder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: emtList.length,
              //     itemBuilder: (context, index) {
              //       return detailsCard(
              //           onTap: () {
              //             // gotoScreen(context, DetailsScreen());
              //           },
              //           index: index,
              //           emtList: emtList);
              //     },
              //   ),
              // ),
              // height(15),
              // headingHome(title: 'Featured Resort', ontap: () {}),
              // height(10),
              // SizedBox(
              //   height: 150,
              //   width: double.infinity,
              //   child: listViewBuilder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: emtList.length,
              //     itemBuilder: (context, index) {
              //       return cardMonthBase(
              //           onTap: () {}, index: index, emtList: emtList);
              //     },
              //   ),
              // ),
              // height(20),

              // headingHome(title: 'Top Villa’s', ontap: () {}),
              // height(10),
              // SizedBox(
              //   height: 230,
              //   width: double.infinity,
              //   child: listViewBuilder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: emtList.length,
              //     itemBuilder: (context, index) {
              //       return detailsCard(
              //           onTap: () {
              //             gotoScreen(context, DetailsScreen());
              //           },
              //           index: index,
              //           emtList: emtList);
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: Image.asset("assets/images/Frame 34312.png"),
              // ),
              // height(10),
              // headingHome(title: 'Newly Farm’s', ontap: () {}),
              // height(10),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: listGrid(
              //       physics: NeverScrollableScrollPhysics(),
              //       itemCount: 10,
              //       crossAxisCount: 2,
              //       mainAxisSpacing: 15,
              //       crossAxisSpacing: 15,
              //       childAspectRatio: 0.7,
              //       itemBuilder: (int index) {
              //         return cardExplore(
              //             onTap: () {},
              //             index: index,
              //             emtList: emtList,
              //             heightH: heightH,
              //             widthW: widthW);
              //       }),
              // ),

              // height(25),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: MasonryGridView.count(
              //     physics: NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     crossAxisCount: 2,
              //     itemCount: 10,
              //     mainAxisSpacing: 15,
              //     crossAxisSpacing: 15,
              //     itemBuilder: (context, index) {
              //       return cardExplore(
              //           onTap: () {
              //             gotoScreen(context, DetailsScreen());
              //           },
              //           index: index,
              //           emtList: emtList,
              //           heightH: heightH,
              //           widthW: widthW);
              //     },
              //   ),
              // ),
              height(25),
            ],
          ),
        ),
      ),
    );
  }
}

Widget headingHome({title, ontap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      children: [
        roundedContainer(
            child: SizedBox(),
            height: 20,
            width: 4,
            color: Colors.orangeAccent),
        width(7),
        text(title, fontSize: 16, fontWeight: FontWeight.bold),
        const Spacer(),
        roundedOutlineContianerInk(
            onTap: ontap,
            borderRadius: 50,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: text("See All ", color: Colors.grey))
      ],
    ),
  );
}
