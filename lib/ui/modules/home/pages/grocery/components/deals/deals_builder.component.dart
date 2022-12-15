import 'package:demo_83/ui/modules/home/pages/grocery/components/deals/deal.component.dart';
import 'package:demo_83/util/dummy_data.dart';
import 'package:flutter/material.dart';

class DealsBuilderComponent extends StatefulWidget {
  const DealsBuilderComponent({super.key});

  @override
  State<DealsBuilderComponent> createState() => _DealsBuilderComponentState();
}

class _DealsBuilderComponentState extends State<DealsBuilderComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 94,
        child: ListView.builder(
          itemCount: DummyDataGenerator().deals.length,
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
              child: DealComponent(
                deal: DummyDataGenerator().deals[index],
                index: index,
              ),
            );
          },
        ),
      ),
    );
  }
}
