import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constant/appcolor.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        const SizedBox(
          height: 20,
        ),
        SvgPicture.asset(
          'assets/svg/coronavirus-red.svg',
          height: 80,
          width: 80,
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
