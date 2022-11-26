import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:restapi_2018001/app/data/models/character.dart';

class HomeController extends GetxController {
  List<dynamic> allchar = [];
  List<dynamic> datum = [];
  var halaman = 1.obs;
  var count = 1.obs;
  RefreshController characterRefresh = RefreshController(initialRefresh: true);
  Future<Map<String, dynamic>?> character(int hal) async {
    Uri url = Uri.parse(
        'https://api-blue-archive.vercel.app/api/characters?page=$hal');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      datum = data['data'];
      var tempData = datum.map((e) => Character.fromJson(e));
      if (data['dataAllPage'] == null) {
        return null;
      } else {
        count.value = data['dataAllPage'];
      }
      allchar.addAll(tempData);
      update();
      return data;
    } else {
      return null;
    }
  }

  void refreshData() async {
    if (characterRefresh.initialRefresh == true) {
      halaman.value = 1;
      await character(halaman.value);
      update();
      return characterRefresh.refreshCompleted();
    } else {
      return characterRefresh.refreshFailed();
    }
  }

  void loadData() async {
    if (datum.length == 20 && datum.length != 119) {
      halaman.value = halaman.value + 1;
      await character(halaman.value);
      update();
      return characterRefresh.loadComplete();
    } else {
      return characterRefresh.loadNoData();
    }
  }
}
