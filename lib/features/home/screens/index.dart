import 'package:attendace_online_polije/features/home/widgets/attendance_card.dart';

import '../export/index.dart';

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
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.3,
                color: ColorConstants.primaryC,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: statusBarHeight + 20, horizontal: 20),
                  child: Header(),
                ),
              ),
            ),
          ),
          AttendanceCard(screenHeight: screenHeight, screenWidth: screenWidth)
        ],
      )
    );
  }
}