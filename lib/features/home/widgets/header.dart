// ignore_for_file: must_be_immutable

import '../export/index.dart';

class Header extends StatelessWidget {
  double screenWidth, screenHeight, statusBarHeight;
  Header({super.key, required this.screenHeight, required this.screenWidth, required this.statusBarHeight});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: SizedBox(
        width: screenWidth,
        child: Container(
          width: screenWidth,
          height: screenHeight * 0.3,
          color: ColorConstants.primaryC,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: statusBarHeight + 20, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(title: "Selamat Pagi,", color: const Color(0xE8F7F7F7), fontSize: 15, fontWeight: FontWeight.w600),
                      MyText(title: "Muhammad Rhomedi", color: ColorConstants.whiteC, fontSize: 18, fontWeight: FontWeight.w700, maxLine: 1),
                      MyText(title: "Teknik Informatika", color: ColorConstants.whiteC, fontSize: 15, fontWeight: FontWeight.w500),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 33,
                  backgroundColor: ColorConstants.primaryC_200,
                  backgroundImage: AssetImage("assets/images/user.jpeg"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}