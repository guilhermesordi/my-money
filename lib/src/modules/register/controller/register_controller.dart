import 'register_repository.dart';
import 'register_data_modal.dart';

class RegisterController {
  final RegisterRepository repository;

  RegisterController(this.repository);

  Future<bool> register(String email, String password) async {
    RegisterDataModal dataModal = RegisterDataModal(email: email, password: password);
    return await repository.registerUser(dataModal);
  }
}
