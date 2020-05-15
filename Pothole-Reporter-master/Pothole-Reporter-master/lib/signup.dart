import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:pothole_reporter/otp.dart';
//import 'login_screen.dart';
import 'otpgen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(Signup());

/*class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Myhome(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'OpenSans'),
    );
  }
}*/
class Signup extends StatefulWidget{
  SignUp createState() => SignUp();
}
class SignUp extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, _phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueAccent,

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Sign Up", style: TextStyle(fontSize: 26,color: Colors.white)),
            Form(
              key: _formKey,
              child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText:"Enter your Email",
                          focusColor :Colors.white,
                        ),
                        validator: (input) {
                          if(input.isEmpty){
                            return "Please enter an Email ID";
                          }
                          else
                          {
                            return null;
                          }
                        },
                        onSaved: (input) => _email = input,
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText:"Enter your Name",
                          focusColor :Colors.white,
                        ),
                        validator: (input) {
                          if(input.isEmpty){
                            return "Please enter the Full Name";
                          }
                          else {
                            return null;
                          }
                        },
                      ),
                      //onSaved: (input) => _name = input,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          hintText:"Enter a phone number",
                          focusColor :Colors.white,
                        ),
                        validator: (input) {
                          if(input.isEmpty){
                            return 'Please enter a Phone number';
                          }
                          else
                          {
                            return null;
                          }
                        },
                        onSaved: (input) => _phone = input,

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText:"Enter your password",
                          focusColor :Colors.white,
                        ),
                        validator: (input) {
                          if(input.length<8){
                            return 'Password should be atleast 8 characters';
                          }
                          else
                          {
                            return null;
                          }
                        },
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
                child: Text('SIGN UP',style: TextStyle(fontSize: 20),),
                textColor: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.white,
                onPressed: () {
                  signUp();
                  Navigator.of(context).pushReplacementNamed('/otp');
                },
              ),

            ),
            Text('or sign up with social Account'),
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
                    onPressed: () {
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text('Google'),
                  ),
                ),
              ],
            ),
            Text('By signing you agree to our terms of use\n and policy'),
            Text('@copyRight 2020')
          ],
        ),
      ),
    );
  }
  _verificationComplete(AuthCredential authCredential, BuildContext context) {
    FirebaseAuth.instance.signInWithCredential(authCredential).then((authResult) {
      final snackBar = SnackBar(content: Text("Success!!! UUID is: " + authResult.user.uid));
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }
//
//  _smsCodeSent(String verificationId, List<int> code) {
//    // set the verification code so that we can use it to log the user in
//    _smsVerificationCode = verificationId;
//  }

  _verificationFailed(AuthException authException, BuildContext context) {
    final snackBar = SnackBar(content: Text("Exception!! message:" + authException.message.toString()));
    Scaffold.of(context).showSnackBar(snackBar);
  }

//  _codeAutoRetrievalTimeout(String verificationId) {
//    // set the verification code so that we can use it to log the user in
//    _smsVerificationCode = verificationId;
//  }
  void signUp() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)).user;
        await FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: _phone, timeout: Duration(seconds: 30), verificationCompleted: (authCredential) => _verificationComplete(authCredential, context), verificationFailed: (authException) => _verificationFailed(authException, context), codeSent: null, codeAutoRetrievalTimeout: null);
        Navigator.of(context).pushReplacementNamed('/citser');
      }catch(e){
        switch(e.code){
          case "ERROR_EMAIL_ALREADY_IN_USE":
            {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        child: Text('This email is already in use.'),
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
                        child: Text('Invalid data!'),
                      ),
                    );
                  });
            }
        }
      }
    }
  }
}