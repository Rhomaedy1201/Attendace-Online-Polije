// ignore_for_file: must_be_immutable
import '../export/index.dart';

const List<Map> dropdownData = [
  {
    'id': 1,
    'name': "2024 / 2025 Ganjil",
  },
  {
    'id': 2,
    'name': "2024 / 2025 Genap",
  },
  {
    'id': 3,
    'name': "2025 / 2026 Ganjil",
  },
  {
    'id': 4,
    'name': "2025 / 2026 Genap",
  },
];

class Filter extends StatelessWidget {
  double screenWidth, screenHeight;
  Filter({super.key, required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    VisibilityDropdownCubit data = context.read<VisibilityDropdownCubit>();
    return Container(
      width: screenWidth,
      height: screenHeight * 0.09,
      decoration: BoxDecoration(
          color: ColorConstants.whiteC,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
                color: ColorConstants.shadowC,
                blurRadius: 5,
                offset: Offset(0, 1))
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(Y: 5),
            MyText(
                title: "Tahun Ajaran",
                fontSize: 12,
                fontWeight: FontWeight.w700),
            Gap(Y: 4),
            BlocBuilder<VisibilityDropdownCubit, String>(
              builder: (context, state) {
                return SizedBox(
                  height: 40,
                  child: Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.5, color: ColorConstants.grayC_500),
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton<int>(
                        value: int.parse(state),
                        hint: MyText(title: "-- silahkan pilih --"),
                        icon: const Icon(Icons.keyboard_arrow_down_sharp, size: 30, color: ColorConstants.grayC_600),
                        isExpanded: true,
                        elevation: 16,
                        style: const TextStyle(color: ColorConstants.textC, fontWeight: FontWeight.w600, fontSize: 13),
                        underline: Container(
                          height: 2,
                          color: Colors.transparent,
                        ),
                        onChanged: (value) {
                          data.toggleVisibility(value.toString());
                        },
                        items: dropdownData.map<DropdownMenuItem<int>>((value) {
                          return DropdownMenuItem<int>(
                            value: value['id'],
                            child: Text(value['name']),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
