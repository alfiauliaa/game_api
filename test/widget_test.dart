import 'package:coba_api/app/data/models/game_model.dart';
import 'package:coba_api/app/modules/home/controllers/home_controller.dart';
import 'package:coba_api/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('HomeView displays correctly', (WidgetTester tester) async {
    // Create a mock HomeController
    final mockHomeController = HomeController();

    // Populate the controller with some mock data
    mockHomeController.games.value = [
      GameModel(
        id: 1,
        title: "Test Game",
        thumbnail: "https://example.com/image.jpg",
        shortDescription: "This is a test game",
        gameUrl: "https://example.com",
        genre: "Shooter",
        platform: "PC",
        publisher: "Test Publisher",
        developer: "Test Developer",
        releaseDate: "2023-01-01",
        freetogameProfileUrl: "https://example.com/profile",
      ),
    ];
    mockHomeController.isLoading.value = false;

    // Build our app and trigger a frame
    await tester.pumpWidget(
      GetMaterialApp(
        home: HomeView(),
        initialBinding: BindingsBuilder(() {
          Get.put<HomeController>(mockHomeController);
        }),
      ),
    );

    // Verify that HomeView is displayed
    expect(find.byType(HomeView), findsOneWidget);

    // Verify that the AppBar title is correct
    expect(find.text('Shooter Games'), findsOneWidget);

    // Verify that the ListView is displayed
    expect(find.byType(ListView), findsOneWidget);

    // Verify that the mock game data is displayed
    expect(find.text('Test Game'), findsOneWidget);
    expect(find.text('This is a test game'), findsOneWidget);

    // Verify that the game thumbnail is displayed
    expect(find.byType(Image), findsOneWidget);

    // Test tapping on a game item
    await tester.tap(find.text('Test Game'));
    await tester.pumpAndSettle();

    // Here you would typically verify that the app navigates to the game detail page
    // However, since we haven't implemented that yet, we'll just check that the tap was registered
    // You can add more specific tests here once you've implemented the game detail page
  });

  testWidgets('HomeView shows loading indicator when isLoading is true',
      (WidgetTester tester) async {
    // Create a mock HomeController
    final mockHomeController = HomeController();

    // Set isLoading to true
    mockHomeController.isLoading.value = true;

    // Build our app and trigger a frame
    await tester.pumpWidget(
      GetMaterialApp(
        home: HomeView(),
        initialBinding: BindingsBuilder(() {
          Get.put<HomeController>(mockHomeController);
        }),
      ),
    );

    // Verify that the loading indicator is displayed
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
