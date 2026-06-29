import 'package:flutter/material.dart';
import 'package:medilink/models/doctor.dart';
import 'package:medilink/widgets/doctor_card.dart';
import 'package:medilink/widgets/speciality_card.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .05),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search doctors',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Icon(Icons.search, color: Color(0xFF00BFA5)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10),
                children: [
                  SpecialityCard(
                    title: 'Cardiology',
                    icon: Icons.favorite,
                    color: const Color(0xFFE53935),
                  ),
                  SpecialityCard(
                    title: 'Dermatology',
                    icon: Icons.face,
                    color: const Color(0xFFFFA726),
                  ),
                  SpecialityCard(
                    title: 'Neurology',
                    icon: Icons.psychology,
                    color: const Color(0xFF5C6BC0),
                  ),
                  SpecialityCard(
                    title: 'Orthopedic',
                    icon: Icons.accessibility_new,
                    color: const Color(0xFF26A69A),
                  ),
                  SpecialityCard(
                    title: 'Pediatrics',
                    icon: Icons.child_care,
                    color: const Color(0xFF66BB6A),
                  ),
                  SpecialityCard(title: 'ENT', icon: Icons.hearing, color: const Color(0xFF8D6E63)),
                  SpecialityCard(
                    title: 'Gynecology',
                    icon: Icons.pregnant_woman,
                    color: const Color(0xFFEC407A),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    "Available Doctors",
                    style: TextStyle(fontSize: 20, fontWeight: .bold, color: Color(0xFF1E293B)),
                  ),
                  Text(
                    "${doctors.where((e) => e.isAvailable).length} online",
                    style: TextStyle(fontWeight: .w600, color: Color(0xFF00BFA5)),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: doctors.length,
                itemBuilder: (context, index) =>
                    DoctorCard(context: context, doctor: doctors[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
