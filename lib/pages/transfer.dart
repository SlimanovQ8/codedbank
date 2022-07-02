import 'package:codedbank/widgets/ButtonsWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/authProvider.dart';
import '../widgets/ContainerWidgets.dart';
import '../widgets/TextField.dart';

class Transfer extends StatefulWidget {
  const Transfer({Key? key}) : super(key: key);

  @override
  _TransferState createState() => _TransferState();
}

int amount = 0;
String Username = "";
TextFieldForms T = TextFieldForms();
ButtonsWidgets BW = ButtonsWidgets();
class _TransferState extends State<Transfer> {
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
            "Transfer",
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
                          hintText: "Transfer amount",
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
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      margin: EdgeInsets.only(top: 32),

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
                            Icons.person,
                            color: Color.fromRGBO(240, 123, 63, 1),
                          ),
                          hintText: "Username",
                        ),
                        onChanged: (value) {
                          setState(() {
                            Username = value;

                          });
                        },

                      ),
                    ),

                    Spacer(),
                    isLoading == true ? Center(
                      child: CircularProgressIndicator(),
                    ) :  InkWell(
                      onTap: () {
                        int? id = value.user!.id;
                        print(id);

                        transfer(amount, Username, id!);
                      },
                      child: BW.OrangeGradientButton(
                        context: context,
                        Text: "Transfer",
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
  bool isLoading = false;
  void transfer(int transfer, String Username, int id) async {
    print("j");

  setState(() {
    isLoading = true;
    });
  check = await Provider.of<AuthProvider>(context, listen: false)
        .transfer(transfer, Username, id);


    if (check == true) {
      setState(() {
        isLoading = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              AlertDialog(
                backgroundColor: Color.fromRGBO(45, 64, 89, 1),
                title: Text(
                  "Transfer complete",
                  style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                ),
                content: Text(
                  "You Transfer $amount kd from your account to $Username account",
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
              "Transfer unsuccessful",
              style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
            ),
            content: Text(
              "balance is insufficient",
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