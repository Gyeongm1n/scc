import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:scc_flutter_app/config.dart';
import 'package:scc_flutter_app/models/login_request_model.dart';
import 'package:scc_flutter_app/models/login_response_model.dart';
import 'package:scc_flutter_app/models/register_request_model.dart';
import 'package:scc_flutter_app/models/register_response_model.dart';
import 'package:scc_flutter_app/services/shared_service.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      //SHARED
      print('로그인 성공!');
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseModel(response.body);
  }

  static Future<String> getUserProfile() async {

    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization' : 'Basic ${loginDetails!.data.token}'
    };

    var url = Uri.http(Config.apiURL, Config.userProfileAPI);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      //SHARED
      return response.body;
    } else {
      return "";
    }
  }
  Future<dynamic> fetchPatients() async {
    final response = await http.put(Uri.parse(Config.patientURL));
    if (response.statusCode == 200) {
      // 만약 서버가 OK 응답을 반환하면, JSON을 파싱합니다.

      dynamic responseJson = json.decode(utf8.decode(response.bodyBytes));

      return responseJson;
    } else {
      // 만약 응답이 OK가 아니면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }
}
