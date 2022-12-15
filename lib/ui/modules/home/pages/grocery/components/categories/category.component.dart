import 'package:demo_83/data/models/category.model.dart';
import 'package:demo_83/ui/common/app_card.component.dart';
import 'package:flutter/material.dart';

class CategoryComponent extends StatelessWidget {
  final Category category;
  final int index;
  const CategoryComponent({super.key, required this.category, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppCardComponent(
          colorIndex: index,
          height: 56,
          width: 56,
          radius: 8,
        ),
        const SizedBox(height: 6),
        Text(
          category.name,
          style: Theme.of(context).textTheme.bodyText1,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
