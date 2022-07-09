import'package:flutter/material.dart';
import'package:scc_flutter_app/item.dart';
import 'package:scc_flutter_app/tabs/body_tab.dart';
import 'package:scc_flutter_app/tabs/life_tab.dart';
import 'package:scc_flutter_app/tabs/main_tab.dart';
import 'package:scc_flutter_app/tabs/note_tab.dart';
import 'package:scc_flutter_app/tabs/observe_tab.dart';
import 'package:scc_flutter_app/main.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _Home_PageState();
}

class _Home_PageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (BuildContext context) {
        return _LoggedInUI(context);
      },),
    );
  }

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
                  IconButton(icon: new Icon(Icons.person_rounded,size: 30,),
                    onPressed: () {
                    Navigator.pop(context);
                    },
                  ),
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
             Main_tab(),
              Life_tab(),
              Body_tab(),
              Observe_tab(),
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
