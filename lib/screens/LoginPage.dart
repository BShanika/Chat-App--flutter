import 'dart:math';

import 'package:chat_app/screens/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  late Size mq;
  bool _isAnimate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  _handleGoogleBtnClick() {
    _signInWithGoogle().then((user) {
      log('User: ${user.user}' as num);
      log('UserAdditionalInfo: ${user.additionalUserInfo}' as num);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const MyHome()));
    });
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome to We Chat'),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            top: mq.height * .15,
            right: _isAnimate ? mq.width * .275 : -mq.width,
            width: mq.width * .45,
            duration: const Duration(seconds: 1),
            child: Image.asset('Assets/icon.png'),
          ),
          Positioned(
            bottom: mq.height * .15,
            left: mq.width * .05,
            width: mq.width * .9,
            height: mq.height * .06,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(166, 61, 49, 128),
                shape: const StadiumBorder(),
                elevation: 1,
              ),
              onPressed: () {
                _handleGoogleBtnClick();
              },
              icon: Image.asset('Assets/google.png', height: mq.height * .03),
              label: RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  children: [
                    TextSpan(text: 'Sign In with '),
                    TextSpan(
                      text: 'Google',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
