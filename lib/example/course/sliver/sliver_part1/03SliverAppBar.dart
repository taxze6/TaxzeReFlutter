import 'package:flutter/material.dart';

class SliverPart1SliverAppBar extends StatefulWidget {
  const SliverPart1SliverAppBar({Key? key}) : super(key: key);

  @override
  State<SliverPart1SliverAppBar> createState() =>
      _SliverPart1SliverAppBarState();
}

class _SliverPart1SliverAppBarState extends State<SliverPart1SliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            // floating: true,
            // snap: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("First FlexibleSpace",style: TextStyle(color: Colors.black),),
              // collapseMode: CollapseMode.pin,
              background: Image.network(
                  "https://p3-passport.byteimg.com/img/user-avatar/af5f7ee5f0c449f25fc0b32c050bf100~180x180.awebp",
                  fit: BoxFit.cover),
              stretchModes: [
                StretchMode.fadeTitle,
                // StretchMode.blurBackground,
                // StretchMode.zoomBackground
              ],
            ),
            actions: <Widget>[
              IconButton(onPressed: () => null, icon: const Icon(Icons.add))
            ],
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((ctx, index) {
            return Container(
              alignment: Alignment.center,
              height: 50,
              color: Colors.primaries[index % Colors.primaries.length],
              child: Text(
                "$index",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }, childCount: 20))
        ],
      ),
    );
  }
}
