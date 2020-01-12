import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jobpedia/LocaleHelper.dart';
import 'package:jobpedia/localizations.dart';
import 'package:jobpedia/model/user.dart';
import 'package:jobpedia/services/auth.dart';
import 'package:jobpedia/ui/splash_screen.dart';
import 'package:jobpedia/ui/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget{
  MyAppState createState()=>MyAppState();
}
class MyAppState extends State<MyApp> {
  User user ;
  static StreamController notifier = new StreamController.broadcast();
  final Stream trigger = notifier.stream ;
  StreamSubscription subscription ;
  SpecificLocalizationDelegate _specificLocalizationDelegate=SpecificLocalizationDelegate(Locale("ar"));
  // This widget is the root of your application.
  onLocaleChange(Locale locale){
    setState((){
      _specificLocalizationDelegate = new SpecificLocalizationDelegate(locale);
    });
  }
  @override
  void initState() {
    super.initState();

    helper.onLocaleChanged = onLocaleChange;
    subscription =  trigger.listen((i){

      print("from stream");
      setState(() {
        helper.onLocaleChanged(Locale(i));

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          new FallbackCupertinoLocalisationsDelegate(),
          //app-specific localization
          _specificLocalizationDelegate
        ],
        supportedLocales: [Locale('en'), Locale('ar')],
        locale: _specificLocalizationDelegate.overriddenLocale,
//        builder:(context,widget){
//          return Directionality(textDirection: TextDirection.rtl, child: widget);
//        },
        title: 'demo',
        theme: ThemeData(
          fontFamily: 'bold65',
          primarySwatch: Colors.blue,
        ),
        home: SplashScreensextends(),
      ),
    );
  }
}
