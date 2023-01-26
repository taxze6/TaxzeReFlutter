import 'package:flutter/material.dart';

class SliverPart2SliverPrototypeExtentList extends StatefulWidget {
  const SliverPart2SliverPrototypeExtentList({Key? key}) : super(key: key);

  @override
  State<SliverPart2SliverPrototypeExtentList> createState() =>
      _SliverPart2SliverPrototypeExtentListState();
}

class _SliverPart2SliverPrototypeExtentListState
    extends State<SliverPart2SliverPrototypeExtentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Hello SliverPrototypeExtentList & Taxze"),
          ),
          SliverPrototypeExtentList(
            prototypeItem: const Text(""),
            delegate: SliverChildBuilderDelegate((ctx, index) {
              return Text("$index");
            }),
          )
        ],
      ),
    );
  }
}
