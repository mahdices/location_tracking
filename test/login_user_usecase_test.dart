import 'package:flutter_test/flutter_test.dart';
import 'package:location_tracking/data/datasource/login_datasource.dart';
import 'package:location_tracking/domain/usecase/login_user_usecase.dart';
import 'package:location_tracking/domain/repository/user_repository.dart';
import 'package:location_tracking/data/repository/user_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_user_usecase_test.mocks.dart';

@GenerateMocks([LoginDatasource])
void main() {
  late LoginUserUseCase useCase;
  late UserRepository repository;
  late LoginDatasource datasource;

  setUp(() {
    datasource = MockLoginDatasource();
    repository = UserRepositoryImpl(datasource: datasource);
    useCase = LoginUserUseCase(repository: repository);
  });
  test(
    "correct email and password return a token",
    () async {
      const email = "correct@email.com";
      const password = "correctpassword";
      when(datasource.loginWithEmailAndPassword(
              email: email, password: password))
          .thenAnswer((realInvocation) async => 'TOKEN');
      final result = await useCase.login(email: email, password: password);
      expect(result, 'TOKEN');
      verify(datasource.loginWithEmailAndPassword(
          email: email, password: password));
      verifyNoMoreInteractions(datasource);
    },
  );
}
