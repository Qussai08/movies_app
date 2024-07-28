import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants.dart';
import 'movie_rating_widget.dart';
import 'movie_title_text.dart';

class HorizontalListCard extends StatelessWidget {
  const HorizontalListCard({
    super.key,
    // required this.image,
    required this.movie,
  });

  // final String image;
  final movie;

  @override
  Widget build(BuildContext context) {
    var image = "${Constants.imageBaseUrl}${movie.poster_path}";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 212.h,
          width: 143.w,
          margin: EdgeInsetsDirectional.only(end: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.sp),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                image,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          width: 143.w,
          child: MovieTitleText(label: movie.title),
        ),
        MovieRating(
          rating: movie.vote_average.toStringAsFixed(1),
        )
      ],
    );
  }
}
