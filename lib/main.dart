import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:neu_social/presentation/splash_screen/Splash_screen.dart';
import 'package:neu_social/routes/App_routes/App_routes.dart';
import 'package:neu_social/routes/Page_list/Page_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required SharedPreferences prefs});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.list,
      home: SplashScreen(),
    );
  }
}
