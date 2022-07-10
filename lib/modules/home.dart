import 'package:covid_report/modules/Home/providers/home_provider.dart';
import 'package:covid_report/shared/responsive_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../locator.dart';
import 'Home/widgets/desktop/desktop_vaccine_info.dart';
import 'Home/widgets/footer.dart';
import 'Home/widgets/mobile/description.dart';
import 'Home/widgets/stacks.dart';
import 'Home/widgets/statistic_card.dart';
import 'Home/widgets/statistics_card_header.dart';

HomeProvider hp = getIt<HomeProvider>();

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveBuilder(
      desktop: FutureBuilder(
        future: hp.getAllCountriesCovidReport(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
          } else {
            return const Center(
                child: CupertinoActivityIndicator(
              animating: true,
              radius: 15,
            ));
          }
        },
      ),
    ));
  }
}
