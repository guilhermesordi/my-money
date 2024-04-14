import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(  
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            PieChartWidget(30, 40, 30),  // O primeiro gráfico
            PieChartWidget(20, 30, 50),  // Segundo gráfico
            PieChartWidget(10, 20, 70),  // Terceiro gráfico
            PieChartWidget(25, 25, 50),  // Quarto gráfico
          ],
        ),
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  final double value1, value2, value3;

  PieChartWidget(this.value1, this.value2, this.value3);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,  // Define uma altura fixa para o container do gráfico
      width: 200,  // Define uma largura fixa
      child: PieChart(
        PieChartData(
          sectionsSpace: 0, // Espaço entre as seções
          centerSpaceRadius: 30, // Raio do espaço do meio
          startDegreeOffset: -90, // 
          sections: [
            PieChartSectionData(
              color: Colors.blue,
              value: value1,
              showTitle: true,
              title: '${value1.toInt()}%',
              radius: 50,
            ),
            PieChartSectionData(
              color: Colors.red,
              value: value2,
              showTitle: true,
              title: '${value2.toInt()}%',
              radius: 50,
            ),
            PieChartSectionData(
              color: Colors.green,
              value: value3,
              showTitle: true,
              title: '${value3.toInt()}%',
              radius: 50,
            ),
          ],
        ),
      ),
    );
  }
}
