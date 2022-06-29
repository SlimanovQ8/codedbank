import 'dart:io';

import 'package:codedbank/models/transactions.dart';
import 'package:codedbank/models/user.dart';
import 'package:codedbank/pages/deposit.dart';
import 'package:codedbank/services/client.dart';
import 'package:dio/dio.dart';

class AuthServices {
  Future<String> signup({required String username , required String password, required File image}) async {
    late String token;


    try {
      FormData data = FormData.fromMap({
        "username": username,
        "password": password,

        "image": await MultipartFile.fromFile(image.path),
      });
      Response response = await client.dio.post('/signup', data: data);
      token = response.data["token"];
      print(token);
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }

  Future<bool> deposit({required deposit, required id}) async {
    late String token;
    bool check = false;

    try {


      Response R = await client.dio.get('/');

      print(R.data[id--]['balance']);
      int total = deposit + R.data[id--]['balance'];
      print("Total: $total");
      Response response = await client.dio.put('/deposit/', data: {"amount": deposit  });
      check = true;



      //token = response.data["token"];
      print(deposit);
    } on DioError catch (error) {
      print(error);
    }
    return check;
  }


  Future<bool> withdraw({required withdraw, required id}) async {
    late String token;
    bool check = false;

    print(id);
    try {
      Response R = await client.dio.get('/');

      print(R.data[id--]['balance']);
      int amount = R.data[id--]['balance'];
      if (amount < withdraw) {
        print("Check: $check");
        return check;
      }
      else {
        int total = withdraw + R.data[id--]['balance'];
        print("Total: $total");
        Response response = await client.dio.put(
            '/withdraw/', data: {"amount": withdraw});
        check = true;


        //token = response.data["token"];
        print(withdraw);
      }
    }
    on DioError catch (error) {
      print(error);
    }
    return check;

  }
  Future<bool> transfer({required withdraw, required username, required id}) async {
    late String token;
    bool check = false;

    int index = id - 1;
    try {
      Response R = await client.dio.get('/');


      print(index);
      print(R.data[index]['balance']);
      int amount = R.data[index]['balance'];
      print("amount: $amount");

      print("Check: $check");
          if (amount < withdraw) {
        print("Check: $check");
        return check;
      }
      else {
        int total = withdraw + R.data[index]['balance'];
        print("Total: $total");
        Response response = await client.dio.post(
            '/transfer/$username/', data: {"amount": withdraw});
        check = true;


        //token = response.data["token"];
        print(withdraw);
      }
    }
    on DioError catch (error) {
      print(error);
    }
    return check;

  }
  Future <String> SignIn(String Username, String Password) async {
    String token = '';

    try {
      print("SErvice");
      Response Res = await client.dio.post('/signin', data: {"username": Username, "password": Password});

       print(Res.statusCode);
      print('ed');
      print(Res.data);

      token = Res.data["token"];
      print(token);
    }
    on DioError catch (e) {
      print(e );
      return token;
    }
    return token;
  }
  Future <List<Transctions>> getTransactions() async {
    try {

      Response R = await client.dio.get('/transactions');
      List<Transctions> transcations = (R.data as List).map((e) => Transctions.fromJson(e)).toList();
      return transcations;


    }
    on DioError catch (e)
    {

    }
    return [];
  }
}