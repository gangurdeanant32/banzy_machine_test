import 'package:banzy_test/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';


import 'launcher_page_controller.dart';


class LauncherPage extends StatelessWidget {

  final launcherPageController = Get.put(LauncherPageController());

  LauncherPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: ZoomIn(
          child: FlutterLogo(
            size: 100.h,
          ),
        ),
      ),
    );
  }
}
