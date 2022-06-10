import 'dart:convert';

import 'package:accompagnateur/configuration/Pelerin.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'pelerinpackage.dart';

Future<List<Pelerin>> bringThePelerinAccompgnateur() async {
  List<Pelerin> PelerinsList = <Pelerin>[];
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var response = await http.get(
    Uri.parse('http://localhost:8000/api/Mobile/pelerinaccom/${sharedPreferences.getInt("idUser").toString()}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
    },
  );

  var data = await json.decode(response.body)['pelerins'] as List;

  PelerinsList = data.map((i) => Pelerin.fromJson(i)).toList();

  return PelerinsList;
}

//

Future<List<Pelerin>> bringThePelerinvol() async {
  List<Pelerin> PelerinsList = <Pelerin>[];
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var response = await http.get(
    Uri.parse('http://localhost:8000/api/Mobile/volpelerin/' +
        sharedPreferences.getInt("idPackage").toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
    },
  );

  var data = await json.decode(response.body)['pelerins'] as List;
  print(data);
  PelerinsList = data.map((i) => Pelerin.fromJson(i)).toList();

  return PelerinsList;
}

//

Future<List<Pelerin>> bringThePelerinAccompgnateurvol() async {
  List<Pelerin> PelerinsList = <Pelerin>[];
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var response = await http.get(
    Uri.parse('http://localhost:8000/api/Mobile/volAccomPacakge/' +
        sharedPreferences.getInt("idUser").toString() +
        '/' +
        sharedPreferences.getInt("idPackage").toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
    },
  );

  var data = await json.decode(response.body)['pelerins'] as List;

  PelerinsList = data.map((i) => Pelerin.fromJson(i)).toList();

  return PelerinsList;
}
