import 'package:flutter/material.dart';
import 'package:medilink/models/doctor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Doctor> doctors = Doctor.getDoctors();
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("Find Your Doctor"),
            SizedBox(height: 4),
            Text(
              "Book Consultation now",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Color(0xFF00BFA5).withValues(alpha: .1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_outlined),
              color: Color(0xFF00BFA5),
            ),
          ),
        ],
      ),
      body: SafeArea(child: Column(children: [])),
    );
  }
}
