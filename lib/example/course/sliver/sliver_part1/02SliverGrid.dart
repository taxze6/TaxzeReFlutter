import 'package:flutter/material.dart';

class SliverPart1SliverGrid extends StatefulWidget {
  const SliverPart1SliverGrid({Key? key}) : super(key: key);

  @override
  State<SliverPart1SliverGrid> createState() => _SliverPart1SliverGridState();
}

class _SliverPart1SliverGridState extends State<SliverPart1SliverGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Hello SliverGrid & Taxze"),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((ctx, index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "$index",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }, childCount: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0)),
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
