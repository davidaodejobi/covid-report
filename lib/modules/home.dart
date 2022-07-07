import 'package:covid_report/constant/appcolor.dart';
import 'package:covid_report/shared/responsive_builder.dart';
import 'package:flutter/material.dart';

import 'Home/widgets/desktop/desktop_vaccine_info.dart';
import 'Home/widgets/footer_icon_and_text.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveBuilder(
      desktop: ListView(
        children: [
          const SizedBox(
            height: 1000,
            width: double.infinity,
            child: Center(
              child: Text('Desktop'),
            ),
          ),
          const DesktopVaccineInfoCard(),
          Container(
            height: 00,
            width: double.infinity,
            color: AppColor.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                FooterIconAndText(
                  icon: 'mask-hygiene-medical',
                  topText: 'Wear Mask',
                  bottomText: 'Indoor and Outdoor',
                  // text: 'Wear Mask\nIndoor and Outdoor',
                ),
                FooterIconAndText(
                  icon: 'layer',
                  topText: 'Wash Your',
                  bottomText: 'Hands',
                ),
                FooterIconAndText(
                  icon: 'social-distancing',
                  topText: 'Maintain',
                  bottomText: 'Social Distance',
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
