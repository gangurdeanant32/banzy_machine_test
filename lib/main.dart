import 'package:banzy_test/views/pages/launcher/launcher_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'helper/app_constants.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.indigo),
          home: child,
          themeMode: ThemeMode.system,
        );
      },
      child: LauncherPage(),
    );
  }
}
