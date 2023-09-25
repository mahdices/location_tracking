import 'package:location_tracking/domain/repository/user_repository.dart';

class LoginUserUseCase {
  final UserRepository repository;

  LoginUserUseCase({required this.repository});

  Future<String> login({required String email, required String password}) {
    return repository.login(email: email, password: password);
  }
}
