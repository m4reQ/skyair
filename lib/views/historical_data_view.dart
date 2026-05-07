import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skyair/components/data_display.dart';
import 'package:skyair/components/historical_data_details.dart';
import 'package:skyair/components/historical_data_list_item.dart';

class HistoricalDataView extends StatelessWidget {
  const HistoricalDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/logo.svg'),
                Text(
                  'Check historical data',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 40.0),
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                decoration: BoxDecoration(
                  color: Color(0xA6FFFFFF),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: ListView.separated(
                    itemCount: 20,
                    separatorBuilder: (context, index) =>
                        Divider(height: 10.0, color: Color(0x00000000)),
                    itemBuilder: (context, index) => HistoricalDataListItem(
                      date: DateTime.now().subtract(Duration(days: index + 1)),
                      onExpand: (date) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          barrierColor: Colors.transparent,
                          builder: (context) => BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Center(
                                child: HistoricalDataDetails(
                                  date: date,
                                  data: AirQualityData(
                                    pm10Concentration: 10.0,
                                    pm25Concentration: 25.0,
                                    so2Concentration: 3.0,
                                    noXConcentration: 21.37,
                                  ),
                                  onClose: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
