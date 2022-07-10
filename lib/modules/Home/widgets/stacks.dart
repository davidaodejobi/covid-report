import 'package:covid_report/shared/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant/appcolor.dart';
import 'header_desc_with_button.dart';
import 'statistics.dart';

class Stacks extends StatelessWidget {
  const Stacks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Column(children: [
            const SizedBox(
              height: 150,
            ),
            HeaderDescriptionWithButton(),
            SizedBox(
              height: ResponsiveBuilder.isDesktop(context) ? 80 : 50,
            ),
            const Statistics(),
          ]),
        ),
        Positioned(
          top: 40,
          right: ResponsiveBuilder.isDesktop(context)
              ? MediaQuery.of(context).size.width * 0.4
              : MediaQuery.of(context).size.width * 0.36,
          child: Image.asset(
            'assets/images/nose-mask-lady.png',
            height: 140,
            width: 140,
          ),
        ),
        Positioned(
          top: 50,
          right: -100,
          child: SvgPicture.asset(
            'assets/svg/coronavirus-grey.svg',
            height: ResponsiveBuilder.isDesktop(context) ? 240 : 180,
            width: ResponsiveBuilder.isDesktop(context) ? 240 : 180,
          ),
        ),
        Positioned(
          top: ResponsiveBuilder.isDesktop(context) ? 50 : 20,
          left: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/svg/coronavirus-red.svg',
                height: ResponsiveBuilder.isDesktop(context) ? 80 : 50,
                width: ResponsiveBuilder.isDesktop(context) ? 80 : 50,
              ),
              RichText(
                text: TextSpan(
                  text: 'The\n',
                  style: TextStyle(
                    fontSize:
                        ResponsiveBuilder.isDesktop(context) ? 18 : 18 / 2,
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                    color: Colors.red,
                  ),
                  children: [
                    TextSpan(
                      text: 'CoVID',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: AppColor.secondary,
                            fontSize:
                                ResponsiveBuilder.isDesktop(context) ? 60 : 30,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: ResponsiveBuilder.isDesktop(context) ? 105 : 60,
                height: 1,
                child: Divider(
                  color: AppColor.primary,
                  thickness: ResponsiveBuilder.isDesktop(context) ? 8 : 4,
                ),
              ),
              Text(
                'Report',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: AppColor.primary,
                      fontSize: ResponsiveBuilder.isDesktop(context) ? 22 : 12,
                      letterSpacing:
                          ResponsiveBuilder.isDesktop(context) ? 10 : 5,
                    ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 70,
          left: -70,
          child: SvgPicture.asset(
            'assets/svg/coronavirus-grey.svg',
            height: ResponsiveBuilder.isDesktop(context) ? 260 : 180,
            width: ResponsiveBuilder.isDesktop(context) ? 260 : 180,
          ),
        ),
      ],
    );
  }
}
