import 'package:flutter/material.dart';

class ScrollHandler extends StatelessWidget {
  const ScrollHandler({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return FractionallySizedBox(
      widthFactor: 0.1,
      child: Column(
        children: [
          SizedBox(
              height: isLandScape
                  ? deviceHeight * (0.0285 / 4.1) * 2
                  : deviceHeight * (0.0285 / 4.1)),
          Container(
            height: isLandScape
                ? deviceHeight * (0.0285 / 4.1) * 2
                : deviceHeight * (0.0285 / 4.1),
            decoration: const BoxDecoration(
              color: Color(0xffD8D8D8),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
