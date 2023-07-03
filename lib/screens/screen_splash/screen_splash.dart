import 'package:flutter/material.dart';
import 'package:kannada_movies/screens/screen_home/screen_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screenLogin/screen_login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotoScreens(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            "assets/WhatsApp Image 2023-06-02 at 16.48.28.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              "assets/360_F_342750654_KUSiNGLWTeNd78ZN56WSkFIdruESUAbf-removebg-preview.png",
              scale: 1,
            ))
      ],
    ));
  }
}

Future gotoScreens(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 3));
  final userShared = await SharedPreferences.getInstance();
  final userLogin = userShared.getString("userName");
  if (userLogin != null) {
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          // return
          // return const ScreenFirstLoginPage();
          return const ScreenHome();
        },
      ),
    );
  } else {
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          // return
          // return const ScreenFirstLoginPage();
          return const ScreenLogin();
        },
      ),
    );
  }
  // ignore: use_build_context_synchronously
}

// Future<void> checkLogin() async {}
