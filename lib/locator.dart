import 'package:get_it/get_it.dart';

import 'modules/Home/providers/home_provider.dart';

GetIt getIt = GetIt.I;

setUp() {
  getIt.registerSingleton<HomeProvider>(HomeProvider());
}
