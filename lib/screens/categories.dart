import 'package:flutter/material.dart';
import 'package:newsapp/widget/category_item.dart';
import 'package:newsapp/widget/category_model.dart';

class CategoriesTab extends StatelessWidget {
  Function onClick;
  CategoriesTab({required this.onClick,super.key});

  List<CategoryModel> categories = CategoryModel.getCategory();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("Pick your category of interest ",style: TextStyle(
          fontSize: 33,
        ),),
        const SizedBox(
          height: 18,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),

            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  onClick(categories[index]);
                },
                child: CategoryItem(model: categories[index],
                  isOdd: index.isOdd,
                ),
              );
            },
            itemCount: categories.length,
          ),
        )
      ]),
    );
  }
}
