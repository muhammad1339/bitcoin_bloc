// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    ask: (json['ask'] as num)?.toDouble(),
    bid: (json['bid'] as num)?.toDouble(),
    last: (json['last'] as num)?.toDouble(),
    high: (json['high'] as num)?.toDouble(),
    low: (json['low'] as num)?.toDouble(),
    volume: (json['volume'] as num)?.toDouble(),
    open: json['open'] == null
        ? null
        : Open.fromJson(json['open'] as Map<String, dynamic>),
    averages: json['averages'] == null
        ? null
        : Averages.fromJson(json['averages'] as Map<String, dynamic>),
    changes: json['changes'] == null
        ? null
        : Changes.fromJson(json['changes'] as Map<String, dynamic>),
    volumePercent: (json['volumePercent'] as num)?.toDouble(),
    timestamp: json['timestamp'] as int,
    displayTimestamp: json['display_timestamp'] as String,
    displaySymbol: json['display_symbol'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'ask': instance.ask,
      'bid': instance.bid,
      'last': instance.last,
      'high': instance.high,
      'low': instance.low,
      'volume': instance.volume,
      'open': instance.open,
      'averages': instance.averages,
      'changes': instance.changes,
      'volumePercent': instance.volumePercent,
      'timestamp': instance.timestamp,
      'displayTimestamp': instance.displayTimestamp,
      'displaySymbol': instance.displaySymbol,
    };

Open _$OpenFromJson(Map<String, dynamic> json) {
  return Open(
    hour: (json['hour'] as num)?.toDouble(),
    day: (json['day'] as num)?.toDouble(),
    week: (json['week'] as num)?.toDouble(),
    month: (json['month'] as num)?.toDouble(),
    month3: (json['month3'] as num)?.toDouble(),
    month6: (json['month6'] as num)?.toDouble(),
    year: (json['year'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$OpenToJson(Open instance) => <String, dynamic>{
      'hour': instance.hour,
      'day': instance.day,
      'week': instance.week,
      'month': instance.month,
      'month3': instance.month3,
      'month6': instance.month6,
      'year': instance.year,
    };

Averages _$AveragesFromJson(Map<String, dynamic> json) {
  return Averages(
    day: (json['day'] as num)?.toDouble(),
    week: (json['week'] as num)?.toDouble(),
    month: (json['month'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$AveragesToJson(Averages instance) => <String, dynamic>{
      'day': instance.day,
      'week': instance.week,
      'month': instance.month,
    };

Changes _$ChangesFromJson(Map<String, dynamic> json) {
  return Changes(
    price: json['price'] == null
        ? null
        : Open.fromJson(json['price'] as Map<String, dynamic>),
    percent: json['percent'] == null
        ? null
        : Percent.fromJson(json['percent'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChangesToJson(Changes instance) => <String, dynamic>{
      'price': instance.price,
      'percent': instance.percent,
    };

Percent _$PercentFromJson(Map<String, dynamic> json) {
  return Percent(
    hour: json['hour'] as double,
    day: (json['day'] as num)?.toDouble(),
    week: (json['week'] as num)?.toDouble(),
    month: json['month'] as double,
    month3: (json['month3'] as num)?.toDouble(),
    month6: (json['month6'] as num)?.toDouble(),
    year: (json['year'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PercentToJson(Percent instance) => <String, dynamic>{
      'hour': instance.hour,
      'day': instance.day,
      'week': instance.week,
      'month': instance.month,
      'month3': instance.month3,
      'month6': instance.month6,
      'year': instance.year,
    };
