import 'package:equatable/equatable.dart';

abstract class CurrencySelectionEvent extends Equatable {
  const CurrencySelectionEvent();
}

class ConvertEvent extends CurrencySelectionEvent {
  final String fromCoin;
  final String toCoin;

  ConvertEvent({this.fromCoin, this.toCoin});

  @override
  List<Object> get props => [
        fromCoin,
        toCoin,
      ];
}
