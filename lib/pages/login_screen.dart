import 'package:flutter/material.dart';
import 'package:shopping_sm_app/pages/Prodact_overview_page.dart';
import 'package:shopping_sm_app/pages/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/welcome-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, String> _loginData = {
    'email': '',
    'password': '',
  };
  var _showPassword = true;

  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    final mediaqWwidth = MediaQuery.of(context).size.width;
    final mediaqWheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  // borderRadius:
                  //     BorderRadius.only(bottomLeft: Radius.circular(220.0)),
                  gradient: const LinearGradient(colors: [
                Color(0xFF0099CA),
                Color(0xFF424C69),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: const Padding(
                  padding: const EdgeInsets.only(top: 66.0, left: 22),
                  child: Text(
                    "Hello\nSign in!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'OpenSans'),
                  ))),
          Padding(
              padding: const EdgeInsets.only(top: 190),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        // topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: Colors.white),
                child: Padding(
                    padding: const EdgeInsets.only(left: 18, right: 10),
                    child: SingleChildScrollView(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Form(
                              key: _formKey,
                              child: Column(children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    suffixIcon:
                                        Icon(Icons.check, color: Colors.grey),
                                    label: Text("Gmail",
                                        style: TextStyle(
                                            color: Color(0xFF0099CA),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains('@') ||
                                        !value.contains(".")) {
                                      return "Invalid email address you enterd";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _loginData['email'] = value.toString();
                                  },
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      focusColor: Color(0xFF0099CA),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _showPassword = !_showPassword;
                                            });
                                          },
                                          icon: Icon(
                                            _showPassword
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.grey,
                                          )),
                                      label: Text("Password",
                                          style: TextStyle(
                                              color: Color(0xFF0099CA),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18))),
                                  //keyboardType: TextInputType.text,
                                  obscureText: _showPassword,
                                  textInputAction: TextInputAction.done,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a passwerd';
                                    }
                                    if (value.length <= 5) {
                                      return "Password is too short";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    //print(value!.length);
                                    _loginData['password'] = value.toString();
                                    Navigator.of(context)
                                        .pushNamed(SignupScreen.routName);
                                  },
                                  onFieldSubmitted: (_) {
                                    _submitForm();
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ]),
                            )),
                        SizedBox(
                          height: mediaqWheight * 0.02,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              child: Text(
                                "Forget Password?",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(SignupScreen.routName);
                              },
                            )),
                        SizedBox(
                          height: mediaqWheight * 0.05,
                        ),
                        Container(
                          width: mediaqWwidth * 0.5,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Color(0xFF0099CA),
                                Color(0xFF424C69),
                              ])),
                          child: Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                child: const Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                onPressed: () {
                                  //Navigator.of(context).pushNamed(
                                  //ProductOverviewScreen.routeName);
                                  _submitForm();
                                },
                              )),
                        ),
                        SizedBox(
                          height: mediaqWheight * 0.1,
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
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(SignupScreen.routName);
                                  },
                                  child: Text(
                                    "Sign up",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ))),
              ))
        ],
      ),
    );
  }
}
