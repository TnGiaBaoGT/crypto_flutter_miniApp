import 'package:crypto_app/model/chart/chart_model.dart';

abstract class ChartStates{}

//loading
class ChartLoading extends ChartStates{}

//Loaded
class ChartLoaded extends ChartStates{
  final List<ChartModel> chartModel;
  ChartLoaded({
    required this.chartModel
});
}

//Error
class ChartError extends ChartStates{
  final String mess;
  ChartError({
    required this.mess,
  });
}