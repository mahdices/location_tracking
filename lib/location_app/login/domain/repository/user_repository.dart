abstract class UserRepository {
  Future<String> login({
    required String email,
    required String password,
  });
}
