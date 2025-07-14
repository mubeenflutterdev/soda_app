// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:soda_bar/firebase_options.dart';
import 'package:soda_bar/presentation/auth_view/onboarding_screen.dart';
import 'package:soda_bar/presentation/auth_view/sign_in_screen.dart';
import 'package:soda_bar/presentation/user_view/bottom_navigation_bar_screen.dart';

import 'package:soda_bar/provider/feature_provider/auth_provider.dart';

import 'package:soda_bar/provider/feature_provider/cart_provider.dart';
import 'package:soda_bar/provider/feature_provider/categories_provider.dart';
import 'package:soda_bar/provider/feature_provider/order_provider.dart';
import 'package:soda_bar/provider/feature_provider/product_provider.dart';
import 'package:soda_bar/provider/feature_provider/shop_provider.dart';
import 'package:soda_bar/provider/feature_provider/user_info_provider.dart';
import 'package:soda_bar/provider/ui_provider/bottom_bar_provider.dart';
import 'package:soda_bar/provider/feature_provider/notification_provider.dart';
import 'package:soda_bar/provider/ui_provider/check_out_provider.dart';
import 'package:soda_bar/provider/ui_provider/home_provider.dart';
import 'package:soda_bar/provider/ui_provider/image_picker_provider.dart';
import 'package:soda_bar/provider/ui_provider/onboarding_provider.dart';
import 'package:soda_bar/provider/ui_provider/theme_provider.dart';
import 'package:soda_bar/utils/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => BottomBarProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => ImagePickerProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => AuthentactionProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        ChangeNotifierProvider(create: (_) => UserInfoProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => CheckOutProvider()),
        ChangeNotifierProvider(create: (_) => ShopProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<OnboardingProvider>(context, listen: false);
    provider.loadOnboardingStatus();
  }

  @override
  Widget build(BuildContext context) {
    //
    /// managing that where user shoul be go 2nd time

    final themeProvider = Provider.of<ThemeProvider>(context);
    final provider = Provider.of<OnboardingProvider>(context);

    // Widget homeScreen;
    // if (isUserLogin != null) {
    //   homeScreen = Bottomnavigationbarscreen();
    // } else if (provider.isSeen == false || provider.isSeen == null) {
    //   homeScreen = OnboardingScreen();
    // }
    // else if(isUserLogin==null){
    //   homeScreen = SignInScreen();
    // }
    // else {
    //   homeScreen = ProfileScreen();
    // }

    // ignore: non_constant_identifier_names
    final isUserLogin = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      themeMode: themeProvider.themeMode,
      darkTheme: CustomTheme.darkTheme,
      home: isUserLogin != null
          ? Bottomnavigationbarscreen()
          : provider.isSeen == true
          ? SignInScreen()
          : OnboardingScreen(),

      debugShowCheckedModeBanner: false,
    );
  }
}
