abstract interface class UserService {
  Future<void> postUser(String uuid, String name, String surname);
}
