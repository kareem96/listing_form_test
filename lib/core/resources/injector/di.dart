import 'package:form_listing_test/core/resources/network/dio_service.dart';
import 'package:form_listing_test/core/resources/network/rest_client.dart';
import 'package:form_listing_test/core/resources/repositories/repository.dart';
import 'package:form_listing_test/presentation/provider/detail_provider.dart';
import 'package:form_listing_test/presentation/provider/home_provider.dart';
import 'package:form_listing_test/presentation/provider/input_provider.dart';
import 'package:form_listing_test/presentation/provider/page_provider.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDI() async {
  //network
  sl.registerLazySingleton<DioService>(() => DioService());
  sl.registerSingleton<RestClient>(RestClient(sl<DioService>().dio));
  sl.registerLazySingleton(() => Repository(restClient: sl<RestClient>()));


  //provider
  sl.registerFactory<PageProvider>(() => PageProvider());
  sl.registerFactory<HomeProvider>(() => HomeProvider(repository: sl<Repository>()));
  sl.registerFactory<InputProvider>(() => InputProvider(repository: sl<Repository>()));
  sl.registerFactory<DetailProvider>(() => DetailProvider(repository: sl<Repository>()));

  }
