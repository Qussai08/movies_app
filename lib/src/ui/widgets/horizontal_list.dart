import 'package:flutter/material.dart';

import '../../models/movies_model.dart';
import 'horizonatl_list_card.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    super.key,
    required this.movies,
  });
  final MoviesModel? movies;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies == null ? 0 : movies!.results.length,
        itemBuilder: (context, index) {
          var movie = movies!.results[index];
          return HorizontalListCard(movie: movie);
        });
  }
}
