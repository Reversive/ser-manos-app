import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/profile/presentation/complete_profile_screen.dart';
import 'package:ser_manos/src/features/profile/presentation/splash_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const String route = '/home/profile';
  static const String routeName = 'profile';
  const ProfileScreen({super.key, this.isCompleted = true});

  final bool isCompleted;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.isCompleted
        ? const CompleteProfileScreen()
        : const SplashProfileScreen();
  }
}
