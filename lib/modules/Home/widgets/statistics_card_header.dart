import 'package:covid_report/modules/Home/providers/home_provider.dart';
import 'package:covid_report/shared/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constant/appcolor.dart';

class StatisticCardHeader extends StatelessWidget {
  const StatisticCardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hp = Provider.of<HomeProvider>(context, listen: true);
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WebsafeSvg.asset(
            'assets/svg/bacteria.svg',
            height: ResponsiveBuilder.isDesktop(context) ? 80 : 60,
            width: ResponsiveBuilder.isDesktop(context) ? 80 : 60,
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Covid Info'.toUpperCase(),
                style: ResponsiveBuilder.isDesktop(context)
                    ? Theme.of(context).textTheme.headline3!.copyWith(
                          color: AppColor.primary,
                          // fontSize: 30,
                          fontWeight: FontWeight.normal,
                        )
                    : Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: 30,
                          color: AppColor.primary,
                          fontWeight: FontWeight.normal,
                        ),
              ),
              Text(
                'By Country'.toUpperCase(),
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: AppColor.tertiary,
                      fontSize: ResponsiveBuilder.isDesktop(context) ? 24 : 20,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          const SizedBox(
            width: 70,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Country',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: AppColor.tertiary,
                      fontSize: ResponsiveBuilder.isDesktop(context) ? 24 : 20,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              //add a dropdown menu here
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  // color: AppColor.primary,
                  border: Border.all(
                    color: AppColor.tertiary,
                    width: 1,
                  ),
                ),
                width: ResponsiveBuilder.isDesktop(context) ? 320 : width / 3,
                height: ResponsiveBuilder.isDesktop(context) ? 45 : 35,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    items: hp.listOfCountries
                        .map((country) => DropdownMenuItem(
                            value: country, child: Text(country!)))
                        .toList(),
                    onChanged: (String? value) {
                      hp.onCountrySelect(value!);
                    },
                    value: hp.selectedCountry,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: AppColor.secondary,
                        ),
                    isExpanded: true,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
