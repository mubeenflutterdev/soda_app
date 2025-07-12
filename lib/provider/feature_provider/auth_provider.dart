
// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/presentation/auth_view/sign_in_screen.dart';
import 'package:soda_bar/presentation/user_view/bottom_navigation_bar_screen.dart';
import 'package:soda_bar/provider/feature_provider/user_info_provider.dart';
import 'package:soda_bar/utils/toast_utils.dart';

class AuthentactionProvider with ChangeNotifier {
  bool isloginLoading = false;
  bool isSignUPLoading = false;
  bool isForgetLoading = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  ///
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> signInWithGoogle() async {
    //there we initilize get device token controller

    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn
          .signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential = await _auth.signInWithCredential(
          credential,
        );
        final User? user = userCredential.user;
        if (user != null) {}
      }
    } catch (e) {
      // EasyLoading.dismiss();
      
    }
  }

  // signIn Provider
  // Future signInUser(email, password, BuildContext context) async {
  //   try {
  //     isloginLoading = true;
  //     notifyListeners();
  //     UserCredential userCredential = await auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => Bottomnavigationbarscreen()),
  //     );
  //   } catch (_e) {
  //     ToastUtil.showToast(
  //       context,
  //       message: _e.toString(),
  //       type: ToastType.error,
  //     );
  //   }
  // }
  Future<void> signInUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      isloginLoading = true;
      notifyListeners();

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Verify user is actually signed in
      if (auth.currentUser != null) {
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Bottomnavigationbarscreen()),
        );
      } else {
        throw Exception("User signed in but currentUser is null");
      }
    } catch (e) {
      ToastUtil.showToast(
        context,
        message: e.toString(),
        type: ToastType.error,
      );
    } finally {
      isloginLoading = false;
      notifyListeners();
    }
  }
  // signUp Provider

  Future signUpUser(
    String name,
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      isSignUPLoading = true;
      final userprovider = Provider.of<UserInfoProvider>(
        context,
        listen: false,
      );

      notifyListeners();
   
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userprovider.addUserInfo(
        FirebaseAuth.instance.currentUser!.uid,
        name,
        email,
        '',
        DateTime.now(),
        DateTime.now(),
        context,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Bottomnavigationbarscreen()),
      );
    } catch (e) {
   
      ToastUtil.showToast(
        context,
        message: e.toString(),
        type: ToastType.error,
      );
    }
  }

  Future forgetPassord(String email, BuildContext context) async {
    try {
      isSignUPLoading = true;
      notifyListeners();

      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      ToastUtil.showToast(
        context,
        message: e.toString(),
        type: ToastType.error,
      );
    }
  }

  Future logOut(BuildContext context) async {
    try {
      notifyListeners();

      await FirebaseAuth.instance.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    } catch (e) {
      ToastUtil.showToast(
        context,
        message: e.toString(),
        type: ToastType.error,
      );
    }
  }
}
