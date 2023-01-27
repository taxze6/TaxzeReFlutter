import 'package:flutter/material.dart';
import 'package:taxze_re_flutter/example/course/sliver/sliver_part2/05SliverPersistentHeader.dart';

class SliverPart2SliverPadding extends StatefulWidget {
  const SliverPart2SliverPadding({Key? key}) : super(key: key);

  @override
  State<SliverPart2SliverPadding> createState() => _SliverPart2SliverPadding();
}

class _SliverPart2SliverPadding extends State<SliverPart2SliverPadding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('SliverAppBar'),
            pinned: true,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverPersistentHeader(
              delegate: TaxzePersistentHeaderDelegate(
                maxSize: 100,
                minSize: 60,
                child: buildItemHeader(4),
              ),
              pinned: true,
              floating: false,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((content, index) {
                return Container(
                  height: 65,
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              }, childCount: 50),
            ),
          )
        ],
      )

    );
  }

  Widget buildItemHeader(int i) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.primaries[i % Colors.primaries.length], width: 10)),
      child: Row(
        children: [
          Image.network(
              "https://p3-passport.byteimg.com/img/user-avatar/af5f7ee5f0c449f25fc0b32c050bf100~180x180.awebp"),
          Text("Taxze $i"),
        ],
      ),
    );
  }
}
