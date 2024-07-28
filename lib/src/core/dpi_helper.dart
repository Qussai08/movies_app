import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

handleFixSize(context) {
  ScreenUtil.init(
    context,
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
  );
}

double fixDpiFont(double size) {
  return ScreenUtil().setSp(size);
}

double fixDpiWidth(double size) {
  return ScreenUtil().setWidth(size);
}

double fixDpiHeight(double size) {
  return ScreenUtil().setHeight(size);
}

double fixDpiScreenWidth() {
  return ScreenUtil().screenWidth;
}

double fixDpiScreenHeight() {
  return ScreenUtil().screenHeight;
}

double pxToDp(BuildContext context, double pixel) {
  final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
  return pixel / devicePixelRatio;
}
