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

  Widget OrangeGradientButton({required BuildContext context, required String Text})
  {
    return Container(
      child: Button1(Text),
      height: 45,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(234, 84, 85, 1),
              Color.fromRGBO(255, 212, 96, 1)
            ],
          ),
          borderRadius:
          BorderRadius.all(Radius.circular(50))),

    );
  }


}