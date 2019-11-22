import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets.dart';
import '../../models/models.dart';
import '../../blocs/blocs.dart';

class ValueInputPage extends StatefulWidget {
  static const String route = 'ValueInputPage';

  @override
  _ValueInputPageState createState() => _ValueInputPageState();
}

class _ValueInputPageState extends State<ValueInputPage> {
  String _fromValue = cryptoList.first;
  String _toValue = currenciesList.first;
  String _convertedCurrency = '$BTC = ? USD';
  double _amount = 1;
  InputValueBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<InputValueBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Input Value'),
      ),
      body: BlocBuilder<InputValueBloc, InputValueState>(
        bloc: bloc,
        builder: (_, state) {
          listenToBloc();
          return Column(
            children: <Widget>[
              RoundedField(
                onChanged: (input) {
                  _amount = double.parse(input);
                },
                label: 'amount',
                isPassword: false,
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropDown(
                    value: _fromValue,
                    items: cryptoList,
                    width: 100,
                    height: 60,
                    onChanged: (selected) {
                      bloc.add(FromSelectEvent(selected));
                    },
                  ),
                  SizedBox(width: 16.0),
                  DropDown(
                    value: _toValue,
                    items: currenciesList,
                    width: 100,
                    height: 60,
                    onChanged: (selected) {
                      bloc.add(ToSelectEvent(selected));
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              RoundedButton(
                  text: 'Convert',
                  onPress: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    bloc.add(InputValueEvent(
                      amount: _amount,
                      fromCoin: _fromValue,
                      toCoin: _toValue,
                    ));
                  }),
              buildConvertedContainer(_convertedCurrency),
            ],
          );
        },
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

  void listenToBloc() {
    bloc.listen(
      (state) {
        if (state is LoadedInputState) {
          String convertedValue = state.value.toStringAsFixed(4);
          _fromValue = state.fromCoin;
          _toValue = state.toCoin;
          _convertedCurrency =
              '$_amount ${state.fromCoin} = $convertedValue ${state.toCoin}';
          //print('$state ---> $_convertedCurrency');
        }
        if (state is FromSelectedState) {
          _fromValue = state.fromCoin;
        }
        if (state is ToSelectedState) {
          _toValue = state.toCoin;
        }
      },
      onDone: () {
        print('DONE!');
      },
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
