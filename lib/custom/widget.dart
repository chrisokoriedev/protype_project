import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:protype_project/custom/styles.dart';

Text textHeader(String title) {
  return Text(
    title,
    style: TextStyle(
        fontSize: 20.0.sp, color: whiteColor, fontWeight: FontWeight.w700),
  );
}

Text textSubHeader(String title) {
  return Text(
    title,
    style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: kTextGreyColor),
  );
}

Row medicieComponent(String title, IconData iconData, String subTitle ) {
  return Row(
    children: [
      Icon(
        iconData,
        color: kPrimaryColor,
        size: 27.sp,
      ),
      SizedBox(width: 15.w),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: const Color(0xff8EA5BC),
              fontSize: 14.sp,
            ),
          ),
          Text(
            subTitle,
            style: TextStyle(
                color: kTextSubColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
        ],
      )
    ],
  );
}