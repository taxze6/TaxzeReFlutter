import 'package:flutter/material.dart';
import 'package:taxze_re_flutter/example/course/sliver/sliver_part1/02SliverGrid.dart';
import 'package:taxze_re_flutter/example/course/sliver/sliver_part1/03SliverAppBar.dart';
import 'package:taxze_re_flutter/example/course/sliver/sliver_part2/04SliverToBoxAdapter.dart';
import 'package:taxze_re_flutter/example/course/sliver/sliver_part2/05SliverPersistentHeader.dart';
import 'package:taxze_re_flutter/example/course/sliver/sliver_part2/06SliverFixedExtentList.dart';
import 'package:taxze_re_flutter/example/course/sliver/sliver_part2/08SliverPrototypeExtentList.dart';
import 'package:taxze_re_flutter/example/utils/router_utils.dart';

import 'sliver_part1/01SliverList.dart';

class SliverMain extends StatefulWidget {
  const SliverMain({Key? key}) : super(key: key);

  @override
  State<SliverMain> createState() => _SliverMainState();
}

class _SliverMainState extends State<SliverMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Hello Sliver & Taxze"),
          ),
          SliverGrid(
              delegate: SliverChildListDelegate([
                toChildButton(
                    childName: "SliverList",
                    goRouter: () => Navigator.of(context).push(
                        Right2LeftRouter(child: SliverPart1SliverList()))),
                toChildButton(
                    childName: "SliverGrid",
                    goRouter: () => Navigator.of(context).push(
                        Right2LeftRouter(child: SliverPart1SliverGrid()))),
                toChildButton(
                    childName: "SliverAppBar",
                    goRouter: () => Navigator.of(context).push(
                        Right2LeftRouter(child: SliverPart1SliverAppBar()))),
                toChildButton(
                    childName: "SliverToBoxAdapter",
                    goRouter: () => Navigator.of(context).push(Right2LeftRouter(
                        child: SliverPart2SliverToBoxAdapter()))),
                toChildButton(
                    childName: "SliverPersistentHeader",
                    goRouter: () => Navigator.of(context).push(Right2LeftRouter(
                        child: SliverPart2SliverPersistentHeader()))),
                toChildButton(
                    childName: "SliverPersistentHeader",
                    goRouter: () => Navigator.of(context).push(
                          Right2LeftRouter(
                              child: SliverPart2SliverFixedExtentList()),
                        )),
                toChildButton(
                    childName: "SliverPersistentHeader",
                    goRouter: () => Navigator.of(context).push(
                          Right2LeftRouter(
                              child: SliverPart2SliverFillViewport()),
                        )),
              ]),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4))
        ],
      ),
    );
  }

  Widget toChildButton(
      {required String childName, required VoidCallback goRouter}) {
    return ElevatedButton(
        onPressed: goRouter,
        child: Text(
          childName,
          style: TextStyle(fontSize: 18),
        ));
  }
}