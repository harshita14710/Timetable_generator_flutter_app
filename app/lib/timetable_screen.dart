import 'package:flutter/material.dart';
import 'dart:math'; // Import dart:math for shuffling
import 'timetable_page.dart';

class TimetableScreen extends StatefulWidget {
  @override
  _TimetableScreenState createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  List<String> subjects = [];
  final TextEditingController _subjectController = TextEditingController();

  void _addSubject(String subject) {
    setState(() {
      subjects.add(subject);
      _subjectController.clear(); // Clear the text field after adding subject
    });
  }

  void _removeSubject(int index) {
    setState(() {
      subjects.removeAt(index);
    });
  }

  void _generateTimetable() {
    if (subjects.isEmpty) {
      return;
    }

    List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];

    Map<String, List<String>> timetable = {};

    // Shuffle subjects list each time
    subjects.shuffle();

    for (var day in days) {
      timetable[day] = [];
      for (int i = 9; i <= 16; i++) {
        String timeSlot = '${i.toString().padLeft(2, '0')}:30';
        String subject =
            (i == 13) ? 'Lunch' : subjects[Random().nextInt(subjects.length)];
        timetable[day]!.add('$subject');
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            TimetablePage(timetable), // Pass timetable to TimetablePage
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable Generator'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Subjects:',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(subjects[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => _removeSubject(index),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Add Subject:',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 200, // Adjust width as needed
                        child: TextField(
                          controller: _subjectController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            hintText: 'Enter subject name',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => _addSubject(_subjectController.text),
                      child: Text('Add'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _generateTimetable,
                  child: Text('Generate Timetable'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
