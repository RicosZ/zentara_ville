import 'package:intl/intl.dart';

class Convert {
  String money(String? value) {
    if (value != '') {
      var formattedNumber =
          NumberFormat('#,##0', 'en_US').format(int.parse(value!));
      return '$formattedNumber บาท';
    }
    return '';
  }
}
