import 'package:flutter/material.dart';

import '../../../../constant/appcolor.dart';

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
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          type,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14,
                color: AppColor.primary,
              ),
        ),
      ],
    );
  }
}
