import 'package:online_food_app/src/repository/AuthRepo.dart';

class AuthBloc {
  final _authRepo = AuthRepo();

  getValidateEmail(String email) {
    return _authRepo.getValidateEmail(email);
  }

  login(String email, String password) {
    return _authRepo.login(email, password);
  }

  register(String nama, String no_tlp, String email, String password) {
    return _authRepo.register(nama, no_tlp, email, password);
  }

   simpanPassword(String id, String password) {
    return _authRepo.simpanPassword(id, password);
  }

}
final authBloc = AuthBloc();

