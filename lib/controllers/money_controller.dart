import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';
import 'package:zentara_ville/models/data_model.dart';

import '../models/api.dart';
import '../models/credentials.dart';

class MoneyController extends GetxController {
  final ScrollController horizontal = ScrollController();
  final ScrollController vertical = ScrollController();

  final gsheets = GSheets(Credential.sheet);
  Spreadsheet? sheet;
  Worksheet? worksheet;
  @override
  Future<void> onInit() async {
    await getInformation();
    sheet = await gsheets.spreadsheet(Credential.sheetId);
    worksheet = sheet!.worksheetByTitle('sheet1');
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  var data = <MoneyData>[].obs;
  var isLoading = true.obs;

  getInformation() async {
    data.clear();
    isLoading(true);
    try {
      final da = await Api().fetchAll();
      data.assignAll(da.data ?? []);
      isLoading(false);
    } catch (e) {
      print(e);
    }
  }

  printinf() {}
}
