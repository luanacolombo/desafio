import 'package:desafio/app/data/models/user_model.dart';
import 'package:desafio/app/data/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseService firebaseService = Get.find<FirebaseService>();
  UserModel user = UserModel();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    user = await firebaseService.getFirestoreUser();
    name.text = user.name.toString();
    email.text = user.email.toString();
  }
}
