import 'package:crypto_app/model/coin/coin_model.dart';

abstract class CoinDataState{}


class CoinDataLoading extends CoinDataState{}

class CoinDataLoaded extends CoinDataState{
  final List<CoinModel> coinList;
  CoinDataLoaded({required this.coinList});
}

class CoinDataError extends CoinDataState{
  final String mess;
  CoinDataError({required this.mess});
}