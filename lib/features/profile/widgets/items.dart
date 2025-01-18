// ignore_for_file: must_be_immutable

import '../export/index.dart';

class Items extends StatelessWidget {
  IconData icon;
  String title;
  bool? addArrowRight = true;
  Color? colorText;
  Color? colorIcon;
  VoidCallback onClick;
  Items({
    super.key, required this.icon,
    required this.title,
    this.addArrowRight,
    this.colorText,
    this.colorIcon,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onClick,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              title: title, fontSize: 14, fontWeight: FontWeight.w600, color: colorText,
              addIcon: true, icon: icon, sizeIcon: 22, gapIcon: 10, colorIcon: colorIcon),
            if(addArrowRight == true)
            Icon(Icons.arrow_forward_ios_rounded, size: 20, color: ColorConstants.textC),
          ],
        ),
      ),
    );
  }
}