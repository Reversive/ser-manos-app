import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_in_screen.dart';

void main() {
  group('SignInScreen Golden Tests', () {
    testWidgets('matches golden file', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SignInScreen(),
          ),
        ),
      );

      await expectLater(
        find.byType(SignInScreen),
        matchesGoldenFile('goldens/sign_in_screen.png'),
      );
    });

    testWidgets('matches golden file in loading state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: SignInScreen(),
          ),
        ),
      );

      final signInButton = find.text('Iniciar Sesión');
      await tester.tap(signInButton);
      await tester.pump();

      await expectLater(
        find.byType(SignInScreen),
        matchesGoldenFile('goldens/sign_in_screen_loading.png'),
      );
    });
  });
}