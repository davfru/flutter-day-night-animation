import 'package:flutter/material.dart';
import 'package:flutter_day_night_animation/screens/components/land.dart';
import 'package:flutter_day_night_animation/screens/components/rounded_text_field.dart';
import 'package:flutter_day_night_animation/screens/components/tabs.dart';
import 'package:flutter_day_night_animation/screens/size_config.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List<Color> lightBgColors = const [
      Color(0xFF8C2480),
      Color(0xFFCE587D),
      Color(0xFFFF9485),
    ];

    return Container(
      width: double.infinity,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: lightBgColors,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: getProportionateScreenWidth(30),
            bottom: getProportionateScreenWidth(-45),
            child: SvgPicture.asset("assets/icons/Sun.svg"),
          ),
          Land(key: UniqueKey()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacing(of: 50),
                  Tabs(
                    press: (value) {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
