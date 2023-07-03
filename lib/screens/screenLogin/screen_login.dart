import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kannada_movies/screens/screen_home/screen_home.dart';
import 'package:kannada_movies/screens/screen_signup/screen_signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userNameController = TextEditingController();
final passWordController = TextEditingController();

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Stack(
          children: [
            SizedBox(
              height: 500,
              child: Image.asset(
                "assets/WhatsApp Image 2023-06-01 at 22.16.05.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Let's you in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 60, 60, 60),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: ListView(
                        children: [
                          TextFormField(
                            controller: userNameController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.account_circle_rounded,
                              ),
                              hintText: "User Name",
                              hintStyle: const TextStyle(
                                fontFamily: "Ubuntu",
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14,
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 229, 229, 229),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: passWordController,
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && value.length < 6
                                    ? "Enter min 6 charecter"
                                    : null,
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                              ),
                              hintStyle: const TextStyle(
                                fontFamily: "Ubuntu",
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14,
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 229, 229, 229),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.black38)),
                                onPressed: () {
                                  // gotoScreenHome(context);
                                  // saveEmailToStorage();
                                  getSavedData(context);
                                },
                                child: const Text(
                                  "Sign in",
                                  style: TextStyle(
                                    // fontFamily: myFont,
                                    // color: colorBlack,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                " Don’t have an Account?  ",
                                style: TextStyle(color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () {
                                  log("..........................");
                                  gotoScreenSignUp(context);
                                },
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void gotoScreenSignUp(context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) {
      return const ScreenSignUp();
    },
  ));
}

void gotoScreenHome(context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) {
      return const ScreenHome();
    },
  ));
}

Future<void> getSavedData(context) async {
  final userShared = await SharedPreferences.getInstance();
  final passwordShared = await SharedPreferences.getInstance();
  final savedUser = userShared.getString("userName");
  final savedPassword = passwordShared.getString("password");
  final userNameText = userNameController.text;
  final passwordText = passWordController.text;

  if (savedUser == userNameText && savedPassword == passwordText) {
    log("okokookokokokokokokokokokokokokokokokokokoko");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.greenAccent,
        content: const Center(
          child: Text(
            "Login Successfull",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        // width: 10,
      ),
    );
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        return const ScreenHome();
      },
    ));
  } else {
    log("notnotnotnotnotnotnotnotnotnotnotnot");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: const Center(
          child: Text(
            "Invalid Credentials",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        // width: 10,
      ),
    );
  }
}
