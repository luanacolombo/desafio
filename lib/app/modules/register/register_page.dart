import 'package:desafio/app/routes/login_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

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
                  const SizedBox(
                    height: 90,
                  ),
                  const Center(
                    child: Text(
                      'Cadastrar',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  const Text('Nome Completo',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  TextFormField(
                    controller: controller.nome,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text('Email',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  TextFormField(
                    controller: controller.email,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text('Senha',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  TextFormField(
                    obscureText: true,
                    controller: controller.senha,
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      fixedSize: Size(Get.width, 40.0),
                    ),
                    onPressed: () {
                      Get.offAllNamed(LoginRoutes
                          .login); //clicando no botão leva pra página do login
                    },
                    child: const Text('Cadastrar'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      fixedSize: Size(Get.width, 40.0),
                    ),
                    onPressed: () {
                      Get.offAllNamed(LoginRoutes
                          .login); //clicando no botão leva pra página do login
                    },
                    child: const Text('Voltar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
