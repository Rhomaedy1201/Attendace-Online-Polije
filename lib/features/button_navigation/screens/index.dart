import 'package:attendace_online_polije/features/jadwal/screens/index.dart';

import '../export/index.dart';

const List<Widget> listBody = [
  HomeScreen(),
  JadwalScreen(),
  HistoryScreen(),
  ProfileScreen(),
];

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    NavigatorCubit data = context.read<NavigatorCubit>();
    return BlocBuilder<NavigatorCubit, int>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorConstants.backgroundC,
          body: listBody[data.state],
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: WidgetStatePropertyAll(
                GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: ColorConstants.textC)
                ),
              iconTheme: WidgetStatePropertyAll(IconThemeData(color: ColorConstants.textC))),
            child: NavigationBar(
              backgroundColor: ColorConstants.whiteC,
              elevation: 10,
              selectedIndex: data.state,
              animationDuration: Duration(seconds: 1),
              indicatorColor: ColorConstants.primaryC,
              onDestinationSelected: (value) {
                data.selectedNavigator(value);
              },
              destinations: [
                NavigationDestination(
                  icon: Icon(FluentIcons.home_16_regular, size: 28),
                  label: "Home",
                  selectedIcon: Icon(FluentIcons.home_16_filled, size: 28, color: Colors.white),
                ),
                NavigationDestination(
                  icon: Icon(FluentIcons.learning_app_24_regular, size: 28),
                  label: "Jadwal",
                  selectedIcon: Icon(FluentIcons.learning_app_24_filled, size: 28, color: Colors.white),
                ),
                NavigationDestination(
                  icon: Icon(FluentIcons.data_histogram_16_regular, size: 30),
                  label: "History",
                  selectedIcon: Icon(FluentIcons.data_histogram_16_filled, size: 28, color: Colors.white),
                ),
                NavigationDestination(
                  icon: Icon(FluentIcons.person_32_regular, size: 28),
                  label: "Profile",
                  selectedIcon: Icon(FluentIcons.person_32_filled, size: 28, color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
