import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mshora/functions/splash_services.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  // For image opacity and scaling
  late Animation<double> _animationOpacity;
  late Animation<double> _animationScale;

  SplashServices services = SplashServices();

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Define the rotation animation
    _rotationAnimation = Tween<double>(begin: 0, end: pi / 4).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Define the scale animation
    _scaleAnimation = Tween<double>(begin: 1, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _animationOpacity =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _animationScale = Tween<double>(begin: 0.0, end: 0.6).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _controller.forward();

    // Optionally navigate to another screen after the animation
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        services.isLogin(context);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Rotating and scaling black container
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
            // Static center image with opacity and scale animation
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _animationOpacity.value,
                  child: Transform.scale(
                    scale: _animationScale.value,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(
                          "assets/images/B34873D5-A882-4A91-9C51-C83E72A0576A 3.png"),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
