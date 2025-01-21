import '../export/index.dart';

final List dataJadwal = [
  {
    'hari': "Senin",
    'jam': "07:30 - 09:30",
    'durasi': "2 jam",
    'matkul': "Matematika Diskrit",
    'ruang': "Lantai 4",
    'dosen': "Bu Vany",
  },
  {
    'hari': "Senin",
    'jam': "09:30 - 11:30",
    'durasi': "2 jam",
    'matkul': "Basis Data",
    'ruang': "Lantai 4",
    'dosen': "Pak Aji",
  }
];
class JadwalScreen extends StatelessWidget {
  const JadwalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaHelper.getScreenWidth(context);
    final double screenHeight = MediaHelper.getScreenHeight(context);
    return Scaffold(
      backgroundColor: ColorConstants.backgroundC,
      appBar: AppBar(
        title: MyText(title: "Jadwal per semester", color: ColorConstants.whiteC, fontSize: 18, fontWeight: FontWeight.w700),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight * 0.05,
            color: ColorConstants.primaryC,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: Column(
              children: [
                Filter(screenWidth: screenWidth, screenHeight: screenHeight),
                Gap(Y: 20),
                Container(
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
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: MyText(title: "Hari", fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          DataColumn(
                            label: MyText(title: "Jam", fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          DataColumn(
                            label: MyText(title: "Durasi", fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          DataColumn(
                            label: MyText(title: "Matakuliah", fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          DataColumn(
                            label: MyText(title: "Ruang", fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          DataColumn(
                            label: MyText(title: "Dosen Koordinator", fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ], 
                        rows: dataJadwal.map((e) => DataRow(cells: [
                          DataCell(MyText(title: e['hari'], fontSize: 15,)),
                          DataCell(MyText(title: e['jam'], fontSize: 15,)),
                          DataCell(MyText(title: e['durasi'], fontSize: 15,)),
                          DataCell(MyText(title: e['matkul'], fontSize: 15,)),
                          DataCell(MyText(title: e['ruang'], fontSize: 15,)),
                          DataCell(MyText(title: e['dosen'], fontSize: 15,)),
                        ])).toList()
                      ),
                    ),
                  ),
                )
              ]
            )
          )
        ]
      )
    );
  }
}