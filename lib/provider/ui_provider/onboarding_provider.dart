// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soda_bar/presentation/auth_view/sign_in_screen.dart';

class OnboardingProvider with ChangeNotifier {
  bool? isSeen = false;

  // Call this when onboarding is completed
  Future<void> setOnboardingSeen(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSeen', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
    isSeen = true;
    notifyListeners();
  }

  // Call this on app start to load the stored value
  Future<void> loadOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    isSeen = prefs.getBool('isSeen') ?? false;
    notifyListeners();
  }
}
