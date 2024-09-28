// import 'package:flutter/material.dart';

// class AnnouncementScreen extends StatefulWidget {
//   @override
//   _AnnouncementScreenState createState() => _AnnouncementScreenState();
// }

// class _AnnouncementScreenState extends State<AnnouncementScreen> {
//   final List<Map<String, String>> _announcements = [];
//   final _formKey = GlobalKey<FormState>();
//   String _title = '';
//   String _description = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Announcements'),
//         backgroundColor: Colors.purple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Make a New Announcement',
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     decoration: InputDecoration(labelText: 'Title'),
//                     onSaved: (value) => _title = value!,
//                     validator: (value) =>
//                         value == null || value.isEmpty ? 'Enter a title' : null,
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(labelText: 'Description'),
//                     onSaved: (value) => _description = value!,
//                     validator: (value) => value == null || value.isEmpty
//                         ? 'Enter a description'
//                         : null,
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         _formKey.currentState!.save();
//                         setState(() {
//                           _announcements.add({
//                             'title': _title,
//                             'description': _description,
//                           });
//                         });
//                         _formKey.currentState!.reset();
//                       }
//                     },
//                     child: const Text('Create Announcement'),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Existing Announcements',
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: _announcements.isEmpty
//                   ? const Center(child: Text('No announcements available.'))
//                   : ListView.builder(
//                       itemCount: _announcements.length,
//                       itemBuilder: (context, index) {
//                         var announcement = _announcements[index];
//                         return Card(
//                           child: ListTile(
//                             title: Text(announcement['title']!),
//                             subtitle: Text(announcement['description']!),
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting the deadline date

class AnnouncementScreen extends StatefulWidget {
  @override
  _AnnouncementScreenState createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  final List<Map<String, String>> _announcements = [];
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  DateTime? _deadline;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Make a New Announcement',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    onSaved: (value) => _title = value!,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter a title' : null,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Description'),
                    onSaved: (value) => _description = value!,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Enter a description'
                        : null,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _deadline == null
                              ? 'Select Deadline'
                              : 'Deadline: ${DateFormat.yMMMd().format(_deadline!)}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _selectDeadline(context);
                        },
                        child: const Text('Pick Date'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          _deadline != null) {
                        _formKey.currentState!.save();
                        setState(() {
                          _announcements.add({
                            'title': _title,
                            'description': _description,
                            'deadline': DateFormat.yMMMd().format(_deadline!),
                          });
                        });
                        _formKey.currentState!.reset();
                        setState(() {
                          _deadline = null; // Clear the deadline after submission
                        });
                      }
                    },
                    child: const Text('Create Announcement'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Existing Announcements',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _announcements.isEmpty
                  ? const Center(child: Text('No announcements available.'))
                  : ListView.builder(
                      itemCount: _announcements.length,
                      itemBuilder: (context, index) {
                        var announcement = _announcements[index];
                        return Card(
                          child: ListTile(
                            title: Text(announcement['title']!),
                            subtitle: Text(
                              'Description: ${announcement['description']!}\nDeadline: ${announcement['deadline']!}',
                            ),
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

  Future<void> _selectDeadline(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // Cannot select past dates
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _deadline) {
      setState(() {
        _deadline = picked;
      });
    }
  }
}
