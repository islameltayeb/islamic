import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic/Screens/home/hadeth/hadeth_tab.dart';
import 'package:islamic/Screens/sura_details/sura_details_argument.dart';
import 'package:flutter/services.dart';
import 'package:islamic/mythemedata.dart';
import 'package:islamic/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HadethDetails extends StatefulWidget {
  static String routeName = "Hadeth details";

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  List<String> suraLines = [];

  @override
  Widget build(BuildContext context) {
    SettindsProvider provider = Provider.of(context);
    var args = ModalRoute.of(context)!.settings.arguments as HadethModel;

    return Container(
      decoration: BoxDecoration(
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
        body: SingleChildScrollView(
          child: Container(
            padding:  EdgeInsets.all(15.0),
            margin: EdgeInsets.all(23),
            color:provider.currentTheme==ThemeMode.light?Colors.white: Color(0xff141A2E),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(args.title,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline1),
                Divider(thickness: 2,color: Color(0xffB7935F),),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    args.content,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 24,
                        color:provider.currentTheme==ThemeMode.light? MythemeData.accentColor:MythemeData.accentColorDark,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
