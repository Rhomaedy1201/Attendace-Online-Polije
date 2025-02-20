// ignore_for_file: must_be_immutable

import 'package:attendace_online_polije/core/config/export/index.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer extends StatelessWidget {
  double width, height;
  MyShimmer({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: ColorConstants.shadowC,
        highlightColor: ColorConstants.grayC_200,
        child: Container(
          color: ColorConstants.shadowC,
        )
      ),
    );
  }
}