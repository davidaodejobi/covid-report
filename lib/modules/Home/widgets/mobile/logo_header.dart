import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constant/appcolor.dart';

class LogoHeader extends StatefulWidget {
  const LogoHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<LogoHeader> createState() => _LogoHeaderState();
}

class _LogoHeaderState extends State<LogoHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _covidController;

  @override
  void initState() {
    super.initState();
    _covidController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8))
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        const SizedBox(
          height: 20,
        ),
        RotationTransition(
          turns: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: _covidController, curve: Curves.linear)),
          child: SvgPicture.asset(
            'assets/svg/coronavirus-red.svg',
            height: 80,
            width: 80,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'The\n',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  height: 1.0,
                  color: Colors.red,
                ),
                children: [
                  TextSpan(
                    text: 'CoVID',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: AppColor.secondary,
                          fontSize: 40,
                          height: 0.9,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 70,
              height: 5,
              child: Divider(
                color: AppColor.primary,
                thickness: 6,
              ),
            ),
            Text(
              'Report',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: AppColor.primary,
                    fontSize: 16,
                    letterSpacing: 8,
                    fontWeight: FontWeight.w100,
                  ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
