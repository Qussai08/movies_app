import 'package:flutter/material.dart';
import 'package:movies_app/src/blocs/bloc_provider.dart';
import 'package:movies_app/src/blocs/movies_bloc.dart';
import 'package:movies_app/src/ui/home_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(bloc: MoviesBloc(), child: HomeView()),
      ),
    );
  }
}
