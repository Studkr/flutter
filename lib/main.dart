import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  void alertDialog(){
    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text('Allert'),
        content: Text('This is Alert dialog'),
        actions: <Widget>[
          FlatButton(
            child: Text('Close'),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
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
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text('About',style: TextStyle(color: Colors.white),),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Seting'),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>secondScreen()));
                  },
                ),
                ListTile(
                  title: Text('Alert dialog'),
                  onTap: (){
                    alertDialog();
                  },
                )
              ],
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

class secondScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Setings"),
      ),
      body: new Container(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0)
            ),
          color: Colors.purple,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.settings_applications),
                title: Text('Change app setings',style: TextStyle(color: Colors.white),),
                onTap: (){
                  _scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text('Settings')));
                },
              )
            ],
          ),
        ),
      )
    );



  }
}
