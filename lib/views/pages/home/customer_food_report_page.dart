import 'package:banzy_test/helper/color.dart';
import 'package:banzy_test/helper/constant_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../helper/app_constants.dart';
import '../../../helper/helper_widgets.dart';
import '../../../models/customer_reports.dart';
import 'customer_food_report_page_controller.dart';
import 'customer_report_header.dart';

class CustomerFoodReportPage extends StatelessWidget {
  final customerFoodReportPageController = Get.put(CustomerFoodReportPageController());

  CustomerFoodReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          AppConstants.appName,
          style: textStyleForTitle(Colors.white),
        ),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomerReportHeader(),
              addVerticalSpacing(20.h),
              Text(
                'Monthly Food Consumption Report',
                style: textStyleForTitle(textTitleColor),
              ),
              addVerticalSpacing(8.h),
              customerFoodReportPageController.isDataLoading.value
                  ? reportLoadingShimmer()
                  : ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: customerFoodReportPageController.reports.length,
                      itemBuilder: (context, index) {
                        return foodConsumptionListItem(index);
                      },
                    )
            ],
          ),
        );
      }),
    );
  }

  Widget foodConsumptionListItem(index) {
    Report report = customerFoodReportPageController.reports[index];
    return Card(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Row(
              children: [
                Icon(
                  Icons.date_range_outlined,
                  size: 28.r,
                  color: iconsColor,
                ),
                addHorizontalSpacing(5.w),
                Text(
                  customerFoodReportPageController.getFormattedDateString(report.date),
                  style: textStyleForTitle(textTitleColor),
                )
              ],
            ),
          ),
          Container(
            color: cardBackgroundColor,
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _commonTextWithTitle('Breakfast', report.optIns!.breakfast ?? 'NA'),
                _commonTextWithTitle('Lunch', report.optIns!.lunch ?? 'NA'),
                _commonTextWithTitle('Dinner', report.optIns!.dinner ?? 'NA'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _commonTextWithTitle(String title, String subTitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textStyleCustom(
              fontSize: 12.sp, fontWeight: FontWeight.normal, color: textSecondaryColor),
        ),
        SizedBox(
          height: 5.0.h,
        ),
        Text(
          subTitle,
          style:
              textStyleCustom(fontSize: 12.sp, fontWeight: FontWeight.bold, color: textTitleColor),
        ),
      ],
    );
  }

  Widget reportLoadingShimmer() {
    return Column(
      children: [
        customerReportLoadingShimmerItem(),
        customerReportLoadingShimmerItem(),
        customerReportLoadingShimmerItem(),
        customerReportLoadingShimmerItem(),
        customerReportLoadingShimmerItem(),
        customerReportLoadingShimmerItem(),
      ],
    );
  }

  Widget customerReportLoadingShimmerItem() {
    return SizedBox(
      height: 80.h,
      width: 1.sw,
      child: Shimmer.fromColors(
        enabled: true,
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Container(
          margin: EdgeInsets.only(bottom: 10.h),
          color: Colors.black,
        ),
      ),
    );
  }
}
