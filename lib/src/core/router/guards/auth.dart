import 'package:beamer/beamer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_in_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_up_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/splash_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/welcome_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/src/features/auth/providers/auth_provider.dart';
import 'package:ser_manos/src/features/news/presentation/news_screen.dart';
import 'package:ser_manos/src/features/profile/presentation/edit_profile_screen.dart';
import 'package:ser_manos/src/features/profile/presentation/profile_screen.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_screen.dart';

part 'generated/auth.g.dart';

@Riverpod(keepAlive: true)
BeamGuard authGuard(Ref ref) {
  return BeamGuard(
    pathPatterns: [
      WelcomeScreen.route,
      VolunteerScreen.route,
      '${VolunteerScreen.route}/:id',
      ProfileScreen.route,
      EditProfileScreen.route,
      NewsScreen.route,
      '${NewsScreen.route}/:id',
    ],
    check: (context, location) {
      return ref.read(authFacadeProvider).isAuthenticated();
    },
    beamToNamed: (origin, target) => SplashScreen.route,
  );
}

@Riverpod(keepAlive: true)
BeamGuard entryGuard(Ref ref) {
  return BeamGuard(
    pathPatterns: [
      SplashScreen.route,
      SignInScreen.route,
      SignUpScreen.route,
    ],
    check: (context, location) {
      return !ref.read(authFacadeProvider).isAuthenticated();
    },
    beamToNamed: (origin, target) => VolunteerScreen.route,
  );
}
