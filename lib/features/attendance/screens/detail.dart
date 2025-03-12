import 'dart:developer';
import 'dart:io';

import 'package:attendace_online_polije/core/config/app_router.dart';
import 'package:attendace_online_polije/core/widgets/button.dart';
import 'package:attendace_online_polije/features/attendance/cubit/face_prediction_cubit.dart';
import 'package:attendace_online_polije/features/attendance/widgets/items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../export/index.dart';

class DetailAttendanceScreen extends StatelessWidget {
  const DetailAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final String? imagePath =
        ModalRoute.of(context)?.settings.arguments as String?;
    final args = ModalRoute.of(context)?.settings.arguments;
    log("📌 Arguments diterima di Detail: $args");

    if (imagePath == null || imagePath.isEmpty) {
      return Scaffold(
        body: Center(child: Text("Tidak ada gambar yang diterima")),
      );
    }

    // Ambil instance Cubit
    final facePredictionCubit = context.read<FacePredictionCubit>();

    // Panggil prediksi saat layar terbuka
    WidgetsBinding.instance.addPostFrameCallback((_) {
      facePredictionCubit.predict(imgFile: File(imagePath));
    });

    return Scaffold(
      backgroundColor: ColorConstants.backgroundC,
      appBar: AppBar(
        title: MyText(
          title: "Detail Presensi",
          color: ColorConstants.whiteC,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(Y: 30),
            Center(
              child: Container(
                width: size.width * 0.4,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                    color: ColorConstants.emberLightC,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(File(imagePath)),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            BlocBuilder<FacePredictionCubit, FacePredictionState>(
              builder: (context, state) {
                if (state is FacePredictionLoading) {
                  // return const Center(child: CircularProgressIndicator());
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width * 0.7,
                            child: Lottie.asset("assets/lottie/process_face.json", fit: BoxFit.cover)
                          ),
                          MyText(title: "PROSES DETEKSI WAJAH...", fontSize: 20, fontWeight: FontWeight.w600, color: ColorConstants.primaryC)
                        ],
                      ),
                    ),
                  );
                }
                if (state is FacePredictionSuccess) {
                  return Column(
                    children: [
                      Gap(Y: 40),
                      ItemAttendance(
                          size: size, title: "Kelas Asli", value: state.data["label_asli"] ?? "Kosong"),
                      Gap(Y: 5),
                      ItemAttendance(
                          size: size, title: "Kelas Prediksi", value: state.data["predicted_label"]),
                      Gap(Y: 5),
                      ItemAttendance(size: size, title: "Akurasi", value: "${state.data["akurasi"]}%"),
                      Gap(Y: 5),
                      ItemAttendance(
                          size: size, title: "Keterangan", value: state.data["label_asli"] != state.data["predicted_label"] ? "Prediksi Salah❌" : "Prediksi Benar✅"),
                      Gap(Y: 20),
                      SizedBox(
                        width: size.width,
                        height: 45,
                        child: CustomButton(
                          isBtnIcon: false,
                          title: "Presensi",
                          bgColor: ColorConstants.primaryC,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          textColor: Colors.white,
                          onPressed: state.data["label_asli"] != state.data["predicted_label"] ? null : () {},
                        ),
                      ),
                      Gap(Y: 5),
                      SizedBox(
                        width: size.width,
                        height: 45,
                        child: CustomButton(
                          isBtnIcon: false,
                          title: "Kembali",
                          bgColor: Colors.transparent,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.attendance);
                          },
                        ),
                      ),
                    ],
                  );
                }
                if (state is FacePredictionError) {
                  log(state.msgErr);
                  return Center(child: Text("Error: ${state.msgErr}", style: TextStyle(color: Colors.red)));
                }
                return const Center(child: Text("Menunggu hasil prediksi..."));
              },
            ),
          ],
        ),
      ),
    );
  }
}
