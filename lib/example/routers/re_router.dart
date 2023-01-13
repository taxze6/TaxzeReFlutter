import 'package:flutter/material.dart';
import 'package:taxze_re_flutter/example/course/re_course_page.dart';
import 'package:taxze_re_flutter/example/utils/router_utils.dart';

class ReRouters {
  static const String course = 'course';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ReRouters.course:
        return Left2RightRouter(child: ReCoursePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
