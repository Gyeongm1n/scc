import 'package:flutter/material.dart';
import 'package:scc_flutter_app/item.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class Body_tab extends StatefulWidget {
  const Body_tab({Key? key}) : super(key: key);

  @override
  State<Body_tab> createState() => _Body_tabState();
}

class _Body_tabState extends State<Body_tab> {
  final List<Item> _data3 = generateItems(4,2);

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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top:100),
        child:
        Column(
          children: [
            _buildPanel(_data3),
          ],
        ),
      ),
    );
  }
}
