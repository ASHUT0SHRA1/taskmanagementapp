import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanagementapp/controller/datacontroller.dart';

class ViewTask extends StatelessWidget {
  final int id;
  const ViewTask({Key? key, required this.id}) : super(key: key);
  _loadSingleTask() async {


    await Get.find<DataController>().getSingleData(id.toString());
  }
  @override

  Widget build(BuildContext context) {
    _loadSingleTask();
    return Container(color: Colors.red,);
  }
}
