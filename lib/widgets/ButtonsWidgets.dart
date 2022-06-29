import 'package:flutter/material.dart';

class ButtonsWidgets extends StatelessWidget {
  const ButtonsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget Button1(String text) {
    return Center(
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }


}