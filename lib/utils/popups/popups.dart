import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bu_edmrs/API/logout_api.dart';
import 'package:bu_edmrs/utils/constants/colors.dart';
import 'package:bu_edmrs/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:toastification/toastification.dart';

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

  static showLogout(context) async {
    AwesomeDialog(
      context: context,
      animType: AnimType.bottomSlide,
      dialogType: DialogType.question,
      headerAnimationLoop: false,
      dismissOnTouchOutside: false,
      buttonsTextStyle: const TextStyle(fontSize: 18),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Logout?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),),
            SizedBox(
              height: 10,
            ),
            Text('Are you sure to logout?'),
          ],
        ),
      ),
      btnOkText: 'Yes',
      btnCancelText: 'No',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        userLogout();
      },
    ).show();
  }
}
