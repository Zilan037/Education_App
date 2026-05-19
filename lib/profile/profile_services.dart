import 'package:dio/dio.dart';

void getData() async {
  final dio = Dio();

  final response = await dio.get(
    'https://jsonplaceholder.typicode.com/posts',
  );

  print(response.data);
}