class RegisterDataModal {
  String email;
  String password;
  //aqui adicionamos outros campos conforme necessário.

  RegisterDataModal({
    required this.email,
    required this.password,
    // Inicialize quaisquer outros campos aqui.
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      // Inclua outros campos aqui conforme você os adicionar.
    };
  }
}
