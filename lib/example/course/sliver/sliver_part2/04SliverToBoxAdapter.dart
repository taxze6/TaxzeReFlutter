import 'package:flutter/material.dart';

class SliverPart2SliverToBoxAdapter extends StatefulWidget {
  const SliverPart2SliverToBoxAdapter({Key? key}) : super(key: key);

  @override
  State<SliverPart2SliverToBoxAdapter> createState() =>
      _SliverPart2SliverToBoxAdapterState();
}

class _SliverPart2SliverToBoxAdapterState
    extends State<SliverPart2SliverToBoxAdapter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Hello SliverToBoxAdapterState & Taxze"),
          ),
          SliverToBoxAdapter(
            child: _helloText,
          ),
          // SliverToBoxAdapter(
          //   child: ListView(
          //     children: [],
          //   ),
          // )
        ],
      ),
    );
  }

  Widget get _helloText {
    return Column(
      children: [
        ...List.generate(
            10, (index) => Text("Taxze SliverToBoxAdapter $index")),
        ElevatedButton(
            onPressed: () => print("Say Hello!"), child: Text("Hello"))
      ],
    );
  }
}
