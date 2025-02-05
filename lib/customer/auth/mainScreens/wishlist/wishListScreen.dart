import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mshora/customer/auth/mainScreens/Home/detailsScreen.dart';

import 'package:mshora/utils/constants.dart';
import 'package:mshora/widgets/button.dart';
import 'package:mshora/widgets/common_widget.dart';
import 'package:mshora/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../other/components.dart';
import '../../../other/searchBar.dart';

class WishListScreen extends StatefulWidget {
  final VoidCallback hideNavigation;
  final VoidCallback showNavigation;
  const WishListScreen(
      {super.key, required this.hideNavigation, required this.showNavigation});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
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

  @override
  Widget build(BuildContext context) {
    final heightH = MediaQuery.of(context).size.height;
    final widthW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white60,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController, // Attach the controller here
          child: Column(
            children: [
              height(30),
              // searchBar(onTap: () {}),
              // height(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    text("Wishlists",
                        fontSize: 16, fontWeight: FontWeight.bold),
                    const Spacer(),
                    // textButton(context, text: "view all", onPressed: () {})
                  ],
                ),
              ),

              height(10),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MasonryGridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  itemCount: 10,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  itemBuilder: (context, index) {
                    return cardExplore(
                        onTap: () {
                          // gotoScreen(context, DetailsScreen());
                        },
                        index: index,
                        emtList: emtList,
                        heightH: heightH,
                        widthW: widthW);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
