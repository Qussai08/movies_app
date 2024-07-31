import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/src/ui/screens/movies_list_view.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
    required this.title,
    required this.movies,
  });
  final String title;
  final movies;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                MoviesListView(title: title, movies: movies)));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.sp),
            border: Border.all(color: const Color(0xFFAAA9B1))),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        margin: EdgeInsetsDirectional.only(end: 24.w),
        child: Text(
          'See more',
          style: TextStyle(color: const Color(0xFFAAA9B1), fontSize: 10.sp),
        ),
      ),
    );
  }
}
