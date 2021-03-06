import 'package:amal_21_rdfpp/utils/constants.dart';
import 'package:amal_21_rdfpp/utils/widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'ProfileScreen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade800,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(300),
                          bottomRight: Radius.circular(300))),
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(kProfileImageUrl),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                children: [
                  addVerticalSpace(20),
                  const Text(
                    "Amal Sunil Pillai",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  ),
                  addVerticalSpace(25),
                  const Text('Bio', style: kBoldFont),
                  addVerticalSpace(10),
                  const Text(
                    "I'm a final year Computer Science student in Symbiosis Institute of Computer Science and Research, Pune. \n"
                    "I'm a passionate Software Developer with experience in Machine Learning, Blockchain Development, Game Development, "
                    "Android Development, Computer Vision and Flutter Development.",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  addVerticalSpace(20),
                  const Text('Contact Number :', style: kBoldFont),
                  addVerticalSpace(10),
                  const Text('+91 7907361102'),
                  const Text('+91 7620035183'),
                  const Text('+971 55 9221517'),
                  addVerticalSpace(20),
                  const Text('Email :', style: kBoldFont),
                  addVerticalSpace(10),
                  const Text('amalsunil117@gmail.com'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
