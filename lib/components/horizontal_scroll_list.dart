import 'package:amal_21_rdfpp/utils/widget_functions.dart';
import 'package:flutter/material.dart';

typedef builderCallback = Widget Function(BuildContext context, int index);

class HorizontalScrollList extends StatelessWidget {
  final int numberOfItems;
  final double spaceBetween;
  final EdgeInsetsGeometry padding;
  final builderCallBack;

  const HorizontalScrollList({
    required this.numberOfItems,
    required this.spaceBetween,
    required this.padding,
    required this.builderCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: padding,
        scrollDirection: Axis.horizontal,
        itemBuilder: builderCallBack,
        separatorBuilder: (context, int) => addHorizontalSpace(spaceBetween),
        itemCount: numberOfItems);
  }
}
