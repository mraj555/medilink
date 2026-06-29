import 'package:flutter/material.dart';
import 'package:medilink/models/doctor.dart';
import 'package:medilink/screens/call_screen.dart';

class DoctorCard extends StatelessWidget {
  final BuildContext context;
  final Doctor doctor;

  const DoctorCard({super.key, required this.context, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
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
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(doctor.imageUrl),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Color(0xFF00BFA5).withValues(alpha: .3),
                  width: 2,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    doctor.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: .bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    doctor.speciality,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFFFA726), size: 16),
                      SizedBox(width: 4),
                      Text(
                        doctor.rating.toString(),
                        style: TextStyle(
                          fontWeight: .w600,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      SizedBox(width: 12),
                      Icon(
                        Icons.work_outline,
                        color: Colors.grey[400],
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "${doctor.experience} years",
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                gradient: doctor.isAvailable
                    ? LinearGradient(
                        colors: [Color(0xFF00BFA5), Color(0xFF00D4B5)],
                      )
                    : LinearGradient(
                        colors: [Colors.grey[300]!, Colors.grey[400]!],
                      ),
                borderRadius: .circular(12),
                boxShadow: doctor.isAvailable
                    ? [
                        BoxShadow(
                          color: Color(0xFF00BFA5).withValues(alpha: .3),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: .circular(12),
                  onTap: doctor.isAvailable
                      ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CallScreen(doctor: doctor),
                          ),
                        )
                      : null,
                  child: Padding(
                    padding: .all(12),
                    child: Icon(
                      doctor.isAvailable ? Icons.videocam : Icons.videocam_off,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
