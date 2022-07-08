import 'package:covid_report/shared/responsive_builder.dart';
import 'package:flutter/material.dart';

import 'Home/widgets/desktop/desktop_vaccine_info.dart';
import 'Home/widgets/footer.dart';
import 'Home/widgets/mobile/description.dart';
import 'Home/widgets/stacks.dart';
import 'Home/widgets/statistic_card.dart';
import 'Home/widgets/statistics_card_header.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveBuilder(
      desktop: ListView(
        children: [
          Container(
            color: Colors.white70,
            height: 1750,
            width: double.infinity,
            child: Column(
              children: const [
                Stacks(),
                SizedBox(
                  height: 80,
                ),
                StatisticCardHeader(),
                StatisticsCard(),
                SizedBox(
                  height: 80,
                ),
                Description()
              ],
            ),
          ),
          const DesktopVaccineInfoCard(),
          const Footer()
        ],
      ),
    ));
  }
}
