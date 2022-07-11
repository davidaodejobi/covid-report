import 'package:covid_report/modules/Home/providers/home_provider.dart';
import 'package:covid_report/modules/Home/widgets/mobile/home_mobile.dart';
import 'package:covid_report/modules/Home/widgets/mobile/statistics_mobile.dart';
import 'package:covid_report/shared/responsive_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../locator.dart';
import 'Home/widgets/desktop/home_desktop.dart';
import 'Home/widgets/mobile/description_mobile.dart';
import 'Home/widgets/mobile/provider/tab_provider.dart';

HomeProvider hp = getIt<HomeProvider>();

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            tp.setTab('home');
                          },
                          child: SvgPicture.asset(
                            tp.switch1
                                ? 'assets/svg/home-red.svg'
                                : 'assets/svg/home-dark.svg',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            tp.setTab('statistics');
                          },
                          child: SvgPicture.asset(
                            tp.switch2
                                ? 'assets/svg/world-red.svg'
                                : 'assets/svg/world-dark.svg',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            tp.setTab('about');
                          },
                          child: SvgPicture.asset(
                            tp.switch3
                                ? 'assets/svg/thinking-red.svg'
                                : 'assets/svg/thinking-dark.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
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
