import 'package:flutter/material.dart';
import 'package:islamic/Screens/hadeth_details/hadeth_details.dart';
import 'package:islamic/Screens/home/home_screen.dart';
import 'package:islamic/Screens/sura_details/sura_details.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic/mythemedata.dart';
import 'package:islamic/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=> SettindsProvider(),
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
late SettindsProvider provider;
  // This widget is the root of your application.
void getSharedPrefernce()async{
  final prefs = await SharedPreferences.getInstance();
  provider.changeCurrentLocal(prefs.getString("language")??"en");
  if(prefs.getString("theme")=="dark"){
    provider.changeCurrentTheme(ThemeMode.dark);
  }else if(prefs.getString("theme")=="light"){
    provider.changeCurrentTheme(ThemeMode.light);
  }
}
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    getSharedPrefernce();
    return MaterialApp(
      theme: MythemeData.lightTheme,
      darkTheme: MythemeData.darkTheme,
      themeMode: provider.currentTheme,

      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadethDetails.routeName: (_) => HadethDetails(),
      },
      initialRoute: HomeScreen.routeName,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English, no country code
        Locale('ar'), // Spanish, no country code
      ],
      locale: Locale(provider.cuurentLocal),
    );
  }
}
