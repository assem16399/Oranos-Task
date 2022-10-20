import 'package:flutter/material.dart';

import '../widgets/draggable_bottom_sheet.dart';
import '../widgets/home_list_title.dart';
import '../widgets/online_experts_list.dart';
import '../widgets/recommended_expert_list_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                HomeListTitle(
                  title: 'Recommended Experts',
                  onMorePressed: () {},
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: SizedBox(
                    height: 242,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => const SizedBox(width: 15),
                      itemCount: 10,
                      itemBuilder: (context, index) =>
                          const RecommendedExpertListItem(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                HomeListTitle(
                  title: 'Online Experts',
                  onMorePressed: () {},
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 97,
                  child: OnlineExpertsList(),
                )
              ],
            ),
          ),
        ),
        const DraggableBottomSheet(),
      ],
    );
  }
}
