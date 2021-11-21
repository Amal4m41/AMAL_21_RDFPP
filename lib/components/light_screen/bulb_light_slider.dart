import 'package:amal_21_rdfpp/providers/light_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class BulbLightSlider extends StatelessWidget {
  const BulbLightSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SLIDER');
    return SliderTheme(
      data: SliderThemeData(
          trackHeight: 0.1,
          activeTrackColor: Colors.orange.shade200,
          inactiveTickMarkColor: Colors.grey,
          thumbColor: Colors.white),
      child: Slider(
          min: 0,
          max: 10,
          divisions: 10,
          value: context.select((LightScreenProvider value) => value
              .sliderValue), //only rebuild this widget if this property changes.
          onChanged: (value) {
            Provider.of<LightScreenProvider>(context, listen: false)
                .setSliderValue(value);
          }),
    );
  }
}
