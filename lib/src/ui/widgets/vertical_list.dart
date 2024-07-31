import 'package:flutter/material.dart';
import '../../models/movies_model.dart';
import 'vertical_list_card.dart';

class VerticalListView extends StatelessWidget {
  const VerticalListView({
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
        : Column(
            children:
                List.generate(maxLength ?? movies!.results.length, (index) {
            var movie = movies!.results[index];
            return VerticalListCard(movie: movie);
          }));
  }
}
