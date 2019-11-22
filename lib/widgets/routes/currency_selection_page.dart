import '../widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models.dart';
import '../../blocs/blocs.dart';

class MainCurrencyPage extends StatefulWidget {
  static const String route = 'MainCurrencyPage';
  @override
  _MainCurrencyPageState createState() => _MainCurrencyPageState();
}

class _MainCurrencyPageState extends State<MainCurrencyPage> {
  String _value = currenciesList.first;
  String _convertedBTC = '$BTC = ? USD';
  String _convertedETH = '$ETH = ? USD';
  String _convertedLTC = '$LTC = ? USD';

  CurrencySelectionBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<CurrencySelectionBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Coin Converter'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ValueInputPage.route);
            },
            icon: Icon(Icons.compare_arrows),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BlocBuilder<CurrencySelectionBloc, CurrencySelectionState>(
              bloc: bloc,
              builder: (context, state) {
                return Column(
                  children: <Widget>[
                    buildConvertedContainer(_convertedBTC),
                    buildConvertedContainer(_convertedETH),
                    buildConvertedContainer(_convertedLTC),
                  ],
                );
              }),
          BlocBuilder<CurrencySelectionBloc, CurrencySelectionState>(
            bloc: bloc,
            builder: (context, state) {
              listenToBloc(bloc);
              return DropDown(
                value: _value,
                items: currenciesList,
                onChanged: (selected) {
                  bloc.add(ConvertEvent(fromCoin: BTC, toCoin: selected));
                  bloc.add(ConvertEvent(fromCoin: ETH, toCoin: selected));
                  bloc.add(ConvertEvent(fromCoin: LTC, toCoin: selected));
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void listenToBloc(CurrencySelectionBloc bloc) {
    bloc.listen((state) {
      if (state is SelectedState) {
        _value = state.toCoin;
      }
      if (state is LoadedBTCState) {
        _convertedBTC = '1 ${state.fromCoin} = ${state.value} ${state.toCoin}';
        //print('$state ---> $_convertedBTC');
      }

      if (state is LoadedETHState) {
        _convertedETH = '1 ${state.fromCoin} = ${state.value} ${state.toCoin}';
        //print('$state ---> $_convertedETH');
      }

      if (state is LoadedLTCState) {
        _convertedLTC = '1 ${state.fromCoin} = ${state.value} ${state.toCoin}';
        //print('$state ---> $_convertedLTC');
      }
    }, onDone: () {
      print('DONE!');
    });
  }

  Widget buildConvertedContainer(String converted) {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.blue,
      height: 80.0,
      alignment: Alignment.center,
      child: Text(
        converted,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //bloc.drain();

    if (bloc != null) {
      bloc.close();
    }
  }
}
