import 'package:flutter/material.dart';

class TimetablePage extends StatelessWidget {
  final Map<String, List<String>> timetable;

  TimetablePage(this.timetable);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generated Timetable'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          // Wrap the SingleChildScrollView with Center widget
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  children: [
                    DataTable(
                      columns: [
                        DataColumn(label: Text('Time')),
                        for (var day in [
                          'Monday',
                          'Tuesday',
                          'Wednesday',
                          'Thursday',
                          'Friday',
                          'Saturday'
                        ])
                          DataColumn(label: Text(day)),
                      ],
                      rows: [
                        for (var time in List.generate(8, (index) => index + 9))
                          DataRow(
                            cells: [
                              DataCell(Text(
                                  '${time.toString().padLeft(2, '0')}:30')),
                              for (var day in [
                                'Monday',
                                'Tuesday',
                                'Wednesday',
                                'Thursday',
                                'Friday',
                                'Saturday'
                              ])
                                DataCell(
                                  Text(timetable[day]![time - 9] ?? '-'),
                                ),
                            ],
                          ),
                      ],
                    ),
                    SizedBox(height: 100), // Add SizedBox below the DataTable
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
