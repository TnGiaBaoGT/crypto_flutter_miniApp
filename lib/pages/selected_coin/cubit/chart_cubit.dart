import 'package:bloc/bloc.dart';
import 'package:crypto_app/coin_service/chart_service.dart';
import 'package:crypto_app/pages/selected_coin/cubit/chart_state.dart';

class ChartCubit extends Cubit<ChartStates>{
  ChartCubit() : super(ChartLoading());

  Future<void> getChart({required String coinId, required int day}) async {
    try{
      final data = await ChartService().getChart(coinId:coinId,day:day);
      emit(ChartLoaded(chartModel: data));
    }
    catch(e){
      emit(ChartError(mess: 'Failed to get chart: $e'));
    }
  }
}