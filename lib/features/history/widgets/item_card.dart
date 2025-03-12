// ignore_for_file: must_be_immutable

import '../export/index.dart';

class ItemCard extends StatelessWidget {
  double screenWidth, screenHeight;
  int no;
  String tgl, matkul, waktu, status;
  ItemCard({
    super.key, 
    required this.screenWidth, 
    required this.screenHeight,
    required this.no,
    required this.tgl,
    required this.matkul,
    required this.waktu,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      width: screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ColorConstants.whiteC,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: ColorConstants.shadowC,
            offset: Offset(0, 1),
          ),
        ]
      ),
      child: Column(
        children: [
          _headNumber(),
          _compData()
        ],
      ),
    );
  }

  Padding _compData() {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1.5, color: ColorConstants.grayC_500)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(title: "Matkul :", color: ColorConstants.grayC_600, fontSize: 11,),
                        MyText(title: matkul, color: ColorConstants.textC, fontWeight: FontWeight.w700,)
                      ],
                    ),
                  ),
                ),
              ),
              Gap(X: 10),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1.5, color: ColorConstants.grayC_500)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(title: "Waktu Absen :", color: ColorConstants.grayC_600, fontSize: 11,),
                        MyText(title: waktu, color: ColorConstants.textC, fontWeight: FontWeight.w700,)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(Y: 7),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(title: "Status : ", color: ColorConstants.textC, fontWeight: FontWeight.w600, fontSize: 11),
              Container(
                decoration: BoxDecoration(
                  color: ColorConstants.redDarkC,
                  borderRadius: BorderRadius.circular(3)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: MyText(title: status, color: ColorConstants.whiteC, fontWeight: FontWeight.w600, fontSize: 11),
                )
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _headNumber() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.primaryDarkC,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(5),
              topLeft: Radius.circular(5),
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
            child: MyText(title: no.toString(), color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.primaryC,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
            child: MyText(title: tgl, color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}