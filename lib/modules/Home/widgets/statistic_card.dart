import 'package:covid_report/modules/Home/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/appcolor.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hp = Provider.of<HomeProvider>(context);
    return Container(
      height: 470,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 250,
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
                    fontSize: 60,
                  ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
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

class CardCasesCount extends StatelessWidget {
  const CardCasesCount({
    required this.noOfOccurrences,
    required this.type,
    required this.crossAxisAlignment,
    Key? key,
  }) : super(key: key);

  final String noOfOccurrences;
  final String type;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          noOfOccurrences,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: AppColor.tertiaryDark,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          type,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 20,
                color: AppColor.primary,
              ),
        ),
      ],
    );
  }
}
