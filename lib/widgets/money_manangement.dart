import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:zentara_ville/controllers/money_controller.dart';
import 'package:zentara_ville/widgets/custom_formbuilder.dart';

class Management {
  add(MoneyController controller) => Get.dialog(Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Container(
            height: 640,
            width: 520,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: FormBuilder(
              key: controller.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('เพิ่มรายการ', style: TextStyle(fontSize: 48)),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('วันที่ :', style: TextStyle(fontSize: 20)),
                  ),
                  FormBuilderDateTimePicker(
                    inputType: InputType.date,
                    name: 'date',
                    onChanged: (value) {
                      controller.key.currentState?.fields['date']!.save();
                      // controller.date.value = value!;
                    },
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('รายการ', style: TextStyle(fontSize: 20)),
                  ),
                  customFormTextField(
                      key: 'description',
                      decoration: customInputDecoration(hintText: '')),
                  FormBuilderRadioGroup(
                    name: 'transection',
                    options: const [
                      FormBuilderChipOption(
                          value: 'รายรับ',
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(
                              'รายรับ',
                              style: TextStyle(fontSize: 16),
                            ),
                          )),
                      FormBuilderChipOption(
                          value: 'รายจ่าย',
                          child: Text(
                            'รายจ่าย',
                            style: TextStyle(fontSize: 16),
                          ))
                    ],
                    onChanged: (value) {},
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('จำนวน', style: TextStyle(fontSize: 20)),
                  ),
                  customFormTextField(
                      key: 'amount',
                      decoration: customInputDecoration(hintText: '')),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('หมายเหตุ', style: TextStyle(fontSize: 20)),
                  ),
                  customFormTextField(
                      key: 'note',
                      action: TextInputAction.newline,
                      decoration: customInputDecoration(hintText: '')),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          onPressed: () {
                            // controller.printinf();
                            controller.addInformation();
                          },
                          child: const Text(
                            'บันทึก',
                            style: TextStyle(fontSize: 20),
                          )))
                ],
              ),
            )),
      ));
}
