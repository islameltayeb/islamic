import 'package:flutter/material.dart';
import 'package:islamic/mythemedata.dart';
import 'package:islamic/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowThemeButtom extends StatelessWidget {
  const ShowThemeButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettindsProvider provider = Provider.of(context);

    return Container(
      color: provider.currentTheme==ThemeMode.light?Colors.white:MythemeData.primiaryColorDark,

      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeCurrentTheme(ThemeMode.light);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.light,
                style: TextStyle(
                    color: provider.currentTheme == ThemeMode.light
                        ? MythemeData.accentColorDark
                        : Colors.white),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeCurrentTheme(ThemeMode.dark);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.dark,
                style: TextStyle(
                    color: provider.currentTheme == ThemeMode.dark
                        ? MythemeData.accentColorDark
                        : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
