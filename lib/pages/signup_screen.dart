import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static const routName = "/signup-screen";

  @override
  Widget build(BuildContext context) {
    final mediaqWwidth = MediaQuery.of(context).size.width;
    final mediaqWheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF0099CA),
            Color(0xFF424C69),
          ])),
          child: const Padding(
              padding: EdgeInsets.only(top: 40, left: 22),
              child: Text(
                "Create Your \nAccount",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 160),
          child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                          label: Text(
                            "Full Name",
                            style: TextStyle(
                              color: Color(0xFF0099CA),
                              fontSize: 18,
                            ),
                          )),
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.check,
                            color: Colors.grey,
                          ),
                          label: Text(
                            "Phone or email",
                            style: TextStyle(
                              color: Color(0xFF0099CA),
                              fontSize: 18,
                            ),
                          )),
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          label: Text(
                            "Password",
                            style: TextStyle(
                              color: Color(0xFF0099CA),
                              fontSize: 18,
                            ),
                          )),
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          label: Text(
                            "Confirm Password",
                            style: TextStyle(
                              color: Color(0xFF0099CA),
                              fontSize: 18,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: mediaqWheight * .06,
                    ),
                    Container(
                        height: 40,
                        width: mediaqWwidth * .5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [
                              Color(0xFF0099CA),
                              Color(0xFF424C69),
                            ])),
                        child: Align(
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text("SIGN UP",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17))),
                        )),
                    SizedBox(
                      height: mediaqWheight * .07,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Don't have account?",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Sign in",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ]),
    );
  }
}
