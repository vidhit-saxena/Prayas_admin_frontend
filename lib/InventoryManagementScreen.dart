// import 'package:flutter/material.dart';

// class InventoryManagementScreen extends StatelessWidget {
//   // Example list of inventory items and their quantities
//   final List<Map<String, dynamic>> _inventoryItems = [
//     {'name': 'Uniform', 'quantity': 120},
//     {'name': 'Books', 'quantity': 350},
//     {'name': 'Bags', 'quantity': 150},
//     {'name': 'Shoes', 'quantity': 100},
//     {'name': 'Notebooks', 'quantity': 500},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Inventory Management'),
//         backgroundColor: Colors.purple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Text(
//               'Items List',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _inventoryItems.length,
//                 itemBuilder: (context, index) {
//                   final item = _inventoryItems[index];
//                   return Card(
//                     elevation: 2.0,
//                     child: ListTile(
//                       leading: Icon(Icons.inventory),
//                       title: Text(item['name'],
//                           style: const TextStyle(fontSize: 18)),
//                       trailing: Text(
//                         'Quantity: ${item['quantity']}',
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:admin_dashboard/StockScreen.dart';
import 'package:admin_dashboard/ProcurementScreen.dart';

class InventoryManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StockScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Stock'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProcurementScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Procurement'),
            ),
          ],
        ),
      ),
    );
  }
}
