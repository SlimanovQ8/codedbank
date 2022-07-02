import 'package:codedbank/pages/transfer.dart';
import 'package:codedbank/widgets/ContainerWidgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/authProvider.dart';
import '../widgets/TextField.dart';

class deposit extends StatefulWidget {
  const deposit({Key? key}) : super(key: key);

  @override
  _depositState createState() => _depositState();
}

int amount = 0;
TextFieldForms T = TextFieldForms();


class _depositState extends State<deposit> {
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
            "Deposit",
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
                child: ContainerWidgets().PicWidget(),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 62),
                child: Column(
                  children: <Widget>[
                    T.GradientTextField(
                      context: context,
                      widget: T.TextFo(
                          "Enter deposit amount",
                          "Deposit amount",
                              (value) => setState(() {
                            amount = int.parse(value);
                          }),
                          Icons.money),
                    ),

                    Spacer(),
                   isLoading == true ? Center(
                     child: CircularProgressIndicator(),
                   ) :  InkWell(
                      onTap: () {
                        int? id = value.user!.id;

                        deposit(amount, id!);
                      },
                      child: BW.OrangeGradientButton(
                        context: context,
                        Text: "Deposit",
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
bool isLoading = false;
  void deposit(int deposit, int id) async {
    print("j");

    setState(() {
      isLoading = true;
    });
    bool? check = await Provider.of<AuthProvider>(context, listen: false)
        .Deposit(deposit, id);


    if (check == true) {
      setState(() {
        isLoading = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                backgroundColor: Color.fromRGBO(45, 64, 89, 1),
                title: Text(
                  "Deposit complete",
                  style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                ),
                content: Text(
                  "You deposit $amount kd to your account",
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
