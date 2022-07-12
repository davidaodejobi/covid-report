import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../../constant/appcolor.dart';
import '../../../../locator.dart';
import '../../providers/home_provider.dart';
import 'description_with_button.dart';
import 'logo_header.dart';
import 'mobile_case_icon_text.dart';

HomeProvider hp = getIt<HomeProvider>();

class HomeMobile extends StatelessWidget {
  const HomeMobile({
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
          Stack(
            children: [
              SizedBox(
                  child: Column(
                children: [
                  const LogoHeader(),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/nose-mask-lady.png',
                    height: 160,
                    width: 160,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const DescriptionWithButton(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
              Positioned(
                top: 2,
                right: -MediaQuery.of(context).size.height * 0.12,
                child: SvgPicture.asset(
                  'assets/svg/coronavirus-grey.svg',
                  height: MediaQuery.of(context).size.width * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
              Positioned(
                bottom: 160,
                left: -MediaQuery.of(context).size.height * 0.12,
                child: SvgPicture.asset(
                  'assets/svg/coronavirus-grey.svg',
                  height: MediaQuery.of(context).size.width * 0.35,
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Spacer(),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    WebsafeSvg.asset(
                      'assets/svg/earth.svg',
                      height: 35,
                      width: 35,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Global Statistics',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: AppColor.primary,
                            fontSize: 23,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MobileCaseIconText(
                          caseNo: hp.withSuffix(hp.globalData.totalConfirmed!),
                          icon: 'bacteria',
                          subText: 'Confirmed Cases\nWorldwide',
                          iconHeight: 32,
                          iconWidth: 32,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        MobileCaseIconText(
                          caseNo: hp.withSuffix(hp.globalData.totalDeaths!),
                          icon: 'union',
                          subText: 'Death\nWorldwide',
                          iconHeight: 27,
                          iconWidth: 27,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
