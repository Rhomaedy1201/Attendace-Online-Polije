import 'dart:developer';

import 'package:attendace_online_polije/core/utils/date_formatter.dart';
import 'package:attendace_online_polije/features/history/cubit/filter_visibilty_cubit.dart';
import 'package:attendace_online_polije/features/history/cubit/history_cubit.dart';
import 'package:attendace_online_polije/features/history/widgets/filter.dart';
import 'package:attendace_online_polije/features/history/widgets/item_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        title: MyText(
            title: "History",
            color: ColorConstants.whiteC,
            fontSize: 18,
            fontWeight: FontWeight.w700),
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                Filter(screenWidth: screenWidth, screenHeight: screenHeight),
                Gap(Y: 5),
                BlocBuilder<HistoryCubit, HistoryState>(
                  builder: (context, state) {
                    if (state is HistoryLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state is HistorySuccess) {
                      var data = state.history.data;
                      if (data.isEmpty) {
                        return emptyData(screenWidth);
                      }

                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.history.data.length,
                          physics: AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ItemCard(
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              no: index + 1,
                              tgl: DateTime.parse("${data[index].tanggal}")
                                  .simpleDateRevers(),
                              matkul: data[index].jadwal.matkul.nama,
                              waktu: data[index].masuk,
                              status: data[index].status,
                            );
                          },
                        ),
                      );
                    }
                    return emptyData(screenWidth);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Center emptyData(double screenWidth) {
    return Center(
      child: BlocBuilder<FilterVisibiltyCubit, DateTime>(
      builder: (context, dateFilter) {
          return Column(
            children: [
              Gap(Y: 20),
              SizedBox(
                  width: screenWidth * 0.45,
                  child: Image.asset('assets/images/empty_data.png')),
              MyText(
                  title: "Tidak ada History presensi\n pada bulan ${dateFilter.getMonthAndYear()}",
                  fontSize: 15,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600)
            ],
          );
        },
      ),
    );
  }
}
