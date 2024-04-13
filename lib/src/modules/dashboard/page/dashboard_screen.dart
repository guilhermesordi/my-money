import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.green,
                      value: 40, // Valor que representa a parte preenchida do gráfico
                      title: '40%',
                      radius: 50, // O raio do gráfico de setores
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      color: Colors.grey,
                      value: 60, // Valor que representa a parte restante do gráfico
                      title: '60%',
                      radius: 50,
                      showTitle: false,
                    ),
                  ],
                ),
              ),
            ),
            // Outros widgets para o resto do conteúdo do dashboard...
          ],
        ),
      ),
    );
  }
}
