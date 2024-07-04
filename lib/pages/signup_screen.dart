import 'package:flutter/material.dart';
import 'package:shopping_sm_app/pages/Prodact_overview_page.dart';
import 'package:shopping_sm_app/pages/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static const routName = "/signup-screen";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _signupData = {
    'fullName': '',
    'email': '',
    'password': '',
    'confirmPassword': ''
  };
  final _formKey = GlobalKey<FormState>();
  var _showPassword = true;
  final _passwordController = TextEditingController();

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
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                suffixIcon:
                                    Icon(Icons.check, color: Colors.grey),
                                label: Text("Full Name",
                                    style: TextStyle(
                                        color: Color(0xFF0099CA),
                                        fontSize: 18))),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _signupData['fullName'] = value.toString();
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                suffixIcon:
                                    Icon(Icons.check, color: Colors.grey),
                                label: Text("Phone or email",
                                    style: TextStyle(
                                        color: Color(0xFF0099CA),
                                        fontSize: 18))),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !value.contains('@') ||
                                  !value.contains(".")) {
                                return "Invalid email address you enterd";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _signupData['email'] = newValue.toString();
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
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
                                label: const Text("Password",
                                    style: TextStyle(
                                        color: Color(0xFF0099CA),
                                        fontSize: 18))),
                            textInputAction: TextInputAction.next,
                            obscureText: _showPassword,
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a passwerd';
                              }
                              if (value.length <= 5) {
                                return "Password is too short";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _signupData['password'] = newValue.toString();
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                label: Text("Confirm Password",
                                    style: TextStyle(
                                        color: Color(0xFF0099CA),
                                        fontSize: 18))),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: _showPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a passwerd';
                              }
                              if (value != _passwordController.text) {
                                return "Password does not match";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _signupData['confirmPassword'] =
                                  newValue.toString();
                              Navigator.of(context)
                                  .pushNamed(ProductOverviewScreen.routeName);
                            },
                            onFieldSubmitted: (_) {
                              _submitForm();
                            },
                          ),
                        ])),
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
                              onPressed: () {
                                _submitForm();
                              },
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
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(LoginScreen.routeName);
                              },
                              child: Text(
                                "Sign in",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ))
                        ],
                      ),
                    )
                  ],
                )),
              )),
        ),
      ]),
    );
  }
}
