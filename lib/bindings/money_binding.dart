import 'package:get/get.dart';

import '../controllers/money_controller.dart';

class MoneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoneyController());
  }
}
