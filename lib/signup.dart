import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text("Sign up"),
        backgroundColor: const Color.fromARGB(255, 8, 148, 122),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            Builder(builder: (context) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Container(
                    width: 360,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(166, 143, 89, 117),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Builder(builder: (context) {
                      return TextButton(
                        onPressed: () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text,
                          )
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                            print("Created new account.");
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
                          "Sign up",
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
          ]),
        ),
      ),
    );
  }
}
