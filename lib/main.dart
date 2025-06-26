// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/presentation/auth_view/splash_screen.dart';
import 'package:soda_bar/provider/ui_provider/home_provider.dart';
import 'package:soda_bar/provider/ui_provider/theme_provider.dart';
import 'package:soda_bar/utils/custom_theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        // ChangeNotifierProvider(create: (_) => ImagePickerProvider()),
        // ChangeNotifierProvider(create: (_) => ProfileProvider()),
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

      home: OnBoardingScreen(),

      debugShowCheckedModeBanner: false,
    );
  }
}
