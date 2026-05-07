import 'package:flutter/material.dart';

class DataPanel extends StatelessWidget {
  final String title;
  final String unitText;
  final Color color;
  final num value;

  const DataPanel({
    super.key,
    required this.title,
    required this.unitText,
    required this.color,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Color(0xFFF9DFFF)),
          color: const Color(0xA6FFFFFF),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Amaranth',
                  color: const Color(0xFFE993DF),
                  fontSize: 18.0,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    value.toStringAsFixed(0),
                    style: TextStyle(
                      fontFamily: 'Amaranth',
                      fontSize: 64.0,
                      height: 1.0,
                      color: color,
                    ),
                  ),
                  Text(
                    unitText,
                    style: TextStyle(
                      fontFamily: 'Amaranth',
                      fontSize: 24.0,
                      height: 1.0,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
