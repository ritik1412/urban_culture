import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:urban_culture/config/colors.dart';

void main() {
  runApp(const MaterialApp(
    home: LineChartSample2(),
  ));
}

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({super.key});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 0,
              left: 0,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const textStyle = TextStyle(
      fontFamily: 'Epilogue',
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('1D', style: textStyle);
      case 3:
        text = const Text('1W', style: textStyle);
      case 5:
        text = const Text('1M', style: textStyle);
      case 7:
        text = const Text('3M', style: textStyle);
      case 9:
        text = const Text('1Y', style: textStyle);
      default:
        text = const Text('');
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(1, 2),
            FlSpot(2, 5),
            FlSpot(3, 4),
            FlSpot(4, 3),
            FlSpot(5, 4),
            FlSpot(6, 2.5),
            FlSpot(7, 1),
            FlSpot(8, 3),
            FlSpot(9, 2),
            FlSpot(10, 3),
            FlSpot(11, 5),
          ],
          isCurved: true,
          color: kiconcolor,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: false,
          ),
        ),
      ],
    );
  }
}
