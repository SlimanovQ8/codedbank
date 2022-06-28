import 'package:codedbank/models/user.dart';
import 'package:codedbank/services/client.dart';
import 'package:dio/dio.dart';

class AuthServices {
  Future<String> signup({required User user}) async {
    late String token;
    try {
      FormData data = FormData.fromMap({
        "username": user.UserName,
        "image": 'https://images-na.ssl-images-amazon.com/images/I/71pX+JTU8EL.jpg',

      });
      Response response = await client.dio.post('/signup', data: data);
      token = response.data["token"];
      print(token);
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }

  Future <String> SignIn(String Username, String Password) async {
    String token = '';

    User U = User(UserName: Username, password: Password);
    try {
      Response Res = await client.dio.post("/signin", data: U.toJson());

      /*   print(Res);
      print('ed');
      print(Res.data);
*/
      token = Res.data["token"];
      print(token);
    }
    on DioError catch (e) {
      print(e.message);
    }
    return token;
  }
}