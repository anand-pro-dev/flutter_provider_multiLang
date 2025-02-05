import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

class ProgressionIndicator extends StatefulWidget {
  const ProgressionIndicator({Key? key}) : super(key: key);
  @override
  _ProgressionIndicatorState createState() => _ProgressionIndicatorState();
}

class _ProgressionIndicatorState extends State<ProgressionIndicator> {
  double value = 1 / 3; // Default value set to 1/3 (one tap done)
  int taps = 1; // Set taps to 1 to indicate one tap already done

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Flutter Devs"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Indeterminate Indicator',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: LinearProgressIndicator(
              backgroundColor: Colors.orangeAccent,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              minHeight: 25,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Determinate Indicator",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: LinearProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
              color: Colors.red,
              minHeight: 15,
              value: value, // Progress bar starts at one-third completed
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
              child: Text("Start"),
              // style: ElevatedButton.styleFrom(
              //     onPrimary: Colors.white, primary: Colors.blueGrey),
              onPressed: () {
                log(value.toString());
                if (taps < 3) {
                  // Ensure no more than 3 taps are allowed
                  taps++;
                  determinateIndicator();
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
              child: Text("Reverse"),
              style: ElevatedButton.styleFrom(
                  // onPrimary: Colors.white,
                  // primary: Colors.blueGrey,
                  ),
              onPressed: () {
                log(value.toString());
                reverseIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }

  void determinateIndicator() {
    // Increment progress in 1/3 steps
    setState(() {
      value += 1 / 3;
      if (value >= 1) {
        value = 1; // Ensure progress doesn't go beyond full
      }
    });
  }

  void reverseIndicator() {
    // Decrement progress in 1/3 steps
    if (taps > 1) {
      setState(() {
        value -= 1 / 3;
        if (value <= 0) {
          value = 0; // Ensure progress doesn't go below zero
        }

        if (taps > 0) {
          taps--; // Decrement taps when reversing
        }
      });
    }
  }
}
