import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleColorItem extends StatelessWidget {
  final Color color;
  final Widget? child;
  const CircleColorItem({
    required this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      padding: const EdgeInsets.only(top: 10, right: 10, bottom: 10, left: 12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: child,
    );
  }
}
