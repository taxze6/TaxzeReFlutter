import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SliverPart3SliverLayoutBuilder extends StatefulWidget {
  const SliverPart3SliverLayoutBuilder({Key? key}) : super(key: key);

  @override
  State<SliverPart3SliverLayoutBuilder> createState() =>
      _SliverPart3SliverLayoutBuilderState();
}

class _SliverPart3SliverLayoutBuilderState
    extends State<SliverPart3SliverLayoutBuilder> {
  var _color = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('SliverLayoutBuilder'),
            pinned: true,
          ),
          SliverLayoutBuilder(
              builder: (BuildContext context, SliverConstraints constraints) {
            if (constraints.userScrollDirection == ScrollDirection.forward) {
              _color = Colors.blue; //向下滑动显示蓝色
            } else if (constraints.userScrollDirection ==
                ScrollDirection.idle) {
              _color = Colors.yellow; //正常显示黄色
            } else {
              _color = Colors.purple; //向上滑动显示紫色
            }
            return SliverToBoxAdapter(
              child: Container(
                height: 200,
                color: _color,
              ),
            );
          }),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 20, (ctx, index) {
            return Container(
              color: Colors.primaries[index % Colors.primaries.length],
              height: 50,
            );
          }))
        ],
      ),
    );
  }
}
