import 'dart:convert';
import 'package:crypto_app/model/chart/chart_model.dart';
import 'package:http/http.dart' as http;

class ChartService {
  Future<List<ChartModel>> getChart({required String coinId,required int day}) async {
    try{
      final reponse = await http.get(Uri.parse('https://api.coingecko.com/api/v3/coins/$coinId/ohlc?vs_currency=usd&days=$day'));

      if(reponse.statusCode == 200){
        final List<dynamic> jsonData = json.decode(reponse.body);
        return jsonData.map((e) => ChartModel.fromJson(e)).toList();
      }
      else{
        throw Exception('Failed to get chart: ${reponse.statusCode}');
      }
    }
    catch(e){
      throw Exception('Error fetching chart: $e');
    }
  }
}