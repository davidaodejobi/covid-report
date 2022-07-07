import 'package:flutter/material.dart';

import '../../../constant/appcolor.dart';
import 'footer_icon_and_text.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: AppColor.primary,
      child: Row(
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
          FooterIconAndText(
            icon: 'social-distancing',
            topText: 'Maintain',
            bottomText: 'Social Distance',
          ),
        ],
      ),
    );
  }
}
