import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobpedia/model/user.dart';
import 'package:jobpedia/services/auth.dart';
import 'package:jobpedia/services/database.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatefulWidget {
  String specialize ,date ,gevern;
  SearchResult({this.date,this.specialize,this.gevern});
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  DatabaseService db = DatabaseService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.specialize=widget.specialize;
    db.gevern=widget.gevern;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamProvider<List<User>>.value(
      value: DatabaseService().users,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("نتائج البحث"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
        ),
        body: Container(
          child: SearchItems(),
        ),
      ),
    );
  }
}

class SearchItems extends StatefulWidget {
  @override
  _SearchItemsState createState() => _SearchItemsState();
}

class _SearchItemsState extends State<SearchItems> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<User>>(context);
    print("++++++++++${users.length}");
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemExtent: 250,
      itemCount: users.length,
      itemBuilder: (context,position){
        return Container(
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("الإسم: ${users[position].name}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Center(
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: (){},
                  textColor: Colors.white,
                  child: Text("طلب المساعدة"
                  ),
                ),
              )
            ],
          )
        );
      },);
  }
}
