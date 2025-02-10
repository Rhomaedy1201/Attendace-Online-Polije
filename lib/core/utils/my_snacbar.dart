import 'package:attendace_online_polije/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class MySnacbar {
  static snackbarSuccess(String msg, BuildContext context){
    var snackbarSuccess = ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: ColorConstants.greenDarkC,),
    );
    return snackbarSuccess;
  }
  static snackbarError(String msg, BuildContext context){
    var snackbarError = ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: ColorConstants.redDarkC,),
    );
    return snackbarError;
  }
}