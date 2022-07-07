import 'dart:developer';

import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveBuilder({
    Key? key,
    @required this.mobile,
    @required this.tablet,
    @required this.desktop,
  }) : super(key: key);

  // This gives us some control over the size of the widget
  // when working on various sreens.
  // And it might be different when working with another design.
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          log('desktop: ${constraints.maxWidth}');
          return desktop ?? tablet ?? mobile!;
        } else if (constraints.maxWidth >= 650 && constraints.maxWidth < 1100) {
          log('tablet: ${constraints.maxWidth}');
          return tablet ?? mobile!;
        } else {
          log('mobile: ${constraints.maxWidth}');
          return mobile!;
        }
      },
    );
  }
}
