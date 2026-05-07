import 'package:flutter/material.dart';
import 'package:skyair/components/data_panel.dart';

class AirQualityData {
  final double pm10Concentration;
  final double pm25Concentration;
  final double so2Concentration;
  final double noXConcentration;

  AirQualityData({
    required this.pm10Concentration,
    required this.pm25Concentration,
    required this.so2Concentration,
    required this.noXConcentration,
  });
}

class DataDisplay extends StatelessWidget {
  final AirQualityData data;

  const DataDisplay({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        DataPanel(
          title: 'PM 10',
          unitText: '\u00B5g/m\u00B3',
          color: const Color(0xFF74B0D6),
          value: data.pm10Concentration,
        ),
        DataPanel(
          unitText: '\u00B5g/m\u00B3',
          title: 'PM 2.5',
          color: const Color(0xFF9BB38C),
          value: data.pm25Concentration,
        ),
        DataPanel(
          unitText: '\u00B5g/m\u00B3',
          title: 'SO\u2082',
          color: const Color(0xFFE993DF),
          value: data.so2Concentration,
        ),
        DataPanel(
          unitText: '\u00B5g/m\u00B3',
          title: 'NO\u2093',
          color: const Color(0xFF6D6AC3),
          value: data.noXConcentration,
        ),
      ],
    );
  }
}
