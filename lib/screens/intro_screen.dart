import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:notes_with_getx/routes/routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  final String titleApp = 'Notes With Getx';
  final String subTitleApp = 'Save notes locally.';
  final titleStyle = TextStyle(color: Color(0xFF000000), fontSize: 30.0);
  final subTitleStyle = TextStyle(color: Color(0xFF000000), fontSize: 20.0);
  final customWhite = Color(0xFFFFFFFF);

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: titleApp,
        styleTitle: titleStyle,
        description: subTitleApp,
        styleDescription: subTitleStyle,
        // pathImage: "assets/logo/book.png",
        backgroundColor: customWhite,
      ),
    );
    slides.add(
      Slide(
        title: titleApp,
        styleTitle: titleStyle,
        description: subTitleApp,
        styleDescription: subTitleStyle,
        // pathImage: "assets/logo/book.png",
        backgroundColor: customWhite,
      ),
    );
    slides.add(
      Slide(
        title: titleApp,
        styleTitle: titleStyle,
        description: subTitleApp,
        styleDescription: subTitleStyle,
        // pathImage: "assets/logo/book.png",
        backgroundColor: customWhite,
      ),
    );
  }

  void onDonePress() {
    Get.offNamed(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: this.slides,
      // Next button
      nameNextBtn: "Next",
      // Done button
      onDonePress: this.onDonePress,
      nameDoneBtn: "Start",
      styleDoneBtn: TextStyle(color: Color(0xFF000000)),
      // Skip button
      nameSkipBtn: "Skip",
      styleSkipBtn: TextStyle(color: Color(0xFF000000)),
      // Prev button
      namePrevBtn: "Previous",
      stylePrevBtn: TextStyle(color: Color(0xFF000000)),
    );
  }
}
