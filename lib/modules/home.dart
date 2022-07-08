import 'package:covid_report/shared/responsive_builder.dart';
import 'package:flutter/material.dart';

import 'Home/widgets/desktop/desktop_vaccine_info.dart';
import 'Home/widgets/footer.dart';
import 'Home/widgets/header_desc_with_button.dart';
import 'Home/widgets/statistics.dart';

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
              height: 1000,
              width: double.infinity,
              child: Column(
                children: const [
                  HeaderDescriptionWithButton(),
                  SizedBox(
                    height: 80,
                  ),
                  Statistics(),
                ],
              )),
          const DesktopVaccineInfoCard(),
          const Footer()
        ],
      ),
    ));
  }
}
