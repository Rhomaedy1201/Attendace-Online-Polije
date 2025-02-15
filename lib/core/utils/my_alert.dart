import 'package:attendace_online_polije/core/widgets/my_text.dart';
import 'package:flutter/material.dart';

class MyAlert {
  String title;
  Color titleColor;
  String message;
  String? nameAction;
  VoidCallback onClick;

  MyAlert({
    required this.title,
    required this.titleColor,
    required this.message,
    this.nameAction,
    required this.onClick,

  });
  
  alertDialog(BuildContext context) async {
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: MyText(title: title, color: titleColor, fontWeight: FontWeight.w600, fontSize: 20),
          content:  MyText(title: message, color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: MyText(title: "Batal"),
            ),
            ElevatedButton(
              onPressed: onClick,
              child: MyText(title: nameAction ?? "Ok"),
            ),
          ],
        );
      },
    );
  }
}