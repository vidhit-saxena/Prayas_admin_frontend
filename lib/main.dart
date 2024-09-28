import 'package:admin_dashboard/AdminProfileScreen.dart';
import 'package:admin_dashboard/AnnouncementScreen.dart';
import 'package:admin_dashboard/CommunicateScreen.dart';
import 'package:admin_dashboard/ExamManagementScreen.dart';
import 'package:admin_dashboard/FeeManagementScreen.dart';
import 'package:admin_dashboard/InventoryManagementScreen.dart';
import 'package:admin_dashboard/TeacherManagementScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Dashboard',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: AdminDashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.purple,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.person_2),
              iconSize: 30.0,
              onPressed: () 
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminProfileScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: const Text(
                  'Admin Dashboard',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2, // Two buttons per row
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1, // Ensures square shape
                  children: [
                    ManagementButton(
                      title: 'Teacher Management',
                      icon: Icons.person,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TeacherManagementScreen(),
                          ),
                        );
                      },
                    ),
                    // const ManagementButton(title: 'Exam Management'),
                    ManagementButton(
                      title: 'Exam Management',
                      icon: Icons.book,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExamManagementScreen(),
                          ),
                        );
                      },
                    ),
                    ManagementButton(
                      title: 'Fee Management',
                      icon: Icons.currency_rupee,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FeeManagementScreen(),
                          ),
                        );
                      },
                    ),
                    ManagementButton(
                      title: 'Announcement',
                      icon: Icons.campaign,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnnouncementScreen(),
                          ),
                        );
                      },
                    ),
                    ManagementButton(
                      title: 'Communicate',
                      icon: Icons.message,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommunicateScreen(),
                          ),
                        );
                      },
                    ),
                    ManagementButton(
                      title: 'Inventory',
                      icon: Icons.inventory,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  InventoryManagementScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ManagementButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final IconData icon;

  const ManagementButton(
      {required this.title, this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 20),
          textStyle: TextStyle(fontSize: 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
        ),
        // child: Text(title),
        // child: Center(
        //   child: Text(
        //     title,
        //     textAlign: TextAlign.center,
        //     style: const TextStyle(
        //       fontSize: 16,
        //     ),
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32), // Display the icon before the text
            const SizedBox(
              width: 8,
              height: 8,
            ), // Add some spacing between the icon and the text
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16, // Font size reduced for proper centering
              ),
            ),
          ],
        ),
      ),
    );
  }
}






// class AdminDashboard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome'),
//         backgroundColor: Colors.purple,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings),
//             onPressed: () {
//               // Settings action
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Center(
//                 child: Text(
//                   'Admin dashboard',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Expanded(
//                 child: ManagementButton(
//                   title: 'Teacher Management',
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => TeacherManagementScreen()),
//                     );
//                   },
//                 ),
//               ),
//               ManagementButton(title: 'Exam Management'),
//               ManagementButton(title: 'Fee Management'),
//               ManagementButton(title: 'Announcement'),
//               ManagementButton(title: 'Communicate'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }