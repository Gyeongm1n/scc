import 'package:flutter/material.dart';
import 'package:scc_flutter_app/item.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:scc_flutter_app/RadioGroup.dart';
import 'package:scc_flutter_app/main.dart';
class Observe_tab extends StatefulWidget {
  const Observe_tab({Key? key}) : super(key: key);

  @override
  State<Observe_tab> createState() => _Observe_tabState();
}

class _Observe_tabState extends State<Observe_tab> {
  final List<Item> _data4 = generateItems(6,3);

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
            title: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  child: SfCartesianChart(
                      backgroundColor: Colors.white,
                      primaryYAxis: NumericAxis(
                        interval: 1,
                      ),
                      primaryXAxis: NumericAxis(
                        interval: 1,
                      ),
                      series: <ChartSeries>[
                        // Renders line chart
                        LineSeries<ChartData, int>(
                          dataSource: item.expandedValue2,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          markerSettings: MarkerSettings(isVisible: true),
                        )
                      ]
                  ),
                ),
              ),
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton:
      FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/observe_write');
        },
        child: Icon(Icons.add,),
      ),
      body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top:100),
        child:
        Column(
          children: [
            _buildPanel(_data4),
          ],
        ),
      ),
    ),
    );
  }
}
