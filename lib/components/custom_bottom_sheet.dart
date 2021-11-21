import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final Widget child;

  const CustomBottomSheet({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xf1F6F8FB),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: child,
    );
  }
}
