import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class WritePage extends StatefulWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  bool isAPIcallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? title;
  String? content;
  final _valueList = ['방문', '앱', '전화', '연계요청'];
  var _selectedValue = '방문';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: new Icon(Icons.arrow_back,size: 30,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('김길동, 남, 78세'),
            centerTitle: true,
          ),
          body: ProgressHUD(
            child: Form(
              key: globalFormKey,
              child: _writeUI(context),
            ),
            inAsyncCall: isAPIcallProcess,
            opacity: 0.3,
            key: UniqueKey(),
          ),
        ),
      ),
    );
  }

  Widget _writeUI(BuildContext context) {


    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 10,
                  ),
                  child: Text(
                    "케어방법",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: DropdownButton(
                    value: _selectedValue,
                    items: _valueList.map(
                          (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "케어주제",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black
                ),
              ),
            ),
            FormHelper.inputFieldWidget(
              context,
              "title",
              "<케어 주제를 입력해주세요>",
                  (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "제목 입력";
                }
                return null;
              },
                  (onSavedVal) {
                title = onSavedVal;
              },
              borderFocusColor: Colors.blue,
              prefixIconColor: Colors.white,
              borderColor: Colors.grey,
              textColor: Colors.black,
              hintColor: Colors.grey.withOpacity(0.8),
              borderRadius: 5,
            ),
            SizedBox(
              height: 10,
            ),
            FormHelper.inputFieldWidget(
              context,
              "title",
              "<케어 내용을 입력해주세요.>",
                  (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "내용 입력";
                }

                return null;
              },
                  (onSavedVal) {
                title = onSavedVal;
              },
              borderFocusColor: Colors.blue,
              prefixIconColor: Colors.white,
              borderColor: Colors.grey,
              textColor: Colors.black,
              hintColor: Colors.grey.withOpacity(0.8),
              borderRadius: 5,
              isMultiline: true,
              multilineRows: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FormHelper.submitButton(
                    "취소",
                        () {
                      Navigator.pop(context);
                    },
                    btnColor: Colors.grey,
                    borderColor: Colors.white,
                    txtColor: Colors.white,
                    borderRadius: 5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormHelper.submitButton(
                    "노트 추가",
                        () {
                      if (validateAndSave()) {
                        print('입력');
                        setState(() {
                          //isAPIcallProcess = true;
                        });
                      }
                    },
                    btnColor: Colors.blue,
                    borderColor: Colors.white,
                    txtColor: Colors.white,
                    borderRadius: 5,
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}