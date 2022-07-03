import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Item> _data = generateItems(2);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (BuildContext context) {
        return _LoggedInUI(context);
      },),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
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

  Widget _LoggedInUI(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.person_rounded, size: 30,),
                  SizedBox(
                    width: 10,
                  ),
                  Text('김길동, 남, 78세'),
                ],
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.supervised_user_circle, size: 30,),
              onPressed: () {},
            ),
          ),
          // 각 화면을 나타내는 곳
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *0.6,
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
                                axisLineStyle: AxisLineStyle(thickness: 15, color: Colors.white),
                                pointers: [
                                  RangePointer(value: 86, width: 10,)
                                ],
                              ),
                              RadialAxis(
                                annotations: [
                                  GaugeAnnotation(
                                    widget: Text('활동량/평균\n86/28', textAlign: TextAlign.center,),
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
                                axisLineStyle: AxisLineStyle(thickness: 15, color: Colors.white),
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
                                width: MediaQuery.of(context).size.width *0.3 + 10,
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
                                width: MediaQuery.of(context).size.width *0.3 + 10,
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
                                width: MediaQuery.of(context).size.width *0.3 + 10,
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
                      _buildPanel(),
                    ],
                  ),
                ),
              ),
              Center(
                child: Text('2'),
              ),
              Center(
                child: Text('3'),
              ),
              Center(
                child: Text('4'),
              ),
              Center(
                child: Text('5'),
              ),
            ],
          ),
          extendBodyBehindAppBar: true,
          bottomNavigationBar: Container(
            color: Colors.white,
            child: Container(
              height: 70,
              padding: EdgeInsets.only(bottom: 10, top: 5),
              child: const TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.red,
                indicatorWeight: 2,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black38,
                labelStyle: TextStyle(
                  fontSize: 13,
                ),
                tabs: [
                  Tab(
                    icon: Icon(Icons.person),
                    text: '메인',
                  ),
                  Tab(
                    icon: Icon(Icons.chair),
                    text: '생활',
                  ),
                  Tab(
                    icon: Icon(Icons.local_hospital),
                    text: '신체',
                  ),
                  Tab(
                    icon: Icon(Icons.check),
                    text: '관찰',
                  ),
                  Tab(
                    icon: Icon(Icons.note_alt),
                    text: '노트',
                  ),
                ]
              ),
            ),
          ),
        ),
      )
    );
  }
}

// ExpansionPanel 정보를 저장하는 공간입니다
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

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      /// 헤더와 본문에 들어갈 내용
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}
