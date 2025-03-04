// ignore_for_file: must_be_immutable

import 'package:attendace_online_polije/core/utils/date_formatter.dart';

import '../export/index.dart';

class EmptyAttendanceCard extends StatelessWidget {
  double screenWidth, screenHeight;
  EmptyAttendanceCard({super.key, required this.screenHeight, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.205),
        width: screenWidth,
        height: 200,
        decoration: BoxDecoration(
            color: ColorConstants.whiteC,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: ColorConstants.shadowC,
                  blurRadius: 5,
                  offset: Offset(0, 0))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                      title: DateTime.now().simpleDateRevers(),
                      addIcon: true,
                      sizeIcon: 20,
                      icon: FluentIcons.calendar_28_regular,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                  MyText(
                      title: "02:45 PM",
                      addIcon: true,
                      sizeIcon: 20,
                      icon: FluentIcons.timer_28_regular,
                      fontSize: 15,
                      fontWeight: FontWeight.w700)
                ],
              ),
              Gap(Y: 5),
              Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.emberDarkC,
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 2),
                    child: MyText(
                      title: "Tidak Ada Jadwal Hari ini",
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
              Gap(Y: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyText(
                      title: "--:--",
                      fontSize: 27,
                      fontWeight: FontWeight.w900),
                  Icon(Icons.double_arrow_outlined,
                      size: 30, color: ColorConstants.textC),
                  MyText(
                      title: "--:--",
                      fontSize: 27,
                      fontWeight: FontWeight.w900),
                ],
              ),
              Gap(Y: 5),
              MyText(
                  title: "....",
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
              Gap(Y: 7),
              SizedBox(
                width: screenWidth * 0.5,
                child: CustomButton(
                  isBtnIcon: true,
                  title: "Presensi",
                  textColor: ColorConstants.whiteC,
                  fontWeight: FontWeight.w700,
                  icon: Icons.center_focus_weak_outlined,
                  onPressed: null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}