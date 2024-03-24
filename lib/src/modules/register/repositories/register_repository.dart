import '../service/register_service.dart';
import '../model/register_data_modal.dart';

class RegisterRepository {
  final RegisterService service;

  RegisterRepository(this.service);

  Future<bool> registerUser(RegisterDataModal dataModal) async {
    return await service.sendRegistrationData(dataModal);
  }
}
