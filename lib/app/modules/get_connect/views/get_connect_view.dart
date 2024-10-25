import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modul_2_public_api/app/widgets/game_card.dart';

import '../../../data/services/get_connect_controller.dart';
import '../../components/card_article.dart';

class GetConnectView extends GetView<GetConnectController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Games'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              return GameCard(article: controller.articles[index]);
            },
          );
        }
      }),
    );
  }
}
