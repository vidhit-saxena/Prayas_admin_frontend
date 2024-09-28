import 'package:flutter/material.dart';

class CommunicateScreen extends StatefulWidget {
  @override
  _CommunicateScreenState createState() => _CommunicateScreenState();
}

class _CommunicateScreenState extends State<CommunicateScreen> {
  String? _selectedRecipient;
  final List<String> _recipients = [
    'John Doe',
    'Jane Smith',
    'Mark Williams',
    'Alice Johnson'
  ];
  final List<String> _filteredRecipients = [];
  final _searchController = TextEditingController();
  final _messageController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredRecipients
        .addAll(_recipients); // Initialize filtered list with all recipients
  }

  @override
  void dispose() {
    _searchController.dispose();
    _messageController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    super.dispose();
  }

  // Function to filter the recipient list based on search input
  void _filterRecipients(String query) {
    final filtered = _recipients.where((recipient) {
      return recipient.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _filteredRecipients.clear();
      _filteredRecipients.addAll(filtered);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Communicate with Staff'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select Recipient',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search Recipient',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _filterRecipients,
            ),
            const SizedBox(height: 20),
            // Dropdown for filtered recipients
            DropdownButtonFormField<String>(
              value: _selectedRecipient,
              items: _filteredRecipients.map((recipient) {
                return DropdownMenuItem(
                  value: recipient,
                  child: Text(recipient),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedRecipient = value;
                });
              },
              decoration:
                  const InputDecoration(labelText: 'Choose a staff member'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Send a Personal Message',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _messageController,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Type your message here',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_selectedRecipient != null &&
                    _messageController.text.isNotEmpty) {
                  // Simulate sending a message (you would implement real logic here)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Message sent to $_selectedRecipient!')),
                  );
                  _messageController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Please select a recipient and enter a message.')),
                  );
                }
              },
              child: const Text('Send Message'),
            ),
            const SizedBox(height: 30),
            const Text(
              'Send an Email',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _subjectController,
              decoration: const InputDecoration(labelText: 'Email Subject'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Type your email here',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_selectedRecipient != null &&
                    _subjectController.text.isNotEmpty &&
                    _emailController.text.isNotEmpty) {
                  // Simulate sending an email (you would implement real logic here)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Email sent to $_selectedRecipient!')),
                  );
                  _emailController.clear();
                  _subjectController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Please select a recipient, subject, and enter an email.')),
                  );
                }
              },
              child: const Text('Send Email'),
            ),
          ],
        ),
      ),
    );
  }
}
