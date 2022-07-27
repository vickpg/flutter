// // CRIAR FUNÇÃO DE LOGIN
// // VALIDAR EMAIL
// //  VALIDAR SENHA
// // VALIDAR NO BACKEND, SE OS DADOS ESTÃO CERTOS
// // DIRECIONAR PARA A TELA HOME

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [TextField(), TextField()],
          ),
        ));
  }
}

// void main() {
//   final isValid = validate(username: "username", password: "password");
//   if (isValid == null) {
//     login(username: "username", password: "password");
//   }
// }

// // parâmetros nomeados
// void login({
//   required String username,
//   required String password,
// }) {
//   final response = validadeLogin(username: username, password: password);
//   if (response) {
//     print("Abrindo a HomePage");
//   }
// }

// String? validate({required String password, required String username}) {
//   final passwordIsValid = validadePassword(password);
//   final usernameIsValid = validadeUsername(username);

//   if (passwordIsValid == false) {
//     return "A senha precisa ter 4 caracteres";
//   }
//   if (usernameIsValid == false) {
//     return "O username precisa ser diferente de nulo";
//   }

//   return null;
// }

// bool validadeUsername(String? username) =>
//     username != null && username.length > 0;
// bool validadePassword(String? password) =>
//     password != null && password.length > 4;

// bool validadeLogin({required String username, required String password}) {
//   print("Conectando no servidor");
//   print("Login realizado com sucesso");
//   return true;
// }
