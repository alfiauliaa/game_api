import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import '../../../data/models/article.dart';
import '../controllers/article_detail_controller.dart';
import 'article_detail_web_view.dart';

class ArticleDetailPage extends GetView<ArticleDetailController> {
  final Articles article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(article.title),
              background: Image.network(
                article.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.shortDescription,
                    style: TextStyle(fontSize: 18, color: Colors.grey[300]),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text(article.genre.toString().split('.').last),
                        backgroundColor: const Color.fromARGB(255, 204, 57, 57),
                      ),
                      Chip(
                        label:
                            Text(article.platform.toString().split('.').last),
                        backgroundColor: Colors.grey.shade800,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Publisher: ${article.publisher}'),
                  Text('Developer: ${article.developer}'),
                  Text('Release Date: ${article.releaseDate}'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('Read More'),
                    onPressed: () {
                      Get.to(() => ArticleDetailWebView(article: article));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 204, 57, 57),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
