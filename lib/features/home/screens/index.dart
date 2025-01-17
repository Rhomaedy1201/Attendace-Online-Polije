import 'package:attendace_online_polije/core/constants/color_constants.dart';
import 'package:attendace_online_polije/core/utils/media_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaHelper.getStatusBarHeight(context);
    final double screenWidth = MediaHelper.getScreenWidth(context);
    final double screenHeight = MediaHelper.getScreenHeight(context);
    return Scaffold(
      backgroundColor: ColorConstants.backgroundC,
      // appBar: AppBar(
      //   title: const Text('Home Screen'),
      // ),
      body: Stack(
        children: [
          ClipPath(
            child: SizedBox(
              width: screenWidth,
              // color: ColorConstants.grayC_600,
              child: Column(
                children: [
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.35,
                    color: ColorConstants.primaryC,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              margin: EdgeInsets.only(top: screenHeight * 0.25),
              width: screenWidth,
              height: 195,
              decoration: BoxDecoration(
                color: ColorConstants.whiteC,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstants.shadowC,
                    blurRadius: 5,
                    offset: Offset(0, 0)
                  )
                ]
              ),
            ),
          ),
        ],
      )
    );
  }
}