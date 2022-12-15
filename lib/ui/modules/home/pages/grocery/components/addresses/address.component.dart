import 'package:demo_83/data/models/address.model.dart';
import 'package:demo_83/ui/common/app_card.component.dart';
import 'package:flutter/material.dart';

class AddressComponent extends StatelessWidget {
  final Address address;
  const AddressComponent({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return AppCardComponent(
      width: 168,
      height: 50,
      hasBorder: true,
      radius: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            AppCardComponent(
              colorIndex: 0,
              height: 38,
              width: 38,
              radius: 8,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    style: Theme.of(context).textTheme.headline2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    "${address.street} ${address.buildingNo}, Floor ${address.floor}, Unit ${address.unitNo}",
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
