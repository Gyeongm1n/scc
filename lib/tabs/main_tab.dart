import 'package:flutter/material.dart';
import 'package:scc_flutter_app/main.dart';
import 'package:scc_flutter_app/item.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
class Main_tab extends StatefulWidget {
  const Main_tab({Key? key}) : super(key: key);


  @override
  State<Main_tab> createState() => _Main_tabState();
}

class _Main_tabState extends State<Main_tab> {
  final List<Item> _data = generateItems(2,0);

  Widget _buildPanel(List<Item> items) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          items[index].isExpanded = !isExpanded;
        });
      },
      children: items.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(

          /// ExpansionPanel은 header와 body로 구성되어 있습니다.
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.6,
                  height: 220,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                      showFirstLabel: false,
                      showLabels: false,
                      showTicks: false,
                      startAngle: 0,
                      endAngle: 360,
                      minimum: 0,
                      maximum: 120,
                      axisLineStyle: AxisLineStyle(
                          thickness: 15, color: Colors.white),
                      pointers: [
                        RangePointer(value: 86, width: 10,)
                      ],
                    ),
                    RadialAxis(
                      annotations: [
                        GaugeAnnotation(
                          widget: Text('활동량/평균\n86/28', textAlign: TextAlign
                              .center,),
                        )
                      ],
                      radiusFactor: 0.83,
                      showFirstLabel: false,
                      showLabels: false,
                      showTicks: false,
                      startAngle: 0,
                      endAngle: 360,
                      minimum: 0,
                      maximum: 120,
                      axisLineStyle: AxisLineStyle(
                          thickness: 15, color: Colors.white),
                      pointers: [
                        RangePointer(value: 86, width: 10, color: Colors.grey,)
                      ],
                    ),
                  ],),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.3 + 10,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xFFFDEBD0),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.3 + 10,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xFFFDEBD0),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.3 + 10,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xFFFDEBD0),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            _buildPanel(_data),
          ],
        ),
      ),
    );
  }
}
