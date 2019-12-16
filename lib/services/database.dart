import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobpedia/model/brew.dart';
import 'package:jobpedia/model/user.dart';
class DatabaseService{
  String uid;
  static String specialize='',gevern='' ;
  DatabaseService({this.uid,});
  User localUser ;
  // collection refrence
  final CollectionReference medCrewCollection = Firestore.instance.collection('jobpediaUsers');
   Future updateUserData( {String name,
     String phone,String govern,String note,String specialize}) async{
     return await medCrewCollection.document(uid).setData({
       'id':uid,
       'name' :name,
       'phone': phone,
       'govern': govern,
       'note': note,
       'specialize': specialize,
     });
   }
  Future addNotification( {String name,String toId,int type,
    String phone,String govern,String date,String specialize}) async{
     UserLocalStorage.getUser().then((user){
       this.localUser=user;
     });
     await medCrewCollection.document(toId).collection('notification').document(uid).setData({
      'from':localUser.uid,
      'to' :toId,
      'name':name,
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
     return medCrewCollection.where("specialize", isEqualTo: specialize,)
         .where('govern',isEqualTo: gevern)
         .snapshots().map(_brewListFromSnapshot);
   }
}