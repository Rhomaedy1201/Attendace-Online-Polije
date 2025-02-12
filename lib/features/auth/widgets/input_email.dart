// ignore_for_file: must_be_immutable

import 'package:attendace_online_polije/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class InputNim extends StatelessWidget {
  TextEditingController nimC;
  InputNim({super.key, required this.nimC});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: ColorConstants.grayC_200,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          width: 1,
          color: const Color(0xFFE3E2E2),
        ),
      ),
      child: TextField(
        autocorrect: false,
        maxLines: 1,
        controller: nimC,
        decoration: const InputDecoration(
          hintText: "Masukkan NIM",
          hintStyle: TextStyle(color: ColorConstants.grayC_600),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.email_outlined,
            color: ColorConstants.grayC_600,
          ),
        ),
      ),
    );
  }
}