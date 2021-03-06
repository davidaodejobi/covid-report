import 'package:covid_report/modules/Home/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constant/appcolor.dart';
import '../../../../shared/responsive_builder.dart';
import 'card_cases_count.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hp = Provider.of<HomeProvider>(context);
    return Container(
      height: ResponsiveBuilder.isDesktop(context) ? 470 : 410,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: ResponsiveBuilder.isDesktop(context) ? 250 : 60,
        vertical: 20,
      ),
      padding: const EdgeInsets.all(40),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              hp.selectedCountry,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: AppColor.primary,
                    fontSize: ResponsiveBuilder.isDesktop(context) ? 60 : 50,
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
            height: 60,
          ),
          Row(
            children: [
              CardCasesCount(
                crossAxisAlignment: CrossAxisAlignment.start,
                noOfOccurrences:
                    hp.addComma(hp.selectedCountryData.totalConfirmed!),
                type: 'Confirmed Cases',
              ),
              const Spacer(),
              CardCasesCount(
                crossAxisAlignment: CrossAxisAlignment.end,
                noOfOccurrences: hp.addComma(hp.selectedCountryData.newDeaths!),
                type: 'New Confirmed Cases',
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              CardCasesCount(
                crossAxisAlignment: CrossAxisAlignment.start,
                noOfOccurrences:
                    hp.addComma(hp.selectedCountryData.totalDeaths!),
                type: 'Deaths',
              ),
              const Spacer(),
              CardCasesCount(
                crossAxisAlignment: CrossAxisAlignment.end,
                noOfOccurrences: hp.addComma(hp.selectedCountryData.newDeaths!),
                type: 'New Deaths',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
