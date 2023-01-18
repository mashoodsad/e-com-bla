import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children:[
          Image.asset("assets/image/sin1-1.png",fit: BoxFit.cover,),
      const Positioned(child:
      MyCustomForm(),)
    ]
      )
    );
  }
}
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  bool _isLoggedIn = false;
  late GoogleSignInAccount _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username'
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: _pass,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              validator: (value){
                if (value == null || value.isEmpty || value.length < 6 ){
                  return 'please enter password';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: _confirmPass,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Re-enter-Password',
              ),validator: (value){
              if (value == null || value.isEmpty){
                return 'please enter password';
              } if(value != _pass.text) {
                return 'Not Match';
              }
              return null;
            },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:150.0),
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
                      onPressed: () {

                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
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
                            child:const Text("Logout"))
                      ],
                    )
                        : Center(
                      child: SizedBox(
                        height: 50,
                        width: 600,
                        child: ElevatedButton(
                          style: ButtonStyle(backgroundColor:

                          MaterialStateProperty.all(const Color(0x22977BB2)),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
