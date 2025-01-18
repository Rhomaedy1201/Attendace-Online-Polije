import '../export/index.dart';

class ItemSchedule extends StatelessWidget {
  const ItemSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(title: "07:00", fontSize: 13, fontWeight: FontWeight.w900),
              Gap(X: 50),
              MyText(title: "09:00", fontSize: 12, fontWeight: FontWeight.w800, color: ColorConstants.grayC_600),
            ],
          ),
        ),
        Gap(X: 12),
        Container(width: 2, height: 120, color: ColorConstants.grayC_500),
        Gap(X: 15),
        Expanded(
          flex: 6,
          child: Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: ColorConstants.primaryC,
              borderRadius: BorderRadius.circular(6)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(title: "Matkul", fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6,vertical: 1),
                        decoration: BoxDecoration(
                          color: ColorConstants.emberDarkC,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: MyText(title: "15 Menit, Toleransi Telat", fontSize: 10, fontWeight: FontWeight.w500)
                      ),
                    ],
                  ),
                  MyText(title: "Data WhereHouse", fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                  Gap(Y: 5),
                  MyText(
                    addIcon: true, icon: Icons.share_location_sharp, sizeIcon: 16, colorIcon: Colors.white, 
                    title: "Kelas 14.3", fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white),
                  MyText(
                    addIcon: true, icon: FluentIcons.share_screen_person_16_regular, sizeIcon: 16, colorIcon: Colors.white, 
                    title: "Ratih Ayuninghemi S,ST. M,Kom", fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white),
                  Gap(Y: 5),
                  Row(
                    children: [
                      MyText(title: "Keterangan : Selesai Absen", fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white),
                      Gap(X: 3),
                      Icon(Icons.check_circle, size: 17, color: ColorConstants.greenDarkC)
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}