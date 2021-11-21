import 'package:amal_21_rdfpp/providers/light_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/src/provider.dart';

class LightBulb extends StatelessWidget {
  const LightBulb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Bulb color');
    Color color =
        context.select((LightScreenProvider value) => value.lightColor);
    return Stack(
      children: [
        // SvgPicture.asset('assets/light bulb.svg',
        //     color: Colors.red),
        Container(
          height: 25,
          width: 25,
          margin: const EdgeInsets.only(left: 55, top: 108),
          decoration: const BoxDecoration(
            color: Colors.black26,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: 25,
          width: 25,
          margin: const EdgeInsets.only(left: 55, top: 108),
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: color, blurRadius: 10)]),
        ),
        SvgPicture.asset('assets/Group 38.svg'),
      ],
    );
  }
}
