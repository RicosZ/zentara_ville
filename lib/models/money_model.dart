// To parse this JSON data, do
//
//     final money = moneyFromJson(jsonString);

import 'dart:convert';

Money moneyFromJson(String str) => Money.fromJson(json.decode(str));

String moneyToJson(Money data) => json.encode(data.toJson());

class Money {
  bool? success;
  List<MoneyData>? data;

  Money({
    this.success,
    this.data,
  });

  factory Money.fromJson(Map<String, dynamic> json) => Money(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<MoneyData>.from(
                json["data"]!.map((x) => MoneyData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MoneyData {
  int? no;
  DateTime? date;
  String? description;
  dynamic income;
  dynamic expense;
  int? total;
  String? note;

  MoneyData({
    this.no,
    this.date,
    this.description,
    this.income,
    this.expense,
    this.total,
    this.note,
  });

  factory MoneyData.fromJson(Map<String, dynamic> json) => MoneyData(
        no: json["ลำดับ"],
        date: json["วัน/เดือน/ปี"] == null
            ? null
            : DateTime.parse(json["วัน/เดือน/ปี"]),
        description: json["รายการ"],
        income: json["รายรับ"],
        expense: json["รายจ่าย"],
        total: json["คงเหลือ"],
        note: json["หมายเหตุ"],
      );

  Map<String, dynamic> toJson() => {
        "ลำดับ": no,
        "วัน/เดือน/ปี": date?.toIso8601String(),
        "รายการ": description,
        "รายรับ": income,
        "รายจ่าย": expense,
        "คงเหลือ": total,
        "หมายเหตุ": note,
      };
}
