import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies_app/home.dart';
import 'package:movies_app/signup.dart';
import 'firebase_options.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(child: Text("Login")),
          backgroundColor: const Color.fromARGB(255, 8, 148, 122),
        ),
        body: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 360,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 57, 50, 66),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: TextField(
                        controller: _emailTextController,
                        decoration: const InputDecoration(
                          icon: Padding(
                            padding: EdgeInsets.all(8.0),
                          ),
                          label: Text(
                            "Enter your email",
                            style: TextStyle(color: Colors.white),
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: 360,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 57, 50, 66),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: TextField(
                        obscureText: true,
                        controller: _passwordTextController,
                        decoration: const InputDecoration(
                          icon: Padding(
                            padding: EdgeInsets.all(8.0),
                          ),
                          label: Text(
                            "Enter your password",
                            style: TextStyle(color: Colors.white),
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _emailTextController.text);
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 151, 32, 23)),
                ),
              ),
              Builder(builder: (context) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: 360,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(166, 143, 89, 117),
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: Builder(builder: (context) {
                        return TextButton(
                          onPressed: () {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text)
                                .then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ));
                              print("Account logged in");
                            }).onError((error, stackTrace) {
                              Widget okbutton = TextButton(
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  },
                                  child: Text("OK"));
                              AlertDialog alert = AlertDialog(
                                title: Text("Oops, error!"),
                                content: Text("${error.toString()}"),
                                actions: [
                                  okbutton,
                                ],
                              );
                              showDialog(
                                context: context,
                                builder: (context) => alert,
                                barrierDismissible: true,
                              );
                            });
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Color.fromARGB(255, 63, 58, 58),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                );
              }),
              Builder(builder: (context) {
                return TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ));
                  },
                  child: const Text(
                    'New user? Create new account!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 63, 23, 66)),
                  ),
                );
              }),
            ]),
          ),
        ),
      );
  }
}