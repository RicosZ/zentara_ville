import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:zentara_ville/controllers/home_controller.dart';
import 'package:zentara_ville/widgets/custom_formbuilder.dart';

class Information {
  add(HomeController controller, String header,
          {List<String>? initalData, VoidCallback? onPressed}) =>
      Get.dialog(Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Container(
            height: 480,
            width: 480,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: FormBuilder(
              key: controller.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('เพิ่มข้อมูล $header',
                      style: const TextStyle(fontSize: 32)),
                  const SizedBox(height: 16),
                  content(
                      controller: controller,
                      label: header,
                      initalData: initalData),
                  const Spacer(),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          onPressed: onPressed,
                          child: const Text(
                            'บันทึก',
                            style: TextStyle(fontSize: 20),
                          )))
                ],
              ),
            )),
      )).then((value) => {});

  Widget content(
      {required String label,
      required HomeController controller,
      List<String>? initalData}) {
    Widget? widget;
    switch (label) {
      case 'ผู้อยู่อาศัย':
        widget = SizedBox(
          height: 340,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: customFormTextField(
                            key: 'residentsMember$index',
                            initalData: index >= initalData!.length
                                ? ''
                                : initalData[index],
                            decoration:
                                customInputDecoration(hintText: 'ชื่อ - สกุล')),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          controller.key.currentState
                              ?.fields['residentsMember$index']!
                              .didChange('');
                        },
                        child: const SizedBox(
                          height: 58,
                          width: 58,
                          child: Card(child: Icon(Icons.delete)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      case 'สัตว์เลี้ยง':
        widget = SizedBox(
          height: 340,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('ประเภท'),
                                  customFormTextField(
                                      key: 'type$index',
                                      initalData: index >= initalData!.length
                                          ? ''
                                          : getdetail(
                                              plan: initalData[index],
                                              type: true),
                                      decoration: customInputDecoration(
                                          hintText: 'ประเภท'))
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Flexible(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('จำนวน'),
                                  customFormTextField(
                                      key: 'pet$index',
                                      initalData: index >= initalData.length
                                          ? ''
                                          : getdetail(
                                              plan: initalData[index],
                                              type: false),
                                      decoration: customInputDecoration(
                                          hintText: 'จำนวน'))
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                controller
                                    .key.currentState?.fields['pet$index']!
                                    .didChange('');
                                controller
                                    .key.currentState?.fields['type$index']!
                                    .didChange('');
                              },
                              child: const SizedBox(
                                height: 58,
                                width: 58,
                                child: Card(child: Icon(Icons.delete)),
                              ),
                            ),
                          ],
                        )),
                // Card(
                //   child: InkWell(
                //     onTap: () {
                //       controller.petMember.add('${UniqueKey()}');
                //     },
                //     child: Container(
                //       padding: const EdgeInsets.symmetric(vertical: 16),
                //       alignment: Alignment.center,
                //       child: const Text('เพิ่มประเภทสัตว์เลี้ยง'),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
        break;
      case 'ยานพาหนะ':
        widget = widget = SizedBox(
          height: 340,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('ประเภท'),
                            customFormTextField(
                                key: 'veType$index',
                                initalData: index >= initalData!.length
                                    ? ''
                                    : getdetail(
                                        plan: initalData[index], type: true),
                                decoration:
                                    customInputDecoration(hintText: 'ประเภท'))
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('จำนวน'),
                            customFormTextField(
                                key: 'vehicles$index',
                                initalData: index >= initalData.length
                                    ? ''
                                    : getdetail(
                                        plan: initalData[index], type: false),
                                decoration:
                                    customInputDecoration(hintText: 'จำนวน'))
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          controller.key.currentState?.fields['veType$index']!
                              .didChange('');
                          controller.key.currentState?.fields['vehicles$index']!
                              .didChange('');
                        },
                        child: const SizedBox(
                          height: 58,
                          width: 58,
                          child: Card(child: Icon(Icons.delete)),
                        ),
                      ),
                    ],
                  ),
                ),
                // Card(
                //   child: InkWell(
                //     onTap: () {
                //       controller.vehicles.add('${UniqueKey()}');
                //     },
                //     child: Container(
                //       padding: const EdgeInsets.symmetric(vertical: 16),
                //       alignment: Alignment.center,
                //       child: const Text('เพิ่มประเภทยานพาหนะ'),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
        break;
      default:
        widget = Container();
    }
    return widget;
  }

  String getdetail({String? plan, required bool type}) {
    if (plan != '') {
      if (type) {
        return '${plan?.split('-')[0]}';
      }
      return '${plan?.split('-')[1]}';
    }
    return '';
  }
}
