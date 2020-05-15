//import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginScreen1 extends StatefulWidget{
  LoginScreen createState() => LoginScreen();
}
class LoginScreen extends State<LoginScreen1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("Sign In", style: TextStyle(fontSize: 26,color: Colors.white)),
          Form(
            key: _formKey,
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (input) {
                        if(input.isEmpty){
                          return 'Please enter an Email';
                        }
                        else
                        {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText:"Enter your Email",
                        focusColor :Colors.white,
                      ),

                      onSaved: (input) => _email = input,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      validator: (input) {
                        if(input.length<6){
                          return 'Enter atleast 6 characters';
                        }
                        else
                        {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText:"Enter your password",
                        focusColor :Colors.white,
                      ),
                      onSaved: (input) => _password = input,
                    ),
                  ),
                ]
            ),
          ),
          Container(
            width: 300,
            height: 45,
            child: RaisedButton(
              onPressed: _signIn,
              child: Text('SIGN IN',style: TextStyle(fontSize: 20),),
              textColor: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: Colors.white,
            ),
          ),
          Text('or sign in with social Account'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 120,
                height: 40,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  onPressed: () {},
                  color: Colors.blue[900],
                  textColor: Colors.white,
                  child: Text('Facebook'),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 120,
                height: 40,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('Google'),
                ),
              ),
            ],
          ),
          Text('Dont have an account?'),
          Container(
            width: 300,
            height: 45,
            child: RaisedButton(
              onPressed: (){
                Navigator.of(context).pushReplacementNamed('/signup');
                },
              child: Text('SIGN UP',style: TextStyle(fontSize: 20),),
              textColor: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: Colors.white,
            ),
          ),
          /*   Text('By signing you agree to our terms of use\n and policy'),
            Text('@copyRight 2020')*/
        ],
      ),
    );
  }
  void _signIn() async {
    final FormState form = _formKey.currentState;
    final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
    if(_formKey.currentState.validate()){
      form.save();
      try{
        FirebaseUser user= (await _firebaseauth.signInWithEmailAndPassword(email: _email, password: _password)).user;
        Navigator.of(context).pushReplacementNamed('/home1');
      }
      catch(e){
        switch (e.code) {
          case "ERROR_USER_NOT_FOUND":
            {

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        child: Text('The username or password is incorrect.'),
                      ),
                    );
                  });

            }
            break;
          case "ERROR_WRONG_PASSWORD":
            {

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        child: Text('The username or password is incorrect.'),
                      ),
                    );
                  });

            }
            break;
          default:
            {

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        child: Text('The username or password is incorrect.'),
                      ),
                    );
                  });

            }
        }
      }
    }
  }
}