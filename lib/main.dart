import 'dart:async';
import 'package:flutter/material.dart';
import 'Sgin up.dart';
import 'login page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SplashSecond())));
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/image/Untitled-1.png",
      fit: BoxFit.cover,
    );
  }
}

class SplashSecond extends StatefulWidget {
  const SplashSecond({Key? key}) : super(key: key);

  @override
  State<SplashSecond> createState() => _SplashSecondState();
}

class _SplashSecondState extends State<SplashSecond> {
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SplashTrid()));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/image/Untitled-2.png"
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 70.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(
                              fontSize: 20, fontStyle: FontStyle.normal),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFFFC727)),
                        shadowColor: MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(15)),
                        alignment: Alignment.bottomCenter),
                    onPressed: () {
                      _navigateToNextScreen(context);
                    },
                    label: const Text('Next  '),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
            ),
          ),
          const Center(
              child: Padding(
            padding: EdgeInsets.only(left: 17.0, bottom: 207),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Share the love for\n'
                'our furry friends',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26,fontFamily: 'Poppins'),
              ),
            ),
          )),
          const Padding(
            padding: EdgeInsets.only(left: 17.0, bottom: 160),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                    "Things that make them happy and make \n your life easy and hussle free",style: TextStyle(
                  fontSize: 14,fontFamily: 'Poppins'
                ),)),
          )
        ],
      ),
    );
  }
}

class SplashTrid extends StatefulWidget {
  const SplashTrid({Key? key}) : super(key: key);

  @override
  State<SplashTrid> createState() => _SplashTridState();
}

class _SplashTridState extends State<SplashTrid> {
  void _navigateToLogin(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Login()));
  }
  void _navigateToSginUp(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SingUp()));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/image/Untitled-2-Recovered.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 70.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(
                              fontSize: 20, fontStyle: FontStyle.normal),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFFFC727)),
                        shadowColor: MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(15)),
                        alignment: Alignment.bottomCenter),
                    onPressed: () {
                      _navigateToLogin(context);
                    },
                    label: const Text("Login"),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 72.0),
                  child: TextButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20, color: Color(0xFFFFC727)),
                    ),
                    onPressed: () {
                      _navigateToSginUp(context);
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
