import 'package:flutter/material.dart';
import 'package:jobpedia/model/user.dart';
import 'package:jobpedia/services/database.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatefulWidget {
  String specialize ,date ,gevern;
  SearchResult({this.date,this.specialize,this.gevern});
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  User localUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserLocalStorage.getUser().then((user){
      this.localUser=user;
    });
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
          elevation: 0.0,
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: SearchItems(this.localUser,widget.date),
        ),
      ),
    );
  }
}

class SearchItems extends StatefulWidget {
  User localUser;
  String date ;
  SearchItems(this.localUser,this.date);
  @override
  _SearchItemsState createState() => _SearchItemsState();
}

class _SearchItemsState extends State<SearchItems> {
  DatabaseService db = DatabaseService();
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<User>>(context);
    print("++++++++++${users.length}");

    return users.length==0?Center(child: Text("jknkl"),):ListView.builder(
      padding: EdgeInsets.all(16),
      itemExtent: 230,
      itemCount: users.length,
      itemBuilder: (context,position){
        return Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)
            ),
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("الإسم: ${users[position].name}",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text("المحافظة: ${users[position].govern}",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text("نبذه عنه: ${users[position].note}",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text("التخصص: ${users[position].specialize}",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: FlatButton(
                      color: Colors.blue,
                      onPressed: (){
                        db.addNotification(
                          type: 1,
                          toId: users[position].uid,
                          specialize: users[position].specialize,
                          name:widget.localUser.name,
                          date: widget.date,
                          govern: users[position].govern
                        );
                        print("from notification");
                      },
                      textColor: Colors.white,
                      child: Text("طلب المساعدة"
                      ),
                    ),
                  ),
                )
              ],
            )
          ),
        );
      },
    );
  }
}
