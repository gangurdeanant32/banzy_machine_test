import 'package:banzy_test/helper/constant_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helper/color.dart';


class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPress;
  final String textTitle;
  final TextStyle? textStyle;

  const CustomOutlinedButton({
    Key? key,
    required this.textTitle,
     this.textStyle,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColorDark,
          backgroundColor: Colors.white
        ),
        onPressed: onPress,
        child: Text(
          textTitle,
          style: textStyle ?? textStyleCustom(fontSize: 16.sp, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ));
  }
}
