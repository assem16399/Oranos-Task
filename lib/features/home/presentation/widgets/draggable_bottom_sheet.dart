import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../data/models/category.dart';
import 'draggable_bottom_sheet_contents.dart';

class DraggableBottomSheet extends StatelessWidget {
  const DraggableBottomSheet({Key? key, required this.categories})
      : super(key: key);

  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return DraggableScrollableSheet(
      snap: true,
      initialChildSize: isLandScape ? 0.0285 * 2 : 0.0285,
      minChildSize: isLandScape ? 0.0285 * 2 : 0.0285,
      maxChildSize: 0.75,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              border: Border.all(color: const Color(0xffEAEBEC))),
          child: DraggableBottomSheetContents(
              scrollController: scrollController, categories: categories),
        );
      },
    );
  }
}
