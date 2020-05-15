import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:advanced_share/advanced_share.dart';
//import 'home1.dart';
//void main() => runApp(detect());
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Myhome(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'OpenSans'),
    );
  }
}*/
class detect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: <Widget>[

            Text("YOUR COMPLAINT IS REGISTERED ", style: TextStyle(fontSize: 26,color: Colors.black)),
            Container(
              width: 300,
              height: 45,
              child: RaisedButton(

                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/home1');
                  },
                  child: Text('HOME',style: TextStyle(fontSize: 20),),
                  textColor: Colors.black,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  color: Colors.orange
              ),
            ),







            Text('Share on social media',style: TextStyle(fontSize: 26,color: Colors.black)),
            /* Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 60,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    onPressed: () {
                      AdvancedShare.facebook(msg: "pothole reported");
                    },
                    color: Colors.blue[900],
                    textColor: Colors.white,
                    child: Text('Share on facebook',style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),*/
           /* Container(
              width: 300,
              height: 45,
              child: RaisedButton(

                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => home1()));},
                  child: Text('HOME',style: TextStyle(fontSize: 20),),
                  textColor: Colors.lightBlue,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  color: Colors.white
              ),
            ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 60,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    onPressed: () {
                      // AdvancedShare.whatsapp(msg: "pothole reported");
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Text('Share on whatsapp',style: TextStyle(fontSize: 20)),

                  ),
                ),
              ],
            ),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 60,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    onPressed: () {
                      AdvancedShare.twitter(msg: "pothole reported");
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text('Share on twitter',style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),*/
            Text('By sharing your complaint people will get to know about this problem and you can get support',style: TextStyle(fontSize: 15)),

          ],
        ),

      ),

    );


  }
}