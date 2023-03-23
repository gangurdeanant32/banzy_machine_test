import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../helper/app_constants.dart';
import '../../../helper/color.dart';
import '../../../helper/constant_styles.dart';
import '../../../helper/helper_widgets.dart';
import 'customer_food_report_page_controller.dart';
import 'package:shimmer/shimmer.dart';

class CustomerReportHeader extends StatelessWidget {
  final CustomerFoodReportPageController customerFoodReportPageController = Get.find();

  CustomerReportHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customerFoodReportPageController.isDataLoading.value
            ? shimmerLoadingDataHeader1()
            : shimmerLoadedDataHeader1(),
        addVerticalSpacing(10.h),
        customerFoodReportPageController.isDataLoading.value
            ? SizedBox(
                width: 1.sw,
                height: 26.h,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: const Card(
                    color: Colors.black,
                  ),
                ),
              )
            : Text(
                'Total Food Wastage Fine For The Month is ₹ ${customerFoodReportPageController.totalPendingFoodCount * 100}',
                style: textStyleForTitle(textTitleColor),
              ),
      ],
    );
  }

  Widget shimmerLoadingDataHeader1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 60.w,
          height: 60.h,
          child: Shimmer.fromColors(
            enabled: true,
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Card(
              color: primaryColorDark,
              child: const Center(),
            ),
          ),
        ),
        addHorizontalSpacing(10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 1.sw,
                height: 18.h,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: const Card(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 1.sw,
                height: 18.h,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: const Card(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget shimmerLoadedDataHeader1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 60.w,
          height: 60.h,
          child: Card(
            color: primaryColorDark,
            child: Center(
              child: Text(
                '${customerFoodReportPageController.user.value.fName?.toUpperCase()[0]}',
                style: textStyleCustom(
                    fontSize: 32.sp, fontWeight: FontWeight.w900, color: Colors.white),
              ),
            ),
          ),
        ),
        addHorizontalSpacing(10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${customerFoodReportPageController.user.value.fName} ${customerFoodReportPageController.user.value.lName} ',
                maxLines: 1,
                style: textStyleCustom(
                    fontSize: 20.sp, fontWeight: FontWeight.bold, color: textTitleColor),
              ),
              Text(
                '${customerFoodReportPageController.user.value.email}',
                maxLines: 1,
                style: textStyleForSubTitle(textSecondaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
