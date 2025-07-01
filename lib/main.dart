// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/presentation/auth_view/onboarding_screen.dart';
import 'package:soda_bar/presentation/auth_view/splash_screen.dart';
import 'package:soda_bar/presentation/user_view/bottom_navigation_bar_screen.dart';
import 'package:soda_bar/presentation/user_view/check_out_screen.dart';
import 'package:soda_bar/presentation/user_view/details_screen.dart';
import 'package:soda_bar/presentation/user_view/home_screen.dart';
import 'package:soda_bar/presentation/user_view/profile_screen.dart';
import 'package:soda_bar/provider/feature_provider/cart_provider.dart';
import 'package:soda_bar/provider/ui_provider/bottom_bar_provider.dart';
import 'package:soda_bar/provider/ui_provider/home_provider.dart';
import 'package:soda_bar/provider/feature_provider/notification_provider.dart';
import 'package:soda_bar/provider/ui_provider/image_picker_provider.dart';
import 'package:soda_bar/provider/ui_provider/theme_provider.dart';
import 'package:soda_bar/utils/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => BottomBarProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ImagePickerProvider()),
      ],

      /// for using screenUtils package
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      themeMode: themeProvider.themeMode,
      darkTheme: CustomTheme.darkTheme,
   
      home: Bottomnavigationbarscreen(),

      debugShowCheckedModeBanner: false,
    );
  }
}
