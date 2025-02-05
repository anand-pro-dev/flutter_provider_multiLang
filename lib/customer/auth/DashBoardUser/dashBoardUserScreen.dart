import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mshora/customer/auth/DashBoardUser/textScreen.dart';
import 'package:mshora/customer/auth/mainScreens/Home/homeScreen.dart';
import 'package:mshora/customer/auth/mainScreens/category/categorySelectScreen.dart';

import 'package:mshora/customer/auth/mainScreens/profile/profileScreen.dart';

import 'package:mshora/customer/auth/mainScreens/wishlist/wishListScreen.dart';
import 'package:mshora/provider/BottomNavVisibilityProvider.dart';
import 'package:mshora/temp/test/scroll_to_hide_bottom/page_one_hide.dart';
import 'package:mshora/widgets/common_widget.dart';
import 'package:provider/provider.dart';

class DashBoardUserScreen extends StatefulWidget {
  const DashBoardUserScreen({super.key});

  @override
  State<DashBoardUserScreen> createState() => _DashBoardUserScreenState();
}

class _DashBoardUserScreenState extends State<DashBoardUserScreen>
    with AutomaticKeepAliveClientMixin {
  int _selectedIndex = 0; // Track the selected bottom navigation bar item
  late PageController _pageController;

  List<Widget> get _widgetOptions => [
        HomeScreen(
          hideNavigation: () {
            context.read<BottomNavVisibilityProvider>().hideNav();
          },
          showNavigation: () {
            context.read<BottomNavVisibilityProvider>().showNav();
          },
        ),
        HomeScreen(
          hideNavigation: () {
            context.read<BottomNavVisibilityProvider>().hideNav();
          },
          showNavigation: () {
            context.read<BottomNavVisibilityProvider>().showNav();
          },
        ),

        CategoryOptionsScreen(),

        WishListScreen(
          hideNavigation: () {
            context.read<BottomNavVisibilityProvider>().hideNav();
          },
          showNavigation: () {
            context.read<BottomNavVisibilityProvider>().showNav();
          },
        ),
        // ExploreScreen(
        //   hideNavigation: () {
        //     context.read<BottomNavVisibilityProvider>().hideNav();
        //   },
        //   showNavigation: () {
        //     context.read<BottomNavVisibilityProvider>().showNav();
        //   },
        // ),

        const ProfileScreen(),
      ];

  @override
  bool get wantKeepAlive => true; // Ensure the state is kept alive

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Call super.build to maintain state
    bool isVisible = context.watch<BottomNavVisibilityProvider>().isVisible;

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController, // Pass the PageController
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _widgetOptions.length,
            itemBuilder: (context, index) {
              return Center(child: _widgetOptions[index]);
            },
          ),
          AnimatedPositioned(
            bottom: isVisible
                ? 20
                : -40, // Adjusts the position based on visibility
            right: 0,
            left: 0,
            duration: const Duration(milliseconds: 800),
            curve: Curves.fastLinearToSlowEaseIn,
            child: AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              height: 70,
              duration: const Duration(milliseconds: 800),
              child: roundedContainer(
                alignment: Alignment.center,
                borderRadius: 0,
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: isVisible ? 1 : 0,
                      duration: const Duration(milliseconds: 700),
                      child: Column(
                        children: [
                          Image.asset("assets/images/oie_SNJJ4XpgM7SO.png"),
                          Container(
                            color: Colors.black,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    bottamIndexIcons(
                                        active: "assets/images/search.svg",
                                        onTap: () {
                                          _onItemTapped(0);
                                        },
                                        currentIndex: _selectedIndex,
                                        selectedIndex: 0),
                                    bottamIndexIcons(
                                        active: "assets/images/messagge.svg",
                                        onTap: () {
                                          _onItemTapped(1);
                                        },
                                        currentIndex: _selectedIndex,
                                        selectedIndex: 1),
                                    bottamIndexIcons(
                                        active: "assets/images/Location.svg",
                                        onTap: () {
                                          _onItemTapped(2);
                                        },
                                        currentIndex: _selectedIndex,
                                        selectedIndex: 2),
                                    bottamIndexIcons(
                                        active: "assets/images/favroute.svg",
                                        onTap: () {
                                          _onItemTapped(3);
                                        },
                                        currentIndex: _selectedIndex,
                                        selectedIndex: 3),
                                    bottamIndexIcons(
                                        active:
                                            "assets/images/profile_view.svg",
                                        onTap: () {
                                          _onItemTapped(4);
                                        },
                                        currentIndex: _selectedIndex,
                                        selectedIndex: 4),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget bottamIndexIcons(
    {required int selectedIndex,
    required int currentIndex,
    required String active,
    required VoidCallback onTap,
    deActive}) {
  return roundedContainer(
    // margin: const EdgeInsets.only(right: 15),
    onTap: onTap,
    // onTap: () {
    //   _onItemTapped(3);
    // },

    borderRadius: 100,

    child: Column(
      children: [
        height(17),
        roundedContainer(
          borderRadius: 100,
          color: selectedIndex == 2 ? Colors.orange : Colors.black,
          padding: EdgeInsets.all(10),
          child: SvgPicture.asset(
            active,
            color: selectedIndex == currentIndex
                ? selectedIndex == 2
                    ? Colors.black
                    : Colors.orange
                : Colors.white,
            height: 22,
            width: 22,
          ),
        ),
        height(18),
        SizedBox(child: selectedIndex == currentIndex ? bottmLight() : null),
        // roundedContainer(
        //     child: SizedBox(),
        //     height: 10,
        //     width: double.infinity,
        //     color: Colors.black)
      ],
    ),
  );
}

Widget bottmLight() {
  return Container(
    height: 4,
    width: 25,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.orange,
        boxShadow: const [
          BoxShadow(
              color: Colors.orange,
              blurRadius: 9.0,
              spreadRadius: 1,
              offset: Offset(-0, -5)),
        ]),
  );
}
