import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  //constructor
  _LoginStore() {
    autorun((_) {});
  }

  @observable
  String email = "";

  //setar email
  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  //mostra a senha com icone visble
  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  void setPassword(String value) => password = value;

  //loading login
  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  //validação dos campos
  @computed
  bool get isEmailValid => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  // @computed
  // bool get isFormValid => isEmailValid && isPasswordValid;

  @computed
  Function get loginPressed =>
      (isEmailValid && isPasswordValid && !loading) ? login : null;

  //funcao login
  @action
  Future<void> login() async {
    loading = true;

    //processar
    await Future.delayed(Duration(seconds: 3));

    loading = false;

    //quando logar
    loggedIn = true;

    email = "";
    password = "";
  }

  //quando der logout
  @action
  void logout() {
    loggedIn = false;
  }
}

//flutter packages pub run build_runner watch
