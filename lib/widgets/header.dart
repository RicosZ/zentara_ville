import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.offAndToNamed(Routes.home);
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.greenAccent,
            width: 180,
            height: 48,
            child: const Text('ทะเบียนบ้าน',
                style: TextStyle(color: Colors.black, fontSize: 20)),
          ),
        ),
        InkWell(
          onTap: () {
            Get.offAndToNamed(Routes.money);
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.amber[100],
            width: 180,
            height: 48,
            child: const Text('รายรับ - รายจ่าย',
                style: TextStyle(color: Colors.black, fontSize: 20)),
          ),
        ),
      ],
    );
  }
}
