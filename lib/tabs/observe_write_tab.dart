import 'package:flutter/material.dart';
import 'package:scc_flutter_app/RadioGroup.dart';

class Observe_write extends StatefulWidget {
  const Observe_write({Key? key}) : super(key: key);

  @override
  State<Observe_write> createState() => _Observe_writeState();
}

class _Observe_writeState extends State<Observe_write> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.95  ,
                decoration: BoxDecoration(
                  color: Color(0xFFFDEBD0),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.black),
                ),

                child: Text(
                    '1. 우울감'
                ),
              ),
              RadioGroup(),
              Container(
                width: MediaQuery.of(context).size.width*0.95 ,
                decoration: BoxDecoration(
                  color: Color(0xFFFDEBD0),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Text(
                    '2. 불안감'
                ),
              ),
              RadioGroup(),
              Container(
                width: MediaQuery.of(context).size.width*0.95 ,
                decoration: BoxDecoration(
                  color: Color(0xFFFDEBD0),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Text(
                    '3. 외로움'
                ),
              ),
              RadioGroup(),
              Container(
                width: MediaQuery.of(context).size.width*0.95 ,
                decoration: BoxDecoration(
                  color: Color(0xFFFDEBD0),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Text(
                    '4. 활동어려움'
                ),
              ),
              RadioGroup(),
              Container(
                width: MediaQuery.of(context).size.width*0.95 ,
                decoration: BoxDecoration(
                  color: Color(0xFFFDEBD0),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Text(
                    '5. 식사어려움'
                ),
              ),
              RadioGroup(),
              Container(
                width: MediaQuery.of(context).size.width*0.95 ,
                decoration: BoxDecoration(
                  color: Color(0xFFFDEBD0),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Text(
                    '6.수면 어려움'
                ),
              ),
              RadioGroup(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("취소")),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("입력완료"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
