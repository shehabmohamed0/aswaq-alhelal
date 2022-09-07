import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:root_package/routes/routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final GlobalKey<IntroductionScreenState> introKey;
  final pages = [
    {"title": "Title1", "body": "body1", "image": 'private.jpg'},
  ];

  @override
  void initState() {
    introKey = GlobalKey<IntroductionScreenState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        pages: [
          PageViewModel(
            title: pages[0]['title']!,
            body: pages[0]['body']!,
            decoration: walkThroughPageDecoration,
            image: Image.asset(
              'assets/images/${pages[0]['image']}',
            ),
          ),
          PageViewModel(
            title: pages[0]['title']!,
            body: pages[0]['body']!,
            decoration: walkThroughPageDecoration,
            image: Image.asset(
              'assets/images/${pages[0]['image']}',
            ),
          ),
        ],
        onDone: () {
          Navigator.pushNamed(context, Routes.landingPage);
        },
        // You can override onSkip callback
        showSkipButton: true,
        showNextButton: true,
        showDoneButton: true,
        nextFlex: 0,
        skip: Text('Skip',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
        next: Icon(Icons.arrow_forward,
            size: 26, color: Theme.of(context).primaryColor),
        done: Text('Done',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 8.0),
        dotsDecorator: DotsDecorator(
          size: const Size(10.0, 10.0),
          color: const Color(0xFFBDBDBD),
          activeColor: Theme.of(context).primaryColor,
          activeSize: const Size(22.0, 10.0),
          activeShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: dotsContainerDecorator);
  }
}

const walkThroughPageDecoration = PageDecoration(
  bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
  pageColor: Colors.white,
  imagePadding: EdgeInsets.zero,
);

const dotsContainerDecorator = ShapeDecoration(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);
