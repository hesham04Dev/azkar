import 'package:flutter/material.dart';
import '../Widget/zkr.dart';
import '../azkar_lists.dart';

class azkarPage extends StatelessWidget {
  final String name;
  const azkarPage(this.name, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:     IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          title: Text(name),


        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return zkr(
                text: Allazkar[name]![index][0] as String,
                orderNum: index,
                rebeatNum: Allazkar[name]![index][1] as int,
                info: Allazkar[name]![index][2] as String);
          },
          itemCount: Allazkar[name]!.length,
        ),

 bottomSheet: Container(
   color: Theme.of(context).primaryColor.withOpacity(0.2),
   height: 50,
   child: Center(
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         IconButton(onPressed: (){},icon: const Icon(Icons.skip_next)),
         const SizedBox(width: 50,),
         IconButton(onPressed: (){},icon: const Icon(Icons.play_arrow)),
         const SizedBox(width: 50,),
           IconButton(onPressed: (){},icon: const Icon(Icons.skip_previous)),
                ],
     ),
   ),
 ) ,
    );
  }
}
