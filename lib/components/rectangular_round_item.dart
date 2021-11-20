import 'package:amal_21_rdfpp/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class RectangularRoundItem extends StatelessWidget {
  final Color bgColor;
  final String title;
  final Widget icon;
  final Color textColor;
  final EdgeInsetsGeometry padding;

  const RectangularRoundItem({
    required this.bgColor,
    required this.title,
    required this.icon,
    required this.textColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          addHorizontalSpace(10),
          Text(title,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
