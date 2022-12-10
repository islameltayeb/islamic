import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettindsProvider extends ChangeNotifier{

  String cuurentLocal="en";
  ThemeMode currentTheme =ThemeMode.light;
  changeCurrentLocal(String newLocal)async{
    final prefs = await SharedPreferences.getInstance();
    if(newLocal==cuurentLocal){
      return;
    }
    cuurentLocal=newLocal;
    prefs.setString("language", cuurentLocal);
    notifyListeners();
  }
  changeCurrentTheme(ThemeMode newMode)async{
    final prefs = await SharedPreferences.getInstance();
    if(newMode== currentTheme){
      return;
    }
    currentTheme=newMode;
    prefs.setString("theme", (currentTheme==ThemeMode.dark)?"dark":"light");

    notifyListeners();
  }
}