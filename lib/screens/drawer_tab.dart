import 'package:flutter/material.dart';

class DrawerTab extends StatelessWidget {
  Function onClick;
   DrawerTab({required this.onClick,super.key});

   static const int CATEGORY_ID=1;
   static const int SETTINGS_ID=2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.6,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.width*.3,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Center(child: Text('News App',style: TextStyle(
              fontSize: 25,
              color: Colors.white
            ),)),
          ),
          InkWell(
            onTap: (){
              onClick(CATEGORY_ID);
            },
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('Categores',style: TextStyle(
                fontSize: 30,
              ),),
            ),
          ),
          
          InkWell(
            onTap: (){
              onClick(SETTINGS_ID);
            },
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('Settings',style: TextStyle(
                fontSize: 30,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
