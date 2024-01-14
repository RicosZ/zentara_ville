import 'dart:typed_data';

import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:cloudinary/cloudinary.dart';
import 'package:gsheets/gsheets.dart';
import 'package:zentara_ville/models/house_registraion_model.dart';

import '../models/api.dart';
import '../models/credentials.dart';

class HomeController extends GetxController {
  final ScrollController horizontal = ScrollController();
  final ScrollController vertical = ScrollController();
  final key = GlobalKey<FormBuilderState>();
  // var residentsMember = ['${UniqueKey()}'].obs;
  var petMember = ['${UniqueKey()}'].obs;
  var vehicles = ['${UniqueKey()}'].obs;
  // var residentsMember = ['residents0'].obs;
  TextEditingController textController = TextEditingController();

  final gsheets = GSheets(Credential.sheet);
  Spreadsheet? sheet;
  Worksheet? worksheet;

  @override
  Future<void> onInit() async {
    // _configureAmplify();
    // await getInformation();
    isLoading(false);
    sheet = await gsheets.spreadsheet(Credential.sheetHouse);
    worksheet = sheet!.worksheetByTitle('sheet1');
    super.onInit();
  }

  var data = <HouseRegistrationData>[].obs;
  var houseData = <HouseRegistrationData>[].obs;
  var isLoading = true.obs;

  var textfield = <Widget>[].obs;

  getInformation() async {
    data.clear();
    isLoading(true);
    try {
      final da = await Api().fetchHouse();
      data.assignAll(da.data ?? []);
      isLoading(false);
    } catch (e) {
      print(e);
    }
  }

  getHouseData({required String houseNumber}) async {
    isLoading(true);
    await getInformation();
    houseData.assignAll(
        data.where((element) => element.houseNumber == '333/$houseNumber'));
    isLoading(false);
    print(houseData.first.hostName);
    // return '';
  }

  var listFileName = [].obs;
  var listFile = [].obs;
  var listFileUrl = [].obs;
  var fileNames = ''.obs;

  addMember({required int index}) async {
    var member = ''.obs;
    for (var i = 0; i < 10; i++) {
      if (key.currentState?.fields['residentsMember$i']?.value != '') {
        member.value +=
            '${key.currentState?.fields['residentsMember$i']?.value}, ';
      }
    }
    print(member.value);
    await worksheet!.values
        .insertRow(index + 1, [member.value], fromColumn: 4)
        .then((value) async => {getHouseData(houseNumber: index.toString())});
    await getInformation();
    Get.back();
  }

  addPet({required int index}) async {
    var pet = ''.obs;
    for (var i = 0; i < 5; i++) {
      if (key.currentState?.fields['type$i']?.value != '' &&
          key.currentState?.fields['pet$i']?.value != '') {
        pet.value +=
            '${key.currentState?.fields['type$i']?.value}-${key.currentState?.fields['pet$i']?.value}, ';
      }
    }
    print(pet.value);
    await worksheet!.values
        .insertRow(index + 1, [pet.value], fromColumn: 5)
        .then((value) async => {getHouseData(houseNumber: index.toString())});
    Get.back();
  }

  addvehicles({required int index}) async {
    var vehicle = ''.obs;
    for (var i = 0; i < 5; i++) {
      if (key.currentState?.fields['veType$i']?.value != '') {
        vehicle.value +=
            '${key.currentState?.fields['veType$i']?.value}-${key.currentState?.fields['vehicles$i']?.value}, ';
      }
    }
    print(vehicle.value);
    await worksheet!.values
        .insertRow(index + 1, [vehicle.value], fromColumn: 6)
        .then((value) async => {getHouseData(houseNumber: index.toString())});
    Get.back();
  }

  addPicture({required int index}) async {
    var picture = ''.obs;
    if (data[index - 1].picture != '') {
      picture.value = data[index - 1].picture!;
    }
    for (var element in imageUrl) {
      picture.value += '$element, ';
    }
    print(picture.value);
    await worksheet!.values
        .insertRow(index + 1, [picture.value], fromColumn: 7)
        .then((value) async => {getHouseData(houseNumber: index.toString())});
    Get.back();
  }

  pickImage({required int index}) async {
    final image = await FilePickerWeb.platform
        .pickFiles(type: FileType.image, allowMultiple: true);
    if (image != null) {
      for (var file in image.files) {
        listFile.add(file.bytes);
      }
      for (var file in listFile) {
        await uploadImage(houseNumber: '333/$index', bytes: file);
      }
      await addPicture(index: index);
      imageUrl.clear();
      update();
    }
  }

  pickSingleImage({required int index}) async {
    final image = await FilePickerWeb.platform.pickFiles(type: FileType.image);
    if (image != null) {
      await uploadImage(houseNumber: '333/$index', bytes: image.files.first.bytes!);
      await addPicture(index: index);
      imageUrl.clear();
      update();
    }
  }

  final cloudinary = Cloudinary.signedConfig(
    apiKey: '962766476284324',
    apiSecret: 'WXxDzHtO8s2z98IonyVutL_2RIQ',
    cloudName: 'dpjgqrkbx',
  );
  var imageUrl = [].obs;
  uploadImage({required Uint8List bytes, String? houseNumber}) async {
    final res = await cloudinary.upload(
      fileBytes: bytes,
      resourceType: CloudinaryResourceType.image,
      folder: 'house/$houseNumber',
    );
    if (res.isSuccessful) {
      imageUrl.add(res.secureUrl.toString());
    }
  }

  // loadInformation() async {
  //   final da = await Api().fetchHouse();
  //   data.assignAll(da.data ?? []);
  // }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}
}
