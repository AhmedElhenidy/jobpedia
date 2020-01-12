import 'package:flutter/material.dart';
class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<String> names=["منى السيد أحمد","نورهان على البهنساوى"];
  List<String> note=["أحب عملى كثيرا","لا تتردد فى طلب مساعدتى"];
  List<String> specialize=["مهندس مدنى","طبيبة أسنان"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("المفضلة"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context,position){
          return Card(
            elevation: 10,
            child: ListTile(
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("التخصص :  ${specialize[position]}"),
                  Text("نبذه عنه :  ${note[position]}"),
                ],
              ),
              title: Text(names[position]),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
              ),
            ),
          );
        },
        )
      ),
    );
  }
}
