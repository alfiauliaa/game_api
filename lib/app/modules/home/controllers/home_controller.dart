import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../data/models/game_model.dart';

class HomeController extends GetxController {
  var games = <GameModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchGames();
    super.onInit();
  }

  void fetchGames() async {
    isLoading(true);
    try {
      final response = await http.get(
          Uri.parse('https://www.freetogame.com/api/games?category=shooter'));
      if (response.statusCode == 200) {
        var gamesJson = json.decode(response.body) as List;
        games.value =
            gamesJson.map((game) => GameModel.fromJson(game)).toList();
      }
    } catch (e) {
      print('Error fetching games: $e');
    } finally {
      isLoading(false);
    }
  }
}
