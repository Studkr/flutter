import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  Color scaffoldBackgroundColor ;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Random rand = new Random();
  Color _color = Colors.white;

  void changeColor(){
    setState(() {
      _color = new Color.fromRGBO(
          rand.nextInt(256),
          rand.nextInt(256),
          rand.nextInt(256),
          1.0
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key:_scaffoldKey,
      appBar:AppBar(
        title: const Text('App title'),
        centerTitle: true,
      ),
      drawer: Drawer(
            child : ListView(
              children: <Widget>[],
            )

      ),
      body: new Container(
        width: double.infinity,
        height: double.infinity,
        child: new GestureDetector(
          onTap: () {
            setState(() {
             changeColor();
            });
          },
          child: new Container(
            child: new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text("Hey there",textAlign: TextAlign.center,)
                ],
              )
            ),
            color: _color,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text('Button whas pressed'),));
        },
        tooltip: 'Increment counter',
        child: Icon(Icons.add_circle),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
