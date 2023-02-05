import 'package:dio/dio.dart';

import '../model/user.dart';
import 'logging.dart';

class DioClient {
  DioClient() {
    dio = Dio();
    dio.options.baseUrl = 'https://reqres.in/api';
    dio.interceptors.add(Logging());
  }
  late Dio dio;
  Future<User?> getUser({required int id}) async {
    User? user;
    try {
      Response response = await dio.get('/users/$id');
      print(response.data);
      user = User.fromJSON(response.data);
      print(user.data.id);
      print(user.data.fName);
      print(user.data.lName);
      print(user.data.email);
      print(user.data.avatar);
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return user;
  }
}
