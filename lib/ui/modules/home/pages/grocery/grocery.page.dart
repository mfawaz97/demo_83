import 'package:demo_83/ui/common/input_field.dart';
import 'package:demo_83/ui/modules/home/pages/grocery/components/categories/categories_builder.component.dart';
import 'package:demo_83/ui/modules/home/pages/grocery/components/offer.component.dart';
import 'package:demo_83/ui/style/theme.dart';
import 'package:demo_83/util/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/textfield_placeholder.component.dart';
import 'components/addresses/addresses_builder.component.dart';
import 'components/deals/deals_builder.component.dart';

class GroceryPage extends StatefulWidget {
  const GroceryPage({super.key});

  @override
  State<GroceryPage> createState() => _GroceryPageState();
}

class _GroceryPageState extends State<GroceryPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            child: TextFieldPlaceHolder(
              radius: 8,
              removeBorder: false,
              color: ownTheme(context).containerColorAlt2,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsetsDirectional.only(start: 16, end: 4),
                    child: SvgPicture.asset(
                      "assets/images/search_bar_icon.svg",
                      height: 18,
                      width: 18,
                      color: ownTheme(context).textColorAlt2,
                    ),
                  ),
                  Expanded(
                    child: CustomInputTextField(
                      onChange: (value) {},
                      removeFillColor: true,
                      hintText: AppLocalizations.of(context).translate("product_search_hint"),
                      validator: (_) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          const AddressesBuilderComponent(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).translate("explore_cat"),
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  AppLocalizations.of(context).translate("see_all_rep", replacement: 36),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontWeight: FontWeight.w500, fontSize: 10, color: ownTheme(context).textColorAlt),
                ),
              ],
            ),
          ),
          const CategoriesBuilderComponent(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Text(
              AppLocalizations.of(context).translate("day_deal"),
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          const DealsBuilderComponent(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            child: OfferComponent(),
          ),
        ],
      ),
    );
  }
}
