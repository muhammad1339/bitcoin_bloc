import 'package:bitcoin_bloc/blocs/blocs.dart';
import 'package:bitcoin_bloc/repositories/api_client.dart';
import 'package:bitcoin_bloc/repositories/bitcoin_repo.dart';
import 'widgets/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    //print(event);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final BitCoinRepo bitCoinRepo = BitCoinRepo(
    apiClient: ApiClient(
      apiClient: http.Client(),
    ),
  );
  runApp(MyApp(
    bitCoinRepo: bitCoinRepo,
  ));
}

class MyApp extends StatelessWidget {
  final BitCoinRepo bitCoinRepo;

  const MyApp({Key key, @required this.bitCoinRepo})
      : assert(bitCoinRepo != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrencySelectionBloc>(
            builder: (context) => CurrencySelectionBloc(bitCoinRepo)),
        BlocProvider<InputValueBloc>(
            builder: (context) => InputValueBloc(bitCoinRepo)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BitCoin',
        initialRoute: MainCurrencyPage.route,
        routes: {
          MainCurrencyPage.route: (context) => MainCurrencyPage(),
          ValueInputPage.route: (context) => ValueInputPage(),
        },
      ),
    );
  }
}
//BlocProvider<CurrencySelectionBloc>(
//builder: (context) => CurrencySelectionBloc(bitCoinRepo),
//child: MaterialApp(
//debugShowCheckedModeBanner: false,
//title: 'BitCoin',
//initialRoute: MainCurrencyPage.route,
//routes: {
//MainCurrencyPage.route: (context) => MainCurrencyPage(),
//ValueInputPage.route: (context) => ValueInputPage(),
//},
//),
//);
