import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class FooterIconAndText extends StatelessWidget {
  const FooterIconAndText({
    required this.icon,
    required this.topText,
    required this.bottomText,
    Key? key,
  }) : super(key: key);

  final String bottomText;
  final String topText;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WebsafeSvg.asset(
          'assets/svg/$icon.svg',
          height: 70,
          width: 70,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          topText,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          bottomText,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
