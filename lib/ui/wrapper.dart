import 'package:flutter/material.dart';
import 'package:jobpedia/model/user.dart';
import 'package:jobpedia/statics/bottom_navigation.dart';
import 'package:jobpedia/ui/login.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if(user==null){
      return LogIn();
    }else
      {
        return BottomNavigationClass();
      }

  }
}
