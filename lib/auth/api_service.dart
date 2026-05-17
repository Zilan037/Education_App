import 'package:dio/dio.dart';

class ApiService {

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  static Future<UserModel> getUser() async {

    final response = await dio.get('users/1');

    return UserModel.fromJson(response.data);
  }
}

class UserModel {

  final int id;
  final String username;
  final String email;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {

    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
    );
  }
}