import 'package:flutter/material.dart';

class SginUp2 extends StatefulWidget {
  const SginUp2({Key? key}) : super(key: key);

  @override
  State<SginUp2> createState() => _SginUp2State();
}

class _SginUp2State extends State<SginUp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children:[
              Image.asset("assets/image/sin1-1.png"),
              const Positioned(child:
              MyCustomForm2(),)
            ]
        )
       );
  }
}

class MyCustomForm2 extends StatefulWidget {
  const MyCustomForm2({Key? key}) : super(key: key);

  @override
  State<MyCustomForm2> createState() => _MyCustomForm2State();
}

class _MyCustomForm2State extends State<MyCustomForm2> {
  @override
  Widget build(BuildContext context) {
    return Form(child:  Column(
        children:<Widget> [
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
    ),
    Padding(
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

    ],
    )
    );
  }
}
