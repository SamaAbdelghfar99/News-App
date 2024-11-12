import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/news_data.dart';

class NewsItem extends StatelessWidget {
  Articles article;
   NewsItem({required this.article,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(25),
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: article.urlToImage??'',
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.only(topRight: Radius.circular(25),
          //     topLeft: Radius.circular(25)
          //   ),
          //     child: Image.network(article.urlToImage??'',)),
          Text(article.author??'',
            textAlign: TextAlign.start,
            style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black54
          ),),
          Text(article.title??'',
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          Text(article.description??'',
            maxLines: 3,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black54
            ),

          ),
          Text(article.publishedAt!.substring(0,10)??'',
            textAlign: TextAlign.end,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black54
            ),
          ),
        ],
      ),
    );
  }
}
