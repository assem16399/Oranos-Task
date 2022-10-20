import 'package:flutter/material.dart';

class OnlineExpertsList extends StatelessWidget {
  const OnlineExpertsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) => const OnlineExpertListItem(),
        separatorBuilder: (_, __) => const SizedBox(
              width: 15,
            ),
        itemCount: 10);
  }
}

class OnlineExpertListItem extends StatelessWidget {
  const OnlineExpertListItem({
    Key? key,
  }) : super(key: key);

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
                    'https://react.semantic-ui.com/images/avatar/large/elliot.jpg',
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
            'Ahmed',
            style: Theme.of(context).textTheme.overline,
          ),
        )
      ],
    );
  }
}
