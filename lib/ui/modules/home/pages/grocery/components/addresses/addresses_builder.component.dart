import 'package:demo_83/ui/modules/home/pages/grocery/components/addresses/address.component.dart';
import 'package:demo_83/util/dummy_data.dart';
import 'package:flutter/material.dart';

class AddressesBuilderComponent extends StatefulWidget {
  const AddressesBuilderComponent({super.key});

  @override
  State<AddressesBuilderComponent> createState() => _AddressesBuilderComponentState();
}

class _AddressesBuilderComponentState extends State<AddressesBuilderComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 56,
        child: ListView.builder(
          itemCount: DummyDataGenerator().addresses.length,
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
              child: AddressComponent(
                address: DummyDataGenerator().addresses[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
