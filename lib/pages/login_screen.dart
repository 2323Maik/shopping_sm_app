import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/welcome-screen';

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
              ])),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          decoration: const InputDecoration(
                              suffixIcon: Icon(
                                Icons.check,
                                color: Colors.grey,
                              ),
                              label: Text(
                                "Gmail",
                                style: TextStyle(
                                    color: Color(0xFF0099CA),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                        ),
                        TextField(
                          decoration: const InputDecoration(
                              focusColor: Color(0xFF0099CA),
                              suffixIcon: Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              label: Text(
                                "Password",
                                style: TextStyle(
                                    color: Color(0xFF0099CA),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                        ),
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
                              onPressed: () {},
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
                                onPressed: () {},
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
                                  onPressed: () {},
                                  child: Text(
                                    "Sign up",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ))
                            ],
                          ),
                        )
                      ],
                    )),
              ))
        ],
      ),
    );
  }
}
