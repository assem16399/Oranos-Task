import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oranos/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:oranos/features/home/logic/home_cubit.dart';

import '/core/styles/colors.dart';
import '../../data/models/recommended_expert.dart';

class RecommendedExpertListItem extends StatelessWidget {
  const RecommendedExpertListItem({Key? key, required this.expert})
      : super(key: key);

  final RecommendedExpert expert;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(width: 0.5, color: kBorderColor)),
      child: Column(
        children: [
          RecommendedExpertImage(
            imageUrl: expert.imageUrl,
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: Color(0xffFFC817),
                          size: 20,
                        ),
                        Text(
                          ' (${expert.rating})',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: kSideInfoColor,

                                // TODO set font family to SFProText
                              ),
                        ),
                        const Spacer(),
                        FavoriteIcon(id: expert.id)
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  SizedBox(
                    height: 19,
                    child: Text(
                      expert.name,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  const SizedBox(height: 7),
                  SizedBox(
                    height: 17,
                    child: Text(
                      expert.specialization,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;
  @override
  Widget build(BuildContext context) {
    final expert = BlocProvider.of<HomeCubit>(context).findExpertById(id);
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      buildWhen: (_, nextState) =>
          nextState is FavoritesStatusChangedState && nextState.itemId == id,
      builder: (context, state) {
        final favCubit = BlocProvider.of<FavoritesCubit>(context);
        return InkWell(
          onTap: () {
            favCubit.toggleExpertFavoriteStatus(expert);
          },
          radius: 40,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Icon(
            Icons.favorite,
            color: favCubit.isInFavorites(id) ? Colors.green : kSideInfoColor,
            size: 20,
          ),
        );
      },
    );
  }
}

class RecommendedExpertImage extends StatelessWidget {
  const RecommendedExpertImage({Key? key, required this.imageUrl})
      : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 151,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
