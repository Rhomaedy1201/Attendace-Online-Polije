import 'package:attendace_online_polije/core/constants/api_constants.dart';
import 'package:attendace_online_polije/core/constants/color_constants.dart';
import 'package:attendace_online_polije/core/utils/my_snacbar.dart';
import 'package:attendace_online_polije/core/widgets/button.dart';
import 'package:attendace_online_polije/core/widgets/gap.dart';
import 'package:attendace_online_polije/features/auth/cubit/auth_cubit.dart';
import 'package:attendace_online_polije/features/auth/cubit/password_visibility_cubit.dart';
import 'package:attendace_online_polije/features/auth/widgets/input_email.dart';
import 'package:attendace_online_polije/features/auth/widgets/input_pass.dart';
import 'package:attendace_online_polije/features/splash/export/index.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController nimC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double heightStatusBar = MediaQuery.of(context).viewPadding.top;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorConstants.primaryC,
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
                    InputNim(nimC: nimC),
                    Gap(Y: 20),
                    BlocProvider(
                      create: (context) => PasswordVisibilityCubit(),
                      child: InputPass(passwordC: passwordC),
                    ),
                    Gap(Y: 30),
                    BlocListener<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          MySnacbar.snackbarSuccess("Berhasil Login", context);
                          Navigator.pushReplacementNamed(context, AppRoutes.myNavigationBar);
                        } else if(state is AuthError) {
                          MySnacbar.snackbarError(state.msgErr, context);
                        }
                      },
                      child: SizedBox(
                        width: screenWidth,
                        height: 50,
                        child: CustomButton(
                            isBtnIcon: true,
                            title: "Log In",
                            icon: Icons.login_outlined,
                            bgColor: ColorConstants.primaryC,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            textColor: Colors.white,
                            onPressed: State is AuthLoading ? null : () {
                              // MySnacbar.snackbarError("Harap isi semua form", context);
                              context.read<AuthCubit>().login(nim: nimC.text, pass: passwordC.text);
                            }),
                      ),
                    )
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
