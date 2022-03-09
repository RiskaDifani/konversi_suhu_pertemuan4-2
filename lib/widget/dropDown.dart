import 'package:flutter/material.dart';

class dropDown extends StatelessWidget {
  const dropDown({
    Key? key,
    required this.selectDropDown,
    required this.listSatuanSuhu, required this.dropDown1,
  }) : super(key: key);

  final String selectDropDown;
  final List<String> listSatuanSuhu;
  final Function dropDown1;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: selectDropDown,
      items: listSatuanSuhu.map((String value){
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
          );
      }).toList(), 
      onChanged: (value){
        dropDown1(value);
      },
    );
  }
}