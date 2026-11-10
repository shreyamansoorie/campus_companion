import 'package:flutter/material.dart';
import '../models/student.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final List<Student> students = [
    Student(rollNumber: '102303001', name: 'Asha', attended: 18, missed: 4),
    Student(rollNumber: '102303002', name: 'Ravi', attended: 15, missed: 5),
    Student(rollNumber: '102303003', name: 'Meera', attended: 12, missed: 8),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: students.length,
      itemBuilder: (context, i) {
        final s = students[i];
        final note = s.percentage >= 75
            ? 'Can skip ${s.canSkip} more'
            : 'Attend ${s.mustAttend} in a row to reach 75%';
        return Card(
          child: ListTile(
            isThreeLine: true,
            leading: CircleAvatar(child: Text(s.name[0])),
            title: Text('${s.name} (${s.rollNumber})'),
            subtitle: Text(
              'Attended ${s.attended} • Missed ${s.missed} • Total ${s.total}\n$note',
            ),
            trailing: Text('${s.percentage.toStringAsFixed(1)}%'),
          ),
        );
      },
    );
  }
}