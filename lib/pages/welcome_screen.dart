import 'package:flutter/material.dart';
import 'package:shopping_sm_app/pages/login_screen.dart';
import 'package:shopping_sm_app/pages/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const routName = '/welcome-screen';

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
          child: Column(children: [
            const Align(
                alignment: Alignment.topCenter,
                child: Image(
                  image: AssetImage("assets/images/shoppingLogo.png"),
                  fit: BoxFit.fill,
                )),
            SizedBox(
              height: mediaqWheight * .06,
            ),
            const Text(
              "Welcome Back",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: mediaqWheight * .04,
            ),
            Container(
              height: 45,
              width: mediaqWwidth * .7,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
                child: const Text(
                  "SIGN IN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: mediaqWheight * .04,
            ),
            Container(
              height: 45,
              width: mediaqWwidth * .7,
              decoration: BoxDecoration(
                  //border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SignupScreen.routName);
                },
                child: Text(
                  "SIGN UP",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            SizedBox(
              height: mediaqWheight * .15,
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Text(
                    "Login with social icons",
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.telegram,
                        color: Colors.white,
                      ),
                      Icon(Icons.tiktok, color: Colors.white),
                      Icon(Icons.facebook, color: Colors.white)
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
