import 'package:desafio/app/routes/home_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPage'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'LoginPage is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed(HomeRoutes.home);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
