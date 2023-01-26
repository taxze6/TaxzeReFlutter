import 'package:flutter/material.dart';

class SliverPart2SliverFillViewport extends StatefulWidget {
  const SliverPart2SliverFillViewport({Key? key}) : super(key: key);

  @override
  State<SliverPart2SliverFillViewport> createState() =>
      _SliverPart2SliverFillViewport();
}

class _SliverPart2SliverFillViewport
    extends State<SliverPart2SliverFillViewport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Hello SliverPrototypeExtentList & Taxze"),
          ),
          SliverFillViewport(
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.green,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
