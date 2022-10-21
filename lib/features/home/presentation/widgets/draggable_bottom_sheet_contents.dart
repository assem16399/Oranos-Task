import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oranos/core/styles/colors.dart';

import '../../data/models/category.dart';
import 'scroll_handler.dart';

class DraggableBottomSheetContents extends StatelessWidget {
  const DraggableBottomSheetContents(
      {Key? key, this.scrollController, required this.categories})
      : super(key: key);

  final ScrollController? scrollController;
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: 10,
      ),
      controller: scrollController,
      itemCount: categories.length + 1,
      itemBuilder: (BuildContext context, int index) {
        return index == 0
            ? const ScrollHandler()
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(width: 0.5, color: kBorderColor)),
                child: ListTile(
                  leading: SvgPicture.network(categories[index - 1].imageUrl),
                  title: Text(
                    categories[index - 1].title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  subtitle: Text(
                    '${categories[index - 1].expertsCount} Experts',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  trailing: const Icon(
                    Icons.navigate_next_rounded,
                    size: 30,
                  ),
                ),
              );
      },
    );
  }
}
