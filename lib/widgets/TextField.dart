
import 'package:flutter/material.dart';

class TextFieldForms extends StatelessWidget {
  const TextFieldForms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  Widget Buttons(String text) {
    return  Center(
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
  Widget TextFo(String hintText, String labelText, void Function(String) OnChanged, IconData icon)
  {

      return TextField(
        decoration: InputDecoration(
          border: InputBorder.none,

          icon: Icon(
            icon,
            color: Color(0xff4a8cff),
          ),
          hintText: 'Deposit',
          labelText: labelText,
        ),
        onChanged: (value) {
         OnChanged(value);
        },

    );
  }

}
