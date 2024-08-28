import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trungtamthethao/account/login.dart';
import 'package:trungtamthethao/firebase_options.dart';
import 'package:trungtamthethao/screen/CartPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const NavigationBarApp());
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const Login(),
      routes: {
        '/cart': (context) => const Cartpage(),
      },
    );
  }
}
