import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobpedia/model/brew.dart';
import 'package:jobpedia/model/user.dart';
class DatabaseService{
  String uid;
  String specialize='',gevern='' ;
  DatabaseService({this.uid,});
  // collection refrence
  final CollectionReference brewCollection = Firestore.instance.collection('jobpediaUsers');
   Future updateUserData( {String name,
     String phone,String govern,String note,String specialize}) async{
     return await brewCollection.document(uid).setData({
       'id':uid,
       'name' :name,
       'phone': phone,
       'govern': govern,
       'note': note,
       'specialize': specialize,
     });
   }
   //brew list of snap shot
  /*List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
     return snapshot.documents.map((doc){
       return Brew(
         name: doc.data['name']??'',
         strength: doc.data['strength']??0,
         sugars: doc.data['sugar']??'0',
       );
     }).toList();
  }*/
  List<User> _brewListFromSnapshot(QuerySnapshot snapshot){
    print("from brew list  : : :: : : :");
    print(snapshot.documents[0].data['name']);
    print(this.specialize+  this.gevern);
    return snapshot.documents.map((doc){
      return User(
        name: doc.data['name']??'',
      );
    }).toList();
  }
   Stream<List<User>> get users{
     return brewCollection.where("specialize", isEqualTo: 'مهندس مدنى',)
         .where('govern',isEqualTo: 'dk')
         .snapshots().map(_brewListFromSnapshot);
     //snapshots().map(_brewListFromSnapshot);
   }
}