import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

TextStyle textStyleForTitle(Color color) {
  return GoogleFonts.openSans(
    fontSize: 18.0.sp,
    fontWeight: FontWeight.bold,
    color: color,
  );
}

TextStyle textStyleForSubTitle(Color color) {
  return GoogleFonts.openSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: color,
  );
}

TextStyle textStyleCustom(
    {required double fontSize,
      required FontWeight fontWeight,
      Color? backgroundColor,
      Color? color}) {
  return GoogleFonts.nunito(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    backgroundColor: backgroundColor,
  );
}