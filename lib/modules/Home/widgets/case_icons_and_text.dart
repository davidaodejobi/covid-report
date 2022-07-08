import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class CasesIconAndText extends StatelessWidget {
  const CasesIconAndText({
    required this.subText,
    required this.caseNo,
    required this.icon,
    this.iconHeight = 37,
    this.iconWidth = 37,
    Key? key,
  }) : super(key: key);

  final String icon;
  final int caseNo;
  final String subText;
  final double iconHeight;
  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          WebsafeSvg.asset(
            'assets/svg/$icon.svg',
            height: iconHeight,
            width: iconWidth,
          ),
        ],
      ),
      const SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${caseNo}K',
            style: Theme.of(context).textTheme.headline1!.copyWith(),
          ),
          Text(
            subText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    ]);
  }
}
