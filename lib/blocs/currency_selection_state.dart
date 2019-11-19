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

class LoadedBTCState extends CurrencySelectionState {
  final Data data;
  final String fromCoin;
  final String toCoin;
  LoadedBTCState(this.data, this.fromCoin, this.toCoin);

  @override
  List<Object> get props => [data, fromCoin, toCoin];
}

class LoadedLTCState extends CurrencySelectionState {
  final Data data;
  final String fromCoin;
  final String toCoin;
  LoadedLTCState(this.data, this.fromCoin, this.toCoin);

  @override
  List<Object> get props => [data, fromCoin, toCoin];
}

class LoadedETHState extends CurrencySelectionState {
  final Data data;
  final String fromCoin;
  final String toCoin;
  LoadedETHState(this.data, this.fromCoin, this.toCoin);

  @override
  List<Object> get props => [data, fromCoin, toCoin];
}

class ErrorState extends CurrencySelectionState {}
