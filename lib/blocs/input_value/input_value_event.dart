import 'package:equatable/equatable.dart';
import '../../models/models.dart';

abstract class InputEvent extends Equatable {
  const InputEvent();

  @override
  List<Object> get props => [];
}

class InputValueEvent extends InputEvent {
  final String fromCoin;
  final String toCoin;
  final double amount;

  InputValueEvent({this.amount = 1.0, this.fromCoin = BTC, this.toCoin = AUD});

  @override
  List<Object> get props => [
        fromCoin,
        toCoin,
        amount,
      ];
}

class FromSelectEvent extends InputEvent {
  final String fromCoin;

  FromSelectEvent(this.fromCoin);

  @override
  List<Object> get props => [fromCoin];
}

class ToSelectEvent extends InputEvent {
  final String toCoin;

  ToSelectEvent(this.toCoin);

  @override
  List<Object> get props => [toCoin];
}
