import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WebsafeSvg.asset(
              'assets/svg/bacteria.svg',
              width: 150,
              height: 150,
            ),
            const SizedBox(
              width: 30,
            ),
            SizedBox(
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      onPressed: () {},
                      child: const Text('Check Symptoms'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
