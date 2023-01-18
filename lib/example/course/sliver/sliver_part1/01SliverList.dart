import 'package:flutter/material.dart';

class SliverPart1SliverList extends StatefulWidget {
  const SliverPart1SliverList({Key? key}) : super(key: key);

  @override
  State<SliverPart1SliverList> createState() => _SliverPart1SliverListState();
}

class _SliverPart1SliverListState extends State<SliverPart1SliverList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Hello SliverList & Taxze"),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((ctx, index) {
              return Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.primaries[index % Colors.primaries.length],
                ),
                child: Text(
                  "$index",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }, childCount: 8),
          )
        ],
      ),
    );
  }
}
