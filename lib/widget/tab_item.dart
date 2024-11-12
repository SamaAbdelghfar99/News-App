import 'package:flutter/material.dart';
import 'package:newsapp/models/sourceReponse.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool isSelected;
   TabItem({super.key,required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected?Colors.green:Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.green)
      ),
      padding: const EdgeInsets.all(8.0),
      child: Text(source.name??'',style: TextStyle(
        color: isSelected?Colors.white:Colors.green,
      ),),
    );
  }
}
