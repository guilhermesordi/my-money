import 'package:dio/dio.dart';
import 'package:mymoney/src/modules/login/model/login_model.dart';
import 'package:mymoney/src/modules/login/repositories/login_repository.dart';
import 'package:mymoney/src/shared/storage/app_keys.dart';
import 'package:mymoney/src/shared/storage/app_secure_storage.dart';

class LoginService {
  LoginRepository repository = LoginRepository();

  Future<Map<dynamic, dynamic>> sendData({
    required String username,
    required String password,
  }) async {
    try {
      LoginModel loginData = LoginModel(
        username: username,
        password: password,
      );

      await persistLocalData(await repository.sendData(loginData));

      return {"sucess": true};
    } on DioError catch (expection) {
      return {"expection": sendExpection(expection)};
    }
  }

  Future<void> persistLocalData(Response<Map<String, dynamic>> response) async {
    Map<String, dynamic>? result = response.data;

    if (result != null) {
      String token = result['acess_token'];
      Map<String, dynamic> userData = result['additional_information'];
      String userId = userData['id'];

      AppSegureStorage.addItem(Appkeys.auth_token, token);
      AppSegureStorage.addItem(Appkeys.user, userData.toString());
      AppSegureStorage.addItem(Appkeys.user_id, userId);
    }
  }

  int sendExpection(Object error) {
    final DioError errorResult = error as DioError;
    return errorResult.response!.data['statusCode'];
  }
}
