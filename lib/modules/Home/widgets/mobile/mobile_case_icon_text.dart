import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../../shared/responsive_builder.dart';

class MobileCaseIconText extends StatelessWidget {
  const MobileCaseIconText({
    required this.subText,
    required this.caseNo,
    required this.icon,
    this.iconHeight = 37,
    this.iconWidth = 37,
    Key? key,
  }) : super(key: key);

  final String icon;
  final String caseNo;
  final String subText;
  final double iconHeight;
  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Column(
          children: [
            WebsafeSvg.asset(
              'assets/svg/$icon.svg',
              height: iconHeight,
              width: iconWidth,
            ),
            // const Spacer(),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveBuilder(
              desktop: Text(
                caseNo,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontSize: 40,
                      height: 1.0,
                    ),
              ),
            ),
            Text(
              subText,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14,
                    height: 1.0,
                  ),
            ),
          ],
        ),
      ]),
    );
  }
}
