import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MonthlyDataChart extends StatelessWidget {
  final List<charts.Series<OrdinalSales, String>> seriesList;

  MonthlyDataChart({required this.seriesList});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: charts.BarChart(
              seriesList,
              animate: true,
              barRendererDecorator: charts.BarLabelDecorator<String>(
                labelPosition: charts.BarLabelPosition.outside,
                labelPadding: 8,
                insideLabelStyleSpec: charts.TextStyleSpec(
                  color: charts.Color.black,
                  fontWeight: 'bold',
                  fontSize: 12,
                ),
                outsideLabelStyleSpec: charts.TextStyleSpec(
                  color: charts.Color.black,
                  fontWeight: 'bold',
                  fontSize: 12,
                ),
              ),
              domainAxis: charts.OrdinalAxisSpec(
                renderSpec: charts.SmallTickRendererSpec(
                  labelRotation: 60,
                  labelStyle: charts.TextStyleSpec(
                    color: charts.Color.fromHex(code: '#666666'),
                    fontWeight: 'bold',
                    fontSize: 10,
                  ),
                ),
              ),
              primaryMeasureAxis: charts.NumericAxisSpec(
                renderSpec: charts.GridlineRendererSpec(
                  lineStyle: charts.LineStyleSpec(
                    color: charts.Color.fromHex(code: '#CCCCCC'),
                  ),
                ),
                tickProviderSpec: charts.BasicNumericTickProviderSpec(
                  desiredTickCount: 5,
                ),
                tickFormatterSpec: charts.BasicNumericTickFormatterSpec(
                  (value) => '\$${value?.toInt()}',
                ),
              ),
              behaviors: [
                charts.ChartTitle(
                  'Sales Performance',
                  behaviorPosition: charts.BehaviorPosition.top,
                  titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                  titleStyleSpec: charts.TextStyleSpec(
                    color: charts.Color.fromHex(code: '#666666'),
                    fontWeight: 'bold',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static List<charts.Series<OrdinalSales, String>> createSampleData() {
    final data = [
      OrdinalSales('Jan', 25),
      OrdinalSales('Feb', 32),
      OrdinalSales('Mar', 41),
      OrdinalSales('Apr', 28),
    
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class OrdinalSales {
  final String month;
  final int sales;

  OrdinalSales(this.month, this.sales);
}