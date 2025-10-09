import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "Bodies/HomeBody/homeBody.dart";
import "Bodies/settingBody/settingPage.dart";
import "Bodies/providers/pageIndexProvider.dart";
import "widget/BottomNavigationBar.dart";



class HomePage extends StatefulWidget {
  const HomePage({super.key,this.title = "" });
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var bodiesController = context.read<PageIndexProvider>().bodiesController;

    List<Widget> bodies = [
      const SettingBody(),
      const HomeBody(),
    ];
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title:  Text(
            widget.title.isEmpty ? "الأذكار" : widget.title,
            
          ),
        ),
        body: PageView(
          onPageChanged: (index) {
            context.read<PageIndexProvider>().pageIndexChanged(index);
          },
          controller: bodiesController,
          children: bodies,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const MyBottomNavigationBar());
  }
}
