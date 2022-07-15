import 'package:flutter/material.dart';

import 'custom_bottom_naviagtion.dart';
import 'description_mobile.dart';
import 'home_mobile.dart';
import 'provider/tab_provider.dart';
import 'statistics_mobile.dart';

class MobileMain extends StatelessWidget {
  const MobileMain({
    Key? key,
    required this.tp,
  }) : super(key: key);

  final TabProvider tp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (tp.switch1) const HomeMobile(),
        if (tp.switch2) const StatisticsMobile(),
        if (tp.switch3) const DescriptionMobile(),
        CustomBottomNaviagtion(tp: tp),
      ],
    );
  }
}
