import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mshora/utils/constants.dart';

import '../../widgets/common_widget.dart';
import '../../widgets/text_field.dart';

Widget detailsCard({required VoidCallback onTap, index, emtList}) {
  return roundedShadeContianer(
    onTap: onTap,
    borderRadius: 10,
    width: 160,
    color: Colors.white,
    margin: EdgeInsets.only(
        left: 20,
        right: index == emtList.length - 1 ? 10 : 0,
        top: 5,
        bottom: 5),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        roundedContainer(
          child: Image.asset(
            "assets/images/Image.png",
            fit: BoxFit.cover,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: text(
                "Apartment ",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                maxLines: 2,
              ),
            ),
            text(
              "\$2000",
              fontSize: 14,
              textAlign: TextAlign.end,
            ),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(
              "assets/images/Group 1000005846.svg",
            ),
            width(2),
            text("2000", fontSize: 11),
            width(2),
            text("sqft", fontSize: 11),
            Spacer(),
            SvgPicture.asset(
              "assets/images/Group 497.svg",
              color: Colors.orangeAccent,
            ),
            width(2),
            text("4", fontSize: 11),
            Spacer(),
            SvgPicture.asset(
              "assets/images/Group 525.svg",
              color: Colors.orangeAccent,
            ),
            width(2),
            text("1", fontSize: 11),
          ],
        )
      ],
    ),
  );
}

Widget cardMonthBase({required VoidCallback onTap, index, emtList}) {
  return roundedShadeContianer(
    onTap: onTap,
    borderRadius: 10,
    height: 150,
    width: 250,
    color: Colors.white,
    margin: EdgeInsets.only(
        left: 20,
        right: index == emtList.length - 1 ? 10 : 0,
        top: 5,
        bottom: 5),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      children: [
        Stack(
          children: [
            roundedContainer(
                height: 120,
                width: 120,
                child: Image.asset(
                  "assets/images/Image111.png",
                  fit: BoxFit.cover,
                )),
            Positioned(
              bottom: 5,
              right: 40,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  roundedContainer(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      color: Colors.red,
                      child: text("Resort",
                          fontSize: 9, color: AppColors.whiteColor)),
                ],
              ),
            )
          ],
        ),
        width(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  "assets/images/Vector (4).svg",
                  height: 10,
                  width: 10,
                ),
                width(5),
                text("4.5", fontSize: 12),
              ],
            ),
            SizedBox(
              width: 100,
              child: text(
                  maxLines: 2,
                  "Dandelions Apartment sky",
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            height(5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/Location.png",
                  height: 15,
                  width: 15,
                ),
                width(5),
                SizedBox(
                  width: 80,
                  child: text("Jakarta, Indonesia Indonesia", fontSize: 12),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: 100,
              child: text(
                  maxLines: 2,
                  "\$ 2000",
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    ),
  );
}

Widget exploreCard({required VoidCallback onTap, index, emtList}) {
  return roundedShadeContianer(
    onTap: onTap,
    borderRadius: 10,
    height: 150,
    width: 250,
    color: Colors.white,
    margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      children: [
        Stack(
          children: [
            roundedContainer(
                height: 120,
                width: 120,
                child: Image.asset(
                  "assets/images/Image111.png",
                  fit: BoxFit.cover,
                )),
            Positioned(
              bottom: 5,
              left: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  roundedContainer(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      color: Colors.red,
                      child: text("Resort",
                          fontSize: 9, color: AppColors.whiteColor)),
                ],
              ),
            )
          ],
        ),
        width(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/Vector (4).svg",
                  height: 12,
                  width: 12,
                ),
                width(5),
                text("4.5", fontSize: 12, color: Colors.grey),
                width(10),
                customDivider(height: 12, width: 1, color: Colors.grey),
                width(10),
                text("4779 Reviews", fontSize: 12, color: Colors.grey),
              ],
            ),
            height(10),
            SizedBox(
              width: 150,
              child: text(
                  maxLines: 2,
                  "Dandelions Apartment sky",
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            height(7),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/Location.png",
                  height: 15,
                  width: 15,
                ),
                width(5),
                SizedBox(
                  width: 150,
                  child: text("Jakarta, Indonesia Indonesia", fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(
              "assets/images/Component 14.svg",
              height: 20,
              width: 20,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget hiStoryCard({required VoidCallback onTap, index, emtList}) {
  return roundedShadeContianer(
    onTap: onTap,
    borderRadius: 10,
    height: 150,
    width: 250,
    color: Colors.white,
    margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      children: [
        Stack(
          children: [
            roundedContainer(
                height: 120,
                width: 120,
                child: Image.asset(
                  "assets/images/Image111.png",
                  fit: BoxFit.cover,
                )),
            Positioned(
              bottom: 5,
              left: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  roundedContainer(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      color: Colors.red,
                      child: text("Resort",
                          fontSize: 9, color: AppColors.whiteColor)),
                ],
              ),
            )
          ],
        ),
        width(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/Vector (4).svg",
                  height: 12,
                  width: 12,
                ),
                width(5),
                text("4.5", fontSize: 12, color: Colors.grey),
                width(10),
                customDivider(height: 12, width: 1, color: Colors.grey),
                width(10),
                text("4779 Reviews", fontSize: 12, color: Colors.grey),
              ],
            ),
            height(10),
            SizedBox(
              width: 150,
              child: text(
                  maxLines: 2,
                  "Dandelions Apartment sky",
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            height(7),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/Location.png",
                  height: 15,
                  width: 15,
                ),
                width(5),
                SizedBox(
                  width: 150,
                  child: text("Jakarta, Indonesia Indonesia", fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: [
        //     SvgPicture.asset(
        //       "assets/images/Component 14.svg",
        //       height: 20,
        //       width: 20,
        //     ),
        //   ],
        // ),
      ],
    ),
  );
}

Widget cardExplore(
    {required VoidCallback onTap,
    index,
    emtList,
    required double heightH,
    required widthW}) {
  return roundedShadeContianer(
    onTap: onTap,
    borderRadius: 10,
    color: Colors.white,
    // margin:
    //     EdgeInsets.only(left: 20, right: index == emtList.length - 1 ? 10 : 0),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            roundedShadeContianer(
                borderRadius: 15,
                height: heightH * 0.15,
                width: widthW * 0.37,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/Imagedfdf.png",
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                          top: 10,
                          right: 10,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 18,
                          ))
                    ],
                  ),
                )),
            Positioned(
              bottom: 5,
              right: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  roundedContainer(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      color: AppColors.redColor.withOpacity(0.4),
                      child: text("\$ 2000",
                          fontSize: 9, color: AppColors.whiteColor)),
                ],
              ),
            ),
          ],
        ),
        height(7),
        text("Wings Tower  ", fontSize: 13, fontWeight: FontWeight.bold),
        // if (index == 0)
        //   text(
        //       text: "Wings Tower  ", fontSize: 13, fontWeight: FontWeight.bold),
        height(5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/Vector (4).svg",
                  height: 10,
                  width: 10,
                ),
                width(5),
                text("4.5", fontSize: 12),
                width(7),
                Image.asset(
                  "assets/images/Location.png",
                  height: 15,
                  width: 15,
                ),
              ],
            ),
            Expanded(child: text("Jakarta, Indonesia Indonesia", fontSize: 12)),
          ],
        ),
      ],
    ),
  );
}

