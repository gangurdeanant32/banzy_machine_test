import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color primaryColorDark = const Color(0xFF04142c);
const Color primaryColor = Color(0xFF052553);
const Color accentColor = Color(0xFFcaecff);
const Color lightGrayColor = Color(0xffF2F2F2);
const Color errorRedColor = Color(0xfff33850);
const Color successGreenColor = Color(0xff74d00e);
const Color informationBlueColor = Color(0xff34c5fc);
const Color warningYellowColor = Color(0xfffeb70b);
Color backgroundColor = Get.isDarkMode ? const Color(0xff24292E) : const Color(0xfff3f5f7);
Color iconsColor = Get.isDarkMode ? accentColor : primaryColor;
Color cardBackgroundColor = Get.isDarkMode ? primaryColorDark : Colors.grey.shade300;
Color textTitleColor = Get.isDarkMode ? const Color(0xffffffff) : const Color(0xff051117);
Color textSecondaryColor = Get.isDarkMode ? const Color(0xffF2F2F2) : const Color(0xff4F5560);
Color textHintColor = const Color(0xffBEC4C5);
