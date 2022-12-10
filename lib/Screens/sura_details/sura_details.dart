import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:islamic/Screens/sura_details/sura_details_argument.dart';
import 'package:flutter/services.dart';
import 'package:islamic/mythemedata.dart';
import 'package:islamic/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuraDetails extends StatefulWidget {
  static String routeName = "suar details";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> suraLines = [];

  @override
  Widget build(BuildContext context) {
    SettindsProvider provider = Provider.of(context);

    var args = ModalRoute.of(context)!.settings.arguments as SuraNameArgument;
    if (suraLines.isEmpty) {
      readFile(args.filename);
    }

    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.currentTheme == ThemeMode.light
                  ? "assets/images/default_bg.png"
                  : "assets/images/dark_bg.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.islami,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding:  EdgeInsets.all(15.0),
          margin: EdgeInsets.all(23),
          color:provider.currentTheme==ThemeMode.light?Colors.white: Color(0xff141A2E),
          child: Column(
            children: [
              Text(args.suraname,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline1),
              Divider(thickness: 2,color: Color(0xffB7935F),),
              Expanded(
                child: ListView.builder(
                    itemCount: suraLines.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              ("${suraLines[index]}${{index + 1}}"),
                              textAlign: TextAlign.center,
                              textDirection:  TextDirection.rtl,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: provider.currentTheme==ThemeMode.light? MythemeData.accentColor:MythemeData.accentColorDark,
                                  fontWeight: FontWeight.bold),
                            ),

                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  readFile(String filename) async {
    String filecontent = await rootBundle.loadString("assets/files/$filename");
    setState(() {});
    suraLines = filecontent.split("\n");
    suraLines = suraLines.where((line) => line.trim().isNotEmpty).toList();
  }
}
