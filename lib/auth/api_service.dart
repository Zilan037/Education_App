import 'package:dio/dio.dart';
import 'package:education_app/auth/user_models.dart';

class ApiService {
  static get dio => null;

  static Future<UserModel> getUser() async {
    final response = await dio.get('users/1');
    return UserModel.fromJson(response.data);
  }

  // DIO SERVICE
  //  فقط اگر API خارجی نیاز شداین قسمت فعال می‌شود
  /*
  static final Dio dio = Dio(

    BaseOptions(

      baseUrl: 'https://dummyjson.com/',

      connectTimeout:
          Duration(seconds: 10),

      receiveTimeout:
          Duration(seconds: 10),
    ),
  );

  // GET USER

  static Future getUser() async {

    final response =
        await dio.get('users/1');

    return response.data;
  }
  */
}