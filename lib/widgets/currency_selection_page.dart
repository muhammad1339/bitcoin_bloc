import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/models.dart';
import '../blocs/blocs.dart';

class MainCurrencyPage extends StatelessWidget {
  String _value = currenciesList.first;
  String convertedBTC = '$BTC = ? USD';
  String convertedETH = '$ETH = ? USD';
  String convertedLTC = '$LTC = ? USD';

  @override
  Widget build(BuildContext context) {
    final CurrencySelectionBloc bloc =
        BlocProvider.of<CurrencySelectionBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Coin Converter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildConvertedContainer(convertedBTC),
          buildConvertedContainer(convertedETH),
          buildConvertedContainer(convertedLTC),
          BlocBuilder<CurrencySelectionBloc, CurrencySelectionState>(
            bloc: bloc,
            builder: (_, state) {
              return Container(
                height: 80.0,
                alignment: Alignment.center,
                color: Colors.blue,
                child: DropdownButton<String>(
                  value: _value,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                  items: currenciesList.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                      ),
                    );
                  }).toList(),
                  onChanged: (selected) {
                    bloc.listen((state) {
                      print('onData : $state');

                      if (state is LoadedBTCState) {
                        _value = state.toCoin;
                        convertedBTC =
                            '1 ${state.fromCoin} = ${state.data.last} ${state.toCoin}';
                        print('$state ---> $convertedBTC');
                      }

                      if (state is LoadedETHState) {
                        _value = state.toCoin;
                        convertedETH =
                            '1 ${state.fromCoin} = ${state.data.last} ${state.toCoin}';
                        print('$state ---> $convertedETH');
                      }
                      if (state is LoadedLTCState) {
                        _value = state.toCoin;
                        convertedLTC =
                            '1 ${state.fromCoin} = ${state.data.last} ${state.toCoin}';
                        print('$state ---> $convertedLTC');
                      }
                    }, onDone: () {
                      print('DONE!');
                    });
                    bloc.add(ConvertEvent(fromCoin: BTC, toCoin: selected));
                    bloc.add(ConvertEvent(fromCoin: ETH, toCoin: selected));
                    bloc.add(ConvertEvent(fromCoin: LTC, toCoin: selected));
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
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
}
