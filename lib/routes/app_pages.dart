import 'package:get/get.dart';

import '../bindings/home_bindings.dart';
import '../bindings/money_binding.dart';
import '../views/home_view.dart';
import '../views/money_view.dart';
import 'app_routes.dart';

class AppPage {
  static var routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      // transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.money,
      page: () => const MoneyView(),
      binding: MoneyBinding(),
      // transition: Transition.rightToLeft,
    ),
  ];
}
