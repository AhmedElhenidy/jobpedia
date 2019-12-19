import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jobpedia/model/chats.dart';
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
    if (messageController.text.length > 0) {
      await _firestore.collection('messages').add({
        'text': messageController.text,
        'from': '',
        'date': DateTime.now().toIso8601String().toString(),
      });
      messageController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore
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
                    from: doc.data['from'],
                    text: doc.data['text'],
                   // me: widget.user.email == doc.data['from'],
                  ))
                      .toList();

                  return ListView(
                    controller: scrollController,
                    children: <Widget>[
                      ...messages,
                    ],
                  );
                },
              ),
            ),
            Container(
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
                  FlatButton(
                  color: Colors.orange,
                  onPressed: (){

                  },
                  child: Text("send"),
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
  final String from;
  final String text;

  final bool me;

  const Message({Key key, this.from, this.text, this.me}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:
        me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            from,
          ),
          Material(
            color: me ? Colors.teal : Colors.red,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                text,
              ),
            ),
          )
        ],
      ),
    );
  }
}