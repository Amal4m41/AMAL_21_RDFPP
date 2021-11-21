import 'package:amal_21_rdfpp/providers/light_screen_provider.dart';
import 'package:amal_21_rdfpp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/src/provider.dart';

import '../horizontal_scroll_list.dart';
import '../rectangular_round_item.dart';

class LightsHorizontalScroll extends StatelessWidget {
  const LightsHorizontalScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizontalScrollList(
      numberOfItems: listViewLightItems.length,
      spaceBetween: 15,
      padding: EdgeInsets.only(
          left: 400 -
              (380 *
                      (context.select(
                          (LightScreenProvider value) => value.animationValue))
                  as double)),
      builderCallBack: (context, index) {
        final colorText;
        final bgColor;
        index.isEven
            ? {colorText = Colors.blue.shade900, bgColor = Colors.white}
            : {colorText = Colors.white, bgColor = Colors.blue.shade900};
        final item = listViewLightItems[index];

        return RectangularRoundItem(
          icon: SvgPicture.asset(item['image'] as String),
          title: item['mainTitle'] as String,
          bgColor: bgColor,
          textColor: colorText,
        );
      },
    );
  }
}
