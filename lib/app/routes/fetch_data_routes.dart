import 'package:get/get.dart';

import '../modules/fetch_data/fetch_data_binding.dart';
import '../modules/fetch_data/fetch_data_page.dart';

class FetchDataRoutes {
  FetchDataRoutes._();

  static const fetchData = '/fetch-data';

  static final routes = [
    GetPage(
      name: fetchData,
      page: () => const FetchDataPage(),
      binding: FetchDataBinding(),
    ),
  ];
}
