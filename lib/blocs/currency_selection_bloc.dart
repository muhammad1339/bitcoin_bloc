import 'dart:async';
import 'package:bloc/bloc.dart';
import './blocs.dart';
import '../repositories/repositories.dart';
import '../models/models.dart';

class CurrencySelectionBloc
    extends Bloc<CurrencySelectionEvent, CurrencySelectionState> {
  CurrencySelectionBloc(this.bitCoinRepo) : assert(bitCoinRepo != null);

  final BitCoinRepo bitCoinRepo;

  @override
  CurrencySelectionState get initialState => InitialCurrencySelectionState();

  @override
  Stream<CurrencySelectionState> mapEventToState(
    CurrencySelectionEvent event,
  ) async* {
    if (event is ConvertEvent) {
      try {
        if (event.fromCoin == BTC) {
          yield LoadingBTCState();
          Data data = await bitCoinRepo.getData(event.fromCoin, event.toCoin);
          yield LoadedBTCState(data, event.fromCoin, event.toCoin);
          //print(event.fromCoin);
        }
        if (event.fromCoin == LTC) {
          yield LoadingLTCState();
          Data data = await bitCoinRepo.getData(event.fromCoin, event.toCoin);
          yield LoadedLTCState(data, event.fromCoin, event.toCoin);
          //print(event.fromCoin);
        }
        if (event.fromCoin == ETH) {
          yield LoadingETHState();
          Data data = await bitCoinRepo.getData(event.fromCoin, event.toCoin);
          yield LoadedETHState(data, event.fromCoin, event.toCoin);
          //print(event.fromCoin);
        }
      } catch (e) {
        yield ErrorState();

        print(e.toString());
      }
    }
  }
}
