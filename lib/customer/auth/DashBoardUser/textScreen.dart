import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BottomCurvedContainer());
  }
}

class BottomCurvedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200, // Adjust the height of the container
      child: CustomPaint(
        painter: BottomCurvePainter(),
      ),
    );
  }
}

class BottomCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black // Set the background color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Start from the top-left corner
    path.moveTo(0, 0);

    // Draw a straight line to the top-right corner
    path.lineTo(size.width, 0);

    // Draw a straight line down to the bottom-right corner
    path.lineTo(size.width, size.height * 0.8);

    // Add a curved path at the bottom
    path.quadraticBezierTo(
      size.width / 2, // Control point at the center of the width
      size.height, // Control point height
      0, // End point (bottom-left corner)
      size.height * 0.8,
    );

    // Close the path
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
