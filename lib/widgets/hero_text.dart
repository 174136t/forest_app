import 'package:flutter/material.dart';
import 'package:forest_app/Animation/Fade_animation.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeroText extends StatelessWidget {
  final double animationDelay;
  final List<String> heroText;
  final double heroTextSize;

  HeroText({this.animationDelay, this.heroText, this.heroTextSize});
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      animationDelay,
      ColorizeAnimatedTextKit(
        colors: [Colors.deepPurple[700], Colors.white],
        repeatForever: true,
        speed: Duration(milliseconds: 300),
        alignment: AlignmentDirectional.topStart,
        text: heroText,
        textStyle: TextStyle(
            letterSpacing: 1.2,
            color: Colors.white,
            fontSize: heroTextSize,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
class HeroText1 extends StatelessWidget {
  final double animationDelay;
  final List<String> heroText;
  final double heroTextSize;

  HeroText1({this.animationDelay, this.heroText, this.heroTextSize});
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      animationDelay,
      ColorizeAnimatedTextKit(
        colors: [Colors.deepPurple[700], Colors.green],
        repeatForever: true,
        speed: Duration(milliseconds: 800),
        alignment: AlignmentDirectional.topStart,
        text: heroText,
        textStyle: TextStyle(
            letterSpacing: 1.2,
            color: Colors.black,
            fontSize: heroTextSize,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}