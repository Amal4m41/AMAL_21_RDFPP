import 'package:flutter/cupertino.dart';

//Even though the LightScreen widget's state can be managed using setState() which will rebuild the entire screen for any change in
//state properties, I'll be using provider to notify the changes in it's state and rebuild only those components that are affected by the change.
class LightScreenProvider extends ChangeNotifier {
  double _sliderValue = 0;
  Color _lightColor = Color(0xffFFD139).withOpacity(0);

  double get sliderValue => _sliderValue;
  Color get lightColor => _lightColor;

  void setSliderValue(double value) {
    _sliderValue = value;
    _lightColor = _lightColor.withOpacity(value / 10);
    notifyListeners();
  }

  //opacity ranges from 0.0 to 1.0
  void setLightColor(Color color) {
    _lightColor = color.withOpacity(_sliderValue / 10);
    notifyListeners();
  }
}
