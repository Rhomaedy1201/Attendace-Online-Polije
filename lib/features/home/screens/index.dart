import 'package:attendace_online_polije/features/home/cubit/jadwal_now_cubit.dart';

import '../export/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaHelper.getStatusBarHeight(context);
    final double screenWidth = MediaHelper.getScreenWidth(context);
    final double screenHeight = MediaHelper.getScreenHeight(context);
    // final bool emptyJadwal = false;
    return Scaffold(
        backgroundColor: ColorConstants.backgroundC,
        body: Stack(
          children: [
            Header(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                statusBarHeight: statusBarHeight),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AttendanceCard(
                    screenHeight: screenHeight, screenWidth: screenWidth),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                          title: "Jadwal Hari Ini",
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                      InkWell(
                        onTap: () {
                          context.read<JadwalTodayCubit>().getJadwalToday();
                          context.read<JadwalNowCubit>().getJadwalNow();
                        },
                        child: Icon(Icons.refresh, color: ColorConstants.primaryDarkC, size: 35),
                      ),
                    ],
                  ),
                ),
                ItemSchedule(screenWidth: screenWidth),
              ],
            ),
          ],
        ));
  }
}
