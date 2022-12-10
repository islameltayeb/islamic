import 'package:flutter/material.dart';
import 'package:islamic/mythemedata.dart';
import 'package:islamic/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    SettindsProvider provider = Provider.of(context);

    return Container(
      color: provider.currentTheme==ThemeMode.light?Colors.white:MythemeData.primiaryColorDark,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeCurrentLocal("en");
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "English",
                style: TextStyle(
                    color: provider.cuurentLocal == "en"
                        ? MythemeData.accentColorDark
                        : Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeCurrentLocal("ar");
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "العربية",
                style: TextStyle(
                    color: provider.cuurentLocal == "ar"
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
