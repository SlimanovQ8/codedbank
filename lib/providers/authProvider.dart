import 'package:codedbank/models/user.dart';
import 'package:codedbank/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String token = "";
  User? uuser;
  authProvider() {
    SharedPreferences.getInstance().then((value) {
      token = value.getString("token") ?? "";
      notifyListeners();
    });
  }

  void signup({required User user}) async {
    token = await AuthServices().signup(user: user);
    uuser = User(UserName: user.UserName, image: user.image);

    print(token);
    setToken(token);
    notifyListeners();
  }
 void SignIn(String Username, String Password) async {
   AuthServices AS = AuthServices();
   token = await AS.SignIn(Username, Password);
   uuser = User(UserName: Username);
   print(token);
   setToken(token);
   notifyListeners();
 }

  bool get isAuth {
    if (token.isNotEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      //user = User.fromJson(Jwt.parseJwt(token));

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

