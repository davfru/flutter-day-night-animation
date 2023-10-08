import 'package:flutter/material.dart';
import 'package:flutter_day_night_animation/screens/components/land.dart';
import 'package:flutter_day_night_animation/screens/components/tabs.dart';
import 'package:flutter_day_night_animation/screens/size_config.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFullSun = false;
  bool _isDayMood = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isFullSun = true;
      });
    });
  }

  void changeMood(int activeTab) {
    if (activeTab == 0) {
      setState(() {
        _isDayMood = true;
      });

      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _isFullSun = true;
        });
      });
    } else {
      setState(() {
        _isFullSun = false;
      });

      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _isDayMood = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List<Color> lightBgColors = [
      Color(0xFF8C2480),
      Color(0xFFCE587D),
      Color(0xFFFF9485),
      if (_isFullSun) Color(0xFFFF9D80),
    ];

    List<Color> darkBgColors = [
      Color(0xFF0D1441),
      Color(0xFF283584),
      Color(0xFF376AB2),
      if (_isFullSun) Color(0xFFFF9D80),
    ];

    const _duration = const Duration(seconds: 1);

    return AnimatedContainer(
      duration: _duration,
      width: double.infinity,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        //color: Colors.transparent,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: _isDayMood ? lightBgColors : darkBgColors,
        ),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.easeInOut,
            duration: _duration,
            left: getProportionateScreenWidth(30),
            bottom: getProportionateScreenWidth(_isFullSun ? -45 : -120),
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
                    press: (value) {
                      changeMood(value);
                    },
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
