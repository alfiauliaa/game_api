import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../components/appbar_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: "HomePage",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("HOW TO USE THIS APPLICATION"),
          Text("1. Buka icon titik 3 di pojok kanan atas"),
          Text("2. Pilih Package yang ingin kalian liat sebagai outputnya"),
          SizedBox(height: 15), // Spacer between text and image frame
          Container(
            height: 150,
            width: 300,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.black), // Optional: adds a border
              borderRadius:
                  BorderRadius.circular(8), // Optional: adds rounded corners
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  8), // Ensures the image fits well with rounded corners
              child: Image.asset(
                'assets/your_image.png', // Replace with your image path
                fit: BoxFit
                    .cover, // Adjusts the image to cover the entire container
              ),
            ),
          ),
        ],
      ),
    );
  }
}
