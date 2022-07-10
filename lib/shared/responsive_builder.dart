import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget? tablet, mobile;
  final Widget desktop;

  const ResponsiveBuilder({
    Key? key,
    required this.desktop,
    this.mobile,
    this.tablet,
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
        if (constraints.maxWidth <= 650) {
          print('constraints.maxWidth: ${constraints.maxWidth}');
          return mobile ?? tablet ?? desktop;
        } else if (constraints.maxWidth > 650 && constraints.maxWidth < 1100) {
          print('constraints.maxWidth: ${constraints.maxWidth}');
          return tablet ?? desktop;
        } else if (constraints.maxWidth >= 1100) {
          print('constraints.maxWidth: ${constraints.maxWidth}');
          return desktop;
        }
        return desktop;
      },
    );
  }
}
