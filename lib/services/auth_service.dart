import 'package:codedbank/models/user.dart';
import 'package:codedbank/services/client.dart';
import 'package:dio/dio.dart';

class AuthServices {
  Future<String> signup({required User user}) async {
    late String token;
    try {
      Response response = await client.dio.post('/signup', data: user.toJson());
      token = response.data["token"];
      print(token);
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }
}
