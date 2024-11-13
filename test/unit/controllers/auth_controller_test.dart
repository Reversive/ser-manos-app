import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:ser_manos/src/features/auth/controllers/auth_controller.dart';
import 'package:ser_manos/src/features/auth/interfaces/auth_service.dart';
import 'package:mockito/annotations.dart';
import 'package:ser_manos/src/features/auth/models/auth_state.dart';
import 'package:ser_manos/src/features/auth/providers/auth_provider.dart';

import 'auth_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthService>()])
void main() {
  late AuthService mockAuthService;
  late ProviderContainer container;

  setUp(() {
    mockAuthService = MockAuthService();
    container = ProviderContainer(
      overrides: [
        authServiceProvider.overrideWithValue(mockAuthService),
      ],
    );
  });

  group('AuthController:::', () {
    test('initial state is AuthState.initial', () {
      final authController = container.read(authControllerProvider);
      expect(authController, const AuthState.initial());
    });
  });

  group('Sign in:::', () {
    test('successful sign in changes state to authenticated', () async {
      when(mockAuthService.signIn(
        email: 'test@test.com',
        password: 'password123',
      )).thenAnswer((_) async {});

      final controller = container.read(authControllerProvider.notifier);
      await controller.signIn(
        email: 'test@test.com',
        password: 'password123',
      );

      expect(
        container.read(authControllerProvider),
        const AuthState.authenticated(),
      );
    });

    test('failed sign in changes state to unauthenticated with error',
        () async {
      when(mockAuthService.signIn(
        email: 'test@test.com',
        password: 'wrong',
      )).thenThrow('Invalid credentials');

      final controller = container.read(authControllerProvider.notifier);
      await controller.signIn(
        email: 'test@test.com',
        password: 'wrong',
      );

      expect(
        container.read(authControllerProvider),
        const AuthState.unauthenticated(message: 'Invalid credentials'),
      );
    });
  });

  group('Sign up:::', () {
    test('successful sign up changes state to authenticated', () async {
      when(mockAuthService.signUp(
        email: 'test@test.com',
        password: 'password123',
        name: 'John',
        surname: 'Doe',
      )).thenAnswer((_) async {});

      final controller = container.read(authControllerProvider.notifier);
      await controller.signUp(
        email: 'test@test.com',
        password: 'password123',
        name: 'John',
        surname: 'Doe',
      );

      expect(
        container.read(authControllerProvider),
        const AuthState.authenticated(),
      );
    });
  });

  group('Sign out:::', () {
    test('sign out changes state to unauthenticated', () async {
      when(mockAuthService.signOut()).thenAnswer((_) async {});

      final controller = container.read(authControllerProvider.notifier);
      await controller.signOut();

      expect(
        container.read(authControllerProvider),
        const AuthState.unauthenticated(),
      );
    });
  });
}
