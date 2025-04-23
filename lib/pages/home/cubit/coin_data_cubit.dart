import 'package:bloc/bloc.dart';
import 'package:crypto_app/coin_service/coin_service.dart';
import 'package:crypto_app/pages/home/cubit/coin_data_state.dart';

class CoinDataCubit extends Cubit<CoinDataState> {
  CoinDataCubit() : super(CoinDataLoading());

  Future<void> loadCoinData() async {
    try{
      final data = await CoinService().getCoinMarket();
      emit(CoinDataLoaded(coinList: data));
    }
    catch(e){
      emit(CoinDataError(mess: 'Error load data: $e'));
      print(e);
    }
  }
}