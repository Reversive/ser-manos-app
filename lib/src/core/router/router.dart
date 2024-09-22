import 'package:beamer/beamer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/src/features/auth/presentation/beam/sign_in_location.dart';
import 'package:ser_manos/src/features/auth/presentation/beam/sign_up_location.dart';
import 'package:ser_manos/src/features/auth/presentation/beam/splash_location.dart';
import 'package:ser_manos/src/features/auth/presentation/beam/welcome_location.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_in_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_up_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/splash_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/welcome_screen.dart';
import 'package:ser_manos/src/features/home/presentation/beam/home_location.dart';
import 'package:ser_manos/src/features/home/presentation/home_screen.dart';
part 'router.g.dart';

@Riverpod(keepAlive: true)
Raw<BeamerDelegate> routerDelegate(RouterDelegateRef ref) {
  return BeamerDelegate(
    initialPath: "/splash",
    locationBuilder: (routeInfo, _) {
      final path = routeInfo.uri.path;
      if (path.contains(SplashScreen.route)) {
        return SplashLocation();
      } else if (path.contains(WelcomeScreen.route)) {
        return WelcomeLocation();
      } else if (path.contains(SignInScreen.route)) {
        return SignInLocation();
      } else if (path.contains(SignUpScreen.route)) {
        return SignUpLocation();
      } else if (path.contains(HomeScreen.route)) {
        return HomeLocation(routeInfo: routeInfo);
      } else {
        return NotFound();
      }
    },
  );
}
