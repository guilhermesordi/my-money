import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle Financeiro'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // configurações.
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Bem-vindo, Usuário!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Resumo do Saldo',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'R\$ 5.450,00',
                      style: TextStyle(fontSize: 28, color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Despesas Recentes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart, size: 40),
                          Text('Compra #${index + 1}'),
                          Text('R\$ ${(index + 1) * 150},00'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: [
                    PieChartSectionData(
                      color: Colors.red,
                      value: 40,
                      title: '40%',
                      showTitle: true,
                      radius: 50,
                    ),
                    PieChartSectionData(
                      color: Colors.blue,
                      value: 30,
                      title: '30%',
                      showTitle: true,
                      radius: 50,
                    ),
                    PieChartSectionData(
                      color: Colors.green,
                      value: 30,
                      title: '30%',
                      showTitle: true,
                      radius: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
