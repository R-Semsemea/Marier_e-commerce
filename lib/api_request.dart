import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'core/class/status_request.dart';
import 'core/functions/handling_status_fail.dart';

class ApiRequest {
  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response;
      } else {
        print("error: ${response.statusCode}");
      }
    } catch (e) {
      print("try catch error: $e");
    }
  }

  Future<Either<Map<String, dynamic>, StatusRequest>> postRequest(
      String url, Map<String, dynamic> data) async {
    try {
      var request = await http.post(Uri.parse(url), body: data);
      if (request.statusCode == 200 || request.statusCode == 201) {
        Map<String, dynamic> responseBody = await jsonDecode(request.body);
        if (responseBody['status'] == "success") {
          print("-------------- Success");
          data = responseBody['data'];
          return Left(data);
        } else if (responseBody['status'] == "fail") {
          print("-------------- ${responseBody['msg'].toString()}");
          return Right(handlingStatusFail(msg: responseBody['msg'].toString()));
        } else {
          //no message from backend
          print("-------------- No msg");
          return const Right(StatusRequest.unknownError);
        }
      } else {
        //possibly wrong link
        print("-------------- Failed Status Code:${request.statusCode}");
        return const Right(StatusRequest.statusCode);
      }
    } catch (e) {
      //possibly Server Down (connection timed out) or json decode error
      print("-------------- try catch error: ${e.toString()}");
      return const Right(StatusRequest.serverError);
    }
  }
}
