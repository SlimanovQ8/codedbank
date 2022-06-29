import 'package:flutter/material.dart';

class TextFieldForms extends StatelessWidget {
  const TextFieldForms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget Buttons(String text) {
    return Center(
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget TextFo(String hintText, String labelText,
      void Function(String) OnChanged, IconData icon) {
    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            icon,
            color: Color.fromRGBO(240, 123, 63, 1),
          ),
          hintText: 'Deposit amount'
          // labelText: "Deposit amout",
          ),
      onChanged: (value) {
        OnChanged(value);
      },
    );
  }
}
