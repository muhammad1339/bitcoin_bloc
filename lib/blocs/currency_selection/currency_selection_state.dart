import 'package:equatable/equatable.dart';

abstract class CurrencySelectionState extends Equatable {
  const CurrencySelectionState();

  @override
  List<Object> get props => [];
}

class InitialCurrencySelectionState extends CurrencySelectionState {}

class LoadingState extends CurrencySelectionState {}

class LoadingBTCState extends CurrencySelectionState {}

class LoadingLTCState extends CurrencySelectionState {}

class LoadingETHState extends CurrencySelectionState {}

class SelectedState extends CurrencySelectionState {
  final String toCoin;
  SelectedState(this.toCoin);

  @override
  List<Object> get props => [toCoin];
}

class LoadedSelectionState extends CurrencySelectionState {
  final double value;
  final String fromCoin;
  final String toCoin;

  LoadedSelectionState(this.value, this.fromCoin, this.toCoin);

  @override
  List<Object> get props => [value, fromCoin, toCoin];
}

class LoadedBTCState extends LoadedSelectionState {
  LoadedBTCState(value, fromCoin, toCoin) : super(value, fromCoin, toCoin);
}

class LoadedLTCState extends LoadedSelectionState {
  LoadedLTCState(value, fromCoin, toCoin) : super(value, fromCoin, toCoin);
}

class LoadedETHState extends LoadedSelectionState {
  LoadedETHState(value, fromCoin, toCoin) : super(value, fromCoin, toCoin);
}

class ErrorSelectionState extends CurrencySelectionState {}
