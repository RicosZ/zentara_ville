import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';
import 'package:zentara_ville/models/money_model.dart';

import '../models/api.dart';
import '../models/credentials.dart';
import '../models/time_format.dart';

class MoneyController extends GetxController {
  final ScrollController horizontal = ScrollController();
  final ScrollController vertical = ScrollController();
  final key = GlobalKey<FormBuilderState>();

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
      final da = await Api().fetchMoney();
      data.assignAll(da.data ?? []);
      isLoading(false);
    } catch (e) {
      print(e);
    }
  }

  loadInformation() async {
    final da = await Api().fetchMoney();
    data.assignAll(da.data ?? []);
  }

  addInformation() async {
    await worksheet!.values.insertRow(data.length + 2, [
      data.length + 1,
      TimeFormat()
          .getDatetime(date: '${key.currentState?.fields['date']?.value}'),
      key.currentState?.fields['description']?.value,
      key.currentState?.fields['transection']?.value == 'รายรับ'
          ? key.currentState?.fields['amount']?.value
          : '',
      key.currentState?.fields['transection']?.value == 'รายจ่าย'
          ? key.currentState?.fields['amount']?.value
          : '',
      key.currentState?.fields['transection']?.value == 'รายรับ'
          ? data[data.length - 1].total! +
              int.parse(key.currentState?.fields['amount']?.value)
          : data[data.length - 1].total! -
              int.parse(key.currentState?.fields['amount']?.value),
      key.currentState?.fields['note']?.value,
    ]).then((value) async => {loadInformation()});
    Get.back();
  }
}
