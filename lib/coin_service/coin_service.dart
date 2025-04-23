import 'dart:convert';
import 'package:crypto_app/model/coin/coin_model.dart';
import 'package:http/http.dart' as http;

class CoinService {
  //Take data from API
  Future<List<CoinModel>> getCoinMarket() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        // Chuyển json thành list CoinModel
        return jsonData.map((item) => CoinModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load coins: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching coins: $e');
    }
  }
}
