import 'package:shared_preferences/shared_preferences.dart';

class User{
   String uid ;
  String name;
  String phone;
  String govern ;
  String note;
  String specialize;
  User({this.name,this.note,this.phone,this.govern,this.specialize,this.uid});
}
class UserLocalStorage {
  static Future<bool> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear() ;
    return true ;
  }
  static Future<bool> logIn(User user) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("uid", user.uid);
      await prefs.setString("name", user.name);
      await prefs.setString("phone", user.phone);
      await prefs.setString("govern", user.govern);
      await prefs.setString("note", user.note);
      await prefs.setString("specialize", user.specialize);
      print("user logged in seccess : :: : : : : : : :");
      return true ;
    }catch(Exception){
      print("save to shared faild   :  $Exception");
      return false ;
    }
  }
  static Future< User > getUser () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return  User(
      uid: prefs.getString('uid'),
      specialize: prefs.getString('specialize'),
      govern: prefs.getString('govern'),
      note: prefs.getString('note'),
      phone: prefs.getString('phone'),
      name: prefs.getString('name'),
    );
  }
}