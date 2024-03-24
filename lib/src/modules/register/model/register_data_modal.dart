class RegisterData {
  String email;
  String password;
  // aqui podemos adicionar outros campos que podemos precisar para o cadastro.

  RegisterData({
    required this.email,
    required this.password,
    // inicialize quaisquer outros campos aqui.
  });

  // podemos adicionar métodos para conversão JSON se for comunicar com uma API.
}
