import 'package:flutter/material.dart';

class ContainerWidgets extends StatelessWidget {
  const ContainerWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget PictureContainer(BuildContext context ) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(234, 84, 85, 1),
              Color.fromRGBO(255, 212, 96, 1)
            ],
          ),
          borderRadius:
          BorderRadius.only(bottomLeft: Radius.circular(90))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: ImageIcon(
              AssetImage("assets/images/codedlogo.png"),
              color: Colors.black,
              size: 160,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget UsernameWidget(BuildContext context, Widget textField)
  {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 45,
      padding:
      EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(240, 123, 63, 1),
                blurRadius: 0)
          ]),
      child: textField

    );
  }
  Widget PicWidget()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Spacer(),
        Align(
          alignment: Alignment.center,
          child: ImageIcon(
            AssetImage("assets/images/codedlogo.png"),
            color: Colors.black,
            size: 160,
          ),
        ),
        Spacer(),
      ],
    );
  }

}