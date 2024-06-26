import 'dart:convert';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:bu_edmrs/API/api_endpoints.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bu_edmrs/API/logout_api.dart';
import 'package:bu_edmrs/common/widgets/inbox_controller.dart';
import 'package:bu_edmrs/pages/inbox_request.dart';
import 'package:bu_edmrs/utils/constants/colors.dart';
import 'package:bu_edmrs/utils/constants/size.dart';
import 'package:bu_edmrs/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:toastification/toastification.dart';
import 'package:http/http.dart' as http;

class PopUps {
  static errorSnackBar({required title, required message}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: ConstColors.white,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2));
  }

  static successToast({required title, required message, required context}) {
    toastification.show(
        context: context, // optional if you use ToastificationWrapper
        title: Text(
          title,
          style: const TextStyle(
              fontSize: ConstSizes.lg, fontWeight: FontWeight.bold),
        ),
        description: RichText(text: TextSpan(text: message)),
        autoCloseDuration: const Duration(milliseconds: 2500),
        showProgressBar: false,
        type: ToastificationType.success,
        style: ToastificationStyle.fillColored,
        icon: const Icon(Icons.check),
        closeOnClick: false,
        pauseOnHover: false,
        alignment: Alignment.topCenter);
  }

  static errorToast({required title, required message, required context}) {
    toastification.show(
        context: context, // optional if you use ToastificationWrapper
        title: Text(
          title,
          style: const TextStyle(
              fontSize: ConstSizes.lg, fontWeight: FontWeight.bold),
        ),
        description: RichText(text: TextSpan(text: message)),
        autoCloseDuration: const Duration(milliseconds: 2500),
        showProgressBar: false,
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
        icon: const Icon(Icons.check),
        closeOnClick: false,
        pauseOnHover: false,
        alignment: Alignment.topCenter);
  }

  static successSnackBar({required title, required message}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: ConstColors.white,
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2));
  }

  static showForgotPass({required context, required icon, required message}) {
    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.success,
        title: message,
        // text: "Show a success message with an icon"
      ),
    );
  }

  static showReject({required context, required docNo}) {
    final controller = Get.put(RejectController());

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 1 / 1.2, // Takes one-third of the screen height
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Form(
                key: controller.loginFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 140,
                        width: double.infinity,
                        child: Center(
                          child: Lottie.asset(
                              'assets/images/animations/Animation - 1719299632486.json',
                              repeat: false),
                        ),
                      ),
                      const Text(
                        'Reject Request',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: ConstSizes.spaceBtwItems,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Are you sure to Reject this request? If YES, please input reason.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: ConstSizes.spaceBtwItems,
                      ),
                      TextFormField(
                        validator: (value) => TValidator.validateReason(value),
                        maxLines: 3,
                        controller: controller.rejectReason,
                      ),
                      const SizedBox(
                        height: ConstSizes.spaceBtwSections,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll<Color>(Colors.red),
                                  foregroundColor:
                                      WidgetStatePropertyAll<Color>(
                                          Colors.white),
                                  side: WidgetStatePropertyAll(
                                    BorderSide(color: Colors.red),
                                  ),
                                ),
                                child: const Text('No'),
                                onPressed: () => Navigator.pop(context)),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll<Color>(Colors.green),
                                foregroundColor:
                                    WidgetStatePropertyAll<Color>(Colors.white),
                                side: WidgetStatePropertyAll(
                                  BorderSide(color: Colors.green),
                                ),
                              ),
                              child: const Text('Yes'),
                              onPressed: () =>
                                  controller.confirmReject(context, docNo),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static showApprove({required context, required docNo}) {
    final controller = Get.put(RejectController());
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 1 / 1.2, // Takes one-third of the screen height
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 160,
                        width: double.infinity,
                        child: Center(
                          child: Lottie.asset(
                              'assets/images/animations/Animation - 1719364337556.json',
                              repeat: false),
                        ),
                      ),
                      const Text(
                        'Approve Request',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: ConstSizes.spaceBtwItems,
                      ),
                      Text(
                        'Are you sure to Approve this request?',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(
                        height: ConstSizes.spaceBtwItems,
                      ),
                      const SizedBox(
                        height: ConstSizes.spaceBtwSections,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll<Color>(Colors.red),
                                  foregroundColor:
                                      WidgetStatePropertyAll<Color>(
                                          Colors.white),
                                  side: WidgetStatePropertyAll(
                                    BorderSide(color: Colors.red),
                                  ),
                                ),
                                child: const Text('No'),
                                onPressed: () => Navigator.pop(context)),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll<Color>(Colors.green),
                                foregroundColor:
                                    WidgetStatePropertyAll<Color>(Colors.white),
                                side: WidgetStatePropertyAll(
                                  BorderSide(color: Colors.green),
                                ),
                              ),
                              child: const Text('Yes'),
                              onPressed: () =>
                                  controller.confirmApprove(context, docNo),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static showLogout(context) async {
    ArtDialogResponse response = await ArtSweetAlert.show(
        barrierDismissible: false,
        context: context,
        artDialogArgs: ArtDialogArgs(
            denyButtonText: "No",
            title: "Are you sure?",
            text: "Logout from the application",
            confirmButtonText: "Yes",
            type: ArtSweetAlertType.warning));

    if (response == null) {
      return;
    }

    if (response.isTapConfirmButton) {
      userLogout();
    }
  }
} // end of POPUPS CLASS

