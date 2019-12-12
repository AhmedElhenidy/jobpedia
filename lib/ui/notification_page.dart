import 'package:flutter/material.dart';
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child:ListView.builder(
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
      ),
    );
  }
}
