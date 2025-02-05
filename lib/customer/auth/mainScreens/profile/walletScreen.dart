import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
 
import 'package:mshora/utils/constants.dart';
import 'package:mshora/widgets/button.dart';
import 'package:mshora/widgets/common_widget.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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

  List name = ["Task Add Wallet", 'Add Wallet', 'Add Wallet', 'Add Wallet'];
  List userImages = [
    "assets/images/Tether (USDT).png",
    'assets/images/Binance Coin (BNB).png',
    'assets/images/Binance Coin (BNB).png',
    'assets/images/Binance Coin (BNB).png',
  ];
  List userMessage = [
    "credit card",
    "credit card",
    "credit card",
    "credit card",
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
                backAppButton(context, title: "Wallet"),
                height(40),
                roundedContainerInk(
                  // height: newH * 0.14,
                  // width: newH * 0.14,
                  borderRadius: 100,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset("assets/images/Subtract.png"),
                      Positioned(
                        top: -35,
                        right: 0,
                        left: 0,
                        child: Column(
                          children: [
                            roundedContainer(
                              color: Colors.white,
                              borderRadius: 100,
                              padding: EdgeInsets.all(6),
                              child: Hero(
                                  tag: 'Image',
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(
                                          height: 70,
                                          width: 70,
                                          "assets/images/Rectangle 1093.png"))),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 60,
                        right: 0,
                        left: 0,
                        child: Column(
                          children: [
                            text(
                              "MY WALLET",
                              color: Colors.white70,
                            ),
                            height(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                text("\$",
                                    fontSize: 10,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w900),
                                width(2),
                                text("2000",
                                    fontSize: 35,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w900),
                              ],
                            ),
                            height(5),
                            roundedContainerInk(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                borderRadius: 0,
                                onTap: () {},
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    width(10),
                                    Icon(
                                      Icons.add,
                                      size: 15,
                                    ),
                                    width(5),
                                    text("Add Balance",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17),
                                    width(10),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                height(25),
                text("Last Transactions",
                    fontWeight: FontWeight.w700, fontSize: 17),
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
                                color: Colors.grey.shade200,
                                padding: EdgeInsets.all(8),
                                child: Image.asset(
                                  userImages[index],
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                              width(10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(name[index],
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                    text(userMessage[index],
                                        color: Colors.grey),
                                  ],
                                ),
                              ),
                              text("\$46.625,32",
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w600)
                            ],
                          ),
                        ),
                        height(20),
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
