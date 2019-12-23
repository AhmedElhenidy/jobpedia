import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobpedia/model/chats.dart';
import 'package:jobpedia/model/user.dart';
import 'package:jobpedia/services/database.dart';
class ChatRoom  extends StatefulWidget {
  Chats chat;
  ChatRoom({this.chat});
  @override
  _ChatRoomState createState() => _ChatRoomState();
}
class _ChatRoomState extends State<ChatRoom > {
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  final Firestore _firestore = Firestore.instance;
  Future<void> callback() async {
    print("from call back");
    if (messageController.text.length > 0) {
      DatabaseService().updateChat(
        docId: widget.chat.chatId,
        date: DateTime.now().toString(),
        message: messageController.text,
      );
      await _firestore.collection('jobpediaUsersChats').document(widget.chat.chatId).collection('messages').add({
        'text': messageController.text,
        'from': localUser.uid,
        'date': DateTime.now().toString(),
      });
      messageController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }
  User localUser ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    localUser=DatabaseService.localUser;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
       title: Container(
         width: MediaQuery.of(context).size.width,
         padding: EdgeInsets.only(left: 0),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
             Padding(
               padding: const EdgeInsets.only(left:8.0),
               child: Text("  ${localUser.name==widget.chat.senderName
                   ?"  ${widget.chat.receiverName.split(' ')[0]} ${widget.chat.receiverName.split(' ')[1]}"
                   :"  ${widget.chat.senderName.split(' ')[0]} ${widget.chat.senderName.split(' ')[1]}"}",
                ),
             ),
             CircleAvatar(
               backgroundColor: Colors.white,
               child: Icon(Icons.person_outline),
             ),
           ],
         ),
       ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:  _firestore.collection('jobpediaUsersChats')
                    .document(widget.chat.chatId)
                    .collection('messages')
                    .orderBy('date')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  List<DocumentSnapshot> docs = snapshot.data.documents;
                  List<Widget> messages = docs
                      .map((doc) => Message(
                    date: doc.data['date'],
                    text: doc.data['text'],
                    me: localUser.uid == doc.data['from'],
                  ))
                      .toList();
                  return ListView(
                    padding: EdgeInsets.only(left: 16,right: 16),
                    controller: scrollController,
                    children: <Widget>[
                      ...messages,
                    ],
                  );
                },
              ),
            ),
            Container(
              height: 53,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) => callback(),
                      decoration: InputDecoration(
                        hintText: "Enter a Message...",
                        border: const OutlineInputBorder(),
                      ),
                      controller: messageController,
                    ),
                  ),
                  Container(
                    child: FlatButton(
                      color: Colors.orange,
                      onPressed:  callback,
                      child: Padding(
                        padding: const EdgeInsets.only(top:8.0,bottom: 16),
                        child: Text("send"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Message extends StatelessWidget {
  final String date;
  final String text;
  final bool me;
  const Message({Key key, this.date, this.text, this.me}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:
        me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            date.substring(0,16),
          ),
          Material(
            color: me ? Colors.greenAccent : Colors.blue,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                text,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}