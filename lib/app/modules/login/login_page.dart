import 'package:desafio/app/routes/home_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: GlobalKey(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 50),
                    child: Image.asset('assets/images/Logo.png'),
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text('Email',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  TextFormField(
                    controller: controller.email,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Senha',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  TextFormField(
                    obscureText: true,
                    controller: controller.senha,
                    onChanged: (value) {
                      if (kDebugMode) {
                        print(controller.senha.text);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      fixedSize: Size(Get.width, 40.0),
                    ),
                    onPressed: () {
                      Get.offAllNamed(HomeRoutes
                          .home); //clicando no botão leva pra página da home
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('Esqueceu a senha?',
                            style: TextStyle(fontSize: 15)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Cadastrar',
                            style: TextStyle(fontSize: 15)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
