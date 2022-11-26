import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restapi_2018001/app/data/models/character.dart';

void main() async {
  List<dynamic> allchar = [];
  int count = 0;
  Uri url = Uri.parse('https://api-blue-archive.vercel.app/api/characters');
  var response = await http.get(url);
  var data = json.decode(response.body);
  var tempData = data['data'].map((e) => Character.fromJson(e));
  count = data['count'];
  allchar.addAll(tempData);
  print(count);
}
