import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants.dart';
import 'movie_rating_widget.dart';
import 'movie_title_text.dart';

class VerticalListCard extends StatelessWidget {
  const VerticalListCard({
    super.key,
    required this.movie,
  });

  final movie;

  @override
  Widget build(BuildContext context) {
    var image = "${Constants.imageBaseUrl}${movie.poster_path}";

    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 16.h),
      child: Row(
        children: [
          Container(
            width: 85.w,
            height: 128.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.sp),
                image: DecorationImage(image: NetworkImage(image))),
          ),
          SizedBox(width: 16.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 200, child: MovieTitleText(label: movie.title)),
              SizedBox(height: 8.h),
              MovieRating(rating: movie.vote_average.toStringAsFixed(1)),
              SizedBox(height: 8.h),
            ],
          )
        ],
      ),
    );
  }
}
