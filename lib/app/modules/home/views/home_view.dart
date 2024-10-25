import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shooter Games'),
        backgroundColor: Colors.blue,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.games.isEmpty) {
          return Center(child: Text('No games found'));
        } else {
          return ListView.builder(
            itemCount: controller.games.length,
            itemBuilder: (context, index) {
              var game = controller.games[index];
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.network(
                    game.thumbnail,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error),
                  ),
                  title: Text(game.title),
                  subtitle: Text(game.shortDescription),
                  onTap: () {
                    Get.toNamed('/game-detail', arguments: game);
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }
}
