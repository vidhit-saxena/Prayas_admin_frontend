import 'package:flutter/material.dart';

class ExamManagementScreen extends StatelessWidget {
  final List<Map<String, dynamic>> exams = [
    {
      'examName': 'Mid-Semester-1',
      'subjects': [
        {'subject': 'Math', 'date': '12-Oct-2024'},
        {'subject': 'Physics', 'date': '14-Oct-2024'},
        {'subject': 'Chemistry', 'date': '16-Oct-2024'},
      ],
    },
    {
      'examName': 'Mid-Semester-2',
      'subjects': [
        {'subject': 'Math', 'date': '12-Oct-2024'},
        {'subject': 'Physics', 'date': '14-Oct-2024'},
        {'subject': 'Chemistry', 'date': '16-Oct-2024'},
      ],
    },
    {
      'examName': 'Final Semester',
      'subjects': [
        {'subject': 'Math', 'date': '10-Dec-2024'},
        {'subject': 'Physics', 'date': '12-Dec-2024'},
        {'subject': 'Chemistry', 'date': '14-Dec-2024'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Management'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: exams.length,
          itemBuilder: (context, index) {
            final exam = exams[index];
            return ExpansionTile(
              title: Text(
                exam['examName'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: exam['subjects'].map<Widget>((subject) {
                return ListTile(
                  title: Text(subject['subject']),
                  subtitle: Text('Exam Date: ${subject['date']}'),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}