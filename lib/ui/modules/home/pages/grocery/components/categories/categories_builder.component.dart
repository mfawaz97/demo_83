import 'package:demo_83/ui/modules/home/pages/grocery/components/categories/category.component.dart';
import 'package:demo_83/util/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesBuilderComponent extends StatefulWidget {
  const CategoriesBuilderComponent({super.key});

  @override
  State<CategoriesBuilderComponent> createState() => _CategoriesBuilderComponentState();
}

class _CategoriesBuilderComponentState extends State<CategoriesBuilderComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: DummyDataGenerator().categories.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(
                start: index == 0 ? 12 : 0,
                end: 12,
              ),
              child: CategoryComponent(
                category: DummyDataGenerator().categories[index],
                index: index,
              ),
            );
          },
        ),
      ),
    );
  }
}
