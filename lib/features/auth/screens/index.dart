import 'package:attendace_online_polije/core/constants/color_constants.dart';
import 'package:attendace_online_polije/core/widgets/gap.dart';
import 'package:attendace_online_polije/core/widgets/my_text.dart';
import 'package:attendace_online_polije/features/auth/cubit/password_visibility_cubit.dart';
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
                    inputEmail(),
                    Gap(Y: 20),
                    BlocProvider(
                      create: (context) => PasswordVisibilityCubit(),
                      child: InputPass(),
                    ),
                    // spaceHeight(20),
                    // _buttomLogin(prefsC.biometric.value)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputEmail() {
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
        controller: null,
        decoration: const InputDecoration(
          hintText: "Masukkan Email atau Nip",
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

  // Widget _buttomLogin(bool biomatrik) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         flex: 4,
  //         child: SizedBox(
  //           height: 50,
  //           child: ElevatedButton.icon(
  //             onPressed: loginController.isLoading.value
  //                 ? null
  //                 : () async {
  //                     if (prefsC.nip.value != "null") {
  //                       print("check");
  //                       loginController.checkAlreadyLogin();
  //                     } else if (prefsC.tipe.value == "User") {
  //                       print("check sdm");
  //                       loginController.checkAlreadyLogin();
  //                     } else {
  //                       print("login");
  //                       loginController.login();
  //                     }
  //                   },
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: cPrimary,
  //               shape: radiusElevetedBtn,
  //             ),
  //             label: Text(
  //               loginController.isLoading.value ? "Loading..." : "Login",
  //               style: const TextStyle(
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.w900,
  //                 color: Colors.white,
  //               ),
  //             ),
  //             icon: const Icon(
  //               Icons.login_outlined,
  //               size: 30,
  //               color: Colors.white,
  //             ),
  //           ),
  //         ),
  //       ),
  //       biomatrik ? spaceWidth(5) : Container(),
  //       biomatrik
  //           ? Expanded(
  //               flex: 1,
  //               child: InkWell(
  //                 onTap: () {
  //                   authenticate();
  //                 },
  //                 child: Container(
  //                   height: 50,
  //                   decoration: const BoxDecoration(
  //                     color: cPrimary,
  //                     borderRadius: BorderRadius.all(
  //                       Radius.circular(4),
  //                     ),
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: cGrey_700,
  //                         blurRadius: 2,
  //                         offset: Offset(0, 1), // Shadow position
  //                       ),
  //                     ],
  //                   ),
  //                   child: const Center(
  //                     child: Icon(
  //                       Icons.fingerprint,
  //                       color: Colors.white,
  //                       size: 35,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             )
  //           : Container(),
  //     ],
  //   );
  // }
}
