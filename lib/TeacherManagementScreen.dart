import 'package:flutter/material.dart';

class TeacherManagementScreen extends StatefulWidget {
  @override
  _TeacherManagementScreenState createState() =>
      _TeacherManagementScreenState();
}

class _TeacherManagementScreenState extends State<TeacherManagementScreen> {
  List<Map<String, String>> _teachers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Management'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Teachers List',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _teachers.isEmpty
                ? Center(child: Text('No teachers added yet.'))
                : Expanded(
                    child: ListView.builder(
                      itemCount: _teachers.length,
                      itemBuilder: (context, index) {
                        var teacher = _teachers[index];
                        return TeacherButton(
                          name: teacher['name']!,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TeacherDetailsScreen(
                                  teacherName: teacher['name']!,
                                  subjectExpertise: teacher['subject']!,
                                  assignedClasses: teacher['classes']!,
                                  attendanceHistory: teacher['attendance']!,
                                  schedule: teacher['schedule']!,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                // Navigate to AddTeacherScreen and wait for result
                final newTeacher = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTeacherScreen(),
                  ),
                );
                // If a new teacher is added, update the list
                if (newTeacher != null) {
                  setState(() {
                    _teachers.add(newTeacher);
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text('Add New Teacher', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class TeacherButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const TeacherButton({required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          textStyle: TextStyle(fontSize: 20),
        ),
        child: Text(name),
      ),
    );
  }
}

class TeacherDetailsScreen extends StatelessWidget {
  final String teacherName;
  final String subjectExpertise;
  final String assignedClasses;
  final String attendanceHistory;
  final String schedule;

  const TeacherDetailsScreen({
    required this.teacherName,
    required this.subjectExpertise,
    required this.assignedClasses,
    required this.attendanceHistory,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$teacherName Details'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Teacher Name: $teacherName',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Subject Expertise: $subjectExpertise'),
            Text('Assigned Classes: $assignedClasses'),
            Text('Attendance History: $attendanceHistory'),
            Text('Schedule: $schedule'),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class AddTeacherScreen extends StatefulWidget {
  @override
  _AddTeacherScreenState createState() => _AddTeacherScreenState();
}

class _AddTeacherScreenState extends State<AddTeacherScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _subject = '';
  String _classes = '';
  String _attendance = '';
  String _schedule = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Teacher'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Teacher Name'),
                onSaved: (value) => _name = value!,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Subject Expertise'),
                onSaved: (value) => _subject = value!,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter subject' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Assigned Classes'),
                onSaved: (value) => _classes = value!,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter classes' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Attendance History'),
                onSaved: (value) => _attendance = value!,
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter attendance history'
                    : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Schedule'),
                onSaved: (value) => _schedule = value!,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter schedule' : null,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, {
                      'name': _name,
                      'subject': _subject,
                      'classes': _classes,
                      'attendance': _attendance,
                      'schedule': _schedule,
                    });
                  }
                },
                child: Text('Add Teacher'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}