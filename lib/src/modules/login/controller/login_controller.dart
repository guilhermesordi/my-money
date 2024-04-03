import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isSuccess = false;

  late String email;
  late String password;
  late BuildContext buildContext;

  @action
  Future<void> checkData({
    required String emailController,
    required String passwordController,
    required BuildContext buildContext,
  }) async {
    this.buildContext = buildContext;
    if (_validate(
        emailController: emailController,
        passwordController: passwordController)) {
      email = emailController;
      password = passwordController;
      isLoading = true;
      await sendData();
      isLoading = false;
    }
  }

  bool _validate({
    required String emailController,
    required String passwordController,
  }) {
    return true;
  }

  @action
  Future<void> sendData() async {}
}
