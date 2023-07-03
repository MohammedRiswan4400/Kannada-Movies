import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kannada_movies/screens/screenLogin/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen_home/screen_home.dart';

class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({super.key});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  List<String> professions = [
    "Driver",
    "Engineer",
    "Artist",
    "Designer",
    "Farmer"
  ];

  String? selectedItems = "Driver";
  final userNameController = TextEditingController();

  final passwordController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  // get items => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(
          255,
          0,
          0,
          0,
        ),
        child: Stack(
          children: [
            Image.asset(
              "assets/WhatsApp Image 2023-06-01 at 22.16.05.jpg",
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Create your Account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 60, 60, 60),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30, bottom: 20, right: 30),
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
                            controller: passwordController,
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
                                // fontFamily: "Ubuntu",
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
                          SizedBox(
                            width: double.infinity,
                            child: DropdownButtonFormField<String>(
                              icon: const Icon(
                                Icons.file_present_sharp,
                              ),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  fillColor:
                                      const Color.fromARGB(255, 229, 229, 229),
                                  filled: true),
                              // borderRadius: BorderRadius.circular(10),

                              value: selectedItems,
                              items: professions
                                  .map((item) => DropdownMenuItem<String>(
                                      value: item, child: Text(item)))
                                  .toList(),
                              onChanged: (item) => setState(
                                () => selectedItems = item,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            //  validator: (email) =>
                            //     email != null && !EmailValidator.validate(email)
                            //         ? "Enter a valid email"
                            //         : null,
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.mail,
                              ),
                              hintText: "E-mail",
                              hintStyle: const TextStyle(
                                // fontFamily: "Ubuntu",
                                color: Color.fromARGB(
                                  255,
                                  0,
                                  0,
                                  0,
                                ),
                                fontSize: 14,
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(
                                255,
                                229,
                                229,
                                229,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: phoneController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            validator: (value) =>
                                value != null && value.length < 10
                                    ? "Enter a valied Mobile Number"
                                    : null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.phone,
                              ),
                              hintText: "Phone",
                              hintStyle: const TextStyle(
                                // fontFamily: "Ubuntu",
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
                                  saveDatasToStorage();
                                  afterSignUp(context);
                                },
                                child: const Text(
                                  "Sign Up",
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
                                "Back to Signin Screen   ",
                                style: TextStyle(color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () {
                                  gotoScreenSignIn(context);
                                },
                                child: const Text(
                                  "Sign in",
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

  Future<void> saveDatasToStorage() async {
    log(userNameController.text);
    log(passwordController.text);
    log(emailController.text);
    log(phoneController.text);

    final userSharedPref = await SharedPreferences.getInstance();
    await userSharedPref.setString("userName", userNameController.text.trim());

    final passwordSharedPref = await SharedPreferences.getInstance();
    await passwordSharedPref.setString(
        "password", passwordController.text.trim());

    final emailSahredPref = await SharedPreferences.getInstance();
    await emailSahredPref.setString("Email", emailController.text.trim());

    final phoneSharedPref = await SharedPreferences.getInstance();
    await phoneSharedPref.setString("Phone", phoneController.text.trim());
  }
}

void gotoScreenSignIn(context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) {
      return const ScreenLogin();
    },
  ));
}

void afterSignUp(context) {
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
}
