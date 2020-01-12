import 'package:flutter/material.dart';
import 'package:jobpedia/main.dart';
import 'package:jobpedia/model/user.dart';
import 'package:jobpedia/services/auth.dart';
import 'package:jobpedia/services/database.dart';
import 'package:jobpedia/ui/chat_page.dart';
import 'package:jobpedia/ui/favourite_page.dart';
import 'package:jobpedia/ui/help.dart';
import 'package:jobpedia/ui/notification_page.dart';
import 'package:jobpedia/ui/search_page.dart';

import '../localizations.dart';
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
      DatabaseService.localUser=user;
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
      drawer: Drawer(
        elevation: 10,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          //color: Colors.red,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                  child: Image.asset("images/logo.png")),
              SizedBox(
                height: 10,
              ),
              ListTile(
                dense: true,
                title: new Text(
                  "المفضلة",
                  style: new TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontFamily: 'bold65',
                  ),
                  textAlign: TextAlign.right,
                ),
                leading: Icon(Icons.favorite,color: Colors.blue,size: 35,),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>FavouritePage()
                  ),
                  );
                },
              ),
              ListTile(
                dense: true,
                title: new Text(
                  "مساعدة",
                  style: new TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.right,
                ),
                leading: Icon(Icons.help,color: Colors.blue,size: 35,),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>Help()
                  ),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    InkWell(
                      child: Text("English   ",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppLocalizations.of(context).locale=="en"?
                          Color(0xffDEB1D0):Colors.grey
                        ),
                      ),
                      onTap: (){

                        MyAppState.notifier.sink.add("en");
                        print("en tapped");
                        Navigator.of(context).pop();

                      },
                    ),
                    Container(
                      width: 2,
                      height: 16,
                      color: Colors.grey,
                    ),
                    InkWell(
                      onTap: (){
                        MyAppState.notifier.sink.add("ar");
                        print("ar tapped");
                        Navigator.of(context).pop();
                      },
                      child: Text("    عربى",
                        style: TextStyle(
                            fontFamily: "Poppins-Bold",
                            color: AppLocalizations.of(context).locale=="ar"?Color(0xffDEB1D0)
                                :Colors.grey,
                            fontSize: 15,
                            height: 1
                        ),
                      ),
                    ),
                  ],
                ),
                leading: Icon(Icons.language,color: Colors.blue,size: 35,),
              ),
            ],
          ),
        ),
      ),
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
class ChooseLanguage extends StatefulWidget{
  _ChooseLanguageState createState()=>_ChooseLanguageState();
}
class _ChooseLanguageState extends State<ChooseLanguage>{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 200,height: 300,
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child:Column(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: new ListTile(
                      title: new Text("العربية",
                        style: new TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey[50],
                            ),
                      ),
                      onTap: () {
                        MyAppState.notifier.sink.add("ar");
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: new ListTile(
                      title: new Text("English",
                        style: new TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey[50],
                            ),
                      ),
                      onTap: () {
                        MyAppState.notifier.sink.add("en");
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}