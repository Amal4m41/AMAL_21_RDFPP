import 'package:amal_21_rdfpp/components/bottom_nav_bar.dart';
import 'package:amal_21_rdfpp/components/circle_color_item.dart';
import 'package:amal_21_rdfpp/components/custom_bottom_sheet.dart';
import 'package:amal_21_rdfpp/components/horizontal_scroll_list.dart';
import 'package:amal_21_rdfpp/components/light_screen/bulb_light_slider.dart';
import 'package:amal_21_rdfpp/components/light_screen/light_bulb.dart';
import 'package:amal_21_rdfpp/components/light_screen/lights_horizontal_scroll.dart';
import 'package:amal_21_rdfpp/components/rectangular_round_item.dart';
import 'package:amal_21_rdfpp/components/round_square_card.dart';
import 'package:amal_21_rdfpp/providers/light_screen_provider.dart';
import 'package:amal_21_rdfpp/utils/constants.dart';
import 'package:amal_21_rdfpp/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LightScreen extends StatefulWidget {
  static const String id = "LightScreen";
  final String roomName;
  final String numberofLights;

  LightScreen({required this.roomName, required this.numberofLights});

  @override
  State<LightScreen> createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen>
    with SingleTickerProviderStateMixin {
  late final List<CircleColorItem> listOfColorItems;
  late final AnimationController controller;
  late final Animation animation;

  void startAnimation(context) async {
    await Future.delayed(const Duration(
        seconds: 1)); //adding a delay for 1 sec before starting the animation.

    controller
      ..forward()
      ..addListener(() {
        // print(animation.value);
        Provider.of<LightScreenProvider>(context, listen: false)
            .setAnimationValue(animation.value);
      }); // ng a delay of 1 second before starting the animation.
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    listOfColorItems = listOfColors
        .map((color) => CircleColorItem(color: Color(color)))
        .toList();

    //Adding the + option for colors list.
    listOfColorItems.add(CircleColorItem(
      color: Colors.white,
      child: SvgPicture.asset('assets/+.svg'),
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("LIGHT SCREEN");
    return ChangeNotifierProvider(
      create: (BuildContext context) => LightScreenProvider(),
      child: Builder(builder: (context) {
        print("LIGHT SCREEN BUILDER");
        startAnimation(context);

        return Scaffold(
          backgroundColor: Colors.blue.shade800,
          body: Stack(children: [
            SvgPicture.asset('assets/Circles.svg',
                alignment: Alignment.topCenter),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
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
                                  widget.roomName.split(' ')[0],
                                  style: kLightsScreenTitleStyle,
                                ),
                              ],
                            ),
                          ),
                          widget.roomName.split(' ').length > 1
                              ? Text(
                                  widget.roomName.split(' ')[1],
                                  style: kLightsScreenTitleStyle,
                                )
                              : addEmptyWidget(),
                          addVerticalSpace(10),
                          Text(widget.numberofLights,
                              style: kSubTitleTextStyle.copyWith(
                                  fontSize: 20, color: Colors.orange.shade200)),
                        ],
                      ),
                      const LightBulb()
                    ],
                  ),
                ),
                addVerticalSpace(40),
                const Expanded(flex: 1, child: LightsHorizontalScroll()),
                addVerticalSpace(35),
                Expanded(
                  flex: 10,
                  child: Stack(children: [
                    CustomBottomSheet(
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
                              const Expanded(
                                child: BulbLightSlider(),
                              ),
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
                                padding: const EdgeInsets.all(5),
                                builderCallBack: (context, index) {
                                  final item = listOfColorItems[index];
                                  return InkWell(
                                      onTap: () {
                                        if (index ==
                                            listOfColorItems.length - 1) return;
                                        Provider.of<LightScreenProvider>(
                                                context,
                                                listen: false)
                                            .setLightColor(item
                                                .color); //setting the bulb color.
                                      },
                                      child: item);
                                }),
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
                                        bgColor: Color(
                                            int.parse(item['color'] as String)),
                                        title: item['mainTitle'] as String,
                                        icon: SvgPicture.asset(
                                            item['image'] as String,
                                            color: Colors.white),
                                        textColor: Colors.white),
                                  )
                                  .toList(),
                            ),
                          ),
                          addVerticalSpace(38),
                        ],
                      ),
                    ),
                    Align(
                      child: CircleAvatar(
                        child: SvgPicture.asset(
                            'assets/Icon awesome-power-off.svg',
                            height: 22),
                        backgroundColor: Colors.white,
                      ),
                      alignment: const Alignment(0.85, -1.1),
                    ),
                  ]),
                )
              ],
            ),
          ]),
          bottomNavigationBar: const BottomNavBar(),
        );
      }),
    );
  }
}

//A class to define the arguments for our named route.
class LightScreenArguments {
  final String roomName;
  final String numberofLights;

  LightScreenArguments({required this.roomName, required this.numberofLights});
}
