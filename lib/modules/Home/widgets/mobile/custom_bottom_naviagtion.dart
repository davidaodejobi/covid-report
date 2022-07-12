import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'provider/tab_provider.dart';

class CustomBottomNaviagtion extends StatelessWidget {
  const CustomBottomNaviagtion({
    Key? key,
    required this.tp,
  }) : super(key: key);

  final TabProvider tp;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            iconSize: tp.switch1 ? 30 : 22,
            icon: SvgPicture.asset(
              tp.switch1
                  ? 'assets/svg/home-red.svg'
                  : 'assets/svg/home-dark.svg',
            ),
            onPressed: () {
              tp.setTab('home');
            },
          ),
          IconButton(
            iconSize: tp.switch2 ? 30 : 18,
            icon: SvgPicture.asset(
              tp.switch2
                  ? 'assets/svg/world-red.svg'
                  : 'assets/svg/world-dark.svg',
            ),
            onPressed: () {
              tp.setTab('statistics');
            },
          ),
          IconButton(
            iconSize: tp.switch3 ? 30 : 20,
            icon: SvgPicture.asset(
              tp.switch3
                  ? 'assets/svg/thinking-red.svg'
                  : 'assets/svg/thinking-dark.svg',
            ),
            onPressed: () {
              tp.setTab('about');
            },
          ),
        ],
      ),
    );
  }
}
