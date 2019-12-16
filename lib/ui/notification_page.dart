import 'package:flutter/material.dart';
import 'package:jobpedia/services/database.dart';
import 'package:provider/provider.dart';
import 'package:jobpedia/model/notifications.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPagePageState createState() => _NotificationPagePageState();
}

class _NotificationPagePageState extends State<NotificationPage> {
  List<String> names=['هدير محمد احمد','محمد زكى ابراهيم','خيرية السيد',];
  List<String> specialize=['دكتورة جلدية','مهندس عماة','محامى'];
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Notifications>>.value(
      value: DatabaseService().notifications,
      child: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xfff0f0f0),
        child:NotificationsList(),
        /*ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: names.length,
          itemBuilder: (context,position){
            return Padding(
              padding: const EdgeInsets.only(bottom :16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                elevation: 10,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("الاسم:    "),
                            Text(names[position])
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("التخصص:  "),
                            Text(specialize[position])
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("التقييم:  "),
                            SmoothStarRating(
                                allowHalfRating: true,
                                /*onRatingChanged: (v) {
                                  rating = v;
                                  setState(() {});
                                },*/
                                starCount: 5,
                                rating: 3.5,
                                size: 25.0,
                                color: Colors.yellow,
                                borderColor: Colors.yellowAccent,
                                spacing:0.0
                            )
                          ],
                        ),
                        Text("لقد وافق ${names[position]} تقديم المساعده هل تود التحدث ؟",textAlign: TextAlign.center,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue
                              ),
                              child: Center(child: Text("نعم")),
                            ),
                            Container(width: 30,),
                            Container(
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue
                              ),
                              child: Center(child: Text("لا")),
                            ),
                          ],
                        )
                      ],
                    ),
                    leading:CircleAvatar(
                      radius: 30,
                      foregroundColor: Colors.black12,
                    ),
                  ),
                ),
              ),
            );
          },
        ),*/
      ),
    );
  }
}

class NotificationsList extends StatefulWidget {
  @override
  _NotificationsListState createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  @override
  Widget build(BuildContext context) {
    final notifications = Provider.of<List<Notifications>>(context);
    print(notifications);
    return ListView.builder(
      itemExtent: 180,
      itemCount: notifications.length,
      itemBuilder: (context,position){
        print(notifications[position].to);
        return notifications[position].type==1?Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          elevation: 10,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${notifications[position].name}",
                  style: TextStyle(
                    color: Colors.blue
                  ),
                ),
                Text("هل يمكنك مساعدة ${notifications[position].name.split(' ')[0]} فى مجال \"${notifications[position].specialize}"
                    "\" فى يوم ${notifications[position].date} ؟",
                  textAlign: TextAlign.center,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.blue,
                        elevation: 10,
                        onPressed: (){
                          DatabaseService().addNotification(
                            receiver: notifications[position].name,
                            govern: notifications[position].govern,
                            date: notifications[position].date,
                            phone: notifications[position].phone,
                            specialize: notifications[position].specialize,
                            toId: notifications[position].from,
                            type: 2
                          ).then((bool){
                                print("notification added");

                          });
                        },
                        child: Text("نعـم"),
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        elevation: 10,
                        onPressed: (){
                        },
                        child: Text("لا"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ):Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          elevation: 10,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("الإسم: ",
                    ),
                    Text("${notifications[position].name}",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("التخصص: ",
                    ),
                    Text("${notifications[position].specialize}",
                    ),
                  ],
                ),
                Text("لقد وافقت ${notifications[position].name.split(' ')[0]} على تقديم المساعده لك. هلى تود التحدث ؟"),
                Container(
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.blue,
                        elevation: 10,
                        onPressed: (){
                        },
                        child: Text("نعـم"),
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        elevation: 10,
                        onPressed: (){
                        },
                        child: Text("لا"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },);
  }
}

