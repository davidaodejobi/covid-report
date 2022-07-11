import 'package:flutter/material.dart';

import '../../../../constant/appcolor.dart';

class DescriptionWithButton extends StatelessWidget {
  const DescriptionWithButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: 'Save Yourself\n',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      overflow: TextOverflow.ellipsis,
                      color: AppColor.primary,
                      fontSize: 23,
                      fontWeight: FontWeight.normal,
                    ),
                children: [
                  TextSpan(
                    text: 'Save the ',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: AppColor.primary,
                          fontSize: 50,
                          height: 1.0,
                        ),
                  ),
                  TextSpan(
                    text: 'World',
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 50,
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
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        SizedBox(
          height: 45,
          width: 200,
          child: ElevatedButton(
            onPressed: () {
              // homeProvider.getAllCountriesCovidReport();
            },
            child: const Text('Check Symptoms'),
          ),
        ),
      ],
    );
  }
}
