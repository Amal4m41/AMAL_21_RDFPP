import 'package:amal_21_rdfpp/utils/constants.dart';
import 'package:amal_21_rdfpp/utils/widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundSquareCard extends StatelessWidget {
  final String imagePath;
  final String mainTitle;
  final String subTitle;

  const RoundSquareCard(
      {required this.imagePath,
      required this.mainTitle,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(25))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(imagePath),
          addVerticalSpace(18),
          Text(
            mainTitle,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          addVerticalSpace(8),
          Text(
            subTitle,
            style: kSubTitleTextStyle,
          ),
        ],
      ),
    );
  }
}
