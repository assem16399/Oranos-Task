import 'package:flutter/material.dart';
import 'package:oranos/features/home/data/models/online_expert.dart';

class OnlineExpertsList extends StatelessWidget {
  const OnlineExpertsList({Key? key, required this.onlineExperts})
      : super(key: key);

  final List<OnlineExpert> onlineExperts;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => OnlineExpertListItem(
              imageUrl: onlineExperts[index].imageUrl,
              name: onlineExperts[index].name,
            ),
        separatorBuilder: (_, __) => const SizedBox(
              width: 15,
            ),
        itemCount: onlineExperts.length);
  }
}

class OnlineExpertListItem extends StatelessWidget {
  const OnlineExpertListItem({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  final String name;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 65,
          width: 65,
          child: Stack(
            alignment: Alignment.topRight,
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  child: Image.network(
                    imageUrl,
                  ),
                ),
              ),
              Container(
                height: 12,
                width: 12,
                decoration: const ShapeDecoration(
                    color: Colors.green, shape: CircleBorder()),
              )
            ],
          ),
        ),
        const SizedBox(height: 7),
        Expanded(
          child: Text(
            name,
            style: Theme.of(context).textTheme.overline,
          ),
        )
      ],
    );
  }
}
