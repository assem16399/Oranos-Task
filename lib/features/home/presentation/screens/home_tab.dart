import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oranos/features/home/logic/home_cubit.dart';

import '../widgets/draggable_bottom_sheet.dart';
import '../widgets/home_list_title.dart';
import '../widgets/online_experts_list.dart';
import '../widgets/recommended_expert_list_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeCubit>(context).getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final homeData = BlocProvider.of<HomeCubit>(context).homeModel;
        if (state is HomeDataLoadingState) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
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
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 15),
                          itemCount: homeData.recommendedExperts.length,
                          itemBuilder: (context, index) =>
                              RecommendedExpertListItem(
                            expert: homeData.recommendedExperts[index],
                          ),
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
                    SizedBox(
                      height: 97,
                      child: OnlineExpertsList(
                        onlineExperts: homeData.onlineExperts,
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (state is HomeDataLoadedSuccessfullyState)
              DraggableBottomSheet(
                categories: homeData.categories,
              ),
          ],
        );
      },
    );
  }
}
