import 'package:flutter/material.dart';
import 'package:newsapp/apis/api_manager.dart';
import 'package:newsapp/widget/news_item.dart';
import 'package:newsapp/widget/tab_item.dart';

class TabBarWidget extends StatefulWidget {
  String id;
   TabBarWidget({required this.id,super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedTabIndex = 0;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('something went wrong');
        }
        var sources = snapshot.data?.sources ?? [];
        return Column(
          children: [
            DefaultTabController(
                length: sources.length,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                      isScrollable: true,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      onTap: (value) {
                        selectedTabIndex = value;
                        setState(() {});
                      },
                      tabs: sources
                          .map((e) => TabItem(
                                source: e,
                                isSelected:
                                    sources.elementAt(selectedTabIndex) == e,
                              ))
                          .toList()),
                )),
            FutureBuilder(
                future: ApiManager.getNewsData(sources[selectedTabIndex].id??''),
                builder: (
                  context,
                  snapshot,
                ) {
                  if (snapshot.connectionState == ConnectionState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Text('something went wrong');
                  }
                  var articles = snapshot.data?.articles ?? [];
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                      itemBuilder: (context, index) {
                        return NewsItem(article:articles[index]);
                      },
                      itemCount: articles.length,
                    ),
                  );
                }),
          ],
        );
      },
    );
  }
}
