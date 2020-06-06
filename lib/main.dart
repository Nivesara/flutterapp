import 'package:flutter/material.dart';

class user{
  final String username, email,phonenumber,dob;

  const user(
      {
        this.username,
        this.email,
        this.phonenumber,
        this.dob,
      }
      );
}
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  var _usernameController = new TextEditingController();
  var _emailController = new TextEditingController();
  var _phonenumberController = new TextEditingController();
  var _dobController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text('user info'),
      ),
      body: new Container(
        child: new Center(
          child: Column(
            children: <Widget>[
              Padding(
                child: new Text(
                  'Type and passed data',
                  style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'username'),
                controller: _usernameController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'email'),
                controller: _emailController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'phonenumber'),
                controller: _phonenumberController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'dob'),
                controller: _dobController,
              ),
              new RaisedButton(
                onPressed: (){
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                    new SecondPage(
                        value: user(
                          username: _usernameController.text,
                          email: _emailController.text,
                          phonenumber: _phonenumberController.text,
                          dob: _dobController.text,
                        )
                    ),
                  );
                  Navigator.of(context).push(route);
                },
                child: new Text('show data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class SecondPage extends StatefulWidget {
  final user value;
  SecondPage({Key key, this.value}): super(key:key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('second page')
      ),
      body: new Container(
        child: new Center(
          child: Column(
            children:<Widget>[
              Padding (
                child: new Text(
                  'passed values',
                  style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                  textAlign:TextAlign.center,
                ),
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Padding(
                child: new Text(
                  'Username:${widget.value.username}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign:TextAlign.left ,
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'Email:${widget.value.email}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign:TextAlign.left ,
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'Phonenumber:${widget.value.phonenumber}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign:TextAlign.left ,
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'DOB:${widget.value.dob}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign:TextAlign.left ,
                ),
                padding: EdgeInsets.all(10.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: new home(),
      ),
    );
  }
}


void main()=> runApp(new Myapp());