import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'image.dart';
//import 'location.dart';
import 'package:geolocator/geolocator.dart';
//void main() => runApp(home1());
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
class home1 extends StatelessWidget {

  /*final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;*/
  //@override
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: <Widget>[
            Text("HOME ", style: TextStyle(fontSize: 40, color: Colors.black)),
            /*   Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 60,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    onPressed: () {},

                    color: Colors.black,
                    textColor: Colors.white,
                    child: Text('Enter location/Choose current location',style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>getCurrentLocation()));
                      //_getCurrentLocation();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => camera()));
                    },
                    color: Colors.black,
                    textColor: Colors.white,
                    child: Text('Press to report a pothole',
                        style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),

          ],
        ),

      ),

    );
  }
  getCurrentLocation(){
    geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((
        Position position) {
      /* setState(() {
        _currentPosition = position;
        _currentAddress = "Lat: ${_currentPosition.latitude}, Lng: ${_currentPosition.longitude}\n\n";
        _getAddressFromLatLng();
      });*/
      _currentPosition = position;
      _currentAddress =
      "Lat: ${_currentPosition.latitude}, Lng: ${_currentPosition
          .longitude}\n\n";
      _getAddressFromLatLng();
    }).catchError((e) {
      //print(e);
    });
  }
  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      _currentAddress =
          _currentAddress + "${place.subLocality}, ${place.locality}\n\n" +
              "${place.administrativeArea}, ${place.country} - ${place
                  .postalCode}";
      /* setState(() {
        _currentAddress = _currentAddress + "${place.subLocality}, ${place.locality}\n\n" + "${place.administrativeArea}, ${place.country} - ${place.postalCode}";
      });*/
    } catch (e) {
      //print(e);
    }
  }
}
/*
  _getCurrentLocation() {
    geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((Position position) {
      setState(() {
        _currentPosition = position;
        _currentAddress = "Lat: ${_currentPosition.latitude}, Lng: ${_currentPosition.longitude}\n\n";
        _getAddressFromLatLng();
      });
    }).catchError((e) {});
  }
  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      setState(() {
        _currentAddress = _currentAddress + "${place.subLocality}, ${place.locality}\n\n" + "${place.administrativeArea}, ${place.country} - ${place.postalCode}";
      });
    } catch (e) {}
  }
}*/
/*class location extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}*/
/*
class Latlong extends StatefulWidget {
  @override
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  noSuchMethod(Invocation i) => super.noSuchMethod(i);
// @override
/*
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_currentPosition != null)
              Text("${_currentAddress}\n"),
            RaisedButton(
              child: Text("Get Location"),
              onPressed: () {
                _getCurrentLocation();
                Navigator.push(context, MaterialPageRoute(builder: (context) =>camera()));
              },
            ),
          ],
        ),
      ),
    );
  }*/

  getCurrentLocation(){
    geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((
        Position position) {
      /* setState(() {
        _currentPosition = position;
        _currentAddress = "Lat: ${_currentPosition.latitude}, Lng: ${_currentPosition.longitude}\n\n";
        _getAddressFromLatLng();
      });*/
      _currentPosition = position;
      _currentAddress =
      "Lat: ${_currentPosition.latitude}, Lng: ${_currentPosition
          .longitude}\n\n";
      _getAddressFromLatLng();
    }).catchError((e) {
      //print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      _currentAddress =
          _currentAddress + "${place.subLocality}, ${place.locality}\n\n" +
              "${place.administrativeArea}, ${place.country} - ${place
                  .postalCode}";
      /* setState(() {
        _currentAddress = _currentAddress + "${place.subLocality}, ${place.locality}\n\n" + "${place.administrativeArea}, ${place.country} - ${place.postalCode}";
      });*/
    } catch (e) {
      //print(e);
    }
  }
}

 */
