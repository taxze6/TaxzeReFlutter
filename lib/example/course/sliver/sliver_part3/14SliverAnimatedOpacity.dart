import 'package:flutter/material.dart';

class SliverPart3SliverAnimatedOpacity extends StatefulWidget {
  const SliverPart3SliverAnimatedOpacity({Key? key}) : super(key: key);

  @override
  State<SliverPart3SliverAnimatedOpacity> createState() =>
      _SliverPart3SliverAnimatedOpacityState();
}

class _SliverPart3SliverAnimatedOpacityState
    extends State<SliverPart3SliverAnimatedOpacity> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('SliverAnimatedOpacity'),
            pinned: true,
          ),
          SliverAnimatedOpacity(
            //动画执行完毕
            onEnd: () => print("动画完成"),
            curve: Curves.linear,
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(seconds: 2),
            sliver: SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Image.network(
                      "https://p3-passport.byteimg.com/img/user-avatar/af5f7ee5f0c449f25fc0b32c050bf100~180x180.awebp");
                }, childCount: 1),
                itemExtent: 200.0),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 18),
            sliver: SliverToBoxAdapter(
                child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
              },
              tooltip: 'Toggle opacity',
              child: const Icon(Icons.flip),
            )),
          ),
        ],
      ),
    );
  }
}
