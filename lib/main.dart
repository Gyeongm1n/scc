import 'package:flutter/material.dart';
import 'item.dart';
import 'package:scc_flutter_app/tabs/body_tab.dart';
import 'package:scc_flutter_app/tabs/life_tab.dart';
import 'package:scc_flutter_app/tabs/main_tab.dart';
import 'package:scc_flutter_app/tabs/note_tab.dart';
import 'package:scc_flutter_app/tabs/observe_tab.dart';
import 'package:scc_flutter_app/page/login_page.dart';
import 'package:scc_flutter_app/services/shared_service.dart';
import 'package:scc_flutter_app/page/patient_list_page.dart';
import 'package:scc_flutter_app/page/home_page.dart';
import 'package:scc_flutter_app/page/register_page.dart';

Widget _defaultHome = const LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool _result = await SharedService.isLoggedIn();
  if (_result) {
    _defaultHome = const PatientListPage();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => _defaultHome,
        '/patient' : (context) => const PatientListPage(),
        '/home' : (context) => const HomePage(),
        '/login' : (context) => const LoginPage(),
        '/register' : (context) => const RegisterPage(),

      },
      title: 'SCC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}



