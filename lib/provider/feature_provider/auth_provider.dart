import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:soda_bar/utils/toast_utils.dart';

class AuthentactionProvider with ChangeNotifier {
  bool isloginLoading = false;
  bool isSignUPLoading = false;
  bool isForgetLoading = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  /// signIn Provider
  Future signInUser(email, password, BuildContext context) async {
    try {
      isloginLoading = true;
      notifyListeners();
      await auth.signInWithEmailAndPassword(
        email: 'abc@gmail.com',
        password: '12345678',
      );
    } catch (_e) {
      ToastUtil.showToast(
        context,
        message: _e.toString(),
        type: ToastType.error,
      );
    }
  }

  // signUp Provider

  Future signUpUser(String email, String password, BuildContext context) async {
    try {
      isSignUPLoading = true;
      notifyListeners();
      print('trying to sighnup ');
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print(e.toString());
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
}
