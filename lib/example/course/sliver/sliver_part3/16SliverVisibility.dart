import 'package:flutter/material.dart';

class SliverPart3SliverVisibility extends StatefulWidget {
  const SliverPart3SliverVisibility({Key? key}) : super(key: key);

  @override
  State<SliverPart3SliverVisibility> createState() =>
      _SliverPart3SliverVisibilityState();
}

class _SliverPart3SliverVisibilityState
    extends State<SliverPart3SliverVisibility> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('SliverPart3SliverVisibility'),
            pinned: true,
          ),
          SliverVisibility(
              visible: _visible,
              replacementSliver: SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.brown,
                  child: Center(
                    child: Text(
                      "Image is hidden. Tap below button to show",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              sliver: SliverToBoxAdapter(
                child: Image.network(
                  "https://p3-passport.byteimg.com/img/user-avatar/af5f7ee5f0c449f25fc0b32c050bf100~180x180.awebp",
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              )),
          SliverPadding(
            padding: EdgeInsets.only(top: 18),
            sliver: SliverToBoxAdapter(
                child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
              },
              tooltip: 'Toggle visibility',
              child: Icon(!_visible ? Icons.visibility : Icons.visibility_off),
            )),
          ),
        ],
      ),
    );
  }
}
