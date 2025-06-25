// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/presentation/user_view/check_out_screen.dart';

import 'package:soda_bar/presentation/user_view/home_screen.dart';
import 'package:soda_bar/provider/ui_provider/home_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        // ChangeNotifierProvider(create: (_) => NoteProvider()),
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
    return const MaterialApp(
      home: CheckOutScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
