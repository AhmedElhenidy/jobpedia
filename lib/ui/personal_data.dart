import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobpedia/services/auth.dart';
import 'package:jobpedia/statics/bottom_navigation.dart';
class PersonalData extends StatefulWidget {
  String mail ,password;
  PersonalData({this.mail,this.password});
  @override
  _PersonalDataState createState() => _PersonalDataState();
}
class _PersonalDataState extends State<PersonalData> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  TextEditingController name , phone , mohagza ,note ;
  String dropdownValue = 'One',error;
  String accountname ="";
  String area ="اختر التخصص";
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController();
    phone = TextEditingController();
    mohagza = TextEditingController();
    note = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("البيانات الشخصية"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xfff5f5f5),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: getImage,
                  child: CircleAvatar(
                    radius: 40,
                    child: Center(
                      child: _image == null?Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ):Image.file(_image,fit: BoxFit.fill,),
                    ),
                    backgroundColor: Colors.grey,
                  ),
                ),
                Text("الصورة الشخصية"),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: TextFormField(
                    controller: name,
                    decoration:  InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: "الإسم رباعى",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: TextFormField(
                    controller: phone,
                    decoration:  InputDecoration(
                      icon: Icon(Icons.phone_android),
                      hintText: "رقم الموبايل",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: TextFormField(
                    controller: mohagza,
                    decoration:  InputDecoration(
                      icon: Icon(Icons.location_on),
                      hintText: "المحافظة",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: TextFormField(
                    controller: note,
                    decoration:  InputDecoration(
                      icon: Icon(Icons.note),
                      hintText: "نبذة مختصرة عنك",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onPressed: (){
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => CupertinoActionSheet(
                            title: const Text('اختر التخصص',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Semi',
                              ),
                            ),
                            //message: const Text('Your options are '),
                            actions: <Widget>[
                              CupertinoActionSheetAction(
                                child: const Text('الهندسة'),
                                onPressed: () {
                                  setState(() {
                                    area ="الهندسة";
                                  });
                                  Navigator.pop(context, 'One');
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (BuildContext context) => CupertinoActionSheet(
                                        title: const Text('اختر التخصص',
                                          style: TextStyle(
                                            fontSize: 22,
                                            //color: FekraColors.blue,
                                            fontFamily: 'Semi',
                                          ),
                                        ),
                                        //message: const Text('Your options are '),
                                        actions: <Widget>[
                                          CupertinoActionSheetAction(
                                            child: const Text('مهندس كهرباء'),
                                            onPressed: () {
                                              setState(() {
                                                area ="مهندس كهرباء";
                                              });
                                              Navigator.pop(context, 'One');
                                            },
                                          ),
                                          CupertinoActionSheetAction(
                                            child: const Text('مهندس مدنى'),
                                            onPressed: () {
                                              setState(() {
                                                area ='مهندس مدنى';
                                              });
                                              Navigator.pop(context, 'Two');
                                            },
                                          ),
                                          CupertinoActionSheetAction(
                                            child: const Text('مهندس اتصالات'),
                                            onPressed: () {
                                              setState(() {
                                                area ='مهندس اتصالات';
                                              });
                                              Navigator.pop(context, 'Two');
                                            },
                                          ),
                                        ],
                                        cancelButton: CupertinoActionSheetAction(
                                          child: const Text('إالغاء'),
                                          isDefaultAction: true,
                                          onPressed: () {
                                            Navigator.pop(context, 'Cancel');
                                          },
                                        )),
                                  );
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: const Text('القانون'),
                                onPressed: () {
                                  setState(() {
                                    area ='القانون';
                                  });
                                  Navigator.pop(context, 'Two');
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: const Text('الصحافة والإعلام'),
                                onPressed: () {
                                  setState(() {
                                    area ='الصحافة والإعلام';
                                  });
                                  Navigator.pop(context, 'Two');
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: const Text('تخصصات خدمية'),
                                onPressed: () {
                                  setState(() {
                                    area ='تخصصات خدمية';
                                  });
                                  Navigator.pop(context, 'Two');
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: const Text('تخصصات حرفية'),
                                onPressed: () {
                                  setState(() {
                                    area ='تخصصات حرفية';
                                  });
                                  Navigator.pop(context, 'Two');
                                },
                              ),
                            ],
                            cancelButton: CupertinoActionSheetAction(
                              child: const Text('إالغاء'),
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context, 'Cancel');
                              },
                            )),
                      );
                    },
                    color: Colors.transparent,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.arrow_drop_down),
                        Text(area),
                      ],
                    ),
                  ),
                ),
                RaisedButton(
                  elevation: 10,
                  child: Text("تسجيل"),
                  onPressed: ()async{
                    if (_formKey.currentState.validate()&&area !="اختر التخصص") {
                      dynamic result  =await _auth.registerWithEmailAndPassword(
                          email: widget.mail,
                      password: widget.password,
                      name: name.text,
                      phone: phone.text,
                      govern: mohagza.text,
                      note: note.text,
                      specialize: area);
                      print(result.toString());
                      print(result);
                      if(result!= null){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                            BottomNavigationClass()), (Route<dynamic> route) => false);
                        setState(() {
                          error = ' validate ypur data';
                        });
                      }
                                      }
                    else{
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
