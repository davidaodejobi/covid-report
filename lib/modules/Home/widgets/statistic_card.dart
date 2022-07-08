import 'package:flutter/material.dart';

import '../../../constant/appcolor.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Text(
            'Country',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: AppColor.primary,
                  fontSize: 60,
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
            children: const [
              CardCasesCount(
                noOfOccurrences: 250000,
                type: 'Confirmed Cases',
              ),
              Spacer(),
              CardCasesCount(
                noOfOccurrences: 345000,
                type: 'Incident Rate',
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: const [
              CardCasesCount(
                noOfOccurrences: 35898,
                type: 'Deaths',
              ),
              Spacer(),
              CardCasesCount(
                noOfOccurrences: 2.7,
                type: 'Case Fatality Ratio',
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
    Key? key,
  }) : super(key: key);

  final double noOfOccurrences;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$noOfOccurrences',
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
