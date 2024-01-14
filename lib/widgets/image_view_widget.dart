import 'package:flutter/material.dart';

class ImageViewWidget {
  upLoad() => Container(
        height: 640,
        width: 640,
        child: Column(
          children: [
            Text('เพิ่มรูปภาพ 333/...'),
            Row(
              children: [
                Text('อัพโหลดรูปภาพ: '),
              ],
            ),
            Text('*เลือกได้สูงสุด 5 รูป'),
            Container(width: 520,height: 480,)
          ],
        ),
      );
  viewImage() {}
}
