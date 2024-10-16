import 'package:chat_app/screens/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late Size mq;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const MyLogin()));
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size; // Initialize mq with MediaQuery size
    return Scaffold(
      body: Stack(
        children: [
          // Logo Animation
          Positioned(
            top: mq.height * .15,
            right: mq.width * .275,
            width: mq.width * .45,
            child: Image.asset('Assets/icon.png'),
          ),
          // Google Sign-in Button
          Positioned(
              bottom: mq.height * .15,
              width: mq.width,
              child: const Text(
                'MADE IN SRI LANKA',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, color: Colors.black87, letterSpacing: .5),
              )),
        ],
      ),
    );
  }
}
