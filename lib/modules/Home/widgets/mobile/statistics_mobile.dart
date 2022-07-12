import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../../constant/appcolor.dart';
import '../../providers/home_provider.dart';
import 'card_case_count_mobile.dart';

class StatisticsMobile extends StatelessWidget {
  const StatisticsMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WebsafeSvg.asset(
                      'assets/svg/bacteria.svg',
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Covid Info'.toUpperCase(),
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: 25,
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        Text(
                          'By Country'.toUpperCase(),
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    color: AppColor.tertiary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: AppColor.primary,
                    border: Border.all(
                      color: AppColor.tertiary,
                      width: 1,
                    ),
                  ),
                  width: double.infinity,
                  height: 45,
                  child: Row(
                    children: [
                      Text(
                        'Select Country',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: AppColor.tertiary,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      const SizedBox(
                        height: 35,
                        child: VerticalDivider(
                          color: AppColor.tertiary,
                        ),
                      ),
                      Consumer<HomeProvider>(builder: (context, hp, _) {
                        return Expanded(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: AppColor.secondary,
                                  ),
                              isExpanded: true,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 365,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 10),
                  blurRadius: 30,
                ),
              ],
            ),
            child: Consumer<HomeProvider>(
              builder: (context, hp, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        hp.selectedCountry,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: AppColor.primary,
                              fontSize: 40,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      //: TODO: get the correct data from the api
                      'Last Updated May 1, 2020 12:00 AM UTC',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16,
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CardCasesCountMobile(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      noOfOccurrences:
                          hp.addComma(hp.selectedCountryData.totalConfirmed!),
                      type: 'Confirmed Cases',
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        CardCasesCountMobile(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          noOfOccurrences:
                              hp.addComma(hp.selectedCountryData.newDeaths!),
                          type: 'New Confirmed Cases',
                        ),
                      ],
                    ),
                    CardCasesCountMobile(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      noOfOccurrences:
                          hp.addComma(hp.selectedCountryData.totalDeaths!),
                      type: 'Deaths',
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        CardCasesCountMobile(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          noOfOccurrences:
                              hp.addComma(hp.selectedCountryData.newDeaths!),
                          type: 'New Deaths',
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
