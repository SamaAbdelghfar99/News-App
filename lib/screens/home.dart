import 'package:flutter/material.dart';
import 'package:newsapp/apis/api_manager.dart';
import 'package:newsapp/screens/categories.dart';
import 'package:newsapp/screens/drawer_tab.dart';
import 'package:newsapp/widget/category_model.dart';
import 'package:newsapp/widget/tab_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: DrawerTab(onClick: onDrawerClick,),
        appBar: AppBar(
          backgroundColor: Colors.green,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ],
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white, size: 35),
          title: const Text(
            'News App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: selectedCategory == null
            ? CategoriesTab(
                onClick: onCategorySelect,
              ): TabBarWidget(id: selectedCategory!.id,),

      ),
    );
  }

  onDrawerClick(id){
    if(id==DrawerTab.CATEGORY_ID){
      selectedCategory=null;
      Navigator.pop(context);
    }
    if(id==DrawerTab.SETTINGS_ID){

    }
    setState(() {

    });
  }

  CategoryModel? selectedCategory = null;

  onCategorySelect(cat) {
    selectedCategory = cat;
    setState(() {

    });
  }
}
