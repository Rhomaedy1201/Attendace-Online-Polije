// ignore_for_file: must_be_immutable

import 'package:attendace_online_polije/core/constants/color_constants.dart';
import 'package:attendace_online_polije/features/auth/cubit/password_visibility_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputPass extends StatelessWidget {
  TextEditingController passwordC;
  InputPass({super.key, required this.passwordC});

  @override
  Widget build(BuildContext context) {
    PasswordVisibilityCubit data = context.read<PasswordVisibilityCubit>();
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
      child: BlocBuilder<PasswordVisibilityCubit, bool>(
        builder: (context, isPasswordVisible) {
          return TextField(
            autocorrect: false,
            maxLines: 1,
            obscureText: isPasswordVisible,
            controller: passwordC,
            enableSuggestions: false,
            decoration: InputDecoration(
              hintText: "Masukkan Password",
              hintStyle: const TextStyle(color: ColorConstants.grayC_600),
              border: InputBorder.none,
              prefixIcon:  Icon(
                Icons.lock_open,
                color: ColorConstants.grayC_600,
              ),
              suffixIcon: InkWell(
                child: Icon(
                  isPasswordVisible
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye,
                  size: 26,
                  color: ColorConstants.grayC_600,
                ),
                onTap: () {
                  data.toggleVisibility();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
