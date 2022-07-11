import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scc_flutter_app/services/api_service.dart';
import 'package:scc_flutter_app/services/shared_service.dart';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';

class PatientListPage extends StatefulWidget {
  const PatientListPage({Key? key}) : super(key: key);
  @override
  _PatientListPageState createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
  dynamic infos = SharedService.loginDetails2();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('돌봄 목록'),
          centerTitle: true,
          backgroundColor: const Color(0xff16A085),
        ),

        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading:  IconButton(icon: new Icon(Icons.menu,size: 30,),
                  onPressed: () {
                  Navigator.pop(context);
                  },
                ),
                title: Text('texter02@gmail.com'),
                trailing: IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    SharedService.logout(context);
                    print('로그아웃');
                  },
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Center(child: ListWidget()),
        ),
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  final APIService apiService = APIService();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: apiService.fetchPatients(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dynamic items =
          snapshot.data!['guardian']['patient'].map((el) => el['id']);
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/home');
                },
                child:
                Card(
                elevation: 3,
                child: Row(
                  children: [
                    Icon(
                      Icons.account_box,
                      size: 70.0,
                      color: Colors.grey,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${snapshot.data!['patients'][items.elementAt(index)]['name']}, ${snapshot.data!['patients'][items.elementAt(index)]['gender']}, ${snapshot.data!['patients'][items.elementAt(index)]['age']}',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          '최근 방문일: ${dateFormat.format(DateTime.fromMillisecondsSinceEpoch(snapshot.data!['patients'][items.elementAt(index)]['state']['visitCare']['lastTime']))}',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // 기본적으로 로딩 Spinner를 보여줍니다.
        return const CircularProgressIndicator();
      },
    );
  }
}
