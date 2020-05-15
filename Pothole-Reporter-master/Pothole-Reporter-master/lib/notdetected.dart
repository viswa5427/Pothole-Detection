import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home1.dart';
import 'image.dart';
//void main() => runApp(notdetect());

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
class notdetect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: <Widget>[
            Text("RESULT", style: TextStyle(fontSize: 26,color: Colors.white)),
            Text("POTHOLE NOT DETECTED!!", style: TextStyle(fontSize: 26,color: Colors.white)),
            Container(
              width: 300,
              height: 45,
              child: RaisedButton(

                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => home1()));},
                child: Text('HOME',style: TextStyle(fontSize: 20),),
                textColor: Colors.lightBlue,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.white,
              ),
            ),

            Container(
              width: 300,
              height: 45,
              child: RaisedButton(

                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => camera()));},
                child: Text('TRY AGAIN',style: TextStyle(fontSize: 20),),
                textColor: Colors.lightBlue,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.white,
              ),
            )
          ],
        ),
      ),

    );
  }
}