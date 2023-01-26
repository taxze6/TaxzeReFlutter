import 'package:flutter/material.dart';

class SliverPart2SliverFixedExtentList extends StatefulWidget {
  const SliverPart2SliverFixedExtentList({Key? key}) : super(key: key);

  @override
  State<SliverPart2SliverFixedExtentList> createState() =>
      _SliverPart2SliverFixedExtentListState();
}

class _SliverPart2SliverFixedExtentListState
    extends State<SliverPart2SliverFixedExtentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Hello SliverFixedExtentList & Taxze"),
          ),
          SliverFixedExtentList(
            //固定尺寸
            itemExtent: 100,
            delegate: SliverChildBuilderDelegate((ctx, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.primaries[index % Colors.primaries.length],
                child: Text(
                  "$index",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
