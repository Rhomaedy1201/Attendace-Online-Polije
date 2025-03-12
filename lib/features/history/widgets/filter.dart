// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:attendace_online_polije/core/utils/date_formatter.dart';
import 'package:attendace_online_polije/features/history/cubit/filter_visibilty_cubit.dart';
import 'package:attendace_online_polije/features/history/cubit/history_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../export/index.dart';

class Filter extends StatelessWidget {
  double screenWidth, screenHeight;
  Filter({super.key, required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
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
            MyText(title: "Filter", fontSize: 12, fontWeight: FontWeight.w700),
            Gap(Y: 4),
            BlocBuilder<FilterVisibiltyCubit, DateTime>(
              builder: (context, dateFilter) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      DateTime selectedDate = dateFilter;
                      showCupertinoModalPopup(
                        context: context,
                        builder: (_) => Container(
                          height: 400,
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 300,
                                child: CupertinoDatePicker(
                                  initialDateTime: dateFilter,
                                  maximumDate: DateTime.now(),
                                  maximumYear: DateTime.now().year,
                                  minimumYear: 2025,
                                  mode: CupertinoDatePickerMode.monthYear,
                                  onDateTimeChanged: (val) {
                                    selectedDate = val;
                                  },
                                ),
                              ),
                              CupertinoButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  context.read<FilterVisibiltyCubit>().setDateTime(selectedDate);
                                  context.read<HistoryCubit>().getHistory(selectedDate);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.5, color: ColorConstants.grayC_500),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              title: dateFilter.getMonthAndYear(),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                            const Icon(FluentIcons.calendar_20_filled,
                                size: 24),
                          ],
                        ),
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
