import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio/app/data/models/user_model.dart';
import 'package:desafio/app/routes/home_routes.dart';
import 'package:desafio/app/routes/login_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Rxn<User> firebaseUser = Rxn<User>();
  Rxn<UserModel> firestoreUser = Rxn<UserModel>();
  final RxBool admin = false.obs;

  @override
  void onReady() async {
    //run every time auth state changes
    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);
    super.onReady();
  }

  handleAuthChanged(firebaseUser) async {
    //get user data from firestore
    if (firebaseUser?.uid != null) {
      firestoreUser.bindStream(streamFirestoreUser());
    }

    if (firebaseUser != null) {
      return Get.offAllNamed(HomeRoutes.home);
    } else {
      return Get.offAllNamed(LoginRoutes.login);
    }
  }

  // Firebase user one-time fetch
  Future<User> get getUser async => _auth.currentUser!;

  // Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  //Streams the firestore user from the firestore collection
  Stream<UserModel> streamFirestoreUser() {
    return _db
        .doc('/users/${firebaseUser.value!.uid}')
        .snapshots()
        .map((snapshot) => UserModel.fromMap(snapshot.data()!));
  }

  //get the firestore user from the firestore collection
  Future<UserModel> getFirestoreUser() {
    return _db.doc('/users/${firebaseUser.value!.uid}').get().then(
        (documentSnapshot) => UserModel.fromMap(documentSnapshot.data()!));
  }

  //Method to handle user sign in using email and password
  signInWithEmailAndPassword(UserModel user) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: user.email!.trim(), password: user.password!.trim());
    } catch (error) {
      Get.snackbar('Login Inválido!', 'Login Inválido!',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  // User registration using email and password
  registerWithEmailAndPassword(UserModel user) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: user.email!.trim(), password: user.password!.trim())
          .then((result) async {
        //create the new user object
        UserModel newUser = UserModel(
          uid: result.user!.uid,
          email: result.user!.email!,
          name: user.name!.trim(),
        );
        //create the user in firestore
        _createUserFirestore(newUser, result.user!);
      });
    } on FirebaseAuthException catch (error) {
      Get.snackbar('Erro de Login!', error.message!,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  //handles updating the user when updating profile
  Future<void> updateUser(
      UserModel user, String oldEmail, String password) async {
    String authUpdateUserNoticeTitle = 'Usuário atualizado com sucesso!';
    String authUpdateUserNotice = 'Usuário atualizado com sucesso!';
    try {
      try {
        await _auth
            .signInWithEmailAndPassword(email: oldEmail, password: password)
            .then((firebaseUser) async {
          await firebaseUser.user!
              .updateEmail(user.email!)
              .then((value) => _updateUserFirestore(user, firebaseUser.user!));
        });
      } catch (err) {
        //not yet working, see this issue https://github.com/delay/uptalk/issues/21
        if (err.toString() ==
            "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
          authUpdateUserNoticeTitle = 'auth.updateUserEmailInUse'.tr;
          authUpdateUserNotice = 'auth.updateUserEmailInUse'.tr;
        } else {
          authUpdateUserNoticeTitle = 'Senha Errada!';
          authUpdateUserNotice = 'Senha Errada!';
        }
      }
      Get.snackbar(authUpdateUserNoticeTitle, authUpdateUserNotice,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    } on PlatformException catch (error) {
      String authError;
      switch (error.code) {
        case 'ERROR_WRONG_PASSWORD':
          authError = 'Senha Errada!';
          break;
        default:
          authError = 'Erro Desconhecido!';
          break;
      }
      Get.snackbar('Senha Errada!', authError,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  //updates the firestore user in users collection
  void _updateUserFirestore(UserModel user, User firebaseUser) {
    _db.doc('/users/${firebaseUser.uid}').update(user.toJson());
    update();
  }

  //create the firestore user in users collection
  void _createUserFirestore(UserModel user, User firebaseUser) {
    _db.doc('/users/${firebaseUser.uid}').set(user.toJson());
    update();
  }

  //password reset email
  Future<void> sendPasswordResetEmail(UserModel user) async {
    try {
      await _auth.sendPasswordResetEmail(email: user.email!.trim());
      Get.snackbar('Senha Alterada com Sucesso!', 'Senha Alterada com Sucesso!',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    } on FirebaseAuthException catch (error) {
      Get.snackbar('Falha na alteração da senha!', error.message!,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  // Sign out
  void signOut() {
    _auth.signOut();
  }
}
