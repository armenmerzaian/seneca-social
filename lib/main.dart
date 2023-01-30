import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:seneca_social/responsive/mobile_screen_layout.dart';
import 'package:seneca_social/responsive/responsive_layout_screen.dart';
import 'package:seneca_social/responsive/web_screen_layout.dart';
import 'package:seneca_social/screens/login_screen.dart';
import 'package:seneca_social/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyCKQBTqsFOw2S6c47H755E-S7NEdIQgH0o',
            appId: '1:787418988209:web:dbad55f0fb9369e9076c90',
            messagingSenderId: '787418988209',
            projectId: 'seneca-social-4d7b0',
            storageBucket: 'seneca-social-4d7b0.appspot.com'));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seneca Social',
      theme: ThemeData.light(),
      home: SignUpScreen(),
      /* home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ), */
    );
  }
}
