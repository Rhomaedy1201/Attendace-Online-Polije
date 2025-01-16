import 'package:attendace_online_polije/core/config/app_router.dart';
import 'package:attendace_online_polije/core/constants/color_constants.dart';
import 'package:attendace_online_polije/core/widgets/button.dart';
import 'package:attendace_online_polije/core/widgets/gap.dart';
import 'package:attendace_online_polije/core/widgets/my_text.dart';
import 'package:attendace_online_polije/features/auth/cubit/password_visibility_cubit.dart';
import 'package:attendace_online_polije/features/auth/widgets/input_email.dart';
import 'package:attendace_online_polije/features/auth/widgets/input_pass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double heightStatusBar = MediaQuery.of(context).viewPadding.top;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorConstants.primaryC,
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      body: Stack(
        children: [
          Positioned(
            top: 5,
            child: SizedBox(
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: heightStatusBar),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 10,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Image(
                        image: AssetImage('assets/icons/login_icon.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 27,
                  right: 27,
                  top: 30,
                  bottom: 80,
                ),
                child: Column(
                  children: [
                    MyText(
                        title: "Log In",
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                    Gap(Y: 30),
                    InputEmail(),
                    Gap(Y: 20),
                    BlocProvider(
                      create: (context) => PasswordVisibilityCubit(),
                      child: InputPass(),
                    ),
                    Gap(Y: 30),
                    SizedBox(
                      width: screenWidth,
                      height: 50,
                      child: CustomButton(
                        isBtnIcon: true, 
                        title: "Log In", 
                        bgColor: ColorConstants.primaryC,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, AppRoutes.myNavigationBar);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
