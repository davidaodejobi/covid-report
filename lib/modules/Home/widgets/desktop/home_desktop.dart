import 'package:covid_report/modules/Home/widgets/desktop/statistic_card.dart';
import 'package:flutter/material.dart';

import '../../../../shared/responsive_builder.dart';
import 'description.dart';
import 'desktop_vaccine_info.dart';
import 'footer.dart';
import 'stacks.dart';
import 'statistics_card_header.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.white70,
          height: ResponsiveBuilder.isDesktop(context) ? 1750 : 1680,
          width: double.infinity,
          child: Column(
            children: [
              const Stacks(),
              SizedBox(
                height: ResponsiveBuilder.isDesktop(context) ? 80 : 50,
              ),
              const StatisticCardHeader(),
              const StatisticsCard(),
              SizedBox(
                height: ResponsiveBuilder.isDesktop(context) ? 80 : 50,
              ),
              const Description()
            ],
          ),
        ),
        const DesktopVaccineInfoCard(),
        const Footer()
      ],
    );
  }
}
