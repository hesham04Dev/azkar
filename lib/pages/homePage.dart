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
    const settingBody(),
    const homeBody(),
    const rankingBody(),
  ];

  int NavItem = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:  TextButton(
              onPressed: () {},
              child: Text(
                "أدعية",
                style: TextStyle(color: Theme.of(context).disabledColor),
              )),
          title: const Text("أذكار"),

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
                icon: Icon(Icons.settings_rounded), label: "الإعدادات "),
             BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: "الصفحة الرئيسية"),
             BottomNavigationBarItem(
                icon: Icon(Icons.stacked_bar_chart_rounded), label: "الدرجات"),
          ],
        ));
  }
}
