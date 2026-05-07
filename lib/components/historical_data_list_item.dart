import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HistoricalDataListItem extends StatelessWidget {
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
  final void Function(DateTime date) onExpand;

  const HistoricalDataListItem({
    super.key,
    required this.date,
    required this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF1F2FF),
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Row(
        spacing: 15.0,
        children: [
          SvgPicture.asset('assets/jebnik.svg'),
          Expanded(
            child: Text(
              '${date.day} ${_months[date.month]} ${date.year}',
              style: TextStyle(
                fontFamily: 'Amaranth',
                color: Color(0xFF77B6CD),
                fontSize: 18.0,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              onExpand(date);
            },
            icon: SvgPicture.asset('assets/see_more_icon.svg'),
          ),
        ],
      ),
    );
  }
}
