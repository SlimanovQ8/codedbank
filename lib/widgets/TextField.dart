import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/authProvider.dart';

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
          hintText: hintText
          // labelText: "Deposit amout",
          ),
      onChanged: (value) {
        OnChanged(value);
      },
    );
  }
  Widget GradientTextField({ required BuildContext context, required Widget widget})
  {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 45,
      padding: EdgeInsets.only(
          top: 4, left: 16, right: 16, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(240, 123, 63, 1),
                blurRadius: 5)
          ]),
      child: widget,
    );

  }
  Widget SearchTextField({
    required BuildContext context,
    required String searchAll,
    required Function(String) OnChanged,
    required bool isEmpty,
    required var trasactions,
    required Function() onTap ,
    required Function() onPressed})  {
  return  Container(
    width: MediaQuery.of(context).size.width / 1.2,
    height: 60,
    margin: EdgeInsets.only(top: 32),
    padding:
    EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(240, 123, 63, 1),
              blurRadius: 5)
        ]),
    child: TextFormField(
      initialValue: searchAll,
//controller: searchFieldController,
      onChanged: (value) {

        OnChanged(value);

        if(searchAll.isEmpty)
        {
          isEmpty = true;

        }
      },
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter> [
        FilteringTextInputFormatter.digitsOnly

      ],
      decoration: InputDecoration(

          hintStyle: TextStyle(
            color: Color.fromRGBO(240, 123, 63, 1),
          ),
          prefixIcon: InkWell(
            child: Icon(
              Icons.search,
              color: Color.fromRGBO(240, 123, 63, 1),
            ),
            onTap: onTap,
          ) ,
          hintText: 'Search by amount',

          suffixIcon: IconButton(
            icon: Icon(Icons.cancel_outlined),
            color: searchAll.isEmpty ? Colors.white : Color.fromRGBO(240, 123, 63, 1),
            onPressed: onPressed
          )),
    ),
  );
}
}
