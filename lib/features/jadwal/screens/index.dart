import 'package:attendace_online_polije/features/jadwal/cubit/jadwal_cubit.dart';

import '../export/index.dart';

class JadwalScreen extends StatelessWidget {
  const JadwalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaHelper.getScreenWidth(context);
    final double screenHeight = MediaHelper.getScreenHeight(context);
    return Scaffold(
        backgroundColor: ColorConstants.backgroundC,
        appBar: AppBar(
          title: MyText(
              title: "Jadwal per semester",
              color: ColorConstants.whiteC,
              fontSize: 18,
              fontWeight: FontWeight.w700),
          centerTitle: false,
        ),
        body: Stack(children: [
          Container(
            width: screenWidth,
            height: screenHeight * 0.05,
            color: ColorConstants.primaryC,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(children: [
                Filter(screenWidth: screenWidth, screenHeight: screenHeight),
                Gap(Y: 20),
                Expanded(
                  child: Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                        color: ColorConstants.whiteC,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: ColorConstants.shadowC,
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 1),
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: BlocBuilder<JadwalCubit, JadwalState>(
                            builder: (context, state) {
                              if (state is JadwalLoading) {
                                return Center(child: const CircularProgressIndicator());
                              }
                              if (state is JadwalSuccess) {
                                if (state.jadwalAll.data.isEmpty) {
                                  return emptyData(screenWidth);
                                }
                                return DataTable(
                                  columns: [
                                    DataColumn(
                                      label: MyText(
                                          title: "Hari",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    DataColumn(
                                      label: MyText(
                                          title: "Jam",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    DataColumn(
                                      label: MyText(
                                          title: "Durasi",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    DataColumn(
                                      label: MyText(
                                          title: "Matakuliah",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    DataColumn(
                                      label: MyText(
                                          title: "Ruang",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    DataColumn(
                                      label: MyText(
                                          title: "Dosen Koordinator",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                  rows: state.jadwalAll.data
                                      .map((e) => DataRow(cells: [
                                            DataCell(MyText(
                                              title: e.hari,
                                              fontSize: 15,
                                            )),
                                            DataCell(MyText(
                                              title: e.jamMasuk,
                                              fontSize: 15,
                                            )),
                                            DataCell(MyText(
                                              title: e.durasi,
                                              fontSize: 15,
                                            )),
                                            DataCell(MyText(
                                              title: e.matkul.nama,
                                              fontSize: 15,
                                            )),
                                            DataCell(MyText(
                                              title: "${e.ruangan.kodeJurusan}-${e.ruangan.namaKelas}",
                                              fontSize: 15,
                                            )),
                                            DataCell(MyText(
                                              title: e.matkul.dosen.nama,
                                              fontSize: 15,
                                            )),
                                          ]))
                                      .toList());
                              }
                              return emptyData(screenWidth);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ]))
        ]));
  }

  Center emptyData(double screenWidth) {
    return Center(
      child: Column(
        children: [
          Gap(Y: 20),
          SizedBox(
              width: screenWidth * 0.45,
              child: Image.asset('assets/images/empty_data.png')),
          MyText(
              title: "Tidak ada Jadwal presensi",
              fontSize: 15,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600)
        ],
      ),
    );
  }
}
