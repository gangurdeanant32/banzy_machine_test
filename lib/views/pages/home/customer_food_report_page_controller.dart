import 'package:banzy_test/helper/api_contants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/customer_reports.dart';
import '../../../service/base_client.dart';

class CustomerFoodReportPageController extends GetxController {
  var isDataLoading = true.obs;
  var user = User().obs;
  var reports = <Report>[].obs;
  var totalPendingFoodCount = 0.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchMonthlyReports(1);
  }

  //to fetch the data from server
  Future<void> fetchMonthlyReports(int month) async {
    var jsonParams = {"month": month.toString()};
    isDataLoading.value = true;
    var response = await BaseClient().postDataOnServer(getReportsUrl, jsonParams);
    if (response == null) {
      isDataLoading.value = false;
      return;
    }
    isDataLoading.value = false;
    CustomerReportsResponse customerReportsResponse = customerReportsResponseFromJson(response);
    user.value = customerReportsResponse.user!;
    reports.value = customerReportsResponse.reports;
    for (Report reportOptIn in reports) {
      OptInsClass optInsClass = reportOptIn.optIns ?? OptInsClass();
      if (optInsClass.breakfast?.contains('Pending') ?? false) {
        totalPendingFoodCount.value += 1;
      }
      if (optInsClass.lunch?.contains('Pending')  ?? false) {
        totalPendingFoodCount.value += 1;
      }
      if (optInsClass.dinner?.contains('Pending') ?? false) {
        totalPendingFoodCount.value += 1;
      }
    }
  }

  String getFormattedDateString(date){
    DateTime parseDate = DateFormat("yyyy-MM-dd").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    return DateFormat.MMMEd().format(inputDate);
  }

}
