import 'package:covid_report/constant/appcolor.dart';
import 'package:covid_report/shared/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'Home/widgets/desktop/desktop_vaccine_info.dart';
import 'Home/widgets/footer.dart';

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
                    height: 50,
                  ),
                ],
              )),
          const DesktopVaccineInfoCard(),
          const Footer()
        ],
      ),
    ));
  }
}

class HeaderDescriptionWithButton extends StatelessWidget {
  const HeaderDescriptionWithButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Save Yourself\n',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: AppColor.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
            children: [
              TextSpan(
                text: 'Save the ',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: AppColor.primary,
                      height: 1.0,
                    ),
              ),
              TextSpan(
                text: 'World',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      height: 1.0,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 400,
          child: Text(
            'Coronavirus diseases (COVID-19) is an infectious disease caused by a newly discovered coronavirus. ',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        SizedBox(
          height: 50,
          width: 200,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Check Symptoms'),
          ),
        ),
      ],
    );
  }
}
