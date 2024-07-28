import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({
    super.key,
    required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 12.sp,
          color: Color(0xFFFFC319),
        ),
        Text(
          "$rating/10 IMDb",
          style: TextStyle(color: Color(0xFF9C9C9C), fontSize: 12.sp),
        ),
      ],
    );
  }
}
