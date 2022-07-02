import 'dart:io';
import 'dart:typed_data';

import 'package:codedbank/models/user.dart';
import 'package:codedbank/pages/deposit.dart';
import 'package:codedbank/providers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../widgets/TextField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

bool chk = false;
bool isLoading = false;
File? _image;
String password = '';
String Username = '';
TextFieldForms T = TextFieldForms();

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final _picker = ImagePicker();
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
                        icon: Icon(Icons.person,
                            color: Color.fromRGBO(240, 123, 63, 1)),
                        hintText: 'Username',
                      ),
                      onChanged: (value) {
                        setState(() {
                          Username = value;
                        });
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
                        icon: Icon(Icons.vpn_key,
                            color: Color.fromRGBO(240, 123, 63, 1)),
                        hintText: 'Password',
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final XFile? image = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            _image = File(image!.path);

                            chk = true;
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(45, 64, 89, 1)),
                          child: chk == true
                              ? Image.file(
                                  _image!,
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.fitHeight,
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(45, 64, 89, 1)),
                                  width: 200,
                                  height: 200,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Color.fromRGBO(240, 123, 63, 1),
                                  ),
                                ),
                        ),
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.all(8.0),
                      //   child: Text("Image"),
                      // )
                    ],
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        print(Username);
                        SignUp(Username, password, _image!);
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
                              child: T.Buttons("Sign up"))
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
                  Text("Already have an account ?"),
                  Text(
                    "Sign In",
                    style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
                  ),
                ],
              ),
              onTap: () {
                context.push("/");
              },
            ),
          ],
        ),
      ),
    );
  }

  void SignUp(String name, String password, File img) async {
    print("j");

    Provider.of<AuthProvider>(context, listen: false)
        .SignUp(username: name, password: password, image: img);

    setState(() {
      //isLoading = false;
      context.push("/homepage");
    });
  }
}
