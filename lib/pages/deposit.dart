import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/authProvider.dart';
class deposit extends StatefulWidget {
  const deposit({Key? key}) : super(key: key);

  @override
  _depositState createState() => _depositState();
}

class _depositState extends State<deposit> {
  @override
  double amount = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("deposit"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff014c8f), Color(0xff014c8f)],
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
                    padding:
                    EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.person,
                          color: Color(0xff4a8cff),
                        ),
                        hintText: 'Deposit',
                      ),
                      onChanged: (value) {
                        setState(() {
                          amount  = double.parse(value);
                          
                        });
                      },
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff4a8cff),
                            Color(0xFF00abff),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: ElevatedButton(
                      onPressed: () {

                        deposit(amount);
                      },
                      child: Text(
                        'Sign Up'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void deposit(double deposit) async
  {
    print("j");

    setState(() {


      Provider.of<AuthProvider>(context, listen: false).Deposit(deposit);
    });
    setState(() {
      context.push('/homepage');

    });
  }
}
