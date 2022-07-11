import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class Item {
  Item({
    required this.expandedValue,
    required this.expandedValue2,
    required this.headerValue,
    this.isExpanded = false,
  });

  Widget expandedValue;
  String headerValue;
  bool isExpanded;
  List<ChartData> expandedValue2;
}

List<Item> generateItems(int numberOfItems, int tabnum) { // tabnum 0:메인 1:생활 2:신체 3:관찰
  List<List<String>> name =[
    ['최근데이터','010-xxxx-xxxx'],
    ['재가 활동성 (AIX)','냉장고 이용빈도 (횟수)','부엌 점유시간 (분)', '화장실 점유시간 (분)', '실내온도 (ºC)'],
    ['체중 (Kg)','체지방 (%)','혈압 (mmHg,이완기/수축기)','체온 (ºC)'],
    ['우울감','불안감','고립감','활동','식사','수면']
  ];
  final List<List<int>> _info = [
    [1, 2, 3, 4, 5, 5, 5],
    [2, 2, 2, 3, 3, 2, 5],
    [3, 4, 5, 1, 2, 3, 4],
    [1, 1, 1, 1, 1, 1, 1],
    [2, 3, 2, 3, 4, 1, 2],
    [5, 3, 2, 1, 2, 3, 3]
  ];


  var panelNameLIst=name[tabnum].asMap();

  return List<Item>.generate(numberOfItems, (int index) {
    if(tabnum==0&&index==0){
      return Item(
        /// 헤더와 본문에 들어갈 내용

        headerValue: '${panelNameLIst[index]}',
        expandedValue: data(),
        expandedValue2: [],
      );
    }
    if(tabnum==0&&index==1){
      return Item(

      headerValue: '${panelNameLIst[index]}',
      expandedValue: address(),
      expandedValue2: [],
      );
    }
    if(tabnum==1){
      List<ChartData> _chartData = [];

      for (int i = 0; i < _info[index].length; i++) {
        _chartData.add(ChartData(i + 1, _info[index][i]));
      }
      return Item(
        headerValue: '${panelNameLIst[index]}',
        expandedValue: data(),
        expandedValue2: _chartData,
      );
    }
    if(tabnum==2){
      List<ChartData> _chartData = [];

      for (int i = 0; i < _info[index].length; i++) {
        _chartData.add(ChartData(i + 1, _info[index][i]));
      }
      return Item(
        headerValue: '${panelNameLIst[index]}',
        expandedValue: data(),
        expandedValue2: _chartData,
      );
    }
    if(tabnum==3){
      List<ChartData> _chartData = [];

      for (int i = 0; i < _info[index].length; i++) {
        _chartData.add(ChartData(i + 1, _info[index][i]));
      }

      return Item(
        headerValue: '${panelNameLIst[index]}',
        expandedValue: data(),
        expandedValue2: _chartData,
      );
    }
    throw 'Error';
  });
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final int y;
}
Widget data() {
  return //Padding(
   // padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
     Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('오늘 재가활동성'),
            Text('56.13 aix'),
            Text('(21/04/28)'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('오늘 냉장고 이용 빈도'),
            Text('12회'),
            Text('(21/04/28)'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('오늘 부엌 점유시간'),
            Text('128분'),
            Text('(21/04/28)'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('오늘 화장실 점유시간'),
            Text('46분'),
            Text('(21/04/28)'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('최근 체중'),
            Text('73.50kg'),
            Text('(21/04/25)'),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('최근 체지방'),
            Text('27.5%'),
            Text('(21/04/25)'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('최근 혈압-이완기'),
            Text('76 mmHg'),
            Text('(21/04/25)'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('최근 혈압 수축기'),
            Text('128 mmHg'),
            Text('(21/04/25)'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('최근 체온'),
            Text('36.42º'),
            Text('(21/04/25)'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
}

Widget address() {
  return ListTile(
    title: Text('서울시 광진구 xx로 OO길 ##-##'),
  );
}

