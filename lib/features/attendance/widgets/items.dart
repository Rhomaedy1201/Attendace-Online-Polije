// ignore_for_file: must_be_immutable

import '../export/index.dart';

class ItemAttendance extends StatelessWidget {
  Size size;
  String title;
  String value;
  ItemAttendance({super.key, required this.size, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ColorConstants.whiteC,
        boxShadow: [
          BoxShadow(
            color: ColorConstants.shadowC,
            blurRadius: 5,
            offset: Offset(1, 3)
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        child: Row(
          children: [
            MyText(
              title: "$title : ",
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            Gap(X: 5),
            MyText(
              title: value,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}