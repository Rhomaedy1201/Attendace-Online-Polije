import 'package:attendace_online_polije/core/constants/color_constants.dart';
import 'package:attendace_online_polije/core/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String title;
  final bool? addIcon;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLine;
  final IconData? icon;
  final double? sizeIcon;
  final Color? colorIcon;
  final double? gapIcon;

  const MyText({
    super.key,
    required this.title,
    this.addIcon,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.textOverflow,
    this.maxLine,
    this.icon,
    this.sizeIcon,
    this.colorIcon,
    this.gapIcon,
  });

  @override
  Widget build(BuildContext context) {
    if (maxLine != null) {
      return Text(
        title,
        style: GoogleFonts.poppins(fontSize: fontSize ?? 12, fontWeight: fontWeight ?? FontWeight.w500, color: color ?? ColorConstants.textC),
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLine ?? 1,
        overflow: textOverflow ?? TextOverflow.ellipsis,
      );
    }else if(addIcon == true){
      return Row(
        children: [
          Icon(icon ?? Icons.abc, size: sizeIcon ?? 30, color: colorIcon ?? ColorConstants.textC),
          Gap(X: gapIcon ?? 5),
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: fontSize ?? 12, fontWeight: fontWeight ?? FontWeight.w500, color: color ?? ColorConstants.textC),
            textAlign: textAlign ?? TextAlign.start,
          ),
        ],
      );
    }else{
      return Text(
        title,
        style: GoogleFonts.poppins(fontSize: fontSize ?? 12, fontWeight: fontWeight ?? FontWeight.w500, color: color ?? ColorConstants.textC),
        textAlign: textAlign ?? TextAlign.start,
      );
    }
  }
}