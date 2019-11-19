import 'package:equatable/equatable.dart';
import '../models/models.dart';

abstract class CurrencySelectionState extends Equatable {
  const CurrencySelectionState();
  @override
  List<Object> get props => [];
}

class InitialCurrencySelectionState extends CurrencySelectionState {}

class LoadingBTCState extends CurrencySelectionState {}

class LoadingLTCState extends CurrencySelectionState {}

class LoadingETHState extends CurrencySelectionState {}

class LoadedState extends CurrencySelectionState {
  final Data data;
  final String fromCoin;
  final String toCoin;
  LoadedState(this.data, this.fromCoin, this.toCoin);

  @override
  List<Object> get props => [data, fromCoin, toCoin];
}

class LoadedBTCState extends LoadedState {
  LoadedBTCState(data, fromCoin, toCoin) : super(data, fromCoin, toCoin);
}

class LoadedLTCState extends LoadedState {
  LoadedLTCState(data, fromCoin, toCoin) : super(data, fromCoin, toCoin);
}

class LoadedETHState extends LoadedState {
  LoadedETHState(data, fromCoin, toCoin) : super(data, fromCoin, toCoin);
}

class ErrorState extends CurrencySelectionState {}
