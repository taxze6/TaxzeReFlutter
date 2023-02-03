import 'package:flutter/material.dart';

class SliverPart3SliverOpacity extends StatefulWidget {
  const SliverPart3SliverOpacity({Key? key}) : super(key: key);

  @override
  State<SliverPart3SliverOpacity> createState() =>
      _SliverPart3SliverOpacityState();
}

class _SliverPart3SliverOpacityState extends State<SliverPart3SliverOpacity> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('SliverOpacity'),
            pinned: true,
          ),
          SliverOpacity(
            opacity: _isVisible ? 1.0 : 0.0,
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 50,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        "Taxze & SliverOpacity",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 24),
            sliver: SliverToBoxAdapter(
              child: FloatingActionButton(
                child: const Icon(Icons.flip),
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
