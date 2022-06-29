import 'package:codedbank/pages/deposit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:codedbank/models/user.dart';

import '../providers/authProvider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  String Username = '';
  String Password = '';
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 64, 89, 1),
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
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.person,
                          color: Color.fromRGBO(240, 123, 63, 1),
                        ),
                        hintText: 'Username',
                      ),
                      onChanged: (value) {
                        Username = value;
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 45,
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
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.vpn_key,
                          color: Color.fromRGBO(240, 123, 63, 1),
                        ),
                        hintText: 'Password',
                      ),
                      onChanged: (value) {
                        Password = value;
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, right: 32),
                      child: Text(
                        'Forgot Password ?',
                        style:
                            TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        print(Username);
                        print(Password);
                        SignIn(Username, Password);
                      },
                      child: isLoading == false
                          ? Container(
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
                              child: T.Buttons("Login"))
                          : Center(
                              child: CircularProgressIndicator(),
                            )),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account ?"),
                  Text(
                    "Sign Up",
                    style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                  ),
                ],
              ),
              onTap: () {
                context.push("/signup");
              },
            ),
          ],
        ),
      ),
    );
  }

  bool isLoading = false;
  void SignIn(String name, String password) async {
    setState(() {
      isLoading = true;
    });

    bool? check = await Provider.of<AuthProvider>(context, listen: false)
        .SignIn(name, password);

    if (check == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text("Login failed!"),
                content: Text("Incorrect username or password"),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.blue),
                    onPressed: () {
                      setState(() {
                        context.pop();
                      });
                    },
                    child: Text('Ok'),
                  ),
                ],
              ));
      isLoading = false;
    } else {
      isLoading = false;
      context.push('/homepage');
    }
  }
}
