import 'package:flutter/material.dart';
import 'package:newsapp/widget/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel model;
  bool isOdd;
   CategoryItem({required this.model,required this.isOdd,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(25),
          bottomRight: isOdd?Radius.circular(25):Radius.zero,
          bottomLeft: !isOdd?Radius.circular(25):Radius.zero,
        )
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(model.image)),
          Text(model.name,style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),),
      
        ],
      ),
    );
  }
}
