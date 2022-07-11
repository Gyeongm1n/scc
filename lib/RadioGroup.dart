import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  const RadioGroup({Key? key}) : super(key: key);

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  String radioButtonItem = 'one';
  int id=1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width -40,

      child:
        Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('문제없음 -',
            style: TextStyle(
              fontSize: 10
            ),
          ),
            Radio(value: 1,
                groupValue: id,materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,onChanged:(val){
              setState(() {
              radioButtonItem='one';
              id=1;
            });
          }),
          Text('1',
            style: TextStyle(
                fontSize: 10
            ),),
          Radio(value: 2, groupValue: id, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,onChanged:(val){
            setState(() {
              radioButtonItem='two';
              id=2;
            });
          }),
          Text('2',
            style: TextStyle(
                fontSize: 10
            ),),
          Radio(value: 3, groupValue: id,materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, onChanged:(val){
            setState(() {
              radioButtonItem='three';
              id=3;
            });
          }),
          Text('3',
            style: TextStyle(
                fontSize: 10
            ),),
          Radio(value: 4, groupValue: id,materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, onChanged:(val){
            setState(() {
              radioButtonItem='four';
              id=4;
            });
          }),
          Text('4',
            style: TextStyle(
                fontSize: 10
            ),),
          Radio(value: 5, groupValue: id,materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, onChanged:(val){
            setState(() {
              radioButtonItem='five';
              id=5;
            });
          }),
          Text('5',
            style: TextStyle(
                fontSize: 10
            ),),
          Text('- 문제심각',
            style: TextStyle(
                fontSize: 10
            ),),
        ],
      )
    );
  }
}
