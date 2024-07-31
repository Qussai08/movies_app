import 'package:flutter/material.dart';

import 'more_button.dart';
import 'title_text.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({
    super.key,
    required this.label,
    required this.movies,
  });
  final String label;
  final movies;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleText(label: label),
        MoreButton(
          title: label,
          movies: movies,
        )
      ],
    );
  }
}
