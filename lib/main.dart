import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Test project'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List colors = [Colors.red, Colors.green, Colors.yellow, Colors.black, Colors.pink];
  Random random = new Random();
  int _index = 0;
  Color _color;

  void changeIndex() {
    setState(() => _index = random.nextInt(5));
  }

  void changeColor() {
    setState(() {
      _color = colors[_index];
    });
  }

  @override
  void initState() {
    super.initState();
    _color = Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(widget.title),
     ),
     body: GestureDetector(
       onTap: () {
         changeIndex();
         changeColor();
       },
       child: Container (
         color: _color,
         child: Center (
           child: Text(
             'Hey there',
             style: TextStyle(color: Colors.blue, fontSize: 35),
           )
         ),
       ),
     ),
     floatingActionButton: FloatingActionButton.extended(
       onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => AccountWindow()));
       },
       label: const Text('Account'),
       icon: const Icon(Icons.account_circle_outlined),
       backgroundColor: Colors.blue,
     ),
   );
  }
}

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
