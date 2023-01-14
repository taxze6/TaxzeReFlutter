import 'package:flutter/material.dart';
import 'package:taxze_re_flutter/example/res/locale/re_localizations.dart';

class ReCoursePage extends StatefulWidget {
  const ReCoursePage({Key? key}) : super(key: key);

  @override
  State<ReCoursePage> createState() => _ReCoursePageState();
}

class _ReCoursePageState extends State<ReCoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          onPressed: () {},
          child: Text("Sliver ${ReLocalizations.of(context).series}")),
    ));
  }
}
