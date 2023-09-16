import 'package:desafio/app/routes/profile_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

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
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed(ProfileRoutes.profile);
                        },
                        child: const Text('Perfil',
                            style: TextStyle(fontSize: 15)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Carrinho',
                            style: TextStyle(fontSize: 15)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  const Text('Canecas',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Topos de Bolo',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Lembrancinhas',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Convites Personalizados',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Caixinhas Personalizadas',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Arranjos de Balões',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 150,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      fixedSize: Size(Get.width, 40.0),
                    ),
                    onPressed: () {
                      controller.firebaseService.signOut();
                    },
                    child: const Text('Sair'),
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
