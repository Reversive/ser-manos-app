import 'package:beamer/beamer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/src/core/router/guards/auth.dart';
import 'package:ser_manos/src/features/auth/presentation/beam/sign_in_location.dart';
import 'package:ser_manos/src/features/auth/presentation/beam/sign_up_location.dart';
import 'package:ser_manos/src/features/auth/presentation/beam/splash_location.dart';
import 'package:ser_manos/src/features/auth/presentation/beam/welcome_location.dart';
import 'package:ser_manos/src/features/home/presentation/beam/home_location.dart';
part 'generated/router.g.dart';

@Riverpod(keepAlive: true)
Raw<BeamerDelegate> routerDelegate(Ref ref) {
  final authGuard = ref.read(authGuardProvider);
  return BeamerDelegate(
    initialPath: "/splash",
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        SplashLocation(),
        WelcomeLocation(),
        SignInLocation(),
        SignUpLocation(),
        HomeLocation(),
      ],
    ).call,
    guards: [
      authGuard,
    ],
  );
}
