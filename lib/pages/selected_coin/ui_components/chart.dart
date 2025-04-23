import 'package:crypto_app/model/chart/chart_model.dart';
import 'package:crypto_app/model/coin/coin_model.dart';
import 'package:crypto_app/pages/selected_coin/cubit/chart_cubit.dart';
import 'package:crypto_app/pages/selected_coin/cubit/chart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class Chart extends StatefulWidget {
  final CoinModel coinModel;
  final Size size;
  const Chart({super.key, required this.size,required this.coinModel});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  late TrackballBehavior trackballBehavior;
  int selectedDay = 1; // default: 1D


  @override
  void initState() {
    // TODO: implement initState
    trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChartCubit()..getChart(coinId: widget.coinModel.id, day: 1),
      child: BlocBuilder<ChartCubit,ChartStates>(
        builder: (context, state) {
          print(state);
          if(state is ChartLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is ChartLoaded){
            return Column(
                children: [
                  SizedBox(
                    height: widget.size.height * 0.4,
                    child: SfCartesianChart(
                      trackballBehavior: trackballBehavior,
                      zoomPanBehavior: ZoomPanBehavior(
                        enablePinching: true,
                        enablePanning: true,
                        zoomMode: ZoomMode.x,
                      ),
                      primaryXAxis: NumericAxis(
                        axisLabelFormatter: (AxisLabelRenderDetails args) {
                          final date = DateTime.fromMillisecondsSinceEpoch(args.value.toInt());
                          final label = DateFormat('MM/dd HH:mm').format(date);
                          return ChartAxisLabel(label, const TextStyle(fontSize: 10));
                        }
                      ),
                      series:<CandleSeries> [
                        CandleSeries<ChartModel,int>(
                            enableSolidCandles: true,
                        enableTooltip: true,
                        bullColor: Colors.green,
                        bearColor: Colors.red,
                        dataSource: state.chartModel,
                        xValueMapper: (ChartModel data, _) => data.time,
                        lowValueMapper: (ChartModel data, _) => data.low,
                        highValueMapper: (ChartModel data, _) => data.high,
                        openValueMapper: (ChartModel data, _) => data.open,
                        closeValueMapper: (ChartModel data, _) => data.close,
                        animationDuration: 55,
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                  SizedBox(
                    height: widget.size.height * 0.05,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildTimeFilterButton(context, label: '1D', value: 1),
                        _buildTimeFilterButton(context, label: '1W', value: 7),
                        _buildTimeFilterButton(context, label: '1M', value: 30),
                        _buildTimeFilterButton(context, label: '3M', value: 90),
                        _buildTimeFilterButton(context, label: '6M', value: 180),
                        _buildTimeFilterButton(context, label: '1Y', value: 365),
                      ],
                    ),
                  ),

                ],
            );
          }
          if(state is ChartError){
            return SizedBox(
              height: widget.size.height * 0.4,
              child: const Center(
                child: Text('Too many actions please wait a few minutes.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }


  Widget _buildTimeFilterButton(BuildContext context, {required String label, required int value}) {
    final isSelected = value == selectedDay;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            selectedDay = value;
          });
          context.read<ChartCubit>().getChart(coinId: widget.coinModel.id, day: value);
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xffFBC700).withOpacity(0.6) : Colors.transparent,
          side: const BorderSide(color: Color(0xffFBC700)),
        ),
        child: Text(label, style: TextStyle(color: isSelected ? Colors.black : Colors.grey)),
      ),
    );
  }

}
