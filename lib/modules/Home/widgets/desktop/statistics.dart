import 'package:covid_report/locator.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../../constant/appcolor.dart';
import '../../../../shared/responsive_builder.dart';
import '../../providers/home_provider.dart';
import 'case_icons_and_text.dart';

HomeProvider hp = getIt.get<HomeProvider>();

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
                height: ResponsiveBuilder.isDesktop(context) ? 40 : 35,
                width: ResponsiveBuilder.isDesktop(context) ? 40 : 35,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'Global Statistics',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: AppColor.primary,
                      fontSize: ResponsiveBuilder.isDesktop(context) ? 30 : 25,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CasesIconAndText(
                  caseNo: hp.withSuffix(hp.globalData.totalConfirmed!),
                  icon: 'bacteria',
                  subText: 'Confirmed Cases\nWorldwide',
                  iconHeight: 43,
                  iconWidth: 43,
                ),
                const SizedBox(
                  width: 150,
                ),
                CasesIconAndText(
                  caseNo: hp.withSuffix(hp.globalData.totalDeaths!),
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
