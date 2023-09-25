import 'package:location_tracking/location_app/login/data/datasource/login_datasource.dart';
import 'package:location_tracking/location_app/login/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  LoginDatasource datasource;
  UserRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<String> login(
      {required String email, required String password}) async {
    return datasource.loginWithEmailAndPassword(
        email: email, password: password);
  }
}
