import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<double> familyExpenses = [0.0, 0.0, 0.0, 0.0]; // Expenses for father, mother, child 1, child 2;
  double totalExpenses = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Витрати сім\'ї'),
      ),
      body: Column(
        children: [
          FamilyExpensesInput(familyExpenses, updateTotalExpenses),
          ExpenseChart(familyExpenses, totalExpenses),
        ],
      ),
    );
  }

  void updateTotalExpenses() {
    double sum = 0.0;
    for (var expense in familyExpenses) {
      sum += expense;
    }
    setState(() {
      totalExpenses = sum;
    });
  }
}

class FamilyExpensesInput extends StatelessWidget {
  final List<double> familyExpenses;
  final Function updateTotalExpenses;

  FamilyExpensesInput(this.familyExpenses, this.updateTotalExpenses);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Витрати батька: ${familyExpenses[0]}'),
        Text('Витрати матері: ${familyExpenses[1]}'),
        Text('Витрати дитини 1: ${familyExpenses[2]}'),
        Text('Витрати дитини 2: ${familyExpenses[3]}'),
        TextField(
          decoration: InputDecoration(labelText: 'Витрати батька'),
          onChanged: (value) {
            familyExpenses[0] = double.parse(value);
            updateTotalExpenses();
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Витрати матері'),
          onChanged: (value) {
            familyExpenses[1] = double.parse(value);
            updateTotalExpenses();
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Витрати дитини 1'),
          onChanged: (value) {
            familyExpenses[2] = double.parse(value);
            updateTotalExpenses();
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Витрати дитини 2'),
          onChanged: (value) {
            familyExpenses[3] = double.parse(value);
            updateTotalExpenses();
          },
        ),
      ],
    );
  }
}

class ExpenseChart extends StatelessWidget {
  final List<double> familyExpenses;
  final double totalExpenses;

  ExpenseChart(this.familyExpenses, this.totalExpenses);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 3.0, // Робимо aspectRatio 1.0, щоб отримати кругову діаграму
        child: PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                color: Colors.blue,
                value: familyExpenses[0],
                title: 'Батько',
              ),
              PieChartSectionData(
                color: Colors.red,
                value: familyExpenses[1],
                title: 'Мати',
              ),
              PieChartSectionData(
                color: Colors.green,
                value: familyExpenses[2],
                title: 'Дитина 1',
              ),
              PieChartSectionData(
                color: Colors.yellow,
                value: familyExpenses[3],
                title: 'Дитина 2',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
