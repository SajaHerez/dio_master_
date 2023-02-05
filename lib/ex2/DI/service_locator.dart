import 'package:dio/dio.dart';
import 'package:dio_master_/ex2/data/network/api/user_api.dart';
import 'package:dio_master_/ex2/data/repository/user_repository.dart';
import 'package:get_it/get_it.dart';

import '../data/network/api/dio_client.dart';

final get = GetIt.instance;

Future<void> setup() async {
  get.registerSingleton(Dio());
  get.registerSingleton(DioClient(get<Dio>()));
  get.registerSingleton(UserApi(client: get<DioClient>()));
  get.registerSingleton(UserRepository(get<UserApi>()));
}
