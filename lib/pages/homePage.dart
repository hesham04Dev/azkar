import 'package:flutter/material.dart';
import 'homeBody.dart';
import 'rankingBody.dart';
import 'settingBody.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> bodies = [

    const homeBody(),
    const homeBody(),
    const rankingBody(),
  ];

  int NavItem = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: const Text("أذكار"),
          ),

        ),
        body: bodies[NavItem],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: NavItem,
          onTap: (index) {
            setState(() {
              NavItem = index;
            });
          },
          items: const [
             BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text("أدعية", style: TextStyle(fontSize: 16)),/*TODO the color of it dont change */
                ), label: "ادعية "),
             BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: "الصفحة الرئيسية"),
             BottomNavigationBarItem(
                icon: Icon(Icons.stacked_bar_chart_rounded), label: "الدرجات"),
          ],
        ));
  }
}
