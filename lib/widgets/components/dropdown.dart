import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final double width;
  final double height;
  final String value;
  final List<String> items;
  final Function onChanged;

  const DropDown({
    Key key,
    this.width = double.infinity,
    this.height = 100.0,
    @required this.value,
    @required this.items,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      color: Colors.blue,
      child: DropdownButton<String>(
        value: value,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 20.0,
        ),
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
