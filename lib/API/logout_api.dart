import 'package:bu_edmrs/pages/login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void userLogout(){
  final localStorage = GetStorage();

  localStorage.erase();

  Get.offAll(() => const LoginScreen());
}