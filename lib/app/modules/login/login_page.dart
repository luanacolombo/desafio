import 'package:desafio/app/core/helpers/validator.dart';
import 'package:desafio/app/data/models/user_model.dart';
import 'package:desafio/app/routes/home_routes.dart';
import 'package:desafio/app/routes/recovery_routes.dart';
import 'package:desafio/app/routes/register_routes.dart';
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
            key: controller.formKey,
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
                    validator: Validator().email,
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
                    validator: Validator().password,
                    controller: controller.password,
                    onChanged: (value) {
                      if (kDebugMode) {
                        print(controller.password.text);
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
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        UserModel user = UserModel(
                          email: controller.email.text,
                          password: controller.password.text,
                        );
                        controller.firebaseService
                            .signInWithEmailAndPassword(user);
                      }
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
                        onPressed: () {
                          Get.offAllNamed(RecoveryRoutes.recovery);
                        },
                        child: const Text('Esqueceu a senha?',
                            style: TextStyle(fontSize: 15)),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed(RegisterRoutes.register);
                        },
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
