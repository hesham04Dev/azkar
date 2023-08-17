import 'package:flutter/material.dart';

import '../models/styles.dart';
import 'zkrInfo.dart';

class zkr extends StatefulWidget {
  final String text;
  final String info;
  final int orderNum;
  int rebeatNum;
  zkr(
      {required this.text,
      required this.orderNum,
      required this.rebeatNum,
      required this.info});
  @override
  State<zkr> createState() => _zkrState();
}

class _zkrState extends State<zkr> {
  @override
  Widget build(BuildContext context) {
    return widget.text == ""
        ? const SizedBox(height: 10)
        : GestureDetector(
            
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return zkrInfo(widget.info);
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${widget.orderNum}. ${widget.text}",
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 20,
                            height: 2,

                          ),
                        ),
                      ),
                     // const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                          height: 30,
                          child: FilledButton(
                            /*color: Theme.of(context).primaryColor.withOpacity(0.2),
                              elevation: 0,
                              hoverElevation: 0,*/
                              style:  ButtonStyle(
                                elevation: const MaterialStatePropertyAll(
                                  0
                                ),

                                backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).primaryColor.withOpacity(0.2),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (widget.rebeatNum > 0) {
                                    widget.rebeatNum--;
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top:2.0),
                                child: Text(widget.rebeatNum.toString(),style: MediumText(),),
                              )))
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
