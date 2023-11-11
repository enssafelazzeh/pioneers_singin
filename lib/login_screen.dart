import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pioneers_singin/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool colorchange = true;
  bool _obscured = false;
  TextEditingController emailController = TextEditingController(text: "enssaf");
  TextEditingController passController = TextEditingController(text: "123");
  late bool newuser;

  @override
  void initState() {
    super.initState();

    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      colorchange = !colorchange;
      setState(() {});
    });
  }

  // Toggles the password show status
  void _toggleObscured() {
    if (kDebugMode) {
      print("enssaf");
    }
    setState(() {
      _obscured = !_obscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "swaar/logo.jpg",
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Police App",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
                child: Row(
                  children: [
                    alawaa(
                        color: colorchange ? Colors.blue : Colors.red,
                        borderRadiusGeometry: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    alawaa(
                        color: colorchange ? Colors.red : Colors.blue,
                        borderRadiusGeometry: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        emailController.text = "";
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  controller: passController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscured,
                  decoration: InputDecoration(
                    labelText: "PassWord",
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    prefixIcon: const Icon(Icons.lock_rounded, size: 24),
                    suffixIcon: SizedBox(
                      width: 90,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: GestureDetector(
                              onTap: _toggleObscured,
                              child: Icon(
                                _obscured
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                                size: 24,
                              ),
                            ),
                          ),
                          IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                passController.text = "";
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("please anter your email"),
                      ));
                    } else if (passController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("please enter your password"),
                      ));
                    } else {
                      if (emailController.text != "enssaf") {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("not valid email"),
                        ));
                      } else if (passController.text != "123") {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("not valid password"),
                        ));
                      } else {
                        emailController.text;
                        passController.text;
                        // Navigator.pushAndRemoveUntil(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return const MainScreen();
                        // }), (Route) => false);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()));
                      }
                    }
                  },
                  child: const Text("login")) // TextButton(
              //     onPressed: () {
              //       for (int i = 0; i > 10000000; i++) {
              //         print("change color before $colorchange");

              //         print("change color before $colorchange");
              //       }
              //     },
              //     child: Text("change"))

              // Image.network(
              //   "https://media.istockphoto.com/id/1575561898/photo/happy-police-team-and-arms-crossed-in-confidence-for-city-protection-law-enforcement-or-crime.jpg?s=1024x1024&w=is&k=20&c=Kh2OQN8wvdIZ3PveEoKG9JEveqHUuwZ7VDgXbXzHpYk=",
              //   width: 200,
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget alawaa(
      {required Color color,
      required BorderRadiusGeometry borderRadiusGeometry}) {
    return Expanded(
        child: Container(
      decoration:
          BoxDecoration(color: color, borderRadius: borderRadiusGeometry),
      height: 50,
      width: 50,
    ));
  }
}
