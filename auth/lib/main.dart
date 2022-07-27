// // CRIAR FUNÇÃO DE LOGIN
// // VALIDAR EMAIL
// //  VALIDAR SENHA
// // VALIDAR NO BACKEND, SE OS DADOS ESTÃO CERTOS
// // DIRECIONAR PARA A TELA HOME

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.purple),
    initialRoute: "/login",
    routes: {
      "/login": (context) => const LoginPage(),
      "/home": (context) => const HomePage(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Usuário logado com sucesso")),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username;
  String? password;
  var isLoading = false;

  final formKey = GlobalKey<FormState>();

// parâmetros nomeados
  void login({
    required String username,
    required String password,
  }) async {
    isLoading = true;
    setState(() {});
    final response = await apiLogin(username: username, password: password);
    isLoading = false;
    setState(() {});
    if (response) {
      Navigator.pushNamed(context, "/home");
    }
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  String? validadeUsername(String? username) =>
      username != null && username.isNotEmpty
          ? null
          : "O username precisa ser diferente de nulo";
  String? validadePassword(String? password) =>
      password != null && password.length >= 4
          ? null
          : "A senha precisa ter 4 caracteres";

  Future<bool> apiLogin(
      {required String username, required String password}) async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Username"),
                    validator: (value) => validadeUsername(value),
                    onSaved: (value) => username = value,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Password"),
                    validator: (value) => validadePassword(value),
                    obscureText: true,
                    onSaved: (value) => password = value,
                  ),
                  if (isLoading)
                    const CircularProgressIndicator()
                  else
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.purple)),
                        onPressed: () {
                          if (validate()) {
                            login(username: username!, password: password!);
                          }
                        },
                        child: const Text("Entrar",
                            style: TextStyle(color: Colors.white))),
                ],
              ),
            )));
  }
}
