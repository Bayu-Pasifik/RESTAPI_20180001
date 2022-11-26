import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:restapi_2018001/app/data/models/character.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Blue Archive Student List'),
          centerTitle: true,
        ),
        body: GetBuilder<HomeController>(
          builder: (c) {
            return SmartRefresher(
              controller: c.characterRefresh,
              enablePullDown: true,
              enablePullUp: true,
              onLoading: () => c.loadData(),
              onRefresh: () => c.refreshData(),
              child: ListView.builder(
                itemCount: c.allchar.length,
                itemBuilder: (context, index) {
                  Character character = c.allchar[index];
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      dense: true,
                      leading: Text("${index + 1}"),
                      trailing: Image.network("${character.photoUrl}"),
                      title: Text("${character.name}"),
                      subtitle: Text("${character.school}"),
                    ),
                  );
                },
              ),
            );
          },
        ));
  }
}
