// import 'package:flutter/material.dart';

// class AdminProfileScreen extends StatelessWidget {
//   // Example admin data
//   final Map<String, String> _adminDetails = {
//     'Name': 'John Doe',
//     'Email': 'johndoe@example.com',
//     'Phone Number': '+1 123 456 7890',
//     'Address': '1234  Street, Jaipur, India',
//     'Designation': 'Principal',
//     'School Name': 'GRV School',
//     'School Address': '4567  Street, Jaipur, India',
//     'School Code': 'SHS1234',
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         backgroundColor: Colors.purple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Center(
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: AssetImage(
//                     'assets/profile_pic.png'), // Replace with actual image path
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Center(
//               child: Text(
//                 'Admin Details',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _adminDetails.length,
//                 itemBuilder: (context, index) {
//                   String key = _adminDetails.keys.elementAt(index);
//                   String value = _adminDetails[key]!;
//                   return Card(
//                     elevation: 2.0,
//                     child: ListTile(
//                       leading: Icon(
//                           _getIconForKey(key)), // Dynamic icon based on field
//                       title: Text(key),
//                       subtitle: Text(value),
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

//   // Helper method to get the appropriate icon based on the key
//   IconData _getIconForKey(String key) {
//     switch (key) {
//       case 'Name':
//         return Icons.person;
//       case 'Email':
//         return Icons.email;
//       case 'Phone Number':
//         return Icons.phone;
//       case 'Address':
//         return Icons.home;
//       case 'Designation':
//         return Icons.work;
//       case 'School Name':
//         return Icons.school;
//       case 'School Address':
//         return Icons.location_on;
//       case 'School Code':
//         return Icons.code;
//       default:
//         return Icons.info;
//     }
//   }
// }

import 'package:flutter/material.dart';

class AdminProfileScreen extends StatelessWidget {
  // Example admin data
  final Map<String, String> _adminDetails = {
    'Name': 'John Doe',
    'Email': 'johndoe@example.com',
    'Phone Number': '+1 123 456 7890',
    'Address': '1234 Street, Jaipur, India',
    'Designation': 'Principal',
    'School Name': 'GRV School',
    'School Address': '4567 Street, Jaipur, India',
    'School Phone Number': '+91 987 654 3210',
    'School Email': 'contact@grvschool.com',
    'School Code': 'SHS1234',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/profile_pic.png'), // Replace with actual image path
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Admin Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _adminDetails.length,
                itemBuilder: (context, index) {
                  String key = _adminDetails.keys.elementAt(index);
                  String value = _adminDetails[key]!;
                  return Card(
                    elevation: 2.0,
                    child: ListTile(
                      leading: Icon(
                          _getIconForKey(key)), // Dynamic icon based on field
                      title: Text(key),
                      subtitle: Text(value),
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

  // Helper method to get the appropriate icon based on the key
  IconData _getIconForKey(String key) {
    switch (key) {
      case 'Name':
        return Icons.person;
      case 'Email':
        return Icons.email;
      case 'Phone Number':
        return Icons.phone_android;
      case 'Address':
        return Icons.home;
      case 'Designation':
        return Icons.work;
      case 'School Name':
        return Icons.school;
      case 'School Address':
        return Icons.location_on;
      case 'School Code':
        return Icons.code;
      case 'School Phone Number':
        return Icons.phone;
      case 'School Email':
        return Icons.email_outlined;
      default:
        return Icons.info;
    }
  }
}
