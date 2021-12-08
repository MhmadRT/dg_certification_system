import 'package:dg_certification_system/controller/state_control.dart';
import 'package:dg_certification_system/repositories/login_repository.dart';
import 'package:flutter/cupertino.dart';

class LoginController extends StateControl {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  bool loading;
  BuildContext context;


  LoginController(this.context,this.loading);

  void login() async {
    if (loginKey.currentState!.validate()) {
      loading = true;
      notifyListeners();
      print(loading);
      await LoginRepository().login(email.text, password.text,context);
      loading = false;
      notifyListeners();
    }
  }
}
