import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic/Screens/home/settings/language_bottom_sheet.dart';
import 'package:islamic/Screens/home/settings/theme_bottom_sheet.dart';
import 'package:islamic/mythemedata.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    SettindsProvider provider = Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 50,),
        Text(
          AppLocalizations.of(context)!.settings,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        InkWell(
          onTap: () {
            showlanguageButtonSheet();
          },
          child: Container(
            color: provider.currentTheme == ThemeMode.light
    ?MythemeData.primiaryColor:MythemeData.primiaryColorDark,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(provider.cuurentLocal == "en" ? "English" : "العربية"),
                Spacer(),
                Icon(
                  Icons.arrow_downward,
                  color: MythemeData.accentColorDark,
                ),
              ],
            ),
          ),
        ),
        Text(
          AppLocalizations.of(context)!.theme,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        InkWell(
          onTap: () {
            showThemeButtonSheet();
          },
          child: Container(
            color: provider.currentTheme == ThemeMode.light
                ?MythemeData.primiaryColor:MythemeData.primiaryColorDark,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                provider.currentTheme==ThemeMode.light?  AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_downward,
                  color: MythemeData.accentColorDark,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showlanguageButtonSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

  void showThemeButtonSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ShowThemeButtom();
        });
  }
}
