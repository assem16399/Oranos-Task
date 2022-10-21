import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/favorites/logic/cubit/favorites_cubit.dart';
import '/features/home/presentation/widgets/recommended_expert_list_item.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          final favoriteExperts = BlocProvider.of<FavoritesCubit>(context)
              .favorites
              .values
              .toList();
          if (favoriteExperts.isEmpty) {
            return Center(
              child: Text(
                'Start adding some experts to your favorites.',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            );
          }
          return GridView.builder(
              itemCount: favoriteExperts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 242),
              itemBuilder: (context, index) =>
                  RecommendedExpertListItem(expert: favoriteExperts[index]));
        },
      ),
    ));
  }
}
