import 'package:flutter/material.dart';
import 'package:movies_app/src/blocs/bloc_provider.dart';
import 'package:movies_app/src/blocs/movies_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final MoviesBloc moviesBloc = BlocProvider.of<MoviesBloc>(context)!;
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder(
            stream: moviesBloc.outPopular,
            builder: (context, snapshot) {
              return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data == null
                        ? 0
                        : snapshot.data!.results.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Text(snapshot.data!.results[index].title),
                      );
                    }),
              );
            },
          ),
          StreamBuilder(
            stream: moviesBloc.outTopRated,
            builder: (context, snapshot) {
              return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data == null
                        ? 0
                        : snapshot.data!.results.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Text(snapshot.data!.results[index].title),
                      );
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}