class RejectController extends GetxController {
  final rejectReason = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final storage = GetStorage();
  final InboxController inboxController = Get.put(InboxController());

  Future<void> confirmApprove(context, docNo) async {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Dialog cannot be dismissed by tapping outside
      builder: (context) {
        return Dialog(
          elevation: 4,
          backgroundColor: Colors.white, // Makes background transparent
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/images/animations/141397-loading-juggle.json', // Replace with your Lottie animation file
                  width: 150,
                ),
                const Text(
                  'Please Wait', // Display custom text or default 'Loading...'
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );

    var url =
        Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.approve);
    String user = storage.read('username');
    String userpass = storage.read('password');
    String credentials = '$user:$userpass';
    String encodedCredentials = base64Encode(utf8.encode(credentials));
    Map<String, String> headers = {
      'authorization': 'Basic $encodedCredentials'
    };

    Map<String, dynamic> body = {
      'docNo': docNo,
      'userApprove': storage.read('username')
    };

    var response = await http.post(url, headers: headers, body: body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      if (result['success'] == true) {
        Navigator.pop(context);
        PopUps.successToast(
            title: 'Success', message: result['message'], context: context);
            inboxController.isLoading.value = true;
        // localStorage.write('username', result);
        // List<dynamic> data = result['data'];
        // storage.write('greeting', result['greeting']);
        // storage.write('fullname', data[0]['EMPL_NAME']);
        // storage.write('position', data[0]['POSITION']);
        // storage.write('business', data[0]['BUSINESS_UNIT']);
        // storage.write('department', data[0]['DEPARTMENT']);
        // storage.write('isLoggedIn', true);
        // storage.write('username', user);
        // storage.write('password', userpass);

        // PopUps.successToast(
        //     title: 'Success', message: result['message'], context: context);

        //   Future.delayed(
        //     const Duration(seconds: 3),
        //     () {
        //       rejectReason.clear();
        //       Get.offAll(() => Home());
        //     },
        //   );
        // } else {
        //   // throw resultDecode(response.body)['message'];
        //   PopUps.errorSnackBar(title: 'Error', message: result['message']);
        // }
      } else {
        Navigator.pop(context);
        PopUps.errorToast(
            title: 'Success', message: result['message'], context: context);
      }
    }
  } // end of approve

  Future<void> confirmReject(context, docNo) async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    } else {
      showDialog(
        context: context,
        barrierDismissible:
            false, // Dialog cannot be dismissed by tapping outside
        builder: (context) {
          return Dialog(
            elevation: 4,
            backgroundColor: Colors.white, // Makes background transparent
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    'assets/images/animations/141397-loading-juggle.json', // Replace with your Lottie animation file
                    width: 150,
                  ),
                  const Text(
                    'Please Wait', // Display custom text or default 'Loading...'
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      );

      var url =
          Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.reject);
      String user = storage.read('username');
      String userpass = storage.read('password');
      String credentials = '$user:$userpass';
      String encodedCredentials = base64Encode(utf8.encode(credentials));
      Map<String, String> headers = {
        'authorization': 'Basic $encodedCredentials'
      };

      Map<String, dynamic> body = {
        'docNo': docNo,
        'userApprove': storage.read('username'),
        'reason': rejectReason.text
      };

      var response = await http.post(url, headers: headers, body: body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Map<String, dynamic> result = json.decode(response.body);
        if (result['success'] == true) {
          Navigator.pop(context);
          PopUps.successToast(
              title: 'Success', message: result['message'], context: context);
          Future.delayed( const Duration(seconds: 3),
            () {
              rejectReason.clear();
              Get.off(()=>InboxRequest());
            }
          );
          // localStorage.write('username', result);
          // List<dynamic> data = result['data'];
          // storage.write('greeting', result['greeting']);
          // storage.write('fullname', data[0]['EMPL_NAME']);
          // storage.write('position', data[0]['POSITION']);
          // storage.write('business', data[0]['BUSINESS_UNIT']);
          // storage.write('department', data[0]['DEPARTMENT']);
          // storage.write('isLoggedIn', true);
          // storage.write('username', user);
          // storage.write('password', userpass);

          // PopUps.successToast(
          //     title: 'Success', message: result['message'], context: context);

          //   Future.delayed(
          //     const Duration(seconds: 3),
          //     () {
          //       rejectReason.clear();
          //       Get.offAll(() => Home());
          //     },
          //   );
          // } else {
          //   // throw resultDecode(response.body)['message'];
          //   PopUps.errorSnackBar(title: 'Error', message: result['message']);
          // }
        } else {
          Navigator.pop(context);
          PopUps.errorToast(
              title: 'Success', message: result['message'], context: context);
        }
      }
    }
  }
}
