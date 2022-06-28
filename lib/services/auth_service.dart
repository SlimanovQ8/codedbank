import 'package:codedbank/models/user.dart';
import 'package:codedbank/pages/deposit.dart';
import 'package:codedbank/services/client.dart';
import 'package:dio/dio.dart';

class AuthServices {
  Future<String> signup({required User user}) async {
    late String token;
    print(user.balance);
    print(user.id);
    print(user.username);
    print(user.password);

    try {
      FormData data = FormData.fromMap({
        "username": user.username,
        "password": user.password,
        "balance": user.balance,
        //"image": await MultipartFile.fromFile(user.image),
      });
      Response response = await client.dio.post('/signup', data: data);
      token = response.data["token"];
      print(token);
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }

  Future<String> deposit({required User user}) async {
    late String token;
    print(user.balance);
    print(user.id);
    print(user.username);
    print(user.password);

    try {
      FormData data = FormData.fromMap({

        "balance": user.balance,
        "image": '/data/user/0/com.example.codedbank/cache/image_picker8789375785740143711.png',
      });
      Response response = await client.dio.put('/deposit/${user.id}', data: data);
      token = response.data["token"];
      print(token);
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }

  Future <String> SignIn(String Username, String Password) async {
    String token = '';

    //User U = User(username: Username, password: Password);
    try {
    //  Response Res = await client.dio.post('/signin', data: U.toJson());

      /*   print(Res);
      print('ed');
      print(Res.data);
*/
      //token = Res.data["token"];
      print(token);
    }
    on DioError catch (e) {
      print(e.message);
    }
    return token;
  }
}