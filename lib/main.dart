import 'package:chat_app/screens/SplashPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

late Size mq;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    _initializeFirebase();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'We Chat',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 1,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 19),
            backgroundColor: Color.fromARGB(255, 122, 109, 170),
          ),
        ),
        home: const Splash());
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
