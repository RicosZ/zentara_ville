// To parse this JSON data, do
//
//     final houseRegistration = houseRegistrationFromJson(jsonString);

import 'dart:convert';

HouseRegistration houseRegistrationFromJson(String str) => HouseRegistration.fromJson(json.decode(str));

String houseRegistrationToJson(HouseRegistration data) => json.encode(data.toJson());

class HouseRegistration {
    bool? success;
    List<HouseRegistrationData>? data;

    HouseRegistration({
        this.success,
        this.data,
    });

    factory HouseRegistration.fromJson(Map<String, dynamic> json) => HouseRegistration(
        success: json["success"],
        data: json["data"] == null ? [] : List<HouseRegistrationData>.from(json["data"]!.map((x) => HouseRegistrationData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class HouseRegistrationData {
    int? no;
    String? houseNumber;
    String? hostName;
    String? residentName;
    String? pet;
    String? vehicle;
    String? picture;

    HouseRegistrationData({
        this.no,
        this.houseNumber,
        this.hostName,
        this.residentName,
        this.pet,
        this.vehicle,
        this.picture,
    });

    factory HouseRegistrationData.fromJson(Map<String, dynamic> json) => HouseRegistrationData(
        no: json["ลำดับ"],
        houseNumber: json["บ้านเลขที่"],
        hostName: json["ชื่อเจ้าบ้าน"],
        residentName: json["ชื่อผู้อยู่อาศัย"],
        pet: json["สัตว์เลี้ยง"],
        vehicle: json["ยานพาหนะ"],
        picture: json["รูปภาพ"],
    );

    Map<String, dynamic> toJson() => {
        "ลำดับ": no,
        "บ้านเลขที่": houseNumber,
        "ชื่อเจ้าบ้าน": hostName,
        "ชื่อผู้อยู่อาศัย": residentName,
        "สัตว์เลี้ยง": pet,
        "ยานพาหนะ": vehicle,
        "รูปภาพ": picture,
    };
}
