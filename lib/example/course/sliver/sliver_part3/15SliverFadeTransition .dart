import 'package:flutter/material.dart';

class SliverPart3SliverFadeTransition extends StatefulWidget {
  const SliverPart3SliverFadeTransition({Key? key}) : super(key: key);

  @override
  State<SliverPart3SliverFadeTransition> createState() =>
      _SliverPart3SliverFadeTransitionState();
}

class _SliverPart3SliverFadeTransitionState
    extends State<SliverPart3SliverFadeTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );
  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    animation.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          title: Text('SliverPart3SliverFadeTransition'),
          pinned: true,
        ),
        SliverFadeTransition(
            opacity: animation,
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Image.network(
                  "https://p3-passport.byteimg.com/img/user-avatar/af5f7ee5f0c449f25fc0b32c050bf100~180x180.awebp",
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ))
      ]),
    );
  }
}
