import 'package:flutter/material.dart';
import 'package:taxze_re_flutter/example/course/sliver/sliver_part1/02SliverGrid.dart';
import 'package:taxze_re_flutter/example/course/sliver/sliver_part1/03SliverAppBar.dart';
import 'package:taxze_re_flutter/example/utils/router_utils.dart';

import '01SliverList.dart';

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
          SliverGrid(
              delegate: SliverChildListDelegate([
                toChildButton(
                    childName: "SliverList",
                    goRouter: () => Navigator.of(context)
                        .push(Right2LeftRouter(child: SliverPart1SliverList()))),
                toChildButton(
                    childName: "SliverGrid",
                    goRouter: () => Navigator.of(context)
                        .push(Right2LeftRouter(child: SliverPart1SliverGrid()))),
                toChildButton(
                    childName: "SliverAppBar",
                    goRouter: () => Navigator.of(context)
                        .push(Right2LeftRouter(child: SliverPart1SliverAppBar())))
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
