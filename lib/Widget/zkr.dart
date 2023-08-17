import 'package:flutter/material.dart';

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
        ? SizedBox(height: 10)
        : GestureDetector(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return zkrInfo(widget.info);
                },
              );
            },
            child: Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.orderNum}. ${widget.text}",
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                        height: 30,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (widget.rebeatNum > 0) {
                                  widget.rebeatNum--;
                                }
                              });
                            },
                            child: Text(widget.rebeatNum.toString())))
                  ],
                ),
              ),
            ),
          );
  }
}
