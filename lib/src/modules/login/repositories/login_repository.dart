import 'package:dio/dio.dart';
import 'package:mymoney/src/http/app_dio.dart';
import 'package:mymoney/src/modules/login/model/login_model.dart';

class LoginRepository {
  String baseURL = "http://000.00.00.000:3099/auth/login"; //IP local

  Future<Response<Map<String, dynamic>>> sendData(LoginModel loginData) async {
    Dio clientHTTP = await AppDio.getConnection(isAuth: false);

    return clientHTTP.post(baseURL, data: loginData.toJson());
  }
}
