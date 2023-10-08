import 'package:flutter/material.dart';
import 'package:flutter_day_night_animation/screens/size_config.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    super.key,
    required this.press,
  });

  final ValueChanged<int> press;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(12),
        ),
        child: DefaultTabController(
          length: 2,
          child: TabBar(
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            indicatorColor: Colors.blue,
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white24,
            onTap: press,
            tabs: const [Tab(text: "Day"), Tab(text: "Night")],
          ),
        ),
      ),
    );
  }
}
