import 'package:desafio/app/core/helpers/validator.dart';
import 'package:desafio/app/data/models/user_model.dart';
import 'package:desafio/app/routes/home_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

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
                  const SizedBox(
                    height: 150,
                  ),
                  const Text('Perfil',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 160,
                  ),
                  const Text('Nome Completo',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  TextFormField(
                    controller: controller.name,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text('Email',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  TextFormField(
                    validator: Validator().email,
                    controller: controller.email,
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
                          name: controller.name.text,
                        );
                        updateUserConfirm(user, controller.email.text);
                      }
                    },
                    child: const Text('Salvar'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      fixedSize: Size(Get.width, 40.0),
                    ),
                    onPressed: () {
                      Get.offAllNamed(HomeRoutes
                          .home); //clicando no botão leva pra página do login
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

  Future<void> updateUserConfirm(UserModel updatedUser, String oldEmail) async {
    final TextEditingController password = TextEditingController();
    return Get.dialog(
      AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        title: const Text(
          'Digite sua senha!',
        ),
        content: TextFormField(
          controller: password,
          validator: Validator().password,
          obscureText: true,
          onChanged: (value) {},
          onSaved: (value) => password.text = value!,
          maxLines: 1,
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancelar'.toUpperCase()),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            child: Text('Salvar'.toUpperCase()),
            onPressed: () async {
              Get.back();
              await controller.firebaseService
                  .updateUser(updatedUser, oldEmail, password.text);
            },
          )
        ],
      ),
    );
  }
}
