import 'package:equatable/equatable.dart';

abstract class InputValueState extends Equatable {
  const InputValueState();

  @override
  List<Object> get props => [];
}

class InitialInputValueState extends InputValueState {}

class LoadingInputState extends InputValueState {}

class FromSelectedState extends InputValueState {
  final String fromCoin;

  FromSelectedState(this.fromCoin);

  @override
  List<Object> get props => [fromCoin];
}

class ToSelectedState extends InputValueState {
  final String toCoin;

  ToSelectedState(this.toCoin);

  @override
  List<Object> get props => [toCoin];
}

class LoadedInputState extends InputValueState {
  final double value;
  final String fromCoin;
  final String toCoin;

  LoadedInputState(this.value, this.fromCoin, this.toCoin);

  @override
  List<Object> get props => [value, fromCoin, toCoin];
}

class ErrorInputState extends InputValueState {}
