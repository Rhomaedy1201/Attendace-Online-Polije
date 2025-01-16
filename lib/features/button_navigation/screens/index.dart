import 'package:attendace_online_polije/core/constants/color_constants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStatePropertyAll(
            GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 13, color: ColorConstants.textC)
          ),
          iconTheme: WidgetStatePropertyAll(
            IconThemeData(color: ColorConstants.textC)
          )
        ),
        child: NavigationBar(
          backgroundColor: ColorConstants.whiteC,
          elevation: 10,
          selectedIndex: 0,
          indicatorColor: ColorConstants.primaryC,
          destinations: [
            NavigationDestination(
              icon: Icon(FluentIcons.home_16_regular, size: 28),
              label: "Home",
              selectedIcon: Icon(FluentIcons.home_16_filled, size: 28, color: Colors.white),
            ),
            NavigationDestination(
              icon: Icon(FluentIcons.learning_app_24_regular, size: 28),
              label: "Jadwal"
            ),
            NavigationDestination(
              icon: Icon(FluentIcons.data_histogram_16_regular, size: 30),
              label: "History"
            ),
            NavigationDestination(
              icon: Icon(FluentIcons.person_32_regular, size: 28),
              label: "Profile"
            ),
          ],
        ),
      )
    );
  }
}