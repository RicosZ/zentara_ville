import 'package:get/get.dart';
import 'package:zentara_ville/views/home_view.dart';

import '../bindings/home_bindings.dart';
import 'app_routes.dart';

class AppPage {
  static var routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    
  ];
}
