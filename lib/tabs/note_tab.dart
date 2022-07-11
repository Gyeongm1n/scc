import 'package:flutter/material.dart';

class Note_tab extends StatefulWidget {
  const Note_tab({Key? key}) : super(key: key);

  @override
  State<Note_tab> createState() => _Note_tabState();
}

class _Note_tabState extends State<Note_tab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.pushNamed(
                context,
                '/write',
              );
            },
            child: Icon(Icons.add,),
            //backgroundColor: Colors.grey,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _post(context, 'Example 1'),
                _post(context, 'Example 2'),
                _post(context, 'Example 3'),
                _post(context, 'Example 4'),
              ],
            ),
          ),
        )
    );
  }

  Widget _post(BuildContext context, String tmp) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 30,
            margin: EdgeInsets.only(left: 5, right: 5, top: 20),
            padding: EdgeInsets.only(top: 6, left: 5),
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Text(tmp),
          ),
        ),
        Center(
          child: Container(
            height: 200,
            margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
            padding: EdgeInsets.only(top: 5, left: 5),
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 1.0),
                )
            ),
            child: Text(tmp),
          ),
        )
      ],
    );
  }
}