import 'package:flutter/material.dart';
import 'package:islamic/Screens/sura_details/sura_details.dart';
import 'package:islamic/Screens/sura_details/sura_details_argument.dart';
import 'package:islamic/mythemedata.dart';

class SuraNameItem extends StatelessWidget {
  String suraName;
int index;
  SuraNameItem(this.suraName,this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SuraDetails.routeName,arguments: SuraNameArgument(suraName, "${index+1}.txt"));
      },
      child: Container(
        child: Column(
          children: [
            Text(
              suraName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,),
            Divider(color: MythemeData.primiaryColor,thickness: 2,),
          ],
        ),

      ),
    );
  }
}
