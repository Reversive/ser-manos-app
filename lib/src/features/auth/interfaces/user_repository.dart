abstract interface class UserRepository {
  Future<void> postUser(String uuid, String name, String surname);
}
