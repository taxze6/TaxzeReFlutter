import 'package:flutter/material.dart';

class SliverPart2SliverPersistentHeader extends StatefulWidget {
  const SliverPart2SliverPersistentHeader({Key? key}) : super(key: key);

  @override
  State<SliverPart2SliverPersistentHeader> createState() =>
      _SliverPart2SliverPersistentHeaderState();
}

class _SliverPart2SliverPersistentHeaderState
    extends State<SliverPart2SliverPersistentHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Hello SliverPersistentHeader & Taxze"),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: TaxzePersistentHeaderDelegate(
              maxSize: 100,
              minSize: 60,
              child: buildItemHeader(1),
            ),
          ),
          buildSliverList(),
          SliverPersistentHeader(
            pinned: true,
            delegate: TaxzePersistentHeaderDelegate(
              maxSize: 100,
              minSize: 60,
              child: buildItemHeader(2),
            ),
          ),
          buildSliverList(),
          SliverPersistentHeader(
            pinned: true,
            delegate: TaxzePersistentHeaderDelegate(
              maxSize: 100,
              minSize: 60,
              child: buildItemHeader(3),
            ),
          ),
          buildSliverList(),
          SliverPersistentHeader(
            pinned: true,
            delegate: TaxzePersistentHeaderDelegate(
              maxSize: 100,
              minSize: 60,
              child: buildItemHeader(4),
            ),
          ),
          buildSliverList(100),

          //SliverAppBar原理
          // SliverToBoxAdapter(),
          // //防止SliverPersistentHeader成为最顶层的Sliver，以至于无法上拉刷新
          // SliverPersistentHeader(
          //   delegate:XXXDelegate(),
          //   //固定在顶部
          //   pinned: true,
          // )

        ],
      ),
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

  Widget buildSliverList([int count = 3]) {
    return SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return ListTile(title: Text('$index'));
        },
        childCount: count,
      ),
    );
  }
}

typedef SliverHeaderBuilder = Widget Function(
    BuildContext context, double shrinkOffset, bool overlapsContent);

class TaxzePersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  TaxzePersistentHeaderDelegate({
    this.minSize = 0,
    required this.maxSize,
    required Widget child,
  })
      : builder = ((context, shrinkOffset, overlapsContent) => child),
        assert(minSize <= maxSize && minSize >= 0);

  final double minSize;
  final double maxSize;
  final SliverHeaderBuilder builder;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    Widget child = builder(context, shrinkOffset, overlapsContent);
    //高度充满父约束，高度在[minHeight,maxHeight]之间变化
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  bool shouldRebuild(TaxzePersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;

  @override
  double get maxExtent => maxSize;

  @override
  double get minExtent => minSize;
}
