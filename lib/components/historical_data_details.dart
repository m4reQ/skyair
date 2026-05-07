import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skyair/components/data_display.dart';

class HistoricalDataDetails extends StatelessWidget {
  static const List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final DateTime date;
  final AirQualityData data;
  final void Function() onClose;

  const HistoricalDataDetails({
    super.key,
    required this.onClose,
    required this.date,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Container(
      padding: EdgeInsets.all(15.0),
      width: double.infinity,
      height: mq.size.height * 0.7,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Color(0x40000000),
            offset: Offset(0.0, 4.0),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: AlignmentGeometry.topEnd,
            child: IconButton(
              onPressed: onClose,
              icon: SvgPicture.asset('assets/close_icon.svg'),
            ),
          ),
          Text(
            'Historical data',
            style: TextStyle(
              fontFamily: 'Sansita Swashed',
              color: Color(0xFF77B6CD),
              fontSize: 30.0,
            ),
          ),
          Text(
            '${date.day} ${_months[date.month]} ${date.year}',
            style: TextStyle(
              fontFamily: 'Amaranth',
              color: Color(0xFF949494),
              fontSize: 18.0,
            ),
          ),
          Expanded(
            child: Center(child: DataDisplay(data: data)),
          ),
        ],
      ),
    );
  }
}
