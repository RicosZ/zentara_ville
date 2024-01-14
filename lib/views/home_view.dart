import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:zentara_ville/widgets/information.dart';

import '../controllers/home_controller.dart';
import '../widgets/custom_formbuilder.dart';
import '../widgets/header.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[50],
        // appBar: AppBar(),
        body: Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.symmetric(horizontal: 48),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Header(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.green[50]),
                                // padding: EdgeInsets.only(bottom: 8),
                                width: 960,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'บ้านเลขที่ 333/',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 48),
                                        ),
                                        SizedBox(
                                          width: 100,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: TextField(
                                              controller:
                                                  controller.textController,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: customInputDecoration(
                                                  hintText: 'เลขที่'),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              onPressed: () {
                                                controller.getHouseData(
                                                    houseNumber: controller
                                                        .textController.text);
                                              },
                                              child: controller.isLoading.value
                                                  ? const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child:
                                                          CircularProgressIndicator(),
                                                    )
                                                  : const Padding(
                                                      padding:
                                                          EdgeInsets.all(16.0),
                                                      child: Text(
                                                        'ค้นหา',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    )),
                                        )
                                      ],
                                    ),
                                    Text(
                                        'ชื่อเจ้าบ้าน: ${controller.houseData.isNotEmpty ? controller.houseData.first.hostName : '......'}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 32)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        customBox(
                                            'ผู้อยู่อาศัย',
                                            controller.houseData.isNotEmpty
                                                ? controller.houseData.first
                                                    .residentName!
                                                    .split(', ')
                                                : [],
                                            'ผู้อยู่อาศัย',
                                            controller.houseData.isNotEmpty
                                                ? controller.houseData.first.no!
                                                : 0),
                                        const SizedBox(height: 8),
                                        customBox(
                                            'สัตว์เลี้ยง',
                                            controller.houseData.isNotEmpty
                                                ? controller
                                                    .houseData.first.pet!
                                                    .split(', ')
                                                : [],
                                            'สัตว์เลี้ยง',
                                            controller.houseData.isNotEmpty
                                                ? controller.houseData.first.no!
                                                : 0),
                                        const SizedBox(height: 8),
                                        customBox(
                                            'ยานพาหนะ',
                                            controller.houseData.isNotEmpty
                                                ? controller
                                                    .houseData.first.vehicle!
                                                    .split(', ')
                                                : [],
                                            'ยานพาหนะ',
                                            controller.houseData.isNotEmpty
                                                ? controller.houseData.first.no!
                                                : 0)
                                      ],
                                    ),
                                  ),
                                  // Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, left: 32),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Colors.red),
                                      height: 480,
                                      width: 480,
                                      // color: Colors.red,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 48,
                          ),
                          SizedBox(
                            width: 400,
                            height: 640,
                            child: SingleChildScrollView(
                              child: controller.houseData.isNotEmpty
                                  ? controller.houseData.first.picture != ''
                                      ? Column(
                                          children: [
                                            ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: controller
                                                  .houseData.first.picture!
                                                  .split(', ')
                                                  .length,
                                              itemBuilder: (context, index) =>
                                                  Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 0, 8, 8),
                                                child: controller.houseData.first.picture!
                                                            .split(
                                                                ', ')[index] !=
                                                        ''
                                                    ? Container(
                                                        padding: const EdgeInsets.all(
                                                            8),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    16),
                                                            color: Colors
                                                                .green[100]),
                                                        height: 200,
                                                        child: CachedNetworkImage(
                                                            fit:
                                                                BoxFit.fitWidth,
                                                            imageUrl: controller
                                                                .houseData
                                                                .first
                                                                .picture!
                                                                .split(', ')[index]))
                                                    : Container(),
                                              ),
                                            ),
                                            controller.houseData.first.picture!
                                                        .split(', ')
                                                        .length <
                                                    5
                                                ? InkWell(
                                                    splashFactory:
                                                        NoSplash.splashFactory,
                                                    splashColor:
                                                        Colors.amber[50],
                                                    hoverColor:
                                                        Colors.amber[50],
                                                    overlayColor:
                                                        MaterialStatePropertyAll(
                                                      Colors.amber[50],
                                                    ),
                                                    onTap: () {
                                                      print('object');
                                                      controller.pickSingleImage(
                                                          index: controller
                                                                  .houseData
                                                                  .isNotEmpty
                                                              ? controller
                                                                  .houseData
                                                                  .first
                                                                  .no!
                                                              : 0);
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16),
                                                            color: Colors
                                                                .green[100]),
                                                        height: 200,
                                                        width: 400,
                                                        child: const Text(
                                                          'เพิ่มรูป',
                                                          style: TextStyle(
                                                              fontSize: 32),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Container()
                                          ],
                                        )
                                      : InkWell(
                                          splashFactory: NoSplash.splashFactory,
                                          splashColor: Colors.amber[50],
                                          hoverColor: Colors.amber[50],
                                          overlayColor:
                                              MaterialStatePropertyAll(
                                            Colors.amber[50],
                                          ),
                                          onTap: () {
                                            controller.pickImage(
                                                index: controller
                                                        .houseData.isNotEmpty
                                                    ? controller
                                                        .houseData.first.no!
                                                    : 0);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(16),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Colors.green[100]),
                                            width: 400,
                                            height: 640,
                                            child: const Text(
                                              'เพิ่มรูป',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 32),
                                            ),
                                          ),
                                        )
                                  : Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Colors.green[100]),
                                      width: 400,
                                      height: 640,
                                    ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }

  customBox(String label, List<String> listtext, String? type, int index) =>
      InkWell(
        onTap: controller.houseData.isNotEmpty
            ? () {
                Information().add(controller, label, initalData: listtext,
                    onPressed: () {
                  label == 'ผู้อยู่อาศัย'
                      ? controller.addMember(index: index)
                      : label == 'สัตว์เลี้ยง'
                          ? controller.addPet(index: index)
                          : controller.addvehicles(index: index);
                });
              }
            : () {},
        child: Container(
            width: 420,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[100]),
            child: content(label: label, listtext: listtext)),
      );

  Widget content({required String label, required List<String> listtext}) {
    Widget? widget;
    switch (label) {
      case 'ผู้อยู่อาศัย':
        widget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(color: Colors.black, fontSize: 28)),
            for (var doc in listtext)
              if (doc != '')
                Text('  ${listtext.indexOf(doc) + 1}. $doc',
                    style: const TextStyle(color: Colors.black, fontSize: 20)),
          ],
        );
        break;
      case 'สัตว์เลี้ยง':
        widget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(color: Colors.black, fontSize: 28)),
            for (var doc in listtext)
              if (doc != '')
                Text(
                    '  ${listtext.indexOf(doc) + 1}. ${getdetail(plan: doc, ex: 'ตัว')}',
                    style: const TextStyle(color: Colors.black, fontSize: 20)),
          ],
        );
        break;
      case 'ยานพาหนะ':
        widget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(color: Colors.black, fontSize: 28)),
            for (var doc in listtext)
              if (doc != '')
                Text(
                    '  ${listtext.indexOf(doc) + 1}. ${getdetail(plan: doc, ex: 'คัน')}',
                    style: const TextStyle(color: Colors.black, fontSize: 20)),
          ],
        );
        break;
      default:
        widget = Container();
    }
    return widget;
  }

  String getdetail({String? plan, String? ex}) {
    if (plan != '') {
      return '${plan?.split('-')[0]} ${plan?.split('-')[1]} $ex';
    }
    return '';
  }
}
