import 'package:covid_report/modules/Home/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../../constant/appcolor.dart';
import '../desktop/footer_icon_and_text.dart';

class DescriptionMobile extends StatelessWidget {
  const DescriptionMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hp = Provider.of<HomeProvider>(context);
    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WebsafeSvg.asset(
                  'assets/svg/bacteria.svg',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'What is novel coronavirus?',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 30,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Novel Coronavirus is a new strain of coronavirus. It is not the same as the coronavirus that has been around for a long time.\n\nAliquam eu nunc. Proin faucibus arcu quis ante. Donec interdum, metus et hendrerit aliquet, dolor diam sagittis ligula, eget egestas libero turpis vel mi. Aenean vulputate eleifend tellus.\n\nAliquam eu nunc. Proin faucibus arcu quis ante. Donec interdum, metus et hendrerit aliquet, dolor diam sagittis ligula, eget egestas libero turpis vel mi. Aenean vulputate eleifend tellus.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      hp.modal(context);
                    },
                    child: const Text('Check Symptoms'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 440,
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/covid19.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    // height: MediaQuery.of(context).size.height * 0.3,

                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Vaccine Information\n',
                        style: Theme.of(context).textTheme.headline3,
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'Vivamus quis mi. Nullam nulla eros, ultricies sit amet, nonummy id, imperdiet feugiat, pede. Curabitur turpisAliquam erat volutpat. Fusce risus nisl, viverra et, tempor et, pretium in, sapien. Curabitur vestibulum aliquam leo.Nullam dictum felis eu pede mollis pretium. Praesent turpis. Vestibulum fringil pede sit amet augue.',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/images/bottle-image.png',
                      height: 130,
                      width: 130,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 350,
            width: double.infinity,
            color: AppColor.primary,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    FooterIconAndText(
                      icon: 'mask-hygiene-medical',
                      topText: 'Wear Mask',
                      bottomText: 'Indoor and Outdoor',
                      // text: 'Wear Mask\nIndoor and Outdoor',
                    ),
                    FooterIconAndText(
                      icon: 'layer',
                      topText: 'Wash Your',
                      bottomText: 'Hands',
                    ),
                  ],
                ),
                const FooterIconAndText(
                  icon: 'social-distancing',
                  topText: 'Maintain',
                  bottomText: 'Social Distance',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
