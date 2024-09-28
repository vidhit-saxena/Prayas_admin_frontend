import 'package:flutter/material.dart';

class FeeManagementScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _students = [
    {
      'name': 'John Doe',
      'class': 'Grade 10',
      'status': 'Paid',
      'dueDate': '2024-10-01',
    },
    {
      'name': 'Jane Smith',
      'class': 'Grade 11',
      'status': 'Unpaid',
      'dueDate': '2024-10-15',
    },
    {
      'name': 'Alice Johnson',
      'class': 'Grade 12',
      'status': 'Partially Paid',
      'dueDate': '2024-10-10',
    },
    // Add more students
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fee Management'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Students Fee Status',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _students.length,
                itemBuilder: (context, index) {
                  var student = _students[index];
                  return Card(
                    child: ListTile(
                      title: Text('${student['name']} (${student['class']})'),
                      subtitle: Text(
                        'Fee Status: ${student['status']}\nDue Date: ${student['dueDate']}',
                      ),
                      trailing: student['status'] == 'Paid'
                          ? Icon(Icons.check_circle, color: Colors.green)
                          : Icon(Icons.error, color: Colors.red),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
