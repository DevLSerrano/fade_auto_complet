import 'package:dio/dio.dart';
import 'package:fade_auto_complet/data/model/complete_model.dart';
import 'package:flutter/material.dart';

class Parser {
  static Future<List<CompleteModel>?> parseDataModel({required String url, key, value}) async {
    Dio dio = Dio();

    Response responseData = await dio.get(url);
    if (responseData.statusCode == 200) {
      debugPrint(responseData.statusCode.toString());
      List<CompleteModel> _complete = [];
      List<dynamic> _data = responseData.data;
      for (Map<String, dynamic> _dat in _data) {
        if (key == null) {
          key = value;
        }
        if (_dat.containsKey(value)) {
          _complete.add(CompleteModel(value: _dat[value], id: _dat[key]));
        }
      }
      return _complete;
    } else {
      return null;
    }
  }
}
