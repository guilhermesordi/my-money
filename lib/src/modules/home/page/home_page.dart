import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle Financeiro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle Financeiro'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Seção de resumo do saldo
            Card(
              margin: const EdgeInsets.all(16),
              child: ListTile(
                title: Text('Saldo Total', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('R\$ 5.450,00', style: TextStyle(color: Colors.green, fontSize: 24)),
              ),
            ),
            // Lista horizontal de transações recentes
            Container(
              height: 120, // Altura para o ListView
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 160, // Largura para cada item
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.shopping_cart),
                            Text('Compra #${index + 1}'),
                            Text('R\$ ${150 * (index + 1)},00'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Gráfico de pizza
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 200, // Altura para o gráfico de pizza
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 0, // Espaço entre as seções
                    centerSpaceRadius: 40, // Raio do espaço central
                    sections: [
                      PieChartSectionData(
                        color: Colors.red,
                        value: 40,
                        title: '40%',
                        showTitle: false,
                        radius: 50,
                      ),
                      PieChartSectionData(
                        color: Colors.blue,
                        value: 30,
                        title: '30%',
                        showTitle: false,
                        radius: 50,
                      ),
                      PieChartSectionData(
                        color: Colors.green,
                        value: 30,
                        title: '30%',
                        showTitle: false,
                        radius: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
