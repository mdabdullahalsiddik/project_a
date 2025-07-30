import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:foodfinder/app/routes/route_names.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  var user = Rxn<User>();
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userImage = ''.obs;
  var loginType = ''.obs;

  @override
  void onInit() {
    super.onInit();
    user.value = _auth.currentUser;
  }

  Future<void> loginWithGoogle() async {
    try {
      await EasyLoading.show(status: "Signing in with Google...");
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        await EasyLoading.dismiss();
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      user.value = userCredential.user;

      userName.value = user.value?.displayName ?? '';
      userEmail.value = user.value?.email ?? '';
      userImage.value = user.value?.photoURL ?? '';
      loginType.value = 'google';

      await EasyLoading.showSuccess("Welcome $userName (${userEmail})");
      Get.offAllNamed(RouteNames.home);
    } catch (e) {
      await EasyLoading.dismiss();
      Get.snackbar("Google Login Failed", e.toString());
      log("Google Login Error: $e");
    }
  }

  Future<void> loginWithFacebook() async {
    try {
      await EasyLoading.show(status: "Signing in with Facebook...");

      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final accessToken = result.accessToken!;
        final facebookAuthCredential = FacebookAuthProvider.credential(accessToken.tokenString);

        final userCredential = await _auth.signInWithCredential(facebookAuthCredential);
        user.value = userCredential.user;

        final userData = await FacebookAuth.instance.getUserData();

        userName.value = userData["name"] ?? '';
        userEmail.value = userData["email"] ?? '';
        userImage.value = userData["picture"]["data"]["url"] ?? '';
        loginType.value = 'facebook';

        await EasyLoading.showSuccess("Welcome $userName (${userEmail})");
        Get.offAllNamed(RouteNames.home);
      } else {
        await EasyLoading.dismiss();
        Get.snackbar("Facebook Login Failed", result.message ?? 'Unknown error');
      }
    } catch (e) {
      await EasyLoading.dismiss();
      Get.snackbar("Facebook Login Failed", e.toString());
      log("Facebook Login Error: $e");
    }
  }

  Future<void> logout() async {
    if (loginType.value == 'google') {
      await googleSignIn.signOut();
    } else if (loginType.value == 'facebook') {
      await FacebookAuth.instance.logOut();
    }
    await _auth.signOut();

    user.value = null;
    userName.value = '';
    userEmail.value = '';
    userImage.value = '';
    loginType.value = '';

    Get.offAllNamed(RouteNames.login);
  }

  bool get isLoggedIn => user.value != null;
}
