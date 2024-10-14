import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/features/auth/providers/auth_provider.dart';
import 'package:ser_manos/src/features/profile/presentation/complete_profile_screen.dart';
import 'package:ser_manos/src/features/profile/presentation/splash_profile_screen.dart';

class ProfileScreen extends HookConsumerWidget {
  static const String route = '/home/profile';
  static const String routeName = 'profile';
  const ProfileScreen({super.key, this.isCompleted = false});

  final bool isCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);

    return currentUser.when(
      data: (user) => user.completed
          ? const CompleteProfileScreen()
          : const SplashProfileScreen(),
      error: (error, _) => Center(
        child: Text('Error: $error'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
