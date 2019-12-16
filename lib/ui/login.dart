import 'package:flutter/material.dart';
import 'package:jobpedia/services/auth.dart';
import 'package:jobpedia/ui/personal_data.dart';
class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController user , password ;
  String errorText = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = TextEditingController();
    password = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Log In"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xfff5f5f5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height/9,
                child: Center(
                  child: Text(errorText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/1.2,
                child: TextField(
                  autocorrect: false,
                  controller: user,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "اسم المستخدم",
                  ),
                  style: TextStyle(
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/30,
              ),
              Container(
                width: MediaQuery.of(context).size.width/1.2,
                child: TextField(
                  autocorrect: false,
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    errorMaxLines: 1,
                    icon: Icon(Icons.security),
                    hintText: "كلمة المرور",
                  ),
                  style: TextStyle(
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/12,
              ),
              RaisedButton(
                elevation: 10,
                child: Text("التالى"),
                onPressed: (){
                  if(user.text.isEmpty)
                    {
                        setState(() {
                          errorText = " اسم المستخدم لا يجب ان يكون فارغا";
                        });
                    }
                  else if(password.text.length<6){
                    setState(() {
                      errorText = "كلمة المرور لا يجب ان تكون أقل من ستة أحرف";
                    });
                  }
                  else{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalData(
                      mail: user.text,
                      password: password.text,
                    )));
                  }
                },
              ),
             /* RaisedButton(
                elevation: 10,
                child: Text("تسجيل دخول"),
                onPressed: (){
                  AuthService().signInWithEmailAndPassword(user.text, password.text);

                },
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
