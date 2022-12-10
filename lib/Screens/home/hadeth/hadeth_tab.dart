import 'package:flutter/material.dart';
import 'package:islamic/Screens/home/hadeth/hadeth_name_item.dart';

import '../../../mythemedata.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> ahadethModels = [];

  @override
  Widget build(BuildContext context) {
    if(ahadethModels.isEmpty){
      readAhadethFile();
    }
    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Image.asset("assets/images/qur2an_screen_logo.png")),
          Divider(
            color: MythemeData.primiaryColor,
            thickness: 3,
          ),
          Text(
            AppLocalizations.of(context)!.ahadeth,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Divider(
            color: MythemeData.primiaryColor,
            thickness: 3,
          ),
          Expanded(
              flex: 7,
              child: ListView.builder(
                itemCount: ahadethModels.length,
              itemBuilder: (context,index){
                return HadethNameItem(ahadethModels[index]);
              },
              ))
        ],
      ),
    );
  }

  readAhadethFile() async {
    String fileContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");

    List<String> ahadeth = fileContent.split("#\r\n");
    print(fileContent);
    for (int i = 0; i < ahadeth.length; i++) {
      List<String> singleHadethLine = ahadeth[i].split("\n");
      String title = singleHadethLine[0];
      singleHadethLine.removeAt(0);
      String content = singleHadethLine.join();
      HadethModel hadeth = HadethModel(title, content);
      ahadethModels.add(hadeth);
    }
    setState(() {});
  }
}

class HadethModel {
  String title;
  String content;

  HadethModel(this.title, this.content);
}
