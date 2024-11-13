import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:ser_manos/src/features/auth/interfaces/auth_repository.dart';
import 'package:ser_manos/src/features/auth/models/auth_exception.dart';
import 'package:ser_manos/src/features/auth/persistence/auth_repository_impl.dart';

import 'auth_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<fb.FirebaseAuth>(),
  MockSpec<FirebaseFirestore>(),
  MockSpec<fb.UserCredential>(),
  MockSpec<fb.User>(),
  MockSpec<DocumentReference>(),
  MockSpec<DocumentSnapshot>(),
  MockSpec<CollectionReference>(),
])
void main() {
  late fb.FirebaseAuth mockAuth;
  late FirebaseFirestore mockFirestore;
  late AuthRepository<fb.UserCredential> authRepository;
  late fb.UserCredential mockUserCredential;
  late fb.User mockUser;
  late DocumentReference<Map<String, dynamic>> mockDocRef;
  late CollectionReference<Map<String, dynamic>> mockCollectionRef;

  setUp(() {
    mockAuth = MockFirebaseAuth();
    mockFirestore = MockFirebaseFirestore();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    mockDocRef = MockDocumentReference();
    mockCollectionRef = MockCollectionReference();

    authRepository = AuthRepositoryImpl(
      auth: mockAuth,
      store: mockFirestore,
    );

    when(mockUserCredential.user).thenReturn(mockUser);
    when(mockUser.uid).thenReturn('test-uid');
    when(mockFirestore.collection('users')).thenReturn(mockCollectionRef);
    when(mockCollectionRef.doc(any)).thenReturn(mockDocRef);
  });

  group('AuthRepository sign in:::', () {
    test('successful sign in', () async {
      when(mockAuth.signInWithEmailAndPassword(
        email: 'test@test.com',
        password: 'password123',
      )).thenAnswer((_) async => mockUserCredential);

      await expectLater(
        authRepository.signIn('test@test.com', 'password123'),
        completes,
      );
    });

    test('throws AuthException on wrong password', () async {
      when(mockAuth.signInWithEmailAndPassword(
        email: 'test@test.com',
        password: 'wrongpassword',
      )).thenThrow(
        fb.FirebaseAuthException(code: 'wrong-password'),
      );

      expect(
        () => authRepository.signIn('test@test.com', 'wrongpassword'),
        throwsA(
          isA<AuthException>().having(
            (e) => e.message,
            'message',
            'Usuario o contraseña incorrectos',
          ),
        ),
      );
    });

    test('throws AuthException on user not found', () async {
      when(mockAuth.signInWithEmailAndPassword(
        email: 'nonexistent@test.com',
        password: 'password123',
      )).thenThrow(
        fb.FirebaseAuthException(code: 'user-not-found'),
      );

      expect(
        () => authRepository.signIn('nonexistent@test.com', 'password123'),
        throwsA(
          isA<AuthException>().having(
            (e) => e.message,
            'message',
            'Usuario o contraseña incorrectos',
          ),
        ),
      );
    });
  });

  group('AuthRepository sign up:::', () {
    test('successful sign up', () async {
      when(mockAuth.createUserWithEmailAndPassword(
        email: 'new@test.com',
        password: 'password123',
      )).thenAnswer((_) async => mockUserCredential);

      final result = await authRepository.signUp(
        'new@test.com',
        'password123',
      );

      expect(result, equals(mockUserCredential));
    });

    test('throws AuthException on email in use', () async {
      when(mockAuth.createUserWithEmailAndPassword(
        email: 'existing@test.com',
        password: 'password123',
      )).thenThrow(
        fb.FirebaseAuthException(code: 'email-already-in-use'),
      );

      expect(
        () => authRepository.signUp('existing@test.com', 'password123'),
        throwsA(
          isA<AuthException>().having(
            (e) => e.message,
            'message',
            'Email en uso',
          ),
        ),
      );
    });

    test('throws AuthException on weak password', () async {
      when(mockAuth.createUserWithEmailAndPassword(
        email: 'test@test.com',
        password: 'weak',
      )).thenThrow(
        fb.FirebaseAuthException(code: 'weak-password'),
      );

      expect(
        () => authRepository.signUp('test@test.com', 'weak'),
        throwsA(
          isA<AuthException>().having(
            (e) => e.message,
            'message',
            'Contraseña débil',
          ),
        ),
      );
    });
  });

  group('AuthRepository get current user:::', () {
    test('throws exception when no current user', () {
      when(mockAuth.currentUser).thenReturn(null);

      expect(
        () => authRepository.getCurrentUser(),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('AuthRepository sign out:::', () {
    test('successful sign out', () async {
      when(mockAuth.signOut()).thenAnswer((_) async {});

      await expectLater(
        authRepository.signOut(),
        completes,
      );
    });
  });
}
