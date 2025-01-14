import 'package:attendace_online_polije/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLine;

  const MyText({
    super.key,
    required this.title,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.textOverflow,
    this.maxLine,
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
    }else{
      return Text(
        title,
        style: GoogleFonts.poppins(fontSize: fontSize ?? 12, fontWeight: fontWeight ?? FontWeight.w500, color: color ?? ColorConstants.textC),
        textAlign: textAlign ?? TextAlign.start,
      );
    }
  }
}