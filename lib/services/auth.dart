import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobpedia/model/user.dart';
import 'package:jobpedia/services/database.dart';
class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFireBase(FirebaseUser user){
    return user != null ? User(uid: user.uid):null;
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromFireBase);
        //.map((FirebaseUser user)=>_userFromFireBase(user));
  }
  Future registerWithEmailAndPassword({String email,String password,String name,
    String phone,String govern,String note,String specialize}) async{
    try{
      print("from register");
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      // create new document for user with uid
      await DatabaseService(uid: user.uid).updateUserData(
        specialize: specialize,
        note: note,
        govern: govern,
        phone: phone,
        name: name,
      );
      return _userFromFireBase(user);
    }catch(e){
      print(e.toString());
      return null ;
    }

  }

  // sign in wit hemail and password
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFireBase(user);
    }catch(e){
      print(e.toString());
      return null ;
    }

  }
  //sign in anon
  Future signInAnon() async {
    try{
      AuthResult result =await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFireBase(user) ;
    }catch(e){
      print(e.toString());
      return null ;
    }
  }

  // sign out
  Future signOut()async{
    try{
      return _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}