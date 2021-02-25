import 'package:get_it/get_it.dart';

import 'app_module.dart' as AppModule;

GetIt getIt = GetIt.instance;

Future init() async {
  AppModule.setup();
}
