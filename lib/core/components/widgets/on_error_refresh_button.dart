import 'package:flutter/material.dart';

class OnErrorRefreshButton extends StatelessWidget {
  const OnErrorRefreshButton(
      {Key? key, required this.onRefreshPressed, required this.failMsg})
      : super(key: key);

  final void Function() onRefreshPressed;
  final String failMsg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
              width: 100,
              child: Icon(
                Icons.error,
                size: 50,
              )),
          const SizedBox(
            height: 10,
          ),
          Text(
            failMsg,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 10),
          IconButton(
              onPressed: onRefreshPressed,
              icon: const Icon(Icons.refresh, size: 40))
        ],
      ),
    );
  }
}
