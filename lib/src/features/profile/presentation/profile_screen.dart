import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/src/features/profile/presentation/complete_profile_screen.dart';
import 'package:ser_manos/src/features/profile/presentation/splash_profile_screen.dart';

class ProfileScreen extends HookWidget {
  static const String route = '/home/profile';
  static const String routeName = 'profile';
  const ProfileScreen({super.key, this.isCompleted = true});

  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return isCompleted
        ? const CompleteProfileScreen()
        : const SplashProfileScreen();
  }
}
