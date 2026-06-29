import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medilink/models/doctor.dart';
import 'package:medilink/utils/zego_config.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallScreen extends StatelessWidget {
  final Doctor doctor;

  const CallScreen({super.key, required this.doctor});

  String get userID => 'patient_${Random().nextInt(10000)}';

  String get userName => 'Dear Pro';

  String get callID =>
      'consultation_${doctor.id}_${DateTime.now().millisecondsSinceEpoch}';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: ZegoConfig.appID,
        appSign: ZegoConfig.appSign,
        callID: callID,
        userID: userID,
        userName: userName,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..topMenuBar = ZegoCallTopMenuBarConfig(
            isVisible: true,
            title: doctor.name,
          )
          ..avatarBuilder = (context, size, user, extraInfo) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(doctor.imageUrl),
                  fit: .cover,
                ),
                border: .all(color: Color(0xFF00BFA5), width: 3),
              ),
            );
          }
          ..audioVideoView = ZegoCallAudioVideoViewConfig(
            showSoundWavesInAudioMode: true,
            useVideoViewAspectFill: true,
            foregroundBuilder: (context, size, user, extraInfo) {
              return Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: .symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: .5),
                    borderRadius: .circular(20),
                  ),
                  child: Row(
                    mainAxisSize: .min,
                    children: [
                      Icon(Icons.circle, color: Color(0xFF00BFA5), size: 8),
                      SizedBox(width: 6),
                      Text(
                        user?.name ?? 'Unknown',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: .w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ),
    );
  }
}
