import 'package:ser_manos/src/features/auth/interfaces/user_repository.dart';
import 'package:ser_manos/src/features/auth/interfaces/user_service.dart';

class UserServiceImpl implements UserService {
  const UserServiceImpl({required this.userRepository});
  final UserRepository userRepository;

  @override
  Future<void> postUser(String uuid, String name, String surname) {
    return userRepository.postUser(uuid, name, surname);
  }
}