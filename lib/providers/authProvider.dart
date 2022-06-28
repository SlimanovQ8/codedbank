import 'dart:io';
import 'package:codedbank/services/client.dart';
import 'package:dio/dio.dart';
import 'package:codedbank/models/user.dart';
import 'package:codedbank/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String token = "";
  User? user;
  AuthServices AS = AuthServices();
  // authProvider() {
  //   SharedPreferences.getInstance().then((value) {
  //     token = value.getString("token") ?? "";
  //     notifyListeners();
  //   });
  // }

  void SignUp({required String username , required String password, required File image}) async {
    token = await AuthServices().signup(username: username, password: password, image: image);
   // user = User.fromJson(Jwt.parseJwt(token));

    print(token);
    setToken(token);
    notifyListeners();
  }
  Future <void> SignIn(String Username, String Password) async {

    token = await AuthServices().SignIn(Username, Password);
    print(token);

    //user = await User.fromJson(Jwt.parseJwt(token));

    // uuser = User(username: Username, password: Password );
    // print(token);
    // setToken(token);
    // notifyListeners();
  }
  Future <void> Deposit(double deposit) async {

    await AuthServices().deposit(deposit: deposit);
    print(token);

    user = await User.fromJson(Jwt.parseJwt(token));

    // uuser = User(username: Username, password: Password );
    print(token);
    setToken(token);
    notifyListeners();
  }

  bool get isAuth {
    if (token.isNotEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      user = User.fromJson(Jwt.parseJwt(token));

      client.dio.options.headers = {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      };
      return true;
    } else
      return false;
  }

  void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var x = await prefs.setString('token', token);
    print(x);
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? "";
    notifyListeners();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    token = "";
    notifyListeners();
  }
}

