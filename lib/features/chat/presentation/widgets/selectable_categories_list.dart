import 'package:flutter/material.dart';

import '/core/styles/colors.dart';
import 'selectable_category.dart';

class SelectableCategoriesList extends StatelessWidget {
  const SelectableCategoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SelectableCategory(categoryName: 'Security'),
          const SelectableCategory(categoryName: 'Supply Chain'),
          const SelectableCategory(categoryName: 'Information Technology'),
          const SelectableCategory(categoryName: 'Human Resources'),
          const SelectableCategory(categoryName: 'Business Research'),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Say Done, Or Press Send to Apply',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: kBodyHintColor),
            ),
          )
        ],
      ),
    );
  }
}
