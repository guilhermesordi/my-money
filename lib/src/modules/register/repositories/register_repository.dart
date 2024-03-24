class RegisterRepository {
  final RegisterService service;

  RegisterRepository(this.service);

  Future<bool> registerUser(RegisterData data) async {
    // Use o 'service' para enviar dados para a API e obter uma resposta.
    // Retorne 'true' se o registro for bem-sucedido e 'false' caso contrário.
  }
}
