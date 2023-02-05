import 'package:dio/dio.dart';
import 'package:dio_master_/ex2/data/network/api/dio_client.dart';

import 'constant/endpoints.dart';

class UserApi {
  final DioClient client;
  UserApi({required this.client});

  Future<Response> addUser(String name, String job) async {
    try {
      Response response = await client.post(
        url: Endpoints.user,
        data: {
          'name': name,
          'job': job,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

    Future<Response> getUsers() async {
    try {
      Response response = await client.get(
        url: Endpoints.user,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateUser(int id,String name, String job) async {
    try {
      Response response = await client.update(
        url: '${Endpoints.user}/$id',
        data: {
          'name': name,
          'job': job,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
   Future<Response> deletUser(int id) async {
    try {
      Response response = await client.delete(
        url: '${Endpoints.user}/$id',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
