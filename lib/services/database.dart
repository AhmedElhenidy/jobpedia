import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobpedia/model/chats.dart';
import 'package:jobpedia/model/notifications.dart';
import 'package:jobpedia/model/user.dart';
class DatabaseService{
  String uid;
  static String myUID ;
  static String specialize='',gevern='' ;
  DatabaseService({this.uid,});
  static User localUser;
  // collection reference
  final CollectionReference jobpediaCollection = Firestore.instance.collection('jobpediaUsers');
  final CollectionReference chatCollection = Firestore.instance.collection('jobpediaUsersChats');
  // add chats
  Future makeChat( {String toId ,String message ,DateTime date,String receiverName}) async{
     // make chat on other side
    var result =await chatCollection.add({
      'senderId':localUser.uid,
      'recieverID' :toId,
      'senderName':localUser.name,
      'recieverName':receiverName,
      'messages':message,
      'date': date.toString(),
    });
    print("result id is  : : :  :  ${result.documentID}");
  }
  Future updateChat( {String docId ,String message ,String date}) async{
    // make chat on other side
    await chatCollection.document(docId).updateData({
      'messages':message,
      'date': date.toString(),
    });

  }
  // add user to fire base
  Future updateUserData( {String name,
    String phone,String govern,String note,String specialize}) async{
    return await jobpediaCollection.document(uid).setData({
      'id':uid,
      'name' :name,
      'phone': phone,
      'govern': govern,
      'note': note,
      'specialize': specialize,
    });
  }
  // add notifications
  Future addNotification( {String sender,String receiver ,String toId,int type,
    String phone,String govern,String date,String specialize}) async{
    await jobpediaCollection.document(toId).collection('notification').document(uid).setData({
      'senderId':localUser.uid,
      'recieverID' :toId,
      'senderName':localUser.name,
      'recieverName':receiver,
      'phone': phone,
      'govern': govern,
      'date': date,
      'specialize': specialize,
      'type':type,
    });
  }
   //user list of snap shot
  List<User> _brewListFromSnapshot(QuerySnapshot snapshot){
    print("from brew list  : : :: : : :");
    print(snapshot.documents[0].data);
    print(specialize+  gevern);
    return snapshot.documents.map((doc){
      return User(
        name: doc.data['name']??'',
        phone: doc.data['phone']??'',
        specialize: doc.data['specialize']??'',
        govern: doc.data['govern']??'',
        note: doc.data['note']??'',
        uid: doc.data['id']??'',
      );
    }).toList();
  }
   Stream<List<User>> get users{
     return jobpediaCollection.where("specialize", isEqualTo: specialize,)
         .where('govern',isEqualTo: gevern)
         .snapshots().map(_brewListFromSnapshot);
   }


   // notifications
  List<Notifications> _notificationListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      print(doc.data);
      return Notifications.fromJson(doc.data);
    }).toList();
  }
  Stream<List<Notifications>> get notifications{
    return jobpediaCollection.document(localUser.uid).collection('notification').snapshots()
        .map(_notificationListFromSnapshot);
  }

  // chats page lists
  List<Chats> _chatListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      print("from chat list snap shot : : : : : : ${doc.documentID}${ doc.data} ");
      return Chats.fromJson(doc.data,doc.documentID);
    }).toList();
  }
  Stream<List<Chats>> get chats{
    return chatCollection.orderBy('date').snapshots()
        .map(_chatListFromSnapshot);
  }
}