import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LightScreen extends StatelessWidget {
  static const String id = "LightScreen";
  const LightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Colors.blue,
        ),
        Container(
          child: SvgPicture.asset('assets'),
          // decoration: BoxDecoration(
          //   : SvgPicture.asset(assetName)
          // ),
        ),
      ]),
    );
  }
}
