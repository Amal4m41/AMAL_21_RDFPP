import 'dart:ui';

import 'package:flutter/material.dart';

const List<Map<String, String>> controlPanelGridData = [
  {'image': 'assets/bed.svg', 'mainTitle': 'Bed Room', 'subTitle': '4 Lights'},
  {
    'image': 'assets/room.svg',
    'mainTitle': 'Living Room',
    'subTitle': '2 Lights'
  },
  {
    'image': 'assets/kitchen.svg',
    'mainTitle': 'Kitchen',
    'subTitle': '5 Lights'
  },
  {
    'image': 'assets/bathtube.svg',
    'mainTitle': 'Bathroom',
    'subTitle': '1 Lights'
  },
  {
    'image': 'assets/kitchen.svg',
    'mainTitle': 'Outdoor',
    'subTitle': '5 Lights'
  },
  {
    'image': 'assets/balcony.svg',
    'mainTitle': 'Balcony',
    'subTitle': '2 Lights'
  },
];

const List<Map<String, String>> listViewLightItems = [
  {
    'image': 'assets/surface1.svg',
    'mainTitle': 'Main Light',
  },
  {
    'image': 'assets/furniture-and-household.svg',
    'mainTitle': 'Desk Light',
  },
  {
    'image': 'assets/bed (1).svg',
    'mainTitle': 'Bed Light',
  },
];


//TODO: to add color for the scenes and diplay it's grid.
const List<Map<String, String>> scenesList = [
  {
    'image': 'assets/surface1.svg',
    'mainTitle': 'Birthday',
    'color':
  },
  {
    'image': 'assets/surface1.svg',
    'mainTitle': 'Party',
  },
  {
    'image': 'assets/surface1.svg',
    'mainTitle': 'Relax',
  },
  {
    'image': 'assets/surface1.svg',
    'mainTitle': 'Fun',
  },
];

const TextStyle kSubTitleTextStyle =
    TextStyle(color: Colors.orange, fontWeight: FontWeight.bold);

const List<int> listOfColors = [
  0xffFF9B9B,
  0xff94EB9E,
  0xff94CAEB,
  0xffA594EB,
  0xffDE94EB,
  0xffEBD094
];
