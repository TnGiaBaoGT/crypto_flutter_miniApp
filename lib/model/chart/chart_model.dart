class ChartModel {
  int time;
  double? open;
  double? close;
  double? low;
  double? high;


  ChartModel({
    required this.time, this.open,this.close,this.high,this.low
});

  factory ChartModel.fromJson(List l) {
    return ChartModel(
      time: l[0],
      open: l[1],
      high: l[2],
      low: l[3],
      close: l[4],
    );
  }
}