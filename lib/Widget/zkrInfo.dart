import 'package:flutter/material.dart';
class zkrInfo extends StatelessWidget {
 final String info;
 zkrInfo(this.info);

  @override
  Widget build(BuildContext context) {
    return /* Container(

      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(1),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text(info),
    );*/

    SimpleDialog(
      titlePadding: EdgeInsets.zero,
      backgroundColor: Colors.white.withOpacity(0.8),
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.black,

      ),

      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(info,textDirection: TextDirection.rtl,),
        )
      ],
    );
  }
}
