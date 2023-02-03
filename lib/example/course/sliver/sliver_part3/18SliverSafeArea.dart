import 'package:flutter/material.dart';

class SliverPart3SliverSafeArea extends StatefulWidget {
  const SliverPart3SliverSafeArea({Key? key}) : super(key: key);

  @override
  State<SliverPart3SliverSafeArea> createState() =>
      _SliverPart3SliverSafeAreaState();
}

class _SliverPart3SliverSafeAreaState extends State<SliverPart3SliverSafeArea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(sliver: SliverList(
            delegate: SliverChildBuilderDelegate((ctx, index) {
              return Container(
                color: Colors.primaries[index % Colors.primaries.length],
                height: 100,
              );
            },childCount: 20),
          ))
        ],
      ),
    );
  }
}
