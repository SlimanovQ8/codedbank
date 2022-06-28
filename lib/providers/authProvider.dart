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
  bool? check;
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
  Future <bool?> SignIn(String Username, String Password) async {

    token = await AuthServices().SignIn(Username, Password);
    if(token.length > 2)
      return false;
    print(token);

    user = await User.fromJson(Jwt.parseJwt(token));

    // uuser = User(username: Username, password: Password );
    // print(token);
    // setToken(token);
    notifyListeners();
    return true;
  }
  Future<bool?> Deposit(int deposit, int id) async {

    check = await AuthServices().deposit(deposit: deposit, id: id);
    print(token);


    //user = await User.fromJson(Jwt.parseJwt(token));

    // uuser = User(username: Username, password: Password );
    print(token);
    setToken(token);
    notifyListeners();

    return check;
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

