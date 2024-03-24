import '../model/register_data_modal.dart';
import '../repositories/register_repository.dart';

class RegisterController {
  final RegisterRepository repository;

  RegisterController(this.repository);

  Future<bool> register(String email, String password) async {
    RegisterDataModal dataModal = RegisterDataModal(email: email, password: password);
    return await repository.registerUser(dataModal);
  }
}
