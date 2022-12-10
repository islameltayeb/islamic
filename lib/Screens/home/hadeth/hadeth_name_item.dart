import 'package:flutter/material.dart';
import 'package:islamic/Screens/hadeth_details/hadeth_details.dart';
import 'package:islamic/Screens/home/hadeth/hadeth_tab.dart';
import 'package:islamic/mythemedata.dart';

class HadethNameItem extends StatelessWidget {
  HadethModel hadeth;

  HadethNameItem(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetails.routeName,
            arguments: hadeth);
      },
      child: Container(
        child: Column(
          children: [
            Text(
              hadeth.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Divider(
              color: MythemeData.primiaryColor,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
