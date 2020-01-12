import 'package:flutter/material.dart';
class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}
class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المساعدة"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: Container(
                child: Image.asset("images/splash.jpg"),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Container(
                child: Text("Jobpedia is a free service that enable people to "
                    "interact with each other to perform their tasks easily by "
                    "looking for the expertise person who is able to finish their"
                    " work efficiently by searching b name, field and region and "
                    "also detecting the time he needs him. The app enables the"
                    " user to chat or deal with the expertise person\n"
                    "This app is established to change the way people interact "
                    "with each other through integrating the technology with "
                    "their daily life to provide them with different, efficient "
                    "and effective way of interaction.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
