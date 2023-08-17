import 'package:flutter/material.dart';
import '../Widget/ClickTitle.dart';
import '../azkar_lists.dart';
import 'azkarPage.dart';

class homeBody extends StatelessWidget {
  const homeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
         shrinkWrap: true,
        children: PageNames.map((name) {
          return Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: ClickTitle(
                text: name,

                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Directionality(textDirection: TextDirection.rtl,child:   azkarPage(name),);
                  }));
                },
              ));
        }).toList(),
      ),
    );
  }
}
