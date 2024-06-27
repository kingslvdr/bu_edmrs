import 'package:get/get.dart';

class DropdownController extends GetxController {
  var dropdownValue = 'Option 1'.obs; // Observable variable to hold dropdown value
  var selectedvalue = ''.obs;
  RxBool isLoading = true.obs;

  void changeDropdownValue(String newValue) {

      dropdownValue.value = newValue;
      viewValue();
  }

  void viewValue(){
      Future.delayed(Duration(seconds: 2), (){
        selectedvalue.value = dropdownValue.value;
        isLoading(false);
      });

      isLoading(true);
  }
}
