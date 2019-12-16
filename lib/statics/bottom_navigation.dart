import 'package:flutter/material.dart';
import 'package:jobpedia/model/user.dart';
import 'package:jobpedia/services/auth.dart';
import 'package:jobpedia/services/database.dart';
import 'package:jobpedia/ui/chat_page.dart';
import 'package:jobpedia/ui/notification_page.dart';
import 'package:jobpedia/ui/search_page.dart';
class BottomNavigationClass extends StatefulWidget{
  _BottomNavigationClassState createState()=> _BottomNavigationClassState();
}
class _BottomNavigationClassState extends State<BottomNavigationClass>{
  int _page =0;
  int cartCount=0,wishListCount=0;
  GlobalKey<ScaffoldState> _globalKeyScafoldState =
  new GlobalKey<ScaffoldState>();
  PageController _pageController;

  navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 100), curve: Curves.ease);
  }
  void onPageChanged(int page){
    print(page);
    setState(() {
      this._page = page;
    });
  }
  @override
  void initState() {
    super.initState();
    _globalKeyScafoldState = new GlobalKey<ScaffoldState>();
    _pageController = new PageController();
    UserLocalStorage.getUser().then((user){
      AuthService.localUser=user;
    });
      }
  @override
  void dispose() {
    super.dispose();
    print("bottom navigation Disposed ");

  }
  @override
  Widget build(BuildContext context) {
    BottomNavigationBarItem search = new BottomNavigationBarItem(
      title: Container(),
        icon: Icon(Icons.search,size: 38,),
    );
    BottomNavigationBarItem notification = new BottomNavigationBarItem(
        title: Container(),
        icon: Icon(Icons.notifications,size: 38)
    );
    BottomNavigationBarItem chat = new BottomNavigationBarItem(
        title: new Container(),
        icon:Icon(Icons.chat,size: 38,)
    );
    BottomNavigationBarItem favourite = new BottomNavigationBarItem(
        title: new Container(),
        icon: Icon(Icons.favorite,size: 38)
    );
    Widget bottomNavigationBarWidget = BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: [
        search,
        notification,
        chat,
       // favourite,
      ],
      onTap: navigationTapped,
      currentIndex: _page,
    );
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
     // drawer: DrawerClass().showDrawer(context),
      key: _globalKeyScafoldState,
      bottomNavigationBar: bottomNavigationBarWidget,
      appBar: AppBar(
        title: Text(_page==0?"البحث":_page==1?"الإشعارات":"المحادثات"),
        centerTitle: true,
      ),//.appBar(this.context,_globalKeyScafoldState,count),
      body: new PageView(
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          reverse: false,
          physics: const BouncingScrollPhysics(),
          children: [
            SearchPage(),
            NotificationPage(),
            ChatPage(),
            //FavouritePage(),
          ],
          controller: _pageController,
          onPageChanged: onPageChanged),
    );
  }
}