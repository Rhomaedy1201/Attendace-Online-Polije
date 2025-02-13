import 'package:attendace_online_polije/features/profile/cubit/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../export/index.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaHelper.getScreenWidth(context);
    final screenHeight = MediaHelper.getScreenHeight(context);
    return Scaffold(
      backgroundColor: ColorConstants.backgroundC,
      appBar: AppBar(
        title: MyText(
            title: "Profile",
            color: ColorConstants.whiteC,
            fontSize: 18,
            fontWeight: FontWeight.w700),
        centerTitle: false,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileSuccess) {
            var data = state.data.data;
            return Column(
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.21,
                  color: ColorConstants.primaryC,
                  child: Column(
                    children: [
                      Gap(Y: 5),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2.5),
                            borderRadius: BorderRadius.circular(50)),
                        child: CircleAvatar(
                          backgroundColor: ColorConstants.grayC_400,
                          radius: 40,
                          backgroundImage: AssetImage('assets/images/user.jpeg'),
                        ),
                      ),
                      Gap(Y: 5),
                      MyText(
                          title: data.mahasiswa.nama,
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                      Gap(Y: 2),
                      MyText(
                          title: data.nim,
                          fontSize: 12,
                          color: const Color(0xDCFFFFFF),
                          fontWeight: FontWeight.w600),
                      MyText(
                          title: data.prodi.nama,
                          fontSize: 12,
                          color: const Color(0xDCFFFFFF),
                          fontWeight: FontWeight.w600),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: ColorConstants.shadowC,
                              offset: Offset(0, 1))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Items(
                            icon: FluentIcons.person_32_filled,
                            title: "Informasi Mahasiswa",
                            onClick: () {
                              debugPrint("Informasi mhs");
                            },
                            addArrowRight: true,
                          ),
                          Gap(Y: 20),
                          Items(
                            icon: FluentIcons.lock_closed_16_filled,
                            title: "Ubah Password",
                            onClick: () {},
                            addArrowRight: true,
                          ),
                          Gap(Y: 20),
                          Items(
                            icon: FluentIcons.settings_16_filled,
                            title: "Settings",
                            onClick: () {},
                            addArrowRight: true,
                          ),
                          Gap(Y: 20),
                          Items(
                            icon: FluentIcons.sign_out_24_filled,
                            title: "Logout",
                            colorText: ColorConstants.redDarkC,
                            colorIcon: ColorConstants.redDarkC,
                            onClick: () {},
                            addArrowRight: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }
          return Center(
            child: MyText(
              title: "Gagal Memuat Data User",
              fontSize: 16,
              color: ColorConstants.grayC_600,
              fontWeight: FontWeight.w700),
          );
        },
      ),
    );
  }
}
