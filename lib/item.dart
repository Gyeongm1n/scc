import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems, int tabnum) { // tabnum 0:메인 1:생활 2:신체 3:관찰
  List<List<String>> name =[
    ['최근데이터','010-xxxx-xxxx'],
    ['재가 활동성 (AIX)','냉장고 이용빈도 (횟수)','부엌 점유시간 (분)', '화장실 점유시간 (분)', '실내온도 (ºC)'],
    ['체중 (Kg)','체지방 (%)','혈압 (mmHg,이완기/수축기)','체온 (ºC)'],
    ['우울감','불안감','고립감','활동','식사','수면']
  ];
  var panelNameLIst=name[tabnum].asMap();

  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      /// 헤더와 본문에 들어갈 내용
      headerValue: '${panelNameLIst[index]}',
      expandedValue: 'This is item number $index',
    );
  });
}

