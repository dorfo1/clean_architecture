import 'package:flutter/material.dart';
import 'app/di/di.dart' as di;
import 'app/route/app_route.dart';
import 'app/route/route_generator.dart';

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoute.ROUTE_USER,
      onGenerateRoute: RouterGenerator.generateRoute,
    );
  }
}
