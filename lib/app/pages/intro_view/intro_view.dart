import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:treint/app/pages/home/home_view.dart';
import 'package:treint/app/style/app_colors.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        isTopSafeArea: true,
        showSkipButton: true,
        showNextButton: true,
        globalBackgroundColor: AppColors.grayBackground,
        done: const Text(
          'Done',
          style: TextStyle(color: AppColors.black),
        ),
        onDone: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          );
        },
        skip: const Text(
          'Skip',
          style: TextStyle(color: AppColors.black),
        ),
        onSkip: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          );
        },
        next: const Icon(
          Icons.arrow_forward,
          color: AppColors.black,
        ),
        onChange: (value) {},
        dotsFlex: 2,
        dotsDecorator: DotsDecorator(
          color: AppColors.white,
          activeColor: AppColors.blue,
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
        pages: [
          PageViewModel(
            image: Center(
              child: Image.asset(
                'assets/intro/page-2.png',
                scale: 1.7,
              ),
            ),
            title: 'Hi! I am Treint',
            body: 'Your treatment intelligence (TI) powered assistant.',
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy'),
              bodyTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Gilroy'),
            ),
          ),
          PageViewModel(
            image: Center(
              child: Image.asset(
                'assets/intro/page-2.png',
                scale: 1.7,
              ),
            ),
            title: 'Are you feeling a little off today?',
            body: 'I can provide you with guidance to help you feel better.',
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy'),
              bodyTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Gilroy'),
            ),
          ),
          PageViewModel(
            image: Center(
              child: Image.asset(
                'assets/intro/page-2.png',
                scale: 1.7,
              ),
            ),
            title: 'Welcome!',
            body:
                'To my brief demonstration of the health management algorithm.',
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy'),
              bodyTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Gilroy'),
            ),
          ),
          PageViewModel(
            image: Center(
              child: Image.asset(
                'assets/intro/page-2.png',
                scale: 1.7,
              ),
            ),
            title: 'I analyze your symptoms, and potential causes',
            body:
                'Using my advanced medical master data created by medical experts team around the world.',
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy'),
              bodyTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Gilroy'),
            ),
          ),
          PageViewModel(
            image: Center(
              child: Image.asset(
                'assets/intro/page-2.png',
                scale: 1.7,
              ),
            ),
            title: 'Coming soon...',
            body:
                'I will soon come up with an app that you can use for daily needs to improve your health and well-being',
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy'),
              bodyTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Gilroy'),
            ),
          ),
          PageViewModel(
            image: Center(
              child: Image.asset(
                'assets/intro/page-2.png',
                scale: 1.7,
              ),
            ),
            titleWidget: TextButton(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(AppColors.blue),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 8.sp, horizontal: 32.sp),
                ),
              ),
              child: Text(
                'Start',
                style: TextStyle(fontSize: 24.sp, color: AppColors.black),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
            ),
            body: 'Understand your symptoms with TI-Powered Search.',
            decoration: PageDecoration(
              titleTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy'),
              bodyTextStyle: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Gilroy'),
            ),
          ),
        ],
      ),
    );
  }
}
