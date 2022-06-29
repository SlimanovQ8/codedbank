import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/authProvider.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, authProvider, child) => authProvider.isAuth
            ? (ListView(
                children: [
                  Card(
                    color: Color.fromRGBO(240, 123, 63, 1),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 10,
                    margin: EdgeInsets.all(7),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: ImageIcon(
                            AssetImage("assets/images/codedlogo.png"),
                            size: 80,
                            color: Colors.black,
                          ),
                          title: Text(
                            "Card Number 4200",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          //      subtitle: ,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            //shape: BoxShape.circle,
                            //border: Border.all(color: Colors.black,width: 0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: EdgeInsets.all(12.5),
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 40,
                              ),
                              Expanded(
                                child: Column(children: <Widget>[
                                  Text("Total balance",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      )),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text("${authProvider.user!.balance}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                            )),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        GestureDetector(
                                          child: Icon(Icons.info_outline),
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    AlertDialog(
                                                      backgroundColor:
                                                          Color(0xff343b4b),
                                                      title: Text(
                                                        "Total balance ${authProvider.user!.balance}",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    240,
                                                                    123,
                                                                    63,
                                                                    1)),
                                                      ),
                                                      content: Text(
                                                        "Total balance without applying the saving rules",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    240,
                                                                    123,
                                                                    63,
                                                                    1)),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            "OK",
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        240,
                                                                        123,
                                                                        63,
                                                                        1)),
                                                          ),
                                                        ),
                                                      ],
                                                    ));
                                          },
                                        )
                                      ]),
                                ]),
                              ),
                              Expanded(
                                child: Column(children: <Widget>[
                                  Text("Available balance",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      )),
                                  SizedBox(
                                    width: 40,
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
