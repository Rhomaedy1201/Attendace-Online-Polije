// ignore_for_file: must_be_immutable

import '../export/index.dart';

class ItemSchedule extends StatelessWidget {
  double screenWidth;
  ItemSchedule({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JadwalTodayCubit, JadwalTodayState>(
      builder: (context, state) {
        if (state is JadwalTodayLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is JadwalTodaySuccess) {
          if(state.jadwal.data.isEmpty){
            return Center(
              child: Column(
                children: [
                  Gap(Y: 20),
                  SizedBox(
                      width: screenWidth * 0.45,
                      child: Image.asset('assets/images/empty_data.png')),
                  MyText(
                      title: "Tidak ada jadwal kuliah\nhari ini.",
                      fontSize: 15,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600)
                ],
              ),
            );
          }
          return Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: state.jadwal.data.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var data = state.jadwal.data;
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  MyText(
                                      title: data[index].jamMasuk,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900),
                                  Gap(X: 50),
                                  MyText(
                                      title: data[index].jamSelesai,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      color: ColorConstants.grayC_600),
                                ],
                              ),
                            ),
                            Gap(X: 12),
                            Container(
                                width: 2,
                                height: 120,
                                color: ColorConstants.grayC_500),
                            Gap(X: 15),
                            Expanded(
                              flex: 6,
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    color: ColorConstants.primaryC,
                                    borderRadius: BorderRadius.circular(6)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(
                                            title: "Matkul",
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6, vertical: 1),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstants.emberDarkC,
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: MyText(
                                                  title:
                                                      "${data[index].jamToleransiMasuk} Menit, Toleransi Telat",
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                      MyText(
                                          title: data[index].matkul.nama,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                      Gap(Y: 5),
                                      MyText(
                                          addIcon: true,
                                          icon: Icons.share_location_sharp,
                                          sizeIcon: 16,
                                          colorIcon: Colors.white,
                                          title: "Kelas ${data[index].ruangan.namaKelas}",
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                      Row(
                                        children: [
                                          Icon(FluentIcons.share_screen_person_16_regular,size: 16, color: Colors.white),
                                          SizedBox(
                                            width: screenWidth * 0.6,
                                            child: MyText(
                                                addIcon: true,
                                                icon: FluentIcons.share_screen_person_16_regular,
                                                sizeIcon: 16,
                                                colorIcon: Colors.white,
                                                title: data[index].matkul.dosen.nama,
                                                maxLine: 1,
                                                textOverflow: TextOverflow.ellipsis,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Gap(Y: 5),
                                      Row(
                                        children: [
                                          MyText(
                                              title: "Keterangan : ${data[index].absensi != null ? 'Selesai Absen' : 'Belum Absen'}",
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                          Gap(X: 3),
                                          Icon(data[index].absensi != null ? Icons.check_circle : Icons.close,
                                              size: 17,
                                              color: data[index].absensi != null ? ColorConstants.greenDarkC : ColorConstants.redDarkC)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    Gap(Y: 50)
                  ],
                ),
              ),
            ),
          );
        }
        return Center(
          child: Column(
            children: [
              Gap(Y: 20),
              SizedBox(
                  width: screenWidth * 0.45,
                  child: Image.asset('assets/images/empty_data.png')),
              MyText(
                  title: "Tidak ada jadwal kuliah\nhari ini.",
                  fontSize: 15,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600)
            ],
          ),
        );
      },
    );
  }
}
