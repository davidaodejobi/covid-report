import 'package:covid_report/modules/Home/providers/home_provider.dart';
import 'package:covid_report/modules/Home/widgets/mobile/home_mobile.dart';
import 'package:covid_report/shared/responsive_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator.dart';
import 'Home/widgets/desktop/home_desktop.dart';
import 'Home/widgets/mobile/custom_bottom_naviagtion.dart';
import 'Home/widgets/mobile/description_mobile.dart';
import 'Home/widgets/mobile/provider/tab_provider.dart';
import 'Home/widgets/mobile/statistics_mobile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider hp = getIt<HomeProvider>();
    final tp = Provider.of<TabProvider>(context, listen: true);
    return Scaffold(
      body: FutureBuilder(
        future: hp.getAllCountriesCovidReport(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ResponsiveBuilder(
              desktop: const HomeDesktop(),
              mobile: Column(
                children: [
                  if (tp.switch1) const HomeMobile(),
                  if (tp.switch2) const StatisticsMobile(),
                  if (tp.switch3) const DescriptionMobile(),
                  CustomBottomNaviagtion(tp: tp),
                ],
              ),
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
    );
  }
}
