import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/src/ui/widgets/vertical_list.dart';

import '../widgets/app_drawer.dart';
import '../widgets/title_text.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key, required this.title, required this.movies});
  final String title;
  final movies;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: TitleText(label: title),
        // leading: DrawerButton(
        //   onPressed: () {
        //     Drawer(
        //       child: Text('Hi'),
        //     );
        //   },
        // ),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsetsDirectional.only(start: 16.w, top: 24.h),
              child: VerticalListView(movies: movies))),
    );
  }
}
