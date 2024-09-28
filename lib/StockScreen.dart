import 'package:flutter/material.dart';

class StockScreen extends StatelessWidget {
  final List<Map<String, dynamic>> stockItems = [
    {'item': 'School Dress', 'quantity': 100},
    {'item': 'Books', 'quantity': 500},
    {'item': 'Bags', 'quantity': 200},
    {'item': 'Stationery', 'quantity': 300},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: stockItems.length,
          itemBuilder: (context, index) {
            var item = stockItems[index];
            return Card(
              elevation: 2.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(item['item']),
                subtitle: Text('Available Quantity: ${item['quantity']}'),
                leading: Icon(Icons.inventory),
              ),
            );
          },
        ),
      ),
    );
  }
}
