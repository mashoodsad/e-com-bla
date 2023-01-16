import 'package:flutter/material.dart';

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyCustomForm(),
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
              decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'phone number'
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty || value.length != 10) {
                  return 'Please enter 10 digit phone number';
                }
                return null;
              },
            ),
          ),Padding(
            padding: const EdgeInsets.all(15.0),
            child:
            TextFormField(
              decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email'
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.')){
                  return 'Invalid Email';
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {

                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
