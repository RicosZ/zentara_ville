import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ScrollController horizontal = ScrollController();
  final ScrollController vertical = ScrollController();
  @override
  Future<void> onInit() async {
    // _configureAmplify();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}
}
