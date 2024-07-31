import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/src/blocs/bloc_provider.dart';
import 'package:movies_app/src/blocs/movies_bloc.dart';
import 'package:movies_app/src/ui/widgets/app_drawer.dart';
import '../widgets/home_list_header.dart';
import '../widgets/horizontal_list.dart';
import '../widgets/title_text.dart';
import '../widgets/vertical_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final MoviesBloc moviesBloc = BlocProvider.of<MoviesBloc>(context)!;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const TitleText(label: 'QMovies'),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              StreamBuilder(
                stream: moviesBloc.outNowPlaying,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      ListHeader(label: 'Now Showing', movies: snapshot.data),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 283.h,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: HorizontalListView(
                            movies: snapshot.data,
                            maxLength: 5,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 24.h),
              StreamBuilder(
                stream: moviesBloc.outPopular,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      ListHeader(label: 'Popular', movies: snapshot.data),
                      SizedBox(height: 16.h),
                      VerticalListView(
                        movies: snapshot.data,
                        maxLength: 3,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 24.h),
              StreamBuilder(
                stream: moviesBloc.outTopRated,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      ListHeader(label: 'Top Rated', movies: snapshot.data),
                      SizedBox(height: 16.h),
                      VerticalListView(
                        movies: snapshot.data,
                        maxLength: 3,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
