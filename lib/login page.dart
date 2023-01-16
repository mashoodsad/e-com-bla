import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petsecom/HomePage.dart';

import 'Sgin up.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoggedIn = false;
  late GoogleSignInAccount _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  void _navigateToHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) =>  HomePage()));
  }
  void _navigateToSginUp(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SingUp()));
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Image.asset("assets/image/bg 3-1.png",fit: BoxFit.cover,),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(top: 259,left: 16,right: 16),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
              ),),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top:348,left: 16,right: 16),
          child: TextField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 410.0,right: 16),
              child: TextButton(
                onPressed: () {
                },
                child: const Text('Forgot Password',style: TextStyle(color: Color((0xFFFFC727))),),
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top: 450),
          child: Container(
              height: 50,
              width: 600,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor:

                  MaterialStateProperty.all(const Color(0xFFFFC727)),
                  shadowColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )
                    )
                ),
                child: const Text('Login'),
                onPressed: () {
                  print(nameController.text);
                  print(passwordController.text);
                  _navigateToHome(context);
                },
              )
          ),

        ), Padding(
          padding: const EdgeInsets.only(top: 580),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('already have account?'),
              TextButton(
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20,color: Color(0xFFFFC727)),
                ),
                onPressed: () {
                  _navigateToSginUp(context);
                },
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:520),
          child: Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: _isLoggedIn
              ? Column(
            children: [
              Text(_userObj.email),
              TextButton(
                  onPressed: () {
                    _googleSignIn.signOut().then((value) {
                      setState(() {
                        _isLoggedIn = false;
                      });
                    }).catchError((e) {});
                  },
                  child: Text("Logout"))
            ],
          )
              : Center(
            child: SizedBox(
              height: 50,
              width: 600,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor:

                MaterialStateProperty.all(const Color(0xD9727FF)),
                  shadowColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                        )
                    )
                ),
                child: const Text("Login with Google"),
                onPressed: () {
                  _googleSignIn.signIn().then((userData) {
                    setState(() {
                      _isLoggedIn = true;
                      _userObj = userData!;
                    });
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
            ),
          ),),
        ),
        ]
      ),
    );
  }
}