import 'package:attendace_online_polije/core/constants/color_constants.dart';
import 'package:attendace_online_polije/core/widgets/my_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isBtnIcon;
  final String title;
  final double? fontSize;
  final Color? bgColor;
  final Color? textColor;
  final FontWeight? fontWeight; 
  final VoidCallback? onPressed;
  final IconData? icon;
  final double? iconSize;
  final Color? colorIcon;

  const CustomButton({
    super.key,
    required this.isBtnIcon,
    required this.title,
    this.fontSize,
    this.bgColor,
    this.textColor,
    this.fontWeight,
    required this.onPressed,
    this.icon,
    this.iconSize,
    this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {
    if (isBtnIcon) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? ColorConstants.primaryC,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        label: MyText(title: title, fontSize: fontSize ?? 14, fontWeight: fontWeight ?? FontWeight.w500, color: textColor),
        icon: Icon(
          icon ?? Icons.login_outlined,
          size: iconSize ?? 30,
          color: colorIcon ?? Colors.white,
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? ColorConstants.primaryC,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: MyText(title: title, fontSize: fontSize ?? 14, fontWeight: fontWeight ?? FontWeight.w500, color: textColor),
      );
    }
  }
}