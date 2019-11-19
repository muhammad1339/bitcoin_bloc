import 'dart:convert';
import 'dart:async';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class ApiClient {
  final http.Client apiClient;

  ApiClient({@required this.apiClient}) : assert(apiClient != null);

  Future<Data> getData(String fromCoin, String toCoin) async {
    //print('$BASE_URL$fromCoin$toCoin');
    final bitCoinResponse = await apiClient.get('$BASE_URL$fromCoin$toCoin');

    // print(bitCoinResponse.body);
    Data data = Data.fromJson(jsonDecode(bitCoinResponse.body));

    return data;
  }
}
