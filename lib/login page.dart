import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petsecom/HomePage.dart';

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

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                  child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/image/bg 3-1.png",fit: BoxFit.cover,)
                      ]
                  )
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),),),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                  TextButton(
                    onPressed: () {
                    },
                    child: const Text('Forgot Password',style: TextStyle(color: Color((0xFFFFC727))),),
                  ),
                ],
              ),

              Container(
                  height: 50,
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
              ), Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('already have account?'),
                  TextButton(
                    child: const Text(
                      'sigin',
                      style: TextStyle(fontSize: 20,color: Color(0xFFFFC727)),
                    ),
                    onPressed: () {

                    },
                  )
                ],
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: _isLoggedIn
                  ? Column(
                children: [
                  //Image.network(_userObj.photoUrl),
                  //Text(_userObj.displayName),
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

                    MaterialStateProperty.all(const Color(0x229727FF)),
                      shadowColor: MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                            )
                        )
                    ),
                    child: Text("Login with Google"),
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
              ),)
            ]
        ),
      ),
    );
  }
}