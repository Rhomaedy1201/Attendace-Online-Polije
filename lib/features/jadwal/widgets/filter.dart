// ignore_for_file: must_be_immutable
import '../export/index.dart';

class Filter extends StatelessWidget {
  double screenWidth, screenHeight;
  Filter({super.key, required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.09,
      decoration: BoxDecoration(
        color: ColorConstants.whiteC,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: ColorConstants.shadowC,
            blurRadius: 5,
            offset: Offset(0, 1)  
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(Y: 5),
            MyText(title: "Tahun Ajaran", fontSize: 12, fontWeight: FontWeight.w700),
            Gap(Y: 4),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                },
                child: Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.5, color: ColorConstants.grayC_500),
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(title: "Januari 2025", fontSize: 12, fontWeight: FontWeight.w700),
                        Icon(FluentIcons.calendar_20_filled, size: 24)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}