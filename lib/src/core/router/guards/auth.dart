import 'package:beamer/beamer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/src/features/auth/controllers/auth_controller.dart';
import 'package:ser_manos/src/features/auth/models/auth_state.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_in_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/welcome_screen.dart';
import 'package:ser_manos/src/features/home/presentation/home_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/auth.g.dart';

@Riverpod(keepAlive: true)
BeamGuard authGuard(Ref ref) {
  return BeamGuard(
    pathPatterns: [
      WelcomeScreen.route,
      RegExp(HomeScreen.route),
    ],
    check: (context, location) {
      final authState = ref.read(authControllerProvider);
      return authState.isAuthenticated;
    },
    beamToNamed: (origin, target) => SignInScreen.route,
  );
}
