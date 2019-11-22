import 'dart:async';
import 'package:bloc/bloc.dart';
import '../blocs.dart';
import '../../repositories/repositories.dart';
import '../../models/models.dart';

class InputValueBloc extends Bloc<InputEvent, InputValueState> {
  InputValueBloc(this.bitCoinRepo) : assert(bitCoinRepo != null);

  final BitCoinRepo bitCoinRepo;

  @override
  InputValueState get initialState => InitialInputValueState();

  @override
  Stream<InputValueState> mapEventToState(
    InputEvent event,
  ) async* {
    if (event is InputValueEvent) {
      try {
        yield LoadingInputState();
        Data data = await bitCoinRepo.getData(event.fromCoin, event.toCoin);
        yield LoadedInputState(
          data.last * event.amount,
          event.fromCoin,
          event.toCoin,
        );
      } catch (e) {
        yield ErrorInputState();
        print(e.toString());
      }
    }

    if (event is FromSelectEvent) {
      yield FromSelectedState(event.fromCoin);
    }
    if (event is ToSelectEvent) {
      yield ToSelectedState(event.toCoin);
    }
  }
}
