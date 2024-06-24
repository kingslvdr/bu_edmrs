import 'package:bu_edmrs/API/bindings.dart';
import 'package:bu_edmrs/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  Get.lazyPut<DataService>(() => DataService());
  // final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(App());
}

