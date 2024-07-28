import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/src/blocs/bloc_provider.dart';
import 'package:movies_app/src/blocs/movies_bloc.dart';
import 'package:movies_app/src/core/dpi_helper.dart';
import 'package:movies_app/src/ui/screens/home_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, widget) {
      handleFixSize(context);
      return MaterialApp(
        home: Scaffold(
          body: BlocProvider(bloc: MoviesBloc(), child: HomeView()),
        ),
      );
    });
  }
}
