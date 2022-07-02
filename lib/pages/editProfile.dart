import 'dart:io';

import 'package:codedbank/widgets/ContainerWidgets.dart';
import 'package:codedbank/widgets/TextField.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/authProvider.dart';



class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  File? _image;
  String username = "";
  String password = "";

  TextFieldForms T = TextFieldForms();
  bool chk = false;
  ContainerWidgets containerWidgets = ContainerWidgets();
  @override
  Widget build(BuildContext context) {
    final _picker = ImagePicker();

    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 64, 89, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(240, 123, 63, 1)),
        backgroundColor: Color.fromRGBO(45, 64, 89, 1),
        title: Padding(
          padding: const EdgeInsets.only(left: 70.0),
          child: Text(
            "My Profile",
            style: TextStyle(color: Color.fromRGBO(240, 123, 63, 1)),
          ),
        ),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) => authProvider.isAuth ?

        Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Color.fromRGBO(240, 123, 63, 1)),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color: Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:  chk == true ? FileImage(_image!) as ImageProvider
                                :NetworkImage(authProvider.user!.image!,
                                ))),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.green,
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                final XFile? image = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  _image = File(image!.path);

                                  chk = true;
                                });

                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,

                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Username",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(240, 123, 63, 1)),
                ),
                SizedBox(
                  height: 10,
                ),
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
                  child: T.TextFo(
                      authProvider.user!.username,
                      "Username",
                          (value) => setState(() {

                            username = value;
                      }),
                      Icons.person),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromRGBO(240, 123, 63, 1)),
                ),
                SizedBox(
                  height: 10,
                ),
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
                  child: T.TextFo(
                      "******",
                      "Password",
                          (value) => setState(() {

                            password= value;
                      }),
                      Icons.vpn_key),
                ),
                SizedBox(
                  height: 35,
                ),

                InkWell(
                  onTap: () {
                    if(username.isEmpty)
                      username = authProvider.user!.username;

                    update(username, password, _image!);

                  },
                  child: Container(
                    child: T.Buttons("Save"),
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
        ) : Center(
          child: CircularProgressIndicator(),
      )
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
  void update(String name, String password, File img) async {
    print("j");

    Provider.of<AuthProvider>(context, listen: false)
        .update(name, password, img);

    setState(() {
      //isLoading = false;
      context.push("/");
    });
  }
}