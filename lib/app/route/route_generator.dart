import 'package:clean_architecture/app/di/di.dart' as di;
import 'package:clean_architecture/common/error/error_screen.dart';
import 'package:clean_architecture/features/user/presentation/screens/repos_screen.dart';
import 'package:clean_architecture/features/user/presentation/screens/user_screen.dart';
import 'package:clean_architecture/features/user/presentation/viewmodels/repos_view_model.dart';
import 'package:clean_architecture/features/user/presentation/viewmodels/user_view_model.dart';
import 'package:flutter/material.dart';
import 'app_route.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoute.ROUTE_USER:
        return MaterialPageRoute(builder: (context) => UserScreen(di.getIt<UserViewModel>()));
        break;
      case AppRoute.ROUTE_REPO:
        return MaterialPageRoute(builder: (context) => ReposScreen(di.getIt<ReposViewModel>(),args));
        break;
      default:
        return MaterialPageRoute(builder: (context) => ErrorScreen());
        break;
    }
  }
}
