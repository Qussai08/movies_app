import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/src/blocs/bloc_provider.dart';
import 'package:movies_app/src/blocs/movies_bloc.dart';
import 'package:movies_app/src/ui/widgets/horizonatl_list_card.dart';
import 'package:movies_app/src/ui/widgets/movie_rating_widget.dart';
import 'package:movies_app/src/ui/widgets/movie_title_text.dart';
import '../../core/constants.dart';
import '../widgets/horizontal_list.dart';
import '../widgets/title_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final MoviesBloc moviesBloc = BlocProvider.of<MoviesBloc>(context)!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TitleText(label: 'QMovies'),
        leading: DrawerButton(),
        actions: [
          Badge.count(
            count: 5,
            child: const Icon(Icons.notifications),
          ),
          SizedBox(
            width: 12.w,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            const TitleText(label: 'Now Showing'),
            SizedBox(height: 16.h),
            StreamBuilder(
              stream: moviesBloc.outNowPlaying,
              builder: (context, snapshot) {
                return SizedBox(
                  height: 283.h,
                  child: HorizontalListView(
                    movies: snapshot.data,
                  ),
                );
              },
            ),
            SizedBox(height: 24.h),
            const TitleText(label: 'Popular'),
            SizedBox(height: 16.h),
            StreamBuilder(
              stream: moviesBloc.outPopular,
              builder: (context, snapshot) {
                return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.results.length,
                        itemBuilder: (context, index) {
                          var movie = snapshot.data!.results[index];
                          var image =
                              "${Constants.imageBaseUrl}${movie.poster_path}";

                          return Padding(
                            padding: EdgeInsetsDirectional.only(bottom: 16.h),
                            child: Row(
                              children: [
                                Container(
                                  width: 85.w,
                                  height: 128.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.sp),
                                      image: DecorationImage(
                                          image: NetworkImage(image))),
                                ),
                                SizedBox(width: 16.w),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MovieTitleText(label: movie.title),
                                    SizedBox(height: 8.h),
                                    MovieRating(rating: movie.vote_average.toStringAsFixed(1)),
                                    SizedBox(height: 8.h),
                                  ],
                                )
                              ],
                            ),
                          );
                        }));
              },
            )
          ],
        ),
      ),
    );
  }
}
