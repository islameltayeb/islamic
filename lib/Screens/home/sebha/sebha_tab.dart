import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic/mythemedata.dart';
import 'package:islamic/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  List<String> tsbeh = ["سبحان الله", "الحمدالله", "الله اكبر"];

  int index = 0;

  double angle = 0;

  rotatesebha() {
    angle--;
    count++;
    if (count == 4) {
      index++;
      count = 0;
      if (index > tsbeh.length - 1) {
        index = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SettindsProvider provider = Provider.of(context);

    return Container(
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * .48,
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Positioned(
                    left: MediaQuery.of(context).size.width * .45,
                    child: Image.asset(provider.currentTheme == ThemeMode.dark
                        ? "assets/images/head_sebha_dark.png"
                        : "assets/images/head_sebha_logo.png"),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * .2,
                    top: MediaQuery.of(context).size.height * .1,
                    child: InkWell(
                      onTap: () {
                        rotatesebha();
                        setState(() {});
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Transform.rotate(
                        angle: angle,
                        child: Image.asset(
                            provider.currentTheme == ThemeMode.dark
                                ? "assets/images/body_sebha_dark.png"
                                : "assets/images/body_sebha_logo.png"),
                      ),
                    ),
                  ),
                ],
              )),
          Text("عدد التسبيحات"),
          Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            decoration: BoxDecoration(
                color: provider.currentTheme == ThemeMode.light
                    ? Color(0xffB7935F)
                    : Color(0xff141A2E),
                borderRadius: BorderRadius.circular(25)),
            child: Text(
              "$count",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: provider.currentTheme == ThemeMode.light
                      ? Colors.black
                      : Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              rotatesebha();
              setState(() {});
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 22),
              decoration: BoxDecoration(
                  color: provider.currentTheme == ThemeMode.light
                      ? MythemeData.primiaryColor
                      : MythemeData.accentColorDark,
                  borderRadius: BorderRadius.circular(35)),
              child: Text(
                "${tsbeh[index]}",
                style: TextStyle(
                    fontSize: 25,
                    color: provider.currentTheme == ThemeMode.light
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
