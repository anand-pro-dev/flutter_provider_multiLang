import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mshora/widgets/common_widget.dart';

class PageOneScrollHide extends StatefulWidget {
  final VoidCallback hideNavigation;
  final VoidCallback showNavigation;

  const PageOneScrollHide({
    Key? key,
    required this.hideNavigation,
    required this.showNavigation,
  }) : super(key: key);

  @override
  _PageOneScrollHideState createState() => _PageOneScrollHideState();
}

class _PageOneScrollHideState extends State<PageOneScrollHide> {
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController, // Attach the controller here
          child: Column(
            children: [
              // First rounded container
              roundedContainer(
                height: 500,
                width: 200,
                color: Colors.red,
                child: text("Hello "),
              ),

              // Second rounded container
              roundedContainer(
                height: 500,
                width: 200,
                color: Colors.blue,
                child: text("Hello "),
              ),

              // Horizontal ListView inside SizedBox (scroll direction horizontal)
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100, // Give width to the items to align properly
                      margin: EdgeInsets.all(8),
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text('Item $index'),
                      ),
                    );
                  },
                ),
              ),

              // Vertical ListView inside Column
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // Prevent internal scrolling
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
