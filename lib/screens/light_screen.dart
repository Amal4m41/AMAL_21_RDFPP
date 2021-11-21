import 'package:amal_21_rdfpp/components/circle_color_item.dart';
import 'package:amal_21_rdfpp/components/horizontal_scroll_list.dart';
import 'package:amal_21_rdfpp/components/rectangular_round_item.dart';
import 'package:amal_21_rdfpp/components/round_square_card.dart';
import 'package:amal_21_rdfpp/utils/constants.dart';
import 'package:amal_21_rdfpp/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LightScreen extends StatelessWidget {
  static const String id = "LightScreen";
  late final List<CircleColorItem> listOfColorItems;
  LightScreen() {
    listOfColorItems = listOfColors
        .map((color) => CircleColorItem(color: Color(color)))
        .toList();

    listOfColorItems.add(CircleColorItem(
      color: Colors.white,
      child: SvgPicture.asset('assets/+.svg'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(35),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              'assets/Icon ionic-md-arrow-round-back.svg'),
                          addHorizontalSpace(10),
                          Text(
                            'Bed',
                            style: TextStyle(
                                letterSpacing: 2,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 28),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Room',
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 28),
                    ),
                    addVerticalSpace(10),
                    Text('4 Lights',
                        style: kSubTitleTextStyle.copyWith(
                            fontSize: 20, color: Colors.orange.shade200)),
                  ],
                ),
                SvgPicture.asset('assets/light bulb.svg'),
              ],
            ),
          ),
          addVerticalSpace(20),
          Expanded(
              flex: 1,
              child: HorizontalScrollList(
                numberOfItems: listViewLightItems.length,
                spaceBetween: 15,
                padding: EdgeInsets.symmetric(horizontal: 20),
                builderCallBack: (context, index) {
                  final colorText;
                  final bgColor;
                  index.isEven
                      ? {
                          colorText = Colors.blue.shade900,
                          bgColor = Colors.white
                        }
                      : {
                          colorText = Colors.white,
                          bgColor = Colors.blue.shade900
                        };
                  final item = listViewLightItems[index];

                  return RectangularRoundItem(
                    icon: SvgPicture.asset(item['image'] as String),
                    title: item['mainTitle'] as String,
                    bgColor: bgColor,
                    textColor: colorText,
                  );
                },
              )),
          addVerticalSpace(30),
          Expanded(
            flex: 10,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xf1F6F8FB),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  addVerticalSpace(10),
                  Text(
                    "Intensity",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  addVerticalSpace(15),
                  Row(
                    children: [
                      SvgPicture.asset('assets/solution2.svg'),
                      Expanded(child: Slider(value: 1, onChanged: (value) {})),
                      SvgPicture.asset('assets/solution.svg'),
                    ],
                  ),
                  addVerticalSpace(20),
                  Text(
                    "Colors",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(
                    flex: 1,
                    child: HorizontalScrollList(
                      numberOfItems: listOfColorItems.length,
                      spaceBetween: 10,
                      padding: EdgeInsets.all(5),
                      builderCallBack: (context, index) =>
                          listOfColorItems[index],
                    ),
                  ),
                  addVerticalSpace(20),
                  Text(
                    "Scenes",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  addVerticalSpace(20),
                  Expanded(
                    flex: 3,
                    child: GridView.count(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 18,
                      childAspectRatio: 2.5,
                      children: scenesList
                          .map(
                            (item) => RectangularRoundItem(
                                bgColor:
                                    Color(int.parse(item['color'] as String)),
                                title: item['mainTitle'] as String,
                                icon: SvgPicture.asset(item['image'] as String,
                                    color: Colors.white),
                                textColor: Colors.white),
                          )
                          .toList(),
                    ),
                  ),
                  addVerticalSpace(40),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset('assets/bulb.svg'),
            SvgPicture.asset('assets/Icon feather-home.svg'),
            SvgPicture.asset('assets/Icon feather-settings.svg'),
          ],
        ),
      ),
    );
  }
}
