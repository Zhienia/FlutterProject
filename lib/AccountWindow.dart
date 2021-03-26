import 'package:flutter/material.dart';

class AccountWindow extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        child: new Form(
          key: _formKey,
          child: new Column(
            children: <Widget>[
              new Text('Username:', style: TextStyle(fontSize: 20.0),),
              new TextFormField(validator: (value){
                if (value.isEmpty) return 'Please write your username';
              }),
              new SizedBox(height: 20.0),
              new Text('Password:', style: TextStyle(fontSize: 20.0),),
              new TextFormField(validator: (value){
                if (value.isEmpty) return 'Please write your password';
              }),
              new SizedBox(height: 20.0),
              new ElevatedButton (
                child: Text("Check form"),
                onPressed: () {
                  if(_formKey.currentState.validate()) ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('The form is true'), backgroundColor: Colors.green,));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
