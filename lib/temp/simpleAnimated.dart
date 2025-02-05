import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:ui';

import 'package:mshora/widgets/common_widget.dart';

class AnimationBackGroundScreen extends StatefulWidget {
  const AnimationBackGroundScreen({Key? key}) : super(key: key);

  @override
  _AnimationBackGroundScreenState createState() =>
      _AnimationBackGroundScreenState();
}

class _AnimationBackGroundScreenState extends State<AnimationBackGroundScreen>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;
  @override
  void initState() {
    super.initState();

    /// to control with Animation  ///
    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .20).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .20).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .20, end: .45).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(const Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }
  //

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                // First floating circle
                Positioned(
                  top: size.height * (animation2.value + .58),
                  left: size.width * .9,
                  child: CustomPaint(
                    painter:
                        MyPainter(50, [Color(0xffFFE3C9), Color(0xffFFE3C9)]),
                  ),
                ),
                // Second floating circle
                Positioned(
                  top: size.height * .98,
                  left: size.width * .1,
                  child: CustomPaint(
                    painter: MyPainter(animation4.value - 30,
                        [Color(0xffFFE3C9), Color(0xffFFE3C9)]),
                  ),
                ),
                // Third floating circle
                Positioned(
                  top: size.height * .5,
                  left: size.width * (animation2.value + .8),
                  child: CustomPaint(
                    painter:
                        MyPainter(30, [Color(0xffFFE3C9), Color(0xffFFE3C9)]),
                  ),
                ),
                // Fourth floating circle
                Positioned(
                  top: size.height * animation3.value,
                  left: size.width * (animation1.value + .1),
                  child: CustomPaint(
                    painter:
                        MyPainter(60, [Color(0xffFFE3C9), Color(0xffFFE3C9)]),
                  ),
                ),
                // Fifth floating circle
                Positioned(
                  top: size.height * .1,
                  left: size.width * .8,
                  child: CustomPaint(
                    painter: MyPainter(animation4.value,
                        [Color(0xffFFE3C9), Color(0xffFFE3C9)]),
                  ),
                ),
                // Optional blur effect on top of the animations
                Positioned.fill(
                    child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  // filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  child: Column(
                    children: [
                      text("Hello", color: Colors.white),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Control circular shapes with this painter
class MyPainter extends CustomPainter {
  final double radius;
  final List<Color>? colors;

  MyPainter(this.radius, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
              colors:
                  colors ?? [Color.fromARGB(255, 197, 197, 255), Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: const Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// Scroll behavior to prevent overscroll glow effect
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
