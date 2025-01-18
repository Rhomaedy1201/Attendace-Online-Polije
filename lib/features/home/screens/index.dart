import 'package:attendace_online_polije/features/home/widgets/attendance_card.dart';
import 'package:attendace_online_polije/features/home/widgets/item_schedule.dart';

import '../export/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaHelper.getStatusBarHeight(context);
    final double screenWidth = MediaHelper.getScreenWidth(context);
    final double screenHeight = MediaHelper.getScreenHeight(context);
    final bool emptyJadwal = false; 
    return Scaffold(
      backgroundColor: ColorConstants.backgroundC,
      body: Stack(
        children: [
          Header(screenHeight: screenHeight, screenWidth: screenWidth, statusBarHeight: statusBarHeight),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AttendanceCard(screenHeight: screenHeight, screenWidth: screenWidth),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: MyText(title: "Jadwal Hari Ini", fontSize: 15, fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        if(emptyJadwal)
                        Center(
                          child: Column(
                            children: [
                              Gap(Y: 20),
                              SizedBox(
                                width: screenWidth * 0.45,
                                child: Image.asset('assets/images/empty_data.png')),
                              MyText(title: "Tidak ada jadwal kuliah\nhari ini.", fontSize: 15, textAlign: TextAlign.center, fontWeight: FontWeight.w600)
                            ],
                          ),
                        )
                        else
                        Column(
                          children: [
                            Row(
                              children: [
                                MyText(title: "Waktu", fontSize: 12, fontWeight: FontWeight.w600),
                                Gap(X: 38),
                                MyText(title: "Kelas", fontSize: 12, fontWeight: FontWeight.w600),
                              ],
                            ),
                            ItemSchedule(),
                            ItemSchedule(),
                            ItemSchedule(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}