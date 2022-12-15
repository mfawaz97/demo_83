import 'package:demo_83/ui/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressHolderComponent extends StatelessWidget {
  final Function()? onTap;
  final String address;
  const AddressHolderComponent({super.key, required this.address, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              "assets/images/address_holder.svg",
              height: 34,
              width: 124,
              color: ownTheme(context).highlightedContainerColor,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 10,
            ),
            child: SizedBox(
              height: 34,
              width: 114,
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/location_mark.svg",
                    height: 16,
                    width: 12,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Text(
                      address,
                      style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      // overflow: ,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
