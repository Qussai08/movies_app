import 'package:flutter/material.dart';

import '../../models/movies_model.dart';
import 'horizonatl_list_card.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    super.key,
    required this.movies,
    this.maxLength,
  });
  final MoviesModel? movies;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return movies == null
        ? const Center(child: CircularProgressIndicator())
        : Row(
            children:
                List.generate(maxLength ?? movies!.results.length, (index) {
            var movie = movies!.results[index];
            return HorizontalListCard(movie: movie);
          }));
  }
}
