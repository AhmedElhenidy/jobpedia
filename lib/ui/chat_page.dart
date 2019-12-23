import 'package:flutter/material.dart';
import 'package:jobpedia/model/chats.dart';
import 'package:jobpedia/model/user.dart';
import 'package:jobpedia/services/database.dart';
import 'package:jobpedia/ui/chat%20room.dart';
import 'package:provider/provider.dart';
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
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Chats>>.value(
      value: DatabaseService().chats,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child:ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: names.length,
          itemBuilder: (context,position){
            return ChatsList();
            /*Container(
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
            );*/
          },
        ),
      ),
    );
  }
}
class ChatsList extends StatefulWidget {
  @override
  _ChatsListState createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  User localUser ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    localUser=DatabaseService.localUser;

  }
  @override
  Widget build(BuildContext context) {
    final chats = Provider.of<List<Chats>>(context);
    print(chats);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context,position){
          print(chats[position].senderName);
          return Container(
            child: ListTile(
              onTap: (){
                print(" I`m tapped ${chats[position].chatId}");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRoom(chat: chats[position],)));
              },
             title:Row(
               children: <Widget>[
                 Expanded(
                   child: Text("${localUser.name==chats[position].senderName
                       ?"${chats[position].receiverName.split(' ')[0]} ${chats[position].receiverName.split(' ')[1]}"
                       :"${chats[position].senderName.split(' ')[0]} ${chats[position].senderName.split(' ')[1]}"}",
                    ),
                 ),
                 Text("${chats[position].date.substring(0,10)}",
                  style: TextStyle(
                    color: Colors.grey
                  ),
                 )
               ],
             ),
             subtitle: Text("${chats[position].messages}",
              ),
             leading: CircleAvatar(
               backgroundColor: Colors.grey,
               radius: 30,
             ),
            ),
          );
        },
      ),
    );
  }
}
