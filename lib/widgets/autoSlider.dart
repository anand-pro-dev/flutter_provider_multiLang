import 'dart:async';
import 'package:flutter/material.dart';

class AutoSlideCarousel extends StatefulWidget {
  @override
  _AutoSlideCarouselState createState() => _AutoSlideCarouselState();
}

class _AutoSlideCarouselState extends State<AutoSlideCarousel> {
  late PageController _controller;
  int _currentPage = 0;
  late Timer _timer;

  final List<String> banarImage = [
    'assets/images/Frame 34315.png',
    'assets/images/Frame 34315.png',
    'assets/images/Frame 34315.png',
    'assets/images/Frame 34315.png',
    'assets/images/Frame 34315.png',
  ];

  CarouselController _controllerC = CarouselController(initialItem: 0);

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    // _controllerC = CarouselController(initialItem: 0);

    // Auto slide every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < banarImage.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0; // Loop back to the first image
      }
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      // _controllerC.animateTo(
      //   _currentPage.toDouble(),
      //   duration: const Duration(milliseconds: 500),
      //   curve: Curves.easeInOut,
      // );
    });
  }

  @override
  void dispose() {
    // _controllerC.dispose();
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _controller,
            //       itemExtent: MediaQuery.sizeOf(context).width - 2,
            itemCount: banarImage.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white,
                child: Image.asset(
                  banarImage[index],
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),
        // const SizedBox(height: 10),
        // SizedBox(
        //   height: 200,
        //   child: CarouselView(
        //       backgroundColor: Colors.white,
        //       controller: _controllerC,
        //       elevation: 0,
        //       itemExtent: MediaQuery.sizeOf(context).width - 10,
        //       itemSnapping: true,
        //       overlayColor: null,
        //       children: List.generate(5, (int index) {
        //         return Container(
        //           color: Colors.white,
        //           child: Image.asset(
        //             banarImage[index],
        //             fit: BoxFit.contain,
        //           ),
        //         );
        //       })),
        // ),
        const SizedBox(height: 10),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(banarImage.length, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == index ? 10 : 6,
          height: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.brown : Colors.grey[400],
          ),
        );
      }),
    );
  }
}


   // SizedBox(
              //   height: 200,
              //   child: CarouselView(
              //       backgroundColor: Colors.white,
              //       controller: controller,
              //       elevation: 0,
              //       itemExtent: MediaQuery.sizeOf(context).width - 2,
              //       itemSnapping: true,
              //       overlayColor: null,
              //       children: List.generate(5, (int index) {
              //         return Container(
              //           color: Colors.white,
              //           child: Image.asset(
              //             banarImage[index],
              //             fit: BoxFit.contain,
              //           ),
              //         );
              //       })),
              // ),

              // SizedBox(
              //   height: 200,
              //   child: CarouselView(
              //     controller: controller,
              //       itemExtent: MediaQuery.sizeOf(context).width - 32,
              //       itemSnapping: true,
              //       children: List.generate(5, (int index) {
              //         return Container(

              //           color: Colors.grey,
              //           child: Image.network(
              //             'https://picsum.photos/400?random=$index',
              //             fit: BoxFit.cover,
              //           ),
              //         );
              //       })),
              // ),