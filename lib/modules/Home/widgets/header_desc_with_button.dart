import 'package:flutter/material.dart';

import '../../../constant/appcolor.dart';
import '../../../locator.dart';
import '../providers/home_provider.dart';

class HeaderDescriptionWithButton extends StatelessWidget {
  HeaderDescriptionWithButton({
    Key? key,
  }) : super(key: key);

  HomeProvider homeProvider = getIt<HomeProvider>();

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
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        SizedBox(
          height: 50,
          width: 200,
          child: ElevatedButton(
            onPressed: () {
              homeProvider.getAllCountriesCovidReport();
            },
            child: const Text('Check Symptoms'),
          ),
        ),
      ],
    );
  }
}
