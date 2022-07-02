import 'dart:io';
import 'package:codedbank/pages/transactions.dart';
import 'package:codedbank/services/client.dart';
import 'package:dio/dio.dart';
import 'package:codedbank/models/user.dart';
import 'package:codedbank/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/transactions.dart';

class AuthProvider extends ChangeNotifier {
  String token = "";
  User? user;
  AuthServices AS = AuthServices();
  List <Transctions> transctions = [];
  int amount = 0;
  bool check = false;
  // authProvider() {
  //   SharedPreferences.getInstance().then((value) {
  //     token = value.getString("token") ?? "";
  //     notifyListeners();
  //   });
  // }

  Future<void> getTranscations() async
  {
    transctions = await AS.getTransactions();

    notifyListeners();
  }
  void SignUp({required String username , required String password, required File image}) async {
    token = await AuthServices().signup(username: username, password: password, image: image);
   // user = User.fromJson(Jwt.parseJwt(token));

    print(token);
    setToken(token);
    notifyListeners();
  }
  Future <int> getAmount(int id) async
  {
     amount = await AS.getBalance(id);

    print("amount:::: $amount");
    setAmount(amount);

    notifyListeners();
    return amount;

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

      user = User(id: user!.id,  username: user!.username, password: user!.password, balance: user!.balance!+deposit, image: user!.image );



    //user = await User.fromJson(Jwt.parseJwt(token));

    // uuser = User(username: Username, password: Password );
    setToken(token);
    print(token);
    print(user!.balance!);

    notifyListeners();

    return check;
  }


  Future<bool?> update(String username, String password, File image) async {

    check = await AuthServices().update(username: username, password: password, image: image);
    print(token);


    //user = await User.fromJson(Jwt.parseJwt(token));

    // uuser = User(username: Username, password: Password );
    print(token);
    setToken(token);
    notifyListeners();

    return check;
  }
  Future<bool> withdraw(int withdraw, int id) async {

    check = await AuthServices().withdraw(withdraw: withdraw, id: id);
    print(token);
    print(check);


    //user = await User.fromJson(Jwt.parseJwt(token));

    // uuser = User(username: Username, password: Password );
    print(token);
    setToken(token);
    notifyListeners();

    print(check);

    return check;
  }
  Future<bool> transfer(int withdraw, String username, int id) async {

    check = await AuthServices().transfer(withdraw: withdraw, username: username, id: id );
    print(token);
    print(check);


    //user = await User.fromJson(Jwt.parseJwt(token));

    // uuser = User(username: Username, password: Password );
    print(token);
    setToken(token);
    notifyListeners();

    print(check);

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


  void setAmount(int amount) async {
    this.amount = amount;
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

