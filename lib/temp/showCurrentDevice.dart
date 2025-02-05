import 'package:flutter/material.dart';
import 'dart:io' show Platform; // For detecting Android and iOS
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:mshora/widgets/common_widget.dart';
import 'package:provider/provider.dart';

// For detecting Web

class ShowCurrentDevice extends StatelessWidget {
  // Function to detect platform
  String detectPlatform() {
    if (kIsWeb) {
      return "Web";
    } else if (Platform.isAndroid) {
      return "Android";
    } else if (Platform.isIOS) {
      return "iOS";
    } else {
      return "Unknown Platform";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          Text('dfdf', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          text("hello", fontSize: 26, color: Colors.deepPurple),
          SizedBox(height: 20),
          Text('dfd', style: TextStyle(fontSize: 24)),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              // Toggle language between English and Somali
            },
            child: Text('sdsd'),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                String platform = detectPlatform();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('This device is running on: $platform'),
                    );
                  },
                );
              },
              child: Text('Show Platform'),
            ),
          ),
        ],
      ),
    );
  }
}
