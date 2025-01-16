import 'package:attendace_online_polije/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.grayC_200,
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
    );
  }
}