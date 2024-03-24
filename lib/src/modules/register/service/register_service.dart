import 'package:dio/dio.dart';
import 'app_dio.dart';
import 'register_data_modal.dart';

class RegisterService {
  Future<bool> sendRegistrationData(RegisterDataModal dataModal) async {
    Dio dio = await AppDio.getConnection();
    try {
      Response response = await dio.post(
        '/register', // Endpoint específico para o registro 
        data: dataModal.toJson(),
      );
      return response.statusCode == 200; // Retorna verdadeiro se o status da resposta for 200
    } on DioError catch (e) {
      print(e);
      return false; // Retorna falso se houver uma falha na requisição
    }
  }
}
