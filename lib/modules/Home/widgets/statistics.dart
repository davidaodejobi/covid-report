import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constant/appcolor.dart';
import 'case_icons_and_text.dart';

class Statistics extends StatelessWidget {
  const Statistics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              WebsafeSvg.asset(
                'assets/svg/earth.svg',
                height: 35,
                width: 35,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'Global Statistics',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: AppColor.primary,
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                CasesIconAndText(
                  caseNo: 100,
                  icon: 'bacteria',
                  subText: 'Confirmed Cases\nWorldwide',
                ),
                SizedBox(
                  width: 120,
                ),
                CasesIconAndText(
                  caseNo: 189,
                  icon: 'union',
                  subText: 'Death\nWorldwide',
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
