import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:zentara_ville/models/convert_text.dart';
import 'package:zentara_ville/models/data_model.dart';

import '../controllers/money_controller.dart';
import '../models/time_format.dart';
import '../widgets/header.dart';

class MoneyView extends GetView<MoneyController> {
  const MoneyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 1280,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Header(),
              ),
            ),
            SizedBox(
              width: 1280,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 36),
                    decoration: BoxDecoration(
                        color: Colors.orange[100], border: Border.all()),
                    height: 52,
                    child: const Text(
                      'รายรับ / รายจ่าย',
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 36),
                    decoration: BoxDecoration(
                        color: Colors.green[50], border: Border.all()),
                    height: 52,
                    child: Text('ยอดเริ่มต้น ${Convert().money('2000000')}',
                        style: const TextStyle(fontSize: 28)),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      controller.printinf();
                    },
                    child: const Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text('เพิ่มรายการ'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Spacer(),
            Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Scrollbar(
                      controller: controller.horizontal,
                      thumbVisibility: true,
                      trackVisibility: true,
                      child: Scrollbar(
                        controller: controller.vertical,
                        child: SizedBox(
                          width: 1280,
                          height: MediaQuery.of(context).size.height - 64 - 100,
                          child: SingleChildScrollView(
                            primary: false,
                            controller: controller.horizontal,
                            scrollDirection: Axis.horizontal,
                            child: SingleChildScrollView(
                              primary: false,
                              controller: controller.vertical,
                              child: StickyHeader(
                                  header: cell(data: [
                                    'ลำดับ',
                                    'วัน/เดือน/ปี',
                                    'รายการ',
                                    'รายรับ',
                                    'รายจ่าย',
                                    'คงเหลือ',
                                    'หมายเหตุ'
                                  ]),
                                  content: Column(
                                    children: [
                                      for (var data in controller.data)
                                        cell2(data: data)
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  Widget cell({required List<String> data}) => Container(
        height: 48,
        color: Colors.green[100],
        child: Row(
          children: [
            //ANCHOR - ลำดับ
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              alignment: Alignment.center,
              width: 80,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: Text(data[0]),
            ),
            //ANCHOR - วัน/เดือน/ปี
            Container(
              alignment: Alignment.center,
              width: 180,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: Text(data[1]),
            ),
            //ANCHOR - รายการ
            Container(
              alignment: Alignment.center,
              width: 300,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: Text(data[2]),
            ),
            //ANCHOR - รายรับ
            Container(
              alignment: Alignment.center,
              width: 170,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: Text(data[3]),
            ),
            //ANCHOR - รายจ่าย
            Container(
              alignment: Alignment.center,
              width: 170,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: Text(data[4]),
            ),
            //ANCHOR - คงเหลือ
            Container(
              alignment: Alignment.center,
              width: 190,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: Text(data[5]),
            ),
            //ANCHOR - หมายเหตุ
            Container(
              alignment: Alignment.center,
              width: 190,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: Text(data[6]),
            ),
          ],
        ),
      );

  //SECTION - cell
  Widget cell2({required MoneyData data}) => Container(
        color: data.no! % 2 == 0 ? Colors.blue[50] : Colors.white,
        child: Row(
          children: [
            //ANCHOR - ลำดับ
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              alignment: Alignment.center,
              width: 80,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: Text(data.no.toString()),
            ),
            //ANCHOR - วัน/เดือน/ปี
            Container(
              alignment: Alignment.center,
              width: 180,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: Text(TimeFormat().getDate(date: data.date.toString())),
            ),
            //ANCHOR - รายการ
            Container(
              alignment: Alignment.center,
              width: 300,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: Text(data.description.toString()),
            ),
            //ANCHOR - รายรับ
            Container(
              alignment: Alignment.center,
              width: 170,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: Text(
                Convert().money(data.income.toString()),
                style: const TextStyle(color: Colors.green),
              ),
            ),
            //ANCHOR - รายจ่าย
            Container(
              alignment: Alignment.center,
              width: 170,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: Text(Convert().money(data.expense.toString()),
                  style: const TextStyle(color: Colors.red)),
            ),
            //ANCHOR - คงเหลือ
            Container(
              alignment: Alignment.center,
              width: 190,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: Text(Convert().money(data.total.toString())),
            ),
            //ANCHOR - หมายเหตุ
            Container(
              alignment: Alignment.center,
              width: 190,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
              child: Text(data.note.toString()),
            ),
          ],
        ),
      );
}
