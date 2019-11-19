import 'package:meta/meta.dart';
import 'repositories.dart';
import '../models/models.dart';

class BitCoinRepo {
  final ApiClient apiClient;

  BitCoinRepo({@required this.apiClient}) : assert(apiClient != null);

  Future<Data> getData(String fromCoin, String toCoin) async {
    return await apiClient.getData(fromCoin, toCoin);
  }
}
