import 'package:get/get.dart';

import '../home/customer_food_report_page.dart';

class LauncherPageController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    launchHomePage();
  }

  void launchHomePage() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Get.off(() => CustomerFoodReportPage());
  }
}
