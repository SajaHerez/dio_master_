import 'package:dio/dio.dart';

import '../model/new_user.dart';
import '../model/user.dart';
import '../network/api/user_api.dart';
import '../network/dio_exception.dart';

class UserRepository {
  final UserApi userApi;

  UserRepository(this.userApi);
  Future<List<UserModel>> getUsersRequested() async {
    try {
      final response = await userApi.getUsers();
      final users = (response.data['data'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
      return users;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<NewUser> addNewUserRequested(String name, String job) async {
    try {
      final response = await userApi.addUser(name, job);
      return NewUser.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<NewUser> updateUserRequested(int id, String name, String job) async {
    try {
      final response = await userApi.updateUser(id, name, job);
      return NewUser.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<void> deleteNewUserRequested(int id) async {
    try {
      await userApi.deletUser(id);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }



}
