// ignore_for_file: avoid_print

import 'package:app_intro/screens/screen2.dart';
import 'package:app_intro/welcome_page.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final _formKey = GlobalKey<FormState>(); // Clé du formulaire
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff018868),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/img/—Pngtree—black lines seamless pattern vector_15620407.png',
                fit: BoxFit.cover,
                height: MediaQuery.of(context)
                    .size
                    .height, // Prendre toute la hauteur de l'écran
                width: MediaQuery.of(context)
                    .size
                    .width, // Prendre toute la largeur de l'écran
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Welcome(),
                      ));
                },
                child: Container(
                  height: 35,
                  width: 35,
                  color: Colors.white,
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color(0xff018868),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SizedBox(
                height: 700,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 130),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello Again!',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'FontsFree',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Sign in to your account',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 240),
              child: Center(
                child: Form(
                  key: _formKey, // Utilisation correcte de la clé du formulaire
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff018868),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter an email";
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
                              .hasMatch(value);
                          if (!emailValid) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Password',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: passController,
                        obscureText: passToggle,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff018868),
                            ),
                          ),
                          suffix: InkWell(
                            onTap: () {
                              setState(() {
                                passToggle = !passToggle;
                              });
                            },
                            child: Icon(passToggle
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a password";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text("Forgot your password?"),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          // Validation du formulaire
                          if (_formKey.currentState!.validate()) {
                            print("Sign in successful");
                            emailController.clear();
                            passController.clear();
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Color(0xff018868),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 550),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "------------------",
                        style: TextStyle(color: Colors.grey, letterSpacing: 4),
                      ),
                      Text(
                        'Or with',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "------------------",
                        style: TextStyle(color: Colors.grey, letterSpacing: 4),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors
                            .grey, // Définir la couleur du contour en gris
                        width: 1.5, // Définir l'épaisseur du contour
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/télécharger.png',
                          height: 25,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text(
                          'Sign in with Google',
                          style: TextStyle(
                            fontFamily: 'FontsFree',
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors
                            .grey, // Définir la couleur du contour en gris
                        width: 1.5, // Définir l'épaisseur du contour
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/twitter-logo-A84FE9258E-seeklogo.com.png',
                          height: 20,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text(
                          'Sign in with Twitter',
                          style: TextStyle(
                            fontFamily: 'FontsFree',
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Not a member yet?",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Screen2(),
                                  ));
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