Widget cardExploreDetails(
    {required VoidCallback onTap, index, emtList, heightH, widthW}) {
  return Container(
    margin:
        EdgeInsets.only(left: 4, right: index >= 0 ? 10 : 0, top: 4, bottom: 4),
    child: roundedShadeContianer(
      height: heightH * 0.24,
      width: widthW * 0.4,
      onTap: onTap,
      borderRadius: 10,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              roundedContainer(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/Image.png",
                  height: 100,
                  width: 140,
                  fit: BoxFit.cover,
                ),
              )),
              Positioned(
                bottom: 5,
                right: 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    roundedContainer(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        color: AppColors.redColor.withOpacity(0.4),
                        child: text("\$ 2000",
                            fontSize: 9, color: AppColors.whiteColor)),
                  ],
                ),
              ),
            ],
          ),
          height(7),
          text("Wings Tower  ", fontSize: 13, fontWeight: FontWeight.bold),
          // if (index == 0)
          //   text(
          //       text: "Wings Tower  ", fontSize: 13, fontWeight: FontWeight.bold),
          height(5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/Vector (4).svg",
                    height: 10,
                    width: 10,
                  ),
                  width(5),
                  text("4.5", fontSize: 12),
                  width(7),
                  Image.asset(
                    "assets/images/Location.png",
                    height: 15,
                    width: 15,
                  ),
                ],
              ),
              Expanded(
                  child: text("Jakarta, Indonesia Indonesia ",
                      fontSize: 12, maxLines: 1)),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget topLocatonCard({required VoidCallback onTap, index, emtList}) {
  return Container(
    margin:
        EdgeInsets.only(left: 15, right: index == emtList.length - 1 ? 5 : 0),
    child: roundedOutlineContianer(
      onTap: onTap,
      borderRadius: 100,
      height: 55,
      color: Colors.white,
      child: Row(
        children: [
          width(5),
          roundedContainer(
              borderRadius: 100,
              height: 45,
              width: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/images/Image.png",
                  fit: BoxFit.cover,
                ),
              )),
          width(10),
          text("${emtList[index]}", fontSize: 12),
          width(10),
        ],
      ),
    ),
  );
}

Widget detailsCardImage(
  imageIndex,
  double bottomHeight, {
  int? value,
  VoidCallback? ontap,
}) {
  return Positioned(
    right: 10,
    bottom: bottomHeight,
    child: roundedContainer(
      onTap: ontap,
      borderRadius: 15,
      color: Colors.white,
      padding: EdgeInsets.all(5),
      child: roundedContainer(
        height: 55,
        width: 55,
        borderRadius: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imageIndex,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}

Widget detailsCardImageText(imageIndex, double bottomHeight, {int? value}) {
  return Positioned(
    right: 10,
    bottom: bottomHeight,
    child: roundedContainer(
      borderRadius: 15,
      color: Colors.white,
      padding: EdgeInsets.all(5),
      child: roundedContainer(
        height: 55,
        width: 55,
        borderRadius: 10,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imageIndex,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text(
                      "+ 3",
                      color: Colors.white,
                    ),
                  ],
                ))
          ],
        ),
      ),
    ),
  );
}
