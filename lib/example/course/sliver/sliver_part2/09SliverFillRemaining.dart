import 'package:flutter/material.dart';

class SliverPart2SliverFillRemaining extends StatefulWidget {
  const SliverPart2SliverFillRemaining({Key? key}) : super(key: key);

  @override
  State<SliverPart2SliverFillRemaining> createState() =>
      _SliverPart2SliverFillRemainingState();
}

class _SliverPart2SliverFillRemainingState
    extends State<SliverPart2SliverFillRemaining> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildBuilderDelegate((ctx, index) {
            return Container(
              height: 50,
              margin: EdgeInsets.all(10),
              color: Colors.red,
            );
          },childCount: 5)),
          SliverFillRemaining(
            hasScrollBody: true,
            child: FlutterLogo(),
          )
        ],
      ),
    );
  }
}
