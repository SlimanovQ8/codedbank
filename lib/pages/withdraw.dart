import 'package:codedbank/widgets/ButtonsWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/authProvider.dart';
import '../widgets/TextField.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({Key? key}) : super(key: key);

  @override
  _WithdrawState createState() => _WithdrawState();
}

int amount = 0;
TextFieldForms T = TextFieldForms();
ButtonsWidgets BW = ButtonsWidgets();
class _WithdrawState extends State<Withdraw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 64, 89, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(240, 123, 63, 1)),
        backgroundColor: Color.fromRGBO(45, 64, 89, 1),
        title: Padding(
          padding: const EdgeInsets.only(left: 70.0),
          child: Text(
            "Withdraw",
            style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
          ),
        ),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, value, child) => Container(
          child: ListView(
            children: <Widget>[
              Container(
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
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 62),
                child: Column(
                  children: <Widget>[
                    Container(
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
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.money,
                            color: Color.fromRGBO(240, 123, 63, 1),
                          ),
                          hintText: "Withdraw amount",
                        ),
                        onChanged: (value) {
                          setState(() {
                            amount = int.parse(value);
                          });
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter> [
                          FilteringTextInputFormatter.digitsOnly

                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        int? id = value.user!.id;

                        withdraw(amount, id!);
                      },
                      child: Container(
                        child: BW.Button1("Withdraw"),
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

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool check = false;
  void withdraw(int withdraw, int id) async {
    print("j");

     check = await Provider.of<AuthProvider>(context, listen: false)
        .withdraw(withdraw, id);

    if (check == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              AlertDialog(
                backgroundColor: Color.fromRGBO(45, 64, 89, 1),
                title: Text(
                  "Withdrw complete",
                  style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                ),
                content: Text(
                  "You withdrawed $amount kd from your account",
                  style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                ),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.blue),
                    onPressed: () {
                      setState(() {
                        context.go("/homepage");
                      });
                    },
                    child: Text(
                      'Ok',
                      style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                    ),
                  ),
                ],
              ));
    }
      else {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Color.fromRGBO(45, 64, 89, 1),
            title: Text(
              "Withdrw unsuccessful",
              style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
            ),
            content: Text(
              "balance is insufficent",
              style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: () {
                  setState(() {
                    context.go("/homepage");
                  });
                },
                child: Text(
                  'Ok',
                  style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                ),
              ),
            ],
          ));
    }
  }
}