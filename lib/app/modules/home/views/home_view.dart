import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modul_2_public_api/app/routes/app_pages.dart';

import '../../components/appbar_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GAMENET',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.6), // 60% dari tinggi layar

            ElevatedButton(
              child: Text('Browse All Games'),
              onPressed: () => Get.toNamed(Routes.GETCONNECT),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 13, 13, 1),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
