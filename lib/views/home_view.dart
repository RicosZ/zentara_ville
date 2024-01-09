import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zentara_ville/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[50],
        // appBar: AppBar(),
        body: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.all(48),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.green[50]),
                        // padding: EdgeInsets.only(bottom: 8),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'บ้านเลขที่ 333/...',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 48),
                            ),
                            Text('ชื่อเจ้าบ้าน นาย ทานุพง แสงวาน',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 32)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customBox('ผู้อยู่อาศัย', [
                                  'นาง ประสานพร แสงวาน',
                                  'เด็กชาย มานาท แสงวาน'
                                ]),
                                SizedBox(
                                  height: 8,
                                ),
                                customBox('สัตว์เลี้ยง', ['แมว', 'สุนัข']),
                                SizedBox(
                                  height: 8,
                                ),
                                customBox('ยานภาหนะ', [
                                  'กข 1202 รถยนต์',
                                  '1กม 2367 รถจักรยายน',
                                  'รถบัส'
                                ])
                              ],
                            ),
                          ),
                          // Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, left: 32),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
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
                  Column(
                    children: [
                      SingleChildScrollView(
                        child: InkWell(
                          splashFactory: NoSplash.splashFactory,
                          splashColor: Colors.amber[50],
                          hoverColor: Colors.amber[50],
                          overlayColor: MaterialStatePropertyAll(
                            Colors.amber[50],
                          ),
                          onTap: () {
                            print('object');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.green[100]),
                            width: 400,
                            height: 580,
                            child: Text(
                              'เพิ่มรูป',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 32),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 400,
                        height: 60,
                        padding: EdgeInsets.only(top: 16),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('บันทึก'),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  customBox(String label, List<String> listtext) => Container(
        width: 420,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.grey[100]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(color: Colors.black, fontSize: 28)),
            for (var doc in listtext)
              Text('  ${listtext.indexOf(doc) + 1}. $doc',
                  style: const TextStyle(color: Colors.black, fontSize: 20)),
          ],
        ),
      );
}
