import 'package:clean_architecture/common/adapter/http_adapter.dart';
import 'package:clean_architecture/common/dio/custom_dio.dart';
import 'package:clean_architecture/common/interceptors/authentication_interceptor.dart';
import 'package:clean_architecture/features/user/data/interactors/get_user_impl.dart';
import 'package:clean_architecture/features/user/data/interactors/get_user_repositories_impl.dart';
import 'package:clean_architecture/features/user/data/services/user_service_impl.dart';
import 'package:clean_architecture/features/user/domain/interactors/get_user.dart';
import 'package:clean_architecture/features/user/domain/interactors/get_user_repositories.dart';
import 'package:clean_architecture/features/user/domain/services/user_service.dart';
import 'package:clean_architecture/features/user/presentation/screens/repos_screen.dart';
import 'package:clean_architecture/features/user/presentation/screens/user_screen.dart';
import 'package:clean_architecture/features/user/presentation/viewmodels/repos_view_model.dart';
import 'package:clean_architecture/features/user/presentation/viewmodels/user_view_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


GetIt getIt = GetIt.I;

void setup() {
  //Interceptors
  getIt.registerLazySingleton<AuthenticationInterceptor>(() => AuthenticationInterceptor());

  //Network
  getIt.registerLazySingleton<Dio>(() => CustomDio(authInterceptor: getIt()).call());
  getIt.registerFactory<HttpAdapter>(() => HttpAdapter(getIt()));

  //Services
  getIt.registerLazySingleton<UserService>(() => UserServiceImpl(getIt()));

  //Usecases
  getIt.registerFactory<GetUser>(() => GetUserImpl(getIt()));
  getIt.registerFactory<GetUserRepositories>(() => GetUserRepositoriesImpl(getIt()));

  //Viewmodels
  getIt.registerFactory<UserViewModel>(() => UserViewModel(getIt()));
  getIt.registerFactory<ReposViewModel>(() => ReposViewModel(getIt()));

}