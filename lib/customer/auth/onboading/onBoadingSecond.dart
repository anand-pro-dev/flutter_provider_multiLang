import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mshora/customer/auth/login.dart';
import 'package:mshora/utils/constants.dart';
import 'package:mshora/widgets/button.dart';
import 'package:mshora/widgets/common_widget.dart';

class OnBoadingSecond extends StatefulWidget {
  const OnBoadingSecond({super.key});

  @override
  State<OnBoadingSecond> createState() => _OnBoadingSecondState();
}

class _OnBoadingSecondState extends State<OnBoadingSecond> {
//
  PageController controller = PageController();
  int _currentPage = 0;

  int taps = 1; // Set taps to 1 to indicate one tap already done

  List<Widget> pages = [
    Pages(image: "assets/images/house with shop.png"),
    Pages(image: "assets/images/house.png"),
    Pages(image: "assets/images/man standing in front of tiny house.png"),
  ];

  List<Widget> pageTexts = [
    const PagesTextOne(),
    const PagesTextTwo(),
    const PagesTextThree()
  ];

  Future<void> nextPage() async {
    if (_currentPage < pages.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  Future<void> previousPage() async {
    if (_currentPage > 0) {
      controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              height(100),
              Container(
                height: 250,
                width: double.infinity,
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: pages,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: _currentPage == index ? 16 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.black
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              height(10),
              SizedBox(
                width: double.infinity,
                height: 160,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: pageTexts[_currentPage], // Display changing text
                ),
              ),
              height(50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: _currentPage > 1
                    ? FadeInUp(
                        duration: const Duration(milliseconds: 2200),
                        child: AppButton(
                          borderRadius: 1,
                          onTap: () {
                            gotoScreenUntil(context, LogInScreen());
                          },
                          text: "Get Started",
                        ))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textButton(context, text: "Skip", onPressed: () {
                            gotoScreenUntil(context, LogInScreen());
                          }, fontSize: 18, color: Colors.grey),
                          Spacer(),
                          if (_currentPage > 0)
                            roundedContainer(
                                color: Colors.white,
                                borderColor: Colors.black,
                                borderRadius: 100,
                                onTap: previousPage,
                                padding: const EdgeInsets.all(10),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                )),
                          width(10),
                          roundedContainerInk(
                              onTap: () {
                                nextPage();
                              },
                              borderRadius: 100,
                              color: Colors.black,
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pages extends StatelessWidget {
  final String image;
  Pages({required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          image,
          width: double.infinity,
          fit: BoxFit
              .cover, // This ensures the image fits well within its bounds
        ),
      ),
    );
  }
}

class PagesTextOne extends StatelessWidget {
  const PagesTextOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        text("Morbi pulvinar eros ac porttitor tempor.",
            textAlign: TextAlign.center,
            fontSize: 25,
            fontWeight: FontWeight.w600),
        height(15),
        Expanded(
          child: text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.",
              fontSize: 18,
              textAlign: TextAlign.center,
              color: Colors.black54,
              fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}

class PagesTextTwo extends StatelessWidget {
  const PagesTextTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        text("Integer sagittis felis a rutrum sodales.",
            textAlign: TextAlign.center,
            fontSize: 25,
            fontWeight: FontWeight.w600),
        height(15),
        Expanded(
          child: text(
              "Ut enim ad minim veniam, quis nostrud exercitation uls ea commodo consequat. ",
              fontSize: 18,
              textAlign: TextAlign.center,
              color: Colors.black54,
              fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}

class PagesTextThree extends StatelessWidget {
  const PagesTextThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        text("Vestibulum ut dolor placerat, euismod nulla a, elementum nisl.",
            textAlign: TextAlign.center,
            fontSize: 25,
            fontWeight: FontWeight.w600),
        height(15),
        Expanded(
          child: text(
              "Excepteur sint occaecat cupidatat non proident, sunt in officia deserunt ",
              fontSize: 18,
              textAlign: TextAlign.center,
              color: Colors.black54,
              fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
