import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oranos/core/styles/colors.dart';

import 'scroll_handler.dart';

class DraggableBottomSheetContents extends StatelessWidget {
  const DraggableBottomSheetContents({Key? key, this.scrollController})
      : super(key: key);

  final ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: 10,
      ),
      controller: scrollController,
      itemCount: 25,
      itemBuilder: (BuildContext context, int index) {
        return index == 0
            ? const ScrollHandler()
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(width: 0.5, color: kBorderColor)),
                child: ListTile(
                  leading: SvgPicture.asset('assets/icons/it_icon.svg'),
                  title: Text(
                    'Information Technology',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  subtitle: Text(
                    '23 Experts',
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
