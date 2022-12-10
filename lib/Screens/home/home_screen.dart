import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic/Screens/home/hadeth/hadeth_tab.dart';
import 'package:islamic/Screens/home/quran/quran_tab.dart';
import 'package:islamic/Screens/home/radio/radio_tab.dart';
import 'package:islamic/Screens/home/sebha/sebha_tab.dart';
import 'package:islamic/Screens/home/settings/settings_tab.dart';
import 'package:islamic/mythemedata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 2;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    SettindsProvider provider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(provider.currentTheme == ThemeMode.light
            ? "assets/images/default_bg.png"
            : "assets/images/dark_bg.png"),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.islami,
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: provider.currentTheme == ThemeMode.light
                  ? MythemeData.primiaryColor
                  : MythemeData.primiaryColorDark),
          child: BottomNavigationBar(
            selectedItemColor:provider.currentTheme == ThemeMode.light
                ? MythemeData.accentColor: MythemeData.accentColorDark,
            showUnselectedLabels: false,
            currentIndex: selectedIndex,
            onTap: (clickIndex) {
              selectedIndex = clickIndex;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                  label: "Quran"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                  label: "Hadeth"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                  label: "Sebha"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                  label: "Radio"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }
}
