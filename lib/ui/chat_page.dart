import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> names=['Mohamed Ahmed','Gamal Omar','خيرية السيد','Samira Saeed','Ghada Morad','Asmaa Ahmed'];
  List<String> msg=['ازيك','أيوه انا ساكن هناك',' ممكن أفضى من خمسة..','Sorry, I`m busy','خلاص تمام'
    ,'هكلمك بكره'];
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
          return Container(
            padding: EdgeInsets.all(8),
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(names[position],
                        style: TextStyle(
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      Text("yesterday",
                        style: TextStyle(
                          fontSize: 12
                        ),
                      ),
                    ],
                  ),
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(msg[position]),
                      SmoothStarRating(
                          allowHalfRating: true,
                          /*onRatingChanged: (v) {
                            rating = v;
                            setState(() {});
                          },*/
                          starCount: 5,
                          rating: 2.5,
                          size: 20.0,
                          color: Colors.yellow,
                          borderColor: Colors.yellowAccent,
                          spacing:0.0
                      )
                    ],
                  ),*/
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(msg[position],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SmoothStarRating(
                      allowHalfRating: true,
                      /*onRatingChanged: (v) {
                            rating = v;
                            setState(() {});
                          },*/
                      starCount: 5,
                      rating: 2.5,
                      size: 18.0,
                      color: Colors.yellow,
                      borderColor: Colors.yellowAccent,
                      spacing:0.0
                  )
                ],
              ),
              leading:CircleAvatar(
                radius: 30,
                foregroundColor: Colors.black12,
              ),
            ),
          );
        },
      ),
    );
  }
}
