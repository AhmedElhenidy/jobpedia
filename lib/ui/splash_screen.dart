import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jobpedia/ui/wrapper.dart';
import 'package:splashscreen/splashscreen.dart';
class SplashScreensextends extends StatefulWidget {
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreensextends> {
  int state ;
  Timer timer ;
  bool finished=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer =new Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        finished =false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      loadingText: Text("Loading..."),
        seconds: 6,
        navigateAfterSeconds: Wrapper(),
        title:  finished?Text('\tThe best way to find yourself is to '
            'lose yourself in the services of others    ',
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0
          ),):Text('\tJobpedia is a facilitating network that make'
            ' it easier to get help at any time and any place from '
            'people with experience in many fields which is needed'
            ' permanently, whether through talks or direct dealing.',
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0
          ),)
      ,
        image: new Image.asset('images/splash.jpg'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0
        ),
        photoSize: 180.0,
        loaderColor: Colors.blue,
    );

  }
}
