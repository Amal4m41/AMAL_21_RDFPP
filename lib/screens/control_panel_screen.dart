import 'package:amal_21_rdfpp/components/round_square_card.dart';
import 'package:amal_21_rdfpp/screens/light_screen.dart';
import 'package:amal_21_rdfpp/screens/profile_screen.dart';
import 'package:amal_21_rdfpp/utils/constants.dart';
import 'package:amal_21_rdfpp/utils/widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ControlPanelScreen extends StatelessWidget {
  static const String id = "ControlPanelScreen";
  const ControlPanelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: SafeArea(
        child: Column(
          children: [
            addVerticalSpace(15),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 22.0, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Control',
                        style: TextStyle(
                            letterSpacing: 2,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 28),
                      ),
                      Text(
                        'Panel',
                        style: TextStyle(
                            letterSpacing: 2,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 28),
                      ),
                    ],
                  ),
                  // SvgPicture.asset('assets/bed.svg'),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ProfileScreen.id);
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(kProfileImageUrl),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
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
                    Text(
                      "All Rooms",
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    addVerticalSpace(15),
                    Expanded(
                      child: GridView.count(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 18,
                        children: controlPanelGridData
                            .map((item) => InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, LightScreen.id);
                                  },
                                  child: RoundSquareCard(
                                    imagePath: item['image'] as String,
                                    mainTitle: item['mainTitle'] as String,
                                    subTitle: item['subTitle'] as String,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
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
      // bottomNavigationBar: BottomNavigationBar(
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   items: [
      //     BottomNavigationBarItem(
      //         label: "bulb", icon: SvgPicture.asset('assets/bulb.svg')),
      //     BottomNavigationBarItem(
      //         label: 'home',
      //         icon: SvgPicture.asset('assets/Icon feather-home.svg')),
      //     BottomNavigationBarItem(
      //         label: 'home',
      //         icon: SvgPicture.asset('assets/Icon feather-settings.svg')),
      //   ],
      // ),
    );
  }
}
