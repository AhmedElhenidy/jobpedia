import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:jobpedia/services/auth.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:jobpedia/ui/search_result.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController name = TextEditingController();
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchBySpecialize()));
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.grey),
              width: MediaQuery.of(context).size.width / 1.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "اختر حسب التخصص والمنطقة",
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: "ابحث بالإسم",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBySpecialize extends StatefulWidget {
  @override
  _SearchBySpecializeState createState() => _SearchBySpecializeState();
}

class _SearchBySpecializeState extends State<SearchBySpecialize> {
  List<String> govern = [
    'الإسكندرية','الإسماعيلية','أسوان', 'أسيوط','الأقصر','البحر الأحمر','البحيرة','بنى سويف','بورسعيد'
    ,'جنو سيناء','الجيزة','الدقهلية', 'دمياط', 'سوهاج', 'الشرقية', 'شمال سيناء', 'الغربية', 'الفيوم',
    'القاهرة', 'قنا', 'كفر الشيخ', 'مرسى مطروح', 'المنوفية', 'المنيا', 'الوادى الجديد',];
   DateTime _currentDate ;
   String government ='dk';
   String specialize ='مهندس مدنى';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'المجال',
              ),
              Tab(
                text: 'التاريخ',
              ),
              Tab(
                text: 'المحافظة',
              ),
            ],
          ),
          centerTitle: true,
          title: Text('اختر حسب التخصص والمنطقة'),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //الهندسة
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              "الهندسة",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //الفانون
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              "القانون",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //الصحافة والغعلام
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              "الصحافة والإعلام",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //تخصصات خدمية
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              "تخصصات خدمية",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //تخصصات حرفية
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              "تخصصات حرفية",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                            color: Colors.blue,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4.5,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: CalendarCarousel<Event>(
                locale: "ar",
                onDayPressed: (DateTime date, List<Event> events) {
                  this.setState(() => _currentDate = date);
                  print(date.toString());
                },
                weekendTextStyle: TextStyle(
                  color: Colors.red,
                ),
                thisMonthDayBorderColor: Colors.grey,
                weekFormat: false,
               // markedDatesMap: _markedDateMap,
                height: 420.0,
                selectedDateTime: _currentDate,
                daysHaveCircularBorder: true,

                /// null for not rendering any border, true for circular border, false for rectangular border
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.all(16),
              reverse: false,
              itemCount: govern.length,
              itemBuilder: (context, position) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                          SearchResult(
                            date:_currentDate.toString() ,
                            gevern: government,
                            specialize:specialize ,
                          )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      color: Color(0xfff0f0f0),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          govern[position],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
