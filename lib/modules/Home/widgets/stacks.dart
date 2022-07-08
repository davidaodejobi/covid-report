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
            const SizedBox(
              height: 80,
            ),
            const Statistics(),
          ]),
        ),
        Positioned(
          top: 40,
          right: MediaQuery.of(context).size.width * 0.4,
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
            height: 240,
            width: 240,
          ),
        ),
        Positioned(
          top: 50,
          left: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/svg/coronavirus-red.svg',
                height: 80,
                width: 80,
              ),
              RichText(
                text: TextSpan(
                  text: 'The\n',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                    color: Colors.red,
                  ),
                  children: [
                    TextSpan(
                      text: 'CoVID',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: AppColor.secondary,
                            fontSize: 60,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 105,
                height: 1,
                child: Divider(
                  color: AppColor.primary,
                  thickness: 8,
                ),
              ),
              Text(
                'Report',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: AppColor.primary,
                      letterSpacing: 10,
                    ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 50,
          left: -70,
          child: SvgPicture.asset(
            'assets/svg/coronavirus-grey.svg',
            height: 260,
            width: 260,
          ),
        ),
      ],
    );
  }
}
