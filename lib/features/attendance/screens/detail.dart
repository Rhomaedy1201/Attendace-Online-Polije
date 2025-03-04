import 'dart:developer';
import 'dart:io';

import 'package:attendace_online_polije/core/config/app_router.dart';
import 'package:attendace_online_polije/core/widgets/button.dart';
import 'package:attendace_online_polije/features/attendance/widgets/items.dart';

import '../export/index.dart';

class DetailAttendanceScreen extends StatelessWidget {
  const DetailAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final String? imagePath = ModalRoute.of(context)?.settings.arguments as String?;
    final args = ModalRoute.of(context)?.settings.arguments;
    log("📌 Arguments diterima di Detail: $args");

    if (imagePath == null || imagePath.isEmpty) {
      return Scaffold(
        body: Center(child: Text("Tidak ada gambar yang diterima")),
      );
    }

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
                  )
                ),
              ),
            ),
            Gap(Y: 40),
            ItemAttendance(size: size, title: "Akurasi", value: "98%"),
            Gap(Y: 5),
            ItemAttendance(size: size, title: "Min Jarak", value: "32"),
            Gap(Y: 5),
            ItemAttendance(size: size, title: "Threshold", value: "10"),
            Gap(Y: 5),
            ItemAttendance(size: size, title: "Prediksi", value: "E4121041"),
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
                onPressed: () {
                },
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
                  Navigator.pushReplacementNamed(context, AppRoutes.attendance);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}