// ignore_for_file: must_be_immutable
import 'package:attendace_online_polije/core/widgets/my_shimmer.dart';

import '../export/index.dart';

class ShimmerAttendanceCard extends StatelessWidget {
  double screenWidth, screenHeight;
  ShimmerAttendanceCard({super.key, required this.screenHeight, required this.screenWidth});

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
              offset: Offset(0, 0)
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyShimmer(width: 90, height: 20),
                  MyShimmer(width: 90, height: 20),
                ],
              ),
              Gap(Y: 5),
              MyShimmer(width: 150, height: 20),
              Gap(Y: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyShimmer(width: 90, height: 30),
                  Icon(Icons.double_arrow_outlined, size: 30, color: ColorConstants.textC),
                  MyShimmer(width: 90, height: 30),
                ],
              ),
              Gap(Y: 10),
              MyShimmer(width: screenWidth * 0.6, height: 20),
              Gap(Y: 7),
              SizedBox(
                width: screenWidth * 0.5,
                child: CustomButton(
                  isBtnIcon: true, title: "Presensi",  textColor: ColorConstants.whiteC, fontWeight: FontWeight.w700,
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