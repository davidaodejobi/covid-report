import 'package:covid_report/locator.dart';
import 'package:covid_report/modules/Home/providers/home_provider.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WebsafeSvg.asset(
          'assets/svg/bacteria.svg',
          height: 80,
          width: 80,
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Covid Info'.toUpperCase(),
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: AppColor.primary,
                    // fontSize: 30,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            Text(
              'By Country'.toUpperCase(),
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: AppColor.tertiary,
                    fontSize: 24,
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
                    fontSize: 24,
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
              width: 320,
              height: 45,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: hp.listOfCountries
                      .map((country) => DropdownMenuItem(value: country, child: Text(country!)))
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
    );
  }
}
