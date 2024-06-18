import 'package:art_sweetalert/art_sweetalert.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
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
}
