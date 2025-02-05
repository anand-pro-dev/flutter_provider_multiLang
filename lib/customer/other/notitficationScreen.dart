import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
 
import 'package:mshora/utils/constants.dart';
import 'package:mshora/widgets/button.dart';
import 'package:mshora/widgets/common_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List name = [
    "New Service Added.",
    'New Booking Received you! ',
    'Please Rate US!',
    'Your enquiry was sent'
  ];
  List userImages = [
    "assets/images/Ellipse 356.png",
    'assets/images/Rectangle 1094.png',
    "assets/images/Ellipse 356.png",
    "assets/images/Ellipse 356.png",
  ];
  List userMessage = [
    "New Service Added.",
    "You've got a new message waiting for you!",
    "Attention homebuyers! We're excited to offer an exclusive discount sale on select properties.",
    "You've got a new message waiting for you!",
  ];

  @override
  Widget build(BuildContext context) {
    final newH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightMq(context, 0.02),
                backAppButton(context, title: "Notifications"),
                height(20),
                listViewBuilder(
                  itemCount: name.length,
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        roundedContainerInk(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          color: Colors.white,
                          onTap: () {},
                          child: Row(
                            children: [
                              roundedContainer(
                                borderRadius: 100,
                                child: Image.asset(
                                  userImages[index],
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              width(10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(name[index],
                                        fontSize: 16,
                                        maxLines: 1,
                                        fontWeight: FontWeight.w600),
                                    text(userMessage[index],
                                        maxLines: 1, color: Colors.grey),
                                  ],
                                ),
                              ),
                              width(5),
                              text("7 days ago", color: Colors.orange)
                            ],
                          ),
                        ),
                        height(10),
                        customDivider(color: Colors.grey.shade400),
                        height(10),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
