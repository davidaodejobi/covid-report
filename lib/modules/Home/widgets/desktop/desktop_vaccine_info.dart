import 'package:flutter/material.dart';

class DesktopVaccineInfoCard extends StatelessWidget {
  const DesktopVaccineInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            // height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.4,
            child: RichText(
              text: TextSpan(
                text: 'Vaccine\nInformation\n',
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
            width: 40,
          ),
          Image.asset(
            'assets/images/bottle-image.png',
            height: 160,
            width: 160,
          ),
        ],
      ),
    );
  }
}
