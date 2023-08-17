import 'package:flutter/material.dart';

class ClickTitle extends StatelessWidget {

final String text;
final VoidCallback function;
ClickTitle({
  required this.text,
  required this.function
});
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: function, child: Text(text, style: TextStyle(
      fontWeight: FontWeight.bold,fontSize: 25,color: Theme.of(context).primaryColor
    ),));
  }
}
