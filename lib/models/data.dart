import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  double ask;
  double bid;
  double last;
  double high;
  double low;
  double volume;
  Open open;
  Averages averages;
  Changes changes;
  double volumePercent;
  int timestamp;
  String displayTimestamp;
  String displaySymbol;

  Data(
      {this.ask,
      this.bid,
      this.last,
      this.high,
      this.low,
      this.volume,
      this.open,
      this.averages,
      this.changes,
      this.volumePercent,
      this.timestamp,
      this.displayTimestamp,
      this.displaySymbol});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Open {
  double hour;
  double day;
  double week;
  double month;
  double month3;
  double month6;
  double year;

  Open(
      {this.hour,
      this.day,
      this.week,
      this.month,
      this.month3,
      this.month6,
      this.year});

  factory Open.fromJson(Map<String, dynamic> json) => _$OpenFromJson(json);

  Map<String, dynamic> toJson() => _$OpenToJson(this);
}

@JsonSerializable()
class Averages {
  double day;
  double week;
  double month;

  Averages({this.day, this.week, this.month});

  factory Averages.fromJson(Map<String, dynamic> json) =>
      _$AveragesFromJson(json);

  Map<String, dynamic> toJson() => _$AveragesToJson(this);
}

@JsonSerializable()
class Changes {
  Open price;
  Percent percent;

  Changes({this.price, this.percent});

  factory Changes.fromJson(Map<String, dynamic> json) =>
      _$ChangesFromJson(json);

  Map<String, dynamic> toJson() => _$ChangesToJson(this);
}

@JsonSerializable()
class Percent {
  double hour;
  double day;
  double week;
  double month;
  double month3;
  double month6;
  double year;

  Percent(
      {this.hour,
      this.day,
      this.week,
      this.month,
      this.month3,
      this.month6,
      this.year});

  factory Percent.fromJson(Map<String, dynamic> json) =>
      _$PercentFromJson(json);

  Map<String, dynamic> toJson() => _$PercentToJson(this);
}
