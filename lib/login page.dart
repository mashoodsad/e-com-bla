import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                    ),
                    child: const Text('Login'),
                    onPressed: () {
                      print(nameController.text);
                      print(passwordController.text);
                    },
                  )
              ), Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('already have account?'),
                  TextButton(
                    child: const Text(
                      'sigin',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                    },
                  )
                ],
              ),
            ]
        ),
      ),
    );
  }
}