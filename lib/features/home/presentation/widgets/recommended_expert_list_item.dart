import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';

class RecommendedExpertListItem extends StatelessWidget {
  const RecommendedExpertListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(width: 0.5, color: kBorderColor)),
      child: Column(
        children: [
          const RecommendedExpertImage(),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rate_rounded,
                        color: Color(0xffFFC817),
                        size: 20,
                      ),
                      Text(
                        ' (5.0)',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: kSideInfoColor,
                              // TODO set font family to SFProText
                            ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        radius: 40,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: const Icon(
                          Icons.favorite,
                          color: kSideInfoColor,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 7),
                  SizedBox(
                    height: 19,
                    child: Text(
                      'Aasem Hany',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  const SizedBox(height: 7),
                  SizedBox(
                    height: 17,
                    child: Text(
                      'Supply Chain',
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

class RecommendedExpertImage extends StatelessWidget {
  const RecommendedExpertImage({
    Key? key,
  }) : super(key: key);

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
          'https://react.semantic-ui.com/images/avatar/large/elliot.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
