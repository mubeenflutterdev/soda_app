// ignore_for_file: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/firebase_options.dart';
import 'package:soda_bar/presentation/auth_view/onboarding_screen.dart';
import 'package:soda_bar/presentation/auth_view/sign_in_screen.dart';
import 'package:soda_bar/presentation/user_view/admin_screen.dart';
import 'package:soda_bar/presentation/user_view/bottom_navigation_bar_screen.dart';
import 'package:soda_bar/provider/feature_provider/admin_notifications_provider.dart';
import 'package:soda_bar/provider/feature_provider/admin_tokken_provider.dart';
import 'package:soda_bar/provider/feature_provider/auth_provider.dart';
import 'package:soda_bar/provider/feature_provider/cart_provider.dart';
import 'package:soda_bar/provider/feature_provider/categories_provider.dart';
import 'package:soda_bar/provider/feature_provider/dashboard_provider.dart';
import 'package:soda_bar/provider/feature_provider/order_provider.dart';
import 'package:soda_bar/provider/feature_provider/product_provider.dart';
import 'package:soda_bar/provider/feature_provider/profile_provider.dart';
import 'package:soda_bar/provider/feature_provider/shop_provider.dart';
import 'package:soda_bar/provider/feature_provider/user_info_provider.dart';
import 'package:soda_bar/provider/ui_provider/bottom_bar_provider.dart';
import 'package:soda_bar/provider/feature_provider/notification_provider.dart';
import 'package:soda_bar/provider/ui_provider/check_out_provider.dart';
import 'package:soda_bar/provider/ui_provider/home_provider.dart';
import 'package:soda_bar/provider/ui_provider/image_picker_provider.dart';
import 'package:soda_bar/provider/ui_provider/onboarding_provider.dart';
import 'package:soda_bar/provider/ui_provider/payment_provider.dart';
import 'package:soda_bar/provider/ui_provider/theme_provider.dart';
import 'package:soda_bar/provider/ui_provider/visibality_provider.dart';
import 'package:soda_bar/services/notification_services.dart';
import 'package:soda_bar/utils/custom_theme.dart';

/// this is for handleing notification when app is not opened
@pragma('vm:entry-point')
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);

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
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => VisibalityProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => AdminTokkenProvider()),
        ChangeNotifierProvider(create: (_) => AdminNotificationsProvider()),
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

void subscribe() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.subscribeToTopic('all');
  print('Subscribed to topic');
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<OnboardingProvider>(context, listen: false);
    provider.loadOnboardingStatus();

    if (FirebaseAuth.instance.currentUser != null) {
      UserInfoProvider userInfoProvider = Provider.of<UserInfoProvider>(
        context,
        listen: false,
      );
    }
    subscribe();
    notificationServices.requestNotificationPermission();
    notificationServices.getDeviceToken();
    // FcmService.firebaseInit();
    notificationServices.firebaseInit(context);
    notificationServices.setupIntractMessage(context);
  }

  @override
  Widget build(BuildContext context) {
    //
    /// managing that where user shoul be go 2nd time
    final isAdmin =
        Provider.of<UserInfoProvider>(context).userInfo?.isAdmin ?? false;

    final themeProvider = Provider.of<ThemeProvider>(context);
    final provider = Provider.of<OnboardingProvider>(context);
    UserInfoProvider userInfoProvider = Provider.of<UserInfoProvider>(
      context,
      listen: false,
    );

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
          ? isAdmin == true
                ? AdminScreen()
                : Bottomnavigationbarscreen()
          : provider.isSeen == true
          ? SignInScreen()
          : OnboardingScreen(),

      debugShowCheckedModeBanner: false,
    );
  }
}
