import 'package:banzy_test/service/base_error_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../views/common_widgets/custom_outlined_button.dart';
import 'color.dart';
import 'constant_styles.dart';
import 'helper_widgets.dart';

class DialogHelper {

  //show error dialog
  static void showErrorDialog(
      {String title = 'Error',
        required List<ServerErrors> errorList,
        required int responseCode,
        required String url}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: textStyleForTitle(textTitleColor),
              ),
              addVerticalSpacing(10.h),
              Flexible(
                child: ListView.builder(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: errorList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Text(
                      "\u2022 ${errorList[i].message}",
                      style: textStyleForSubTitle(textSecondaryColor),
                    );
                  },
                ),
              ),
              addVerticalSpacing(20.h),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 0.2.sw,
                  height: 32.h,
                  child: CustomOutlinedButton(
                    textTitle: 'Ok',
                    onPress: () async {
                      hideDialog();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //hide alert dialog
  static void hideDialog() {
    if (Get.isDialogOpen!) Get.back();
  }

  //error snack bar
  static showSnackBar(
      {String title = "Error",
      required String msg,
      Color backgroundColor = informationBlueColor,
      IconData snackIcon = Icons.info}) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        title,
        style: textStyleForTitle(Colors.white),
      ),
      messageText: Text(
        msg,
        style: textStyleForSubTitle(Colors.white),
      ),
      duration: const Duration(milliseconds: 2000),
      backgroundColor: backgroundColor,
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      icon: Icon(
        snackIcon,
        color: Colors.white,
      ),
    );
  }

}
