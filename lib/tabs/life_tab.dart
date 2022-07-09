import 'package:flutter/material.dart';
import 'package:scc_flutter_app/item.dart';

class Life_tab extends StatefulWidget {
  const Life_tab({Key? key}) : super(key: key);

  @override
  State<Life_tab> createState() => _Life_tabState();
}

class _Life_tabState extends State<Life_tab> {
  final List<Item> _data2 = generateItems(5,1);

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
        padding: EdgeInsets.only(top:100),
        child:
        Column(
          children: [
            _buildPanel(_data2),
          ],
        ),
      ),
    );
  }
}