import 'package:attendace_online_polije/features/history/widgets/filter.dart';
import 'package:attendace_online_polije/features/history/widgets/item_card.dart';

import '../export/index.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaHelper.getScreenWidth(context);
    final double screenHeight = MediaHelper.getScreenHeight(context);
    return Scaffold(
      backgroundColor: ColorConstants.backgroundC,
      appBar: AppBar(
        title: MyText(title: "History", color: ColorConstants.whiteC, fontSize: 18, fontWeight: FontWeight.w700),
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
                Gap(Y: 5),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ItemCard(screenWidth: screenWidth, screenHeight: screenHeight),
                        ItemCard(screenWidth: screenWidth, screenHeight: screenHeight),
                        ItemCard(screenWidth: screenWidth, screenHeight: screenHeight),
                        ItemCard(screenWidth: screenWidth, screenHeight: screenHeight),
                        ItemCard(screenWidth: screenWidth, screenHeight: screenHeight),
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}